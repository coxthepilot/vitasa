using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;
using UIKit;
using System.Drawing;
using CoreGraphics;

using zsquared;

namespace vitavol
{
    public partial class VC_Calendar : UIViewController
    {
        // todo: really should cache the SiteSchedule to reduce load times when cycling through the months

        // Input:
        //   CalendarDate (optional) (used on return from downstream screens to remember where we were)
        //   LoggedInUser
        //   AllSites

		C_Global Global;
        C_DateState[] DateState;
        C_CVHelper CollectionViewHelper;

		public static UIColor Color_StaffingNeeded = UIColor.FromRGB(244, 167, 45);
		public static UIColor Color_NoStaffingNeeds = UIColor.FromRGB(67, 202, 67);
		public static UIColor Color_AllSitesClosed = UIColor.LightGray;

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
                PerformSegue("Segue_CalendarToVolunteerOptions", this);

            B_NextMonth.TouchUpInside += (sender, e) =>
            {
                C_YMD d = Global.CalendarDate;
                d.Day = 1;
                d.AddMonths(1);
                Global.CalendarDate = d;

				L_MonthYear.Text = Global.CalendarDate.ToString("mmm-yyyy");

				//int daysInMonth = DateTime.DaysInMonth(Global.CalendarDate.Year, Global.CalendarDate.Month);
				//C_YMD start = new C_YMD(Global.CalendarDate.Year, Global.CalendarDate.Month, 1);
				//C_YMD end = new C_YMD(Global.CalendarDate.Year, Global.CalendarDate.Month, daysInMonth);

				AI_Loading.StartAnimating();
				EnableUI(false);
				Task.Run(async () =>
				{
                    Global.SitesSchedule = await Global.GetSitesScheduleCached(Global.CalendarDate.Year, Global.CalendarDate.Month);
					//Global.SitesSchedule = await C_SiteSchedule.FetchSitesSchedules(start, end);

					DateState = BuildDateStateArray(Global.CalendarDate);

					UIApplication.SharedApplication.InvokeOnMainThread(
					new Action(() =>
					{
						AI_Loading.StopAnimating();
						EnableUI(true);

						CollectionViewHelper.SetDayState(DateState, null);

						CV_Grid.ReloadData();
					}));
				});
			};

            B_PreviousMonth.TouchUpInside += (sender, e) =>
            {
				C_YMD d = Global.CalendarDate;
				d.Day = 1;
                d.SubtractMonths(1);
                Global.CalendarDate = d;

				L_MonthYear.Text = Global.CalendarDate.ToString("mmm-yyyy");

				//int daysInMonth = DateTime.DaysInMonth(Global.CalendarDate.Year, Global.CalendarDate.Month);
				//C_YMD start = new C_YMD(Global.CalendarDate.Year, Global.CalendarDate.Month, 1);
				//C_YMD end = new C_YMD(Global.CalendarDate.Year, Global.CalendarDate.Month, daysInMonth);

				AI_Loading.StartAnimating();
				EnableUI(false);
				Task.Run(async () => 
                {
					Global.SitesSchedule = await Global.GetSitesScheduleCached(Global.CalendarDate.Year, Global.CalendarDate.Month);
					//Global.SitesSchedule = await C_SiteSchedule.FetchSitesSchedules(start, end);

					DateState = BuildDateStateArray(Global.CalendarDate);

					UIApplication.SharedApplication.InvokeOnMainThread(
                    new Action(() =>
                    {
						AI_Loading.StopAnimating();
						EnableUI(true);

						CollectionViewHelper.SetDayState(DateState, null);

						CV_Grid.ReloadData();
					}));
				});
			};

			L_MonthYear.Text = Global.CalendarDate.ToString("mmm-yyyy");

			IMG_StaffingNeeded.BackgroundColor = Color_StaffingNeeded;
			IMG_FullyStaffed.BackgroundColor = Color_NoStaffingNeeds;
			IMG_AllSitesClosed.BackgroundColor = Color_AllSitesClosed;
			IMG_UserSignedUpBase.BackgroundColor = UIColor.Black;
			IMG_UserSignedUpTop.BackgroundColor = UIColor.White;
			
            B_NextMonth.BackgroundColor = C_Common.StandardBackground;
            B_PreviousMonth.BackgroundColor = C_Common.StandardBackground;

			AI_Loading.StartAnimating();
            EnableUI(false);
            Task.Run(async () => 
            {
                try
                {
                    //int daysInMonth = DateTime.DaysInMonth(Global.CalendarDate.Year, Global.CalendarDate.Month);
                    //C_YMD start = new C_YMD(Global.CalendarDate.Year, Global.CalendarDate.Month, 1);
                    //C_YMD end = new C_YMD(Global.CalendarDate.Year, Global.CalendarDate.Month, daysInMonth);

                    if (Global.SitesSchedule == null)
                    {
						Global.SitesSchedule = await Global.GetSitesScheduleCached(Global.CalendarDate.Year, Global.CalendarDate.Month);
						//Global.SitesSchedule = await C_SiteSchedule.FetchSitesSchedules(start, end);
                    }

                    //TimeSpan ts = DateTime.Now - Global.SiteScheduleSampleTime;
                    //if (ts.TotalMinutes > 10)
                    //{
                    //    Global.SitesSchedule = await C_SiteSchedule.FetchSitesSchedules(start, end);
                    //    Global.SiteScheduleSampleTime = DateTime.Now;
                    //}

                    // get the actual screen size so we can adjust the cell sizes accordingly
                    DateState = BuildDateStateArray(Global.CalendarDate);

                    UIApplication.SharedApplication.InvokeOnMainThread(
                    new Action(() =>
                    {
                        AI_Loading.StopAnimating();
                        EnableUI(true);

                        UIColor c = UIColor.FromRGB(240, 240, 240);
                        CollectionViewHelper = new C_CVHelper(c, CV_Grid, DateState, null, false);
                        CollectionViewHelper.DateTouched += (sender, e) =>
                        {
                            C_DateTouchedEventArgs ea = (C_DateTouchedEventArgs)e;
                            Global.SelectedDate = ea.Date;
                            PerformSegue("Segue_CalendarToSitesOnDateList", this);
                        };
                    }));
                }
                catch (Exception e)
                {
                    Console.WriteLine(e.Message);
                }
			}); // end of task.run
		}

        public override void ViewDidAppear(bool animated)
        {
			// set the standard background color
            View.BackgroundColor = C_Common.StandardBackground;
		}

        private void EnableUI(bool en)
        {
            B_Back.Enabled = en;
        }

		public C_DateState[] BuildDateStateArray(C_YMD Date)
		{
			int daysInMonth = DateTime.DaysInMonth(Date.Year, Date.Month);

			// determine the state of each day in the month
            // create a new array based on the number of days in the month
			DateState = new C_DateState[daysInMonth];
            // scan through the days to determine the state of that date
			for (int day = 1; day <= daysInMonth; day++)
			{
				C_YMD ourDate = new C_YMD(Date.Year, Date.Month, day);

                C_DateState dayState = new C_DateState(ourDate)
                {
                    BoxColor = UIColor.Black
                };

                // see if the user is already signed up somewhere that day
                List<C_WorkItem> LoggedInUserWorkItems = Global.GetWorkItemsForUser(Global.LoggedInUserId);
                var oux = LoggedInUserWorkItems.Where(wi => wi.Date == ourDate);

                dayState.ShowBox = oux.Any();

				List<C_SiteSchedule> sitesOnDateSchedule = C_SiteSchedule.GetSiteScheduleForSiteOnDate(null, ourDate, Global.SitesSchedule);

				bool allClosed = C_SiteSchedule.AllSitesClosed(sitesOnDateSchedule);
                if (allClosed)
                {
                    //dayState.State = C_DayState.E_DayState.AllClosed;
                    dayState.NormalColor = Color_AllSitesClosed;
                    dayState.HighlightedColor = Color_AllSitesClosed;
                    dayState.TextColor = UIColor.White;
                }
				else
				{
					var ou = sitesOnDateSchedule.Where(ss => ss.EFilersNeeded > ss.EFilersSignedUp);

                    if (ou.Any())
                    {
						//C_DayState.E_DayState.OnePlusHasNeeds
                        dayState.NormalColor = Color_StaffingNeeded;
						dayState.HighlightedColor = Color_StaffingNeeded;
                        dayState.TextColor = UIColor.Black;
					}
                    else
                    {
						//C_DayState.E_DayState.NoNeeds
                        dayState.NormalColor = Color_NoStaffingNeeds;
						dayState.HighlightedColor = Color_NoStaffingNeeds;
                        dayState.TextColor = UIColor.White;
                        dayState.CanClick = false;
					}
				}

				DateState[day - 1] = dayState;
			}

			return DateState;
		}
    }
}