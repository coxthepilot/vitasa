using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;
using UIKit;

using zsquared;

namespace vitavol
{
    public partial class VC_Calendar : UIViewController
    {
        // Input:
        //   CalendarDate (optional) (used on return from downstream screens to remember where we were)
        //   LoggedInUser
        //   AllSites

        C_YMD CalDate;
        C_CalGrid calgrid;
		C_Global Global;

		public VC_Calendar (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

			// use the date from our previous visit if it exists
			if (Global.CalendarDate == null)
				Global.CalendarDate = C_YMD.Now;

			B_Back.TouchUpInside += (sender, e) => 
                PerformSegue("Segue_CalendarToSignUps", this);

            B_NextMonth.TouchUpInside += (sender, e) =>
            {
                calgrid.MoveToNextMonth();

				calgrid.BuildDateStateArray(CalDate, Global.AllSites);

				calgrid.SetDisplay();
			};

            B_PreviousMonth.TouchUpInside += (sender, e) =>
            {
                calgrid.MoveToPreviousMonth();

				calgrid.BuildDateStateArray(CalDate, Global.AllSites);

				calgrid.SetDisplay();
			};

            AI_Loading.StartAnimating();
            EnableUI(false);
            Task.Run(async () => 
            {
				int daysInMonth = DateTime.DaysInMonth(Global.CalendarDate.Year, Global.CalendarDate.Month);
				C_YMD start = new C_YMD(Global.CalendarDate.Year, Global.CalendarDate.Month, 1);
				C_YMD end = new C_YMD(Global.CalendarDate.Year, Global.CalendarDate.Month, daysInMonth);

                if (Global.SitesSchedule == null)
                {
                    Global.SitesSchedule = await C_SiteSchedule.FetchSitesSchedules(start, end);
                    Global.SiteScheduleSampleTime = DateTime.Now;
                }

                TimeSpan ts = DateTime.Now - Global.SiteScheduleSampleTime;
                if (ts.TotalMinutes > 10)
				{
					Global.SitesSchedule = await C_SiteSchedule.FetchSitesSchedules(start, end);
					Global.SiteScheduleSampleTime = DateTime.Now;
				}

				UIApplication.SharedApplication.InvokeOnMainThread(
                new Action(() =>
                {
                    AI_Loading.StopAnimating();
                    EnableUI(true);

					CalDate = Global.CalendarDate;
                    calgrid = new C_CalGrid(GetButtonsArray(), L_MonthYear, Global);
					calgrid.ButtonTouchUpInside += (ymd) =>
					{
						Global.SelectedDate = ymd;

						PerformSegue("Segue_CalendarToSitesOnDateList", this);
					};

					calgrid.BuildDateStateArray(CalDate, Global.AllSites);

					calgrid.SetDisplay();
				}));
			});
		}

        private void EnableUI(bool en)
        {
            B_Back.Enabled = en;

            List<UIButton> buttons = GetButtonsArray();
            foreach (UIButton b in buttons)
                b.Hidden = !en;
        }

        public List<UIButton> GetButtonsArray()
        {
            List<UIButton> res = new List<UIButton>() { 
                B_00, B_01, B_02, B_03, B_04, B_05, B_06,
			    B_10, B_11, B_12, B_13, B_14, B_15, B_16,
		        B_20, B_21, B_22, B_23, B_24, B_25, B_26,
			    B_30, B_31, B_32, B_33, B_34, B_35, B_36,
			    B_40, B_41, B_42, B_43, B_44, B_45, B_46,
			    B_50, B_51, B_52, B_53, B_54, B_55, B_56 };

            return res;
		}

        public class C_CalGrid
        {
            enum E_DayState { 
                AllClosed,          // all sites are closed on this day
                OnePlusHasNeeds,    // at least one site has needs
                NoNeeds,            // all sites have satisfied their needs
                SignedUp,           // user is signed up to work this day
                Unknown
            }

            readonly List<UIButton> Buttons; // an array of all of the 42 buttons
            E_DayState[] DayState;  // array of flags for each day in the month on day status
            C_YMD Date;             // current month/year
            int DateOffset;         // offset for first day of the month
            readonly UILabel YearMonthLabel; // the label for month/year display
            C_VitaUser OurUser;
            List<C_SiteSchedule> SitesSchedule;
            C_Global Global;

            public delegate void ButtonTouchUpEventHandler(C_YMD ymd);

			/// <summary>
			/// When the user touchupinside on a date, this event is called.
			/// </summary>
			public event ButtonTouchUpEventHandler ButtonTouchUpInside;

            public C_CalGrid(List<UIButton> buttons, UILabel yearMonthLabel, C_Global global)
            {
                Buttons = buttons;
                YearMonthLabel = yearMonthLabel;
                Global = global;
                OurUser = Global.LoggedInUser;
                SitesSchedule = Global.SitesSchedule;

                foreach(UIButton button in Buttons)
                    button.TouchUpInside += Button_TouchUpInside;
            }

            private void Button_TouchUpInside(object sender, EventArgs e)
            {
                if (!(sender is UIButton))
                    throw new ApplicationException("expecting a UIButton");

                UIButton b = (UIButton)sender;
                nint tag = b.Tag;
                int day = ((int)tag - DateOffset) + 1;

                int daysInMonth = DateTime.DaysInMonth(Date.Year, Date.Month);

                if ((day < 0) || (day > daysInMonth))
                    return;

                E_DayState thisDayState = DayState[day - 1];
                // we let the user sign up is any site has needs or he's already signed up (for mobile doing >1 per day)
                if ((thisDayState == E_DayState.OnePlusHasNeeds)
                    || (thisDayState == E_DayState.SignedUp))
                    ButtonTouchUpInside?.Invoke(new C_YMD(Date.Year, Date.Month, day));
            }

            public bool BuildDateStateArray(C_YMD ymd, List<C_VitaSite> sites)
            {
                Date = ymd;

				int daysInMonth = DateTime.DaysInMonth(Date.Year, Date.Month);

                // determine the state of each day in the month
				DayState = new E_DayState[daysInMonth];
                for (int day = 1; day <= daysInMonth; day++)
                {
                    E_DayState dayState = E_DayState.Unknown;

                    C_YMD ourDate = new C_YMD(Date.Year, Date.Month, day);

                    // see if the user is already signed up somewhere that day
                    List<C_WorkItem> LoggedInUserWorkItemsOnDate = Global.GetWorkItemsForSiteOnDateForUser(
                        null,
                        ourDate,
                        OurUser.id,
                        C_Global.E_SiteCondition.Any);
                    if (LoggedInUserWorkItemsOnDate.Count != 0)
                        dayState = E_DayState.SignedUp;
                    else
                    {
                        List<C_SiteSchedule> sitesOnDateSchedule = C_SiteSchedule.GetSiteScheduleForSiteOnDate(null, ourDate, SitesSchedule);

                        bool allClosed = C_SiteSchedule.AllSitesClosed(sitesOnDateSchedule);
                        if (allClosed)
                            dayState = E_DayState.AllClosed;
                        else
                        {
                            var ou = sitesOnDateSchedule.Where(ss => ss.EFilersNeeded > ss.EFilersSignedUp);

                            int xc = ou.Count();
                            dayState = ou.Any() ? E_DayState.OnePlusHasNeeds : E_DayState.NoNeeds;
                        }
                    }

                    DayState[day - 1] = dayState;
				}

                return true;
            }

            public void MoveToNextMonth()
            {
                Date.AddMonths(1);
            }

            public void MoveToPreviousMonth()
            {
                Date.SubtractMonths(1);
			}

            public void SetDisplay()
            {
                string monthName = Date.ToDateTime().ToString("MMMM");
                YearMonthLabel.Text = monthName + " " + Date.Year.ToString();

				// set the DateOffset; the DateOffset is for the first day of the month
				C_YMD firstDayOfMonth = new C_YMD(Date.Year, Date.Month, 1);
                DateOffset = (int)firstDayOfMonth.DayOfWeek;
                // 0 here represents Sunday; 6 is Saturday which is what we want
                int daysInMonth = DateTime.DaysInMonth(Date.Year, Date.Month);

                foreach(UIButton b in Buttons)
                {
                    // each button has a tag assigned, starting with 0 on top left of the grid
                    //  incrementing to 41
                    int x = (int)b.Tag - DateOffset;
                    if ((x >= 0) && (x < daysInMonth))
                    {
                        b.Hidden = false;
                        string btext = (x + 1).ToString();
                        b.SetTitle(btext, UIControlState.Normal);

                        E_DayState dayState = DayState[x];
                        switch (dayState)
                        {
                            case E_DayState.AllClosed:
                                b.BackgroundColor = UIColor.LightGray;
                                b.SetTitleColor(UIColor.Black, UIControlState.Normal);
                                break;
                            case E_DayState.NoNeeds:
                                b.BackgroundColor = UIColor.Green;
								b.SetTitleColor(UIColor.White, UIControlState.Normal);
								break;
                            case E_DayState.OnePlusHasNeeds:
                                b.BackgroundColor = UIColor.Red;
								b.SetTitleColor(UIColor.White, UIControlState.Normal);
								break;
                            case E_DayState.SignedUp:
                                b.BackgroundColor = UIColor.Blue;
								b.SetTitleColor(UIColor.White, UIControlState.Normal);
								break;
                            default:
                                throw new ApplicationException("unexpected day state");
                        }
                    }
                    else
                    {
                        b.Hidden = true;
						b.SetTitle("", UIControlState.Normal);
					}
				}
            }
        }
    }
}