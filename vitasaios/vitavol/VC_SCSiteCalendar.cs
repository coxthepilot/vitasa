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

		C_Global Global;
        C_DateState[] DateState;
        C_DayState[] DayState;
		C_CVHelper CollectionViewHelper;

		public static UIColor Color_OpenDefault = UIColor.FromRGB(244, 167, 45);
		//public static UIColor Color_NoStaffingNeeds = UIColor.FromRGB(67, 202, 67);
		public static UIColor Color_ClosedDefault = UIColor.LightGray;

		public VC_SCSiteCalendar (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

			if (Global.CalendarDate == null)
				Global.CalendarDate = C_YMD.Now;

            B_Back.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_SCSiteCalendarToSCSite", this);
            };

            B_MonthNext.TouchUpInside += (sender, e) =>
			{
				C_YMD d = Global.CalendarDate;
				d.Day = 1;
				d.AddMonths(1);
				Global.CalendarDate = d;

				L_MonthYear.Text = Global.CalendarDate.ToString("mmm-yyyy");

				DateState = BuildDateStateArray(Global.CalendarDate, Global.SelectedSite);
				DayState = BuildDayStateArray(Global.SelectedSite);

                CollectionViewHelper.SetDayState(DateState, DayState);

				CV_Grid.ReloadData();
			};

            B_MonthPrevious.TouchUpInside += (sender, e) =>
			{
				C_YMD d = Global.CalendarDate;
				d.Day = 1;
                d.SubtractMonths(1);
				Global.CalendarDate = d;

				L_MonthYear.Text = Global.CalendarDate.ToString("mmm-yyyy");

				DateState = BuildDateStateArray(Global.CalendarDate, Global.SelectedSite);
				DayState = BuildDayStateArray(Global.SelectedSite);

				CollectionViewHelper.SetDayState(DateState, DayState);

				CV_Grid.ReloadData();
			};

            IMG_SiteIsClosed.BackgroundColor = Color_ClosedDefault;
            IMG_SiteIsOpen.BackgroundColor = Color_OpenDefault;
            IMG_ExceptionBase.BackgroundColor = UIColor.Black;
            IMG_ExceptionTop.BackgroundColor = UIColor.White;

            DateState = BuildDateStateArray(Global.CalendarDate, Global.SelectedSite);
            DayState = BuildDayStateArray(Global.SelectedSite);

			L_MonthYear.Text = Global.CalendarDate.ToString("mmm-yyyy");

            CollectionViewHelper = new C_CVHelper(UIColor.FromRGB(240, 240, 240), CV_Grid, DateState, DayState);
			CollectionViewHelper.DateTouched += (sender, e) =>
			{
				C_DateTouchedEventArgs ea = e;
				Global.SelectedDate = ea.Date;
				PerformSegue("Segue_SCSiteCalendarToSCSiteOnDate", this);
			};
            CollectionViewHelper.DayOfWeekTouched += (sender, e) =>
			{
                C_DayOfWeekTouchedEventArgs ea = e;
                Global.SelectedDayOfWeek = ea.DayOfWeek;
				PerformSegue("Segue_SCSiteCalendarToSCSiteDefaults", this);
			};
		}

        public override void ViewDidAppear(bool animated)
        {
			// set the standard background color
            View.BackgroundColor = C_Common.StandardBackground;
            B_MonthNext.BackgroundColor = C_Common.StandardBackground;
            B_MonthPrevious.BackgroundColor = C_Common.StandardBackground;
		}

        public C_DateState[] BuildDateStateArray(C_YMD Date, C_VitaSite site)
		{
			int daysInMonth = DateTime.DaysInMonth(Date.Year, Date.Month);

			// determine the state of each day in the month
			DateState = new C_DateState[daysInMonth];

			for (int day = 1; day <= daysInMonth; day++)
			{
				C_YMD ourDate = new C_YMD(Date.Year, Date.Month, day);

				C_DateState dayState = new C_DateState(ourDate)
				{
					BoxColor = UIColor.Black
				};

				int ourDayOfWeek = (int)ourDate.DayOfWeek;

				C_SiteCalendarEntry sce = site.SiteCalendar[ourDayOfWeek];
				bool defOpen = sce.OpenTime != sce.CloseTime;
                if (defOpen)
                {
                    dayState.NormalColor = Color_OpenDefault;
					dayState.HighlightedColor = Color_OpenDefault;
                    dayState.TextColor = UIColor.Black;
				}
                else
                {
                    dayState.NormalColor = Color_ClosedDefault;
					dayState.HighlightedColor = Color_ClosedDefault;
                    dayState.TextColor = UIColor.Black;
				}

				// see if this date has an exception
				C_CalendarEntry siteExceptionOnDate = site.GetCalendarExceptionForDateForSite(ourDate);
                if (siteExceptionOnDate != null)
                {
                    if (!siteExceptionOnDate.IsClosed)
                    {
                        dayState.ShowBox = true;
						dayState.NormalColor = Color_OpenDefault;
						dayState.HighlightedColor = Color_OpenDefault;
						dayState.TextColor = UIColor.Black;
					}
                    else
                    {
                        dayState.ShowBox = true;
						dayState.NormalColor = Color_ClosedDefault;
						dayState.HighlightedColor = Color_ClosedDefault;
						dayState.TextColor = UIColor.Black;
					}
                }

				// todo: add a check for out of season

				DateState[day - 1] = dayState;
			}

            return DateState;
		}

		public C_DayState[] BuildDayStateArray(C_VitaSite site)
        {
            C_DayState[] DayOfWeekState = new C_DayState[7];
			for (int ix = 0; ix != 7; ix++)
			{
				C_SiteCalendarEntry sce = site.SiteCalendar[ix];
				bool isOpen = sce.OpenTime != sce.CloseTime;

                C_DayState dayState = new C_DayState(ix);
                if (isOpen)
                {
					dayState.NormalColor = Color_OpenDefault;
					dayState.HighlightedColor = Color_OpenDefault;
					dayState.TextColor = UIColor.White;
				}
                else
                {
					dayState.NormalColor = Color_ClosedDefault;
					dayState.HighlightedColor = Color_ClosedDefault;
					dayState.TextColor = UIColor.White;
				}
                DayOfWeekState[ix] = dayState;
			}

            return DayOfWeekState;
		}
    }
}