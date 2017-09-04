using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using UIKit;

using zsquared;

namespace vitavol
{
    public partial class VC_SCSiteCalendar : UIViewController
    {
        // Input
        //   LoggedInUser
        //   SelectedDate
        //   SelectedSite
        //   SelectedDayOfWeek

		C_YMD CalDate;
		C_CalGrid calgrid;
		C_Global Global;

		public VC_SCSiteCalendar (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

            if ((Global.LoggedInUser == null)
                || (Global.SelectedDate == null)
                || (Global.SelectedSite == null)
                || (Global.SelectedDayOfWeek == -1))
                throw new ApplicationException("required parameters not found");

			B_Back.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_SCSiteCalendarToSCSite", this);
            };

            CalDate = C_YMD.Now;
            calgrid = new C_CalGrid(GetDayOfMonthButtonsArray(), GetDayOfWeekButtonsArray(), L_YearMonth, Global.LoggedInUser);

			calgrid.ButtonTouchUpInside += (ymd) =>
			{
				Global.SelectedDate = ymd;

				PerformSegue("Segue_SCSiteCalendarToSCSiteOnDate", this);
			};

            B_MonthNext.TouchUpInside += (sender, e) =>
			{
				calgrid.MoveToNextMonth();

                calgrid.BuildDateStateArray(CalDate, Global.SelectedSite);

				calgrid.SetDisplay();
			};

            B_MonthPrevious.TouchUpInside += (sender, e) =>
			{
				calgrid.MoveToPreviousMonth();

                calgrid.BuildDateStateArray(CalDate, Global.SelectedSite);

				calgrid.SetDisplay();
			};

			B_Sunday.TouchUpInside += (sender, e) =>
			{
				Global.SelectedDayOfWeek = 0;
				PerformSegue("Segue_SCSiteCalendarToSCSiteDefaults", this);
			};

			B_Monday.TouchUpInside += (sender, e) => 
            {
                Global.SelectedDayOfWeek = 1;
                PerformSegue("Segue_SCSiteCalendarToSCSiteDefaults", this);
            };

			B_Tuesday.TouchUpInside += (sender, e) =>
			{
				Global.SelectedDayOfWeek = 2;
				PerformSegue("Segue_SCSiteCalendarToSCSiteDefaults", this);
			};

            B_Wednesday.TouchUpInside += (sender, e) =>
			{
				Global.SelectedDayOfWeek = 3;
				PerformSegue("Segue_SCSiteCalendarToSCSiteDefaults", this);
			};

            B_Thursday.TouchUpInside += (sender, e) =>
			{
				Global.SelectedDayOfWeek = 4;
				PerformSegue("Segue_SCSiteCalendarToSCSiteDefaults", this);
			};

            B_Friday.TouchUpInside += (sender, e) =>
			{
				Global.SelectedDayOfWeek = 5;
				PerformSegue("Segue_SCSiteCalendarToSCSiteDefaults", this);
			};

            B_Saturday.TouchUpInside += (sender, e) =>
			{
				Global.SelectedDayOfWeek = 6;
				PerformSegue("Segue_SCSiteCalendarToSCSiteDefaults", this);
			};

            calgrid.BuildDateStateArray(CalDate, Global.SelectedSite);

			calgrid.SetDisplay();
		}

        public List<UIButton> GetDayOfMonthButtonsArray()
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

		public List<UIButton> GetDayOfWeekButtonsArray()
		{
			List<UIButton> res = new List<UIButton>() {
                B_Sunday, B_Monday, B_Tuesday, B_Wednesday, B_Thursday, B_Friday, B_Saturday 
            };

			return res;
		}

		public class C_CalGrid
		{
			enum E_DayState
			{
                ClosedDefault,      // the site is closed using the default calendar    [red
                ClosedException,    // the site is closed based on an exception         [red, bold
                OpenDefault,        // the site is open using the default calendar      [green
                OpenException,      // the site is open based on an exception           [green, bold
                OutOfSeason,        // the site is close due to being out of season     [light grey
				Unknown
			}

			readonly List<UIButton> DayOfMonthButtons; // an array of all of the 42 buttons
            readonly List<UIButton> DayOfWeekButtons;  // array of 7 buttons, for the day of the week
			E_DayState[] DayState;  // array of flags for each day in the month on day status
            E_DayState[] DayOfWeekState; // array of flags, one for each day of the week (SMTWTFS)
			C_YMD Date;             // current month/year
			int DateOffset;         // offset for first day of the month
			readonly UILabel YearMonthLabel; // the label for month/year display
			C_VitaUser OurUser;

			public delegate void ButtonTouchUpEventHandler(C_YMD ymd);

			/// <summary>
			/// When the user touchupinside on a date, this event is called.
			/// </summary>
			public event ButtonTouchUpEventHandler ButtonTouchUpInside;

            public C_CalGrid(List<UIButton> dayOfMonthButtons, List<UIButton> dayOfWeekButtons, UILabel yearMonthLabel, C_VitaUser ou)
			{
				DayOfMonthButtons = dayOfMonthButtons;
                DayOfWeekButtons = dayOfWeekButtons;
				YearMonthLabel = yearMonthLabel;
				OurUser = ou;

				foreach (UIButton button in DayOfMonthButtons)
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

				ButtonTouchUpInside?.Invoke(new C_YMD(Date.Year, Date.Month, day));
			}

			public bool BuildDateStateArray(C_YMD ymd, C_VitaSite site)
			{
				Date = ymd;

				int daysInMonth = DateTime.DaysInMonth(Date.Year, Date.Month);

				// determine the state of each day in the month
				DayState = new E_DayState[daysInMonth];
                for (int day = 1; day <= daysInMonth; day++)
                {
					C_YMD ourDate = new C_YMD(Date.Year, Date.Month, day);
					int ourDayOfWeek = (int)ourDate.DayOfWeek;

                    C_SiteCalendarEntry sce = site.SiteCalendar[ourDayOfWeek];
                    bool defOpen = sce.OpenTime != sce.CloseTime;
                    E_DayState dayState = defOpen ? E_DayState.OpenDefault : E_DayState.ClosedDefault;

                    // see if this date has an exception
                    C_CalendarEntry siteExceptionOnDate = site.GetCalendarExceptionForDateForSite(ourDate);
                    if (siteExceptionOnDate != null)
                        dayState = (siteExceptionOnDate.OpenTime != siteExceptionOnDate.CloseTime) ? E_DayState.OpenException : E_DayState.ClosedException;

                    // todo: add a check for out of season

					DayState[day - 1] = dayState;
				}

                DayOfWeekState = new E_DayState[7];
                for (int ix = 0; ix != 7; ix++)
                {
                    C_SiteCalendarEntry sce = site.SiteCalendar[ix];
                    bool isOpen = sce.OpenTime != sce.CloseTime;
                    DayOfWeekState[ix] = isOpen ? E_DayState.OpenDefault : E_DayState.ClosedDefault;
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
                // todo: user CoreGraphics to draw boxes around exception dates
                // todo: need way to soften the SMTWTFS colors

                // set the day of week button status
                for (int ix = 0; ix != 7; ix++)
                {
                    E_DayState dowState = DayOfWeekState[ix];
                    UIButton b = DayOfWeekButtons[ix];
                    switch (dowState)
                    {
                        case E_DayState.OpenDefault:
							b.BackgroundColor = UIColor.FromRGB(0, 200, 0);
							b.SetTitleColor(UIColor.White, UIControlState.Normal);
							break;
                        case E_DayState.ClosedDefault:
							b.BackgroundColor = UIColor.FromRGB(200, 0, 0);
							b.SetTitleColor(UIColor.White, UIControlState.Normal);
							break;
						default:
							throw new ApplicationException("unexpected day state");
					}
                }

				string monthName = Date.ToDateTime().ToString("MMMM");
				YearMonthLabel.Text = monthName + " " + Date.Year.ToString();

				// set the DateOffset; the DateOffset is for the first day of the month
				C_YMD firstDayOfMonth = new C_YMD(Date.Year, Date.Month, 1);
				DateOffset = (int)firstDayOfMonth.DayOfWeek;
				// 0 here represents Sunday; 6 is Saturday which is what we want
				int daysInMonth = DateTime.DaysInMonth(Date.Year, Date.Month);

                foreach (UIButton b in DayOfMonthButtons)
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
                            case E_DayState.OpenDefault:
                                b.BackgroundColor = UIColor.FromRGB(0, 200, 0);
								b.SetTitleColor(UIColor.Black, UIControlState.Normal);
								break;
                            case E_DayState.OpenException:
								b.BackgroundColor = UIColor.FromRGB(0, 150, 0);
								b.SetTitleColor(UIColor.Black, UIControlState.Normal);
								break;
                            case E_DayState.ClosedDefault:
                                b.BackgroundColor = UIColor.FromRGB(200, 0, 0);
								b.SetTitleColor(UIColor.White, UIControlState.Normal);
								break;
                            case E_DayState.ClosedException:
								b.BackgroundColor = UIColor.FromRGB(015, 0, 0);
								b.SetTitleColor(UIColor.White, UIControlState.Normal);
								break;
                            case E_DayState.OutOfSeason:
                                b.BackgroundColor = UIColor.FromRGB(200, 200, 200);
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