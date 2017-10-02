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

		C_VitaSite OurSite;

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

			OurSite = Global.GetSiteFromCacheNoFetch(Global.SelectedSiteSlug);

			B_Back.TouchUpInside += (sender, e) =>
			{
				PerformSegue("Segue_SCSiteVolCalToSCSite", this);
			};

			B_MonthNext.TouchUpInside += (sender, e) =>
			{
				C_YMD d = Global.CalendarDate;
				d.Day = 1;
				d.AddMonths(1);
				Global.CalendarDate = d;

				L_MonthYear.Text = Global.CalendarDate.ToString("mmm-yyyy");

				DateState = BuildDateStateArray(Global.CalendarDate);

				CollectionViewHelper.SetDayState(DateState, null);

				CV_Grid.ReloadData();
			};

			B_MonthPrevious.TouchUpInside += (sender, e) =>
			{
				C_YMD d = Global.CalendarDate;
				d.Day = 1;
				d.SubtractMonths(1);
				Global.CalendarDate = d;

				L_MonthYear.Text = Global.CalendarDate.ToString("mmm-yyyy");

				DateState = BuildDateStateArray(Global.CalendarDate);

				CollectionViewHelper.SetDayState(DateState, null);

				CV_Grid.ReloadData();
			};

            IMG_Closed.Image = UIImage.FromBundle("closed");
            IMG_PastNoApprovals.Image = UIImage.FromBundle("opennoneeds");
            IMG_PastApprovals.Image = UIImage.FromBundle("opennoneedsboxed");
            IMG_FutureNoNeeds.Image = UIImage.FromBundle("openwithneeds");
            IMG_FutureNeeds.Image = UIImage.FromBundle("openwithneedsboxed");

			DateState = BuildDateStateArray(Global.CalendarDate);

			L_MonthYear.Text = Global.CalendarDate.ToString("mmm-yyyy");

			CollectionViewHelper = new C_CVHelper(UIColor.FromRGB(240, 240, 240), CV_Grid, DateState, null, true);
			CollectionViewHelper.DateTouched += (sender, e) =>
			{
				C_DateTouchedEventArgs ea = e;
				Global.SelectedDate = ea.Date;
				PerformSegue("Segue_SCSiteVolCalToSCVolunteers", this);
			};
			//CollectionViewHelper.DayOfWeekTouched += (sender, e) =>
			//{
			//	C_DayOfWeekTouchedEventArgs ea = e;
			//	Global.SelectedDayOfWeek = ea.DayOfWeek;
			//	PerformSegue("Segue_SCSiteCalendarToSCSiteDefaults", this);
			//};
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

				// get workitems for this date at this site
				List<C_WorkItem> wiList = Global.GetWorkItemsForSiteOnDate(ourDate, OurSite.Slug);

				if (ourDate < now)
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
					// find out how many we need today
					int dayOfWeek = (int)ourDate.DayOfWeek;
					C_SiteCalendarEntry ce = OurSite.SiteCalendar[dayOfWeek];
					// see if this date has an exception
					C_CalendarEntry siteExceptionOnDate = OurSite.GetCalendarExceptionForDateForSite(ourDate);
					bool isClosed = ce.OpenTime == ce.CloseTime;
					if (siteExceptionOnDate != null)
						isClosed = siteExceptionOnDate.IsClosed;

					if (isClosed)
					{
						dayState.ShowBox = false;
						dayState.NormalColor = Color_Closed;
						dayState.HighlightedColor = Color_Closed;
						dayState.TextColor = UIColor.Black;
						dayState.CanClick = false;
					}
					else if (wiList.Count == 0)
					{
						dayState.ShowBox = true;
                        dayState.NormalColor = Color_Orange;
						dayState.HighlightedColor = Color_Orange;
						dayState.TextColor = UIColor.Black;
					}
					else
					{
						int needed = ce.NumEFilers;
						if (siteExceptionOnDate != null)
							needed = siteExceptionOnDate.NumEFilers;

						dayState.NormalColor = Color_Orange;
						dayState.HighlightedColor = Color_Orange;
						dayState.TextColor = UIColor.Black;
						dayState.ShowBox = wiList.Count < needed;
					}
				}

				// todo: add a check for out of season

				DateState[day - 1] = dayState;
			}

			return DateState;
		}

	}
}