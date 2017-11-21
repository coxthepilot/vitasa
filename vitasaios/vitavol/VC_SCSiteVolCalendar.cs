using Foundation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UIKit;

using zsquared;

namespace vitavol
{
    public partial class VC_SCSiteVolCalendar : UIViewController
    {
		C_Global Global;

		C_DateState[] DateState;
		C_CVHelper CollectionViewHelper;

        C_VitaSite SelectedSite;

        public static UIColor Color_Orange = UIColor.FromRGB(244, 167, 45);
        public static UIColor Color_Green = UIColor.FromRGB(67, 202, 67);
        public static UIColor Color_Closed = UIColor.LightGray;

		public VC_SCSiteVolCalendar (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

			if (Global.CalendarDate == null)
				Global.CalendarDate = C_YMD.Now;

			SelectedSite = Global.GetSiteNoFetch(Global.SelectedSiteSlug);

			B_Back.TouchUpInside += (sender, e) =>
				PerformSegue("Segue_SCSiteVolCalToSCSite", this);

			B_MonthNext.TouchUpInside += (sender, e) =>
			{
				C_YMD d = Global.CalendarDate;
				d.Day = 1;
				d.AddMonths(1);
				Global.CalendarDate = d;

				L_MonthYear.Text = Global.CalendarDate.ToString("mmm-yyyy");

				AI_Busy.StartAnimating();
                EnableUI(false);
				Task.Run(async () =>
				{
                    Global.SitesSchedule = await Global.GetSitesScheduleForSiteCached(Global.CalendarDate.Year, Global.CalendarDate.Month, SelectedSite.Slug);

					DateState = BuildDateStateArray(Global.CalendarDate);

					UIApplication.SharedApplication.InvokeOnMainThread(
					new Action(() =>
					{
						AI_Busy.StopAnimating();
                        EnableUI(true);

						CollectionViewHelper.SetDayState(DateState, null);

						CV_Grid.ReloadData();
					}));
				});
			};

			B_MonthPrevious.TouchUpInside += (sender, e) =>
			{
				C_YMD d = Global.CalendarDate;
				d.Day = 1;
				d.SubtractMonths(1);
				Global.CalendarDate = d;

				L_MonthYear.Text = Global.CalendarDate.ToString("mmm-yyyy");

                AI_Busy.StartAnimating();
                EnableUI(false);
				Task.Run(async () =>
				{
                    Global.SitesSchedule = await Global.GetSitesScheduleForSiteCached(Global.CalendarDate.Year, Global.CalendarDate.Month, SelectedSite.Slug);

					DateState = BuildDateStateArray(Global.CalendarDate);

					UIApplication.SharedApplication.InvokeOnMainThread(
					new Action(() =>
					{
						AI_Busy.StopAnimating();
                        EnableUI(true);

						CollectionViewHelper.SetDayState(DateState, null);

						CV_Grid.ReloadData();
					}));
				});
			};

            IMG_Closed.Image = UIImage.FromBundle("closed");
            IMG_PastNoApprovals.Image = UIImage.FromBundle("opennoneeds");
            IMG_PastApprovals.Image = UIImage.FromBundle("opennoneedsboxed");
            IMG_FutureNoNeeds.Image = UIImage.FromBundle("openwithneeds");
            IMG_FutureNeeds.Image = UIImage.FromBundle("openwithneedsboxed");

            AI_Busy.StartAnimating();
            EnableUI(false);

            Task.Run(async () =>
            {
                Global.SitesSchedule = await Global.GetSitesScheduleForSiteCached(Global.CalendarDate.Year, Global.CalendarDate.Month, SelectedSite.Slug);

				DateState = BuildDateStateArray(Global.CalendarDate);

				UIApplication.SharedApplication.InvokeOnMainThread(
                new Action(() =>
                {
                    AI_Busy.StopAnimating();
                    EnableUI(true);

					L_MonthYear.Text = Global.CalendarDate.ToString("mmm-yyyy");

					CollectionViewHelper = new C_CVHelper(UIColor.FromRGB(240, 240, 240), CV_Grid, DateState, null, true);
					CollectionViewHelper.DateTouched += (sender, e) =>
					{
						C_DateTouchedEventArgs ea = e;
						Global.SelectedDate = ea.Date;
						PerformSegue("Segue_SCSiteVolCalToSiteShifts", this);
					};
				}));
			});
        }

        private void EnableUI(bool en)
        {
            CV_Grid.UserInteractionEnabled = en;
            B_Back.Enabled = en;
            B_MonthNext.Enabled = en;
            B_MonthPrevious.Enabled = en;
        }

		public override void ViewDidAppear(bool animated)
		{
			// set the standard background color
			View.BackgroundColor = C_Common.StandardBackground;
			B_MonthNext.BackgroundColor = C_Common.StandardBackground;
			B_MonthPrevious.BackgroundColor = C_Common.StandardBackground;
		}

		public C_DateState[] BuildDateStateArray(C_YMD Date)
		{
			int daysInMonth = DateTime.DaysInMonth(Date.Year, Date.Month);

			// determine the state of each day in the month
			DateState = new C_DateState[daysInMonth];

            C_YMD now = C_YMD.Now;

			for (int day = 1; day <= daysInMonth; day++)
			{
				C_YMD ourDate = new C_YMD(Date.Year, Date.Month, day);


				C_DateState dayState = new C_DateState(ourDate)
				{
					BoxColor = UIColor.Black
				};

                List<C_SiteSchedule> siteOnDateSchedule = C_SiteSchedule.GetSiteScheduleForSiteOnDate(Global.SelectedSiteSlug, ourDate, Global.SitesSchedule);
                //if (siteOnDateSchedule.Count > 1)
                    //throw new ApplicationException("expecting only zero or one entry per day");
                C_SiteSchedule ourSiteSchedule = null;
                if (siteOnDateSchedule.Count != 0)
                    ourSiteSchedule = siteOnDateSchedule[0];

				// get workitems for this date at this site
                List<C_SignUp> wiList = Global.GetSignUpsForSiteOnDate(ourDate, SelectedSite.Slug); // <<<<<<<< this doesn't work; only current user!

				// find out how many we need today
				C_CalendarEntry ce = SelectedSite.GetCalendarEntryForDate(ourDate);

				if (ce == null) // this is essentially a check for out of season
				{
					dayState.ShowBox = false;
					dayState.NormalColor = C_Common.StandardBackground;
					dayState.HighlightedColor = C_Common.StandardBackground;
					dayState.TextColor = UIColor.Black;
					dayState.CanClick = false;
				}
				else if (ourDate < now)
				{
					// if there are no signups on a date, then show as "no volunteers"
					if (wiList.Count == 0)
					{
                        dayState.ShowBox = false;
						dayState.NormalColor = Color_Closed;
						dayState.HighlightedColor = Color_Closed;
						dayState.TextColor = UIColor.Black;
                        dayState.CanClick = false;
					}
					else
					{
                        dayState.NormalColor = Color_Green;
						dayState.HighlightedColor = Color_Green;
						dayState.TextColor = UIColor.Black;
						var ou = wiList.Where(wi => !wi.Approved);
						dayState.ShowBox = ou.Any();
					}
				}
				else
				{
                    if (!ce.SiteIsOpen)
					{
						dayState.ShowBox = false;
						dayState.NormalColor = Color_Closed;
						dayState.HighlightedColor = Color_Closed;
						dayState.TextColor = UIColor.Black;
						dayState.CanClick = false;
					}
                    else
                    {
						dayState.NormalColor = Color_Orange;
						dayState.HighlightedColor = Color_Orange;
						dayState.TextColor = UIColor.Black;
                        dayState.ShowBox = AnyShiftIsUnderStaffed(ourSiteSchedule);
					}
				}

				DateState[day - 1] = dayState;
			}

			return DateState;
		}

        private bool AnyShiftIsUnderStaffed(C_SiteSchedule ss)
        {
            bool anyNeed = false;

            if (ss != null)
            {
                foreach (C_SiteScheduleShift sss in ss.Shifts)
                {
                    anyNeed = (sss.eFilersSignedUpBasic < sss.eFilersNeededBasic)
                        || (sss.eFilersSignedUpAdvanced < sss.eFilersNeededAdvanced);
                    if (anyNeed)
                        break;
                }
            }

            return anyNeed;
        }
	}
}