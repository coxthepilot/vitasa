using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;

using zsquared;

namespace a_vitavol
{
    [Activity(Label = "VITA: Site Volunteer Calendar")]
    public class A_SCSiteVolCalendar : Activity
    {
		C_Global Global;

		ProgressDialog AI_Busy;

		C_GVHelper GVHelper;
        C_VitaSite OurSite;

		GridView GV_Calendar;
        Button B_PrevMonth;
        Button B_NextMonth;
        TextView L_Date;

        ImageView IMG_NoVolunteers;
        ImageView IMG_PastDateNoApprovals;
        ImageView IMG_PastDateNeedsApproval;
        ImageView IMG_FutureDateFullyStaffed;
        ImageView IMG_FutureDateHaveNeeds;

		protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

			MyAppDelegate g = (MyAppDelegate)Application;
			if (g.Global == null)
				g.Global = new C_Global();
			Global = g.Global;

			if (Global.SelectedDate == null)
				Global.SelectedDate = C_YMD.Now;

            OurSite = Global.GetSiteFromCacheNoFetch(Global.SelectedSiteSlug);

			// Set our view from the "main" layout resource
            SetContentView(Resource.Layout.SCSiteVolCalendar);

			AI_Busy = new ProgressDialog(this);
			AI_Busy.SetMessage("Please wait...");
			AI_Busy.SetCancelable(false);
			AI_Busy.SetProgressStyle(ProgressDialogStyle.Spinner);

			GV_Calendar = FindViewById<GridView>(Resource.Id.GV_Calendar);
            B_NextMonth = FindViewById<Button>(Resource.Id.B_NextMonth);
            B_PrevMonth = FindViewById<Button>(Resource.Id.B_PrevMonth);
            L_Date = FindViewById<TextView>(Resource.Id.L_Date);

            IMG_NoVolunteers = FindViewById<ImageView>(Resource.Id.IMG_NoVolunteers);
            IMG_PastDateNoApprovals = FindViewById<ImageView>(Resource.Id.IMG_PastDateNoApprovals);
            IMG_PastDateNeedsApproval = FindViewById<ImageView>(Resource.Id.IMG_PastDateNeedsApproval);
            IMG_FutureDateFullyStaffed = FindViewById<ImageView>(Resource.Id.IMG_FutureDateFullyStaffed);
            IMG_FutureDateHaveNeeds = FindViewById<ImageView>(Resource.Id.IMG_FutureDateHaveNeeds);

			B_NextMonth.Click += (sender, e) =>
			{
				C_YMD d = Global.SelectedDate;
				d.Day = 1;
				d.AddMonths(1);
				Global.SelectedDate = d;

				L_Date.Text = Global.SelectedDate.ToString("mmm yyyy");

				C_DateDetails[] detailsx = BuildDateStateArray(Global.SelectedDate);
				C_DateDetails[] dayDetailsx = BuildDayStateArray();
				GVHelper.SetNewDateDetails(detailsx, dayDetailsx);
			};

			B_PrevMonth.Click += (sender, e) =>
			{
				C_YMD d = Global.SelectedDate;
				d.Day = 1;
				d.SubtractMonths(1);
				Global.SelectedDate = d;

				L_Date.Text = Global.SelectedDate.ToString("mmm yyyy");

				C_DateDetails[] detailsx = BuildDateStateArray(Global.SelectedDate);
				C_DateDetails[] dayDetailsx = BuildDayStateArray();
				GVHelper.SetNewDateDetails(detailsx, dayDetailsx);
			};

			L_Date.Text = Global.SelectedDate.ToString("mmm yyyy");

			C_DateDetails[] details = BuildDateStateArray(Global.SelectedDate);
			C_DateDetails[] dayDetails = BuildDayStateArray();
			GVHelper = new C_GVHelper(this, GV_Calendar);

			GVHelper.SetResourceID(C_GVHelper.ID_Background, Resource.Drawable.background);
			GVHelper.SetResourceID(C_GVHelper.ID_OpenWithNeeds, Resource.Drawable.openwithneeds);
			GVHelper.SetResourceID(C_GVHelper.ID_OpenWithNeedsBoxed, Resource.Drawable.openwithneedsboxed);
			GVHelper.SetResourceID(C_GVHelper.ID_OpenNoNeeds, Resource.Drawable.opennoneeds);
			GVHelper.SetResourceID(C_GVHelper.ID_OpenNoNeedsBoxed, Resource.Drawable.opennoneedsboxed);
			GVHelper.SetResourceID(C_GVHelper.ID_Closed, Resource.Drawable.closed);
			GVHelper.SetResourceID(C_GVHelper.ID_ClosedBoxed, Resource.Drawable.closedboxed);
			GVHelper.SetResourceID(C_GVHelper.ID_GridCell, Resource.Layout.GridCell);
			GVHelper.SetResourceID(C_GVHelper.ID_GridCellText, Resource.Id.L_Cell);

			GVHelper.SetNewDateDetails(details, dayDetails);
			GVHelper.DateTouched += GVHelper_DateTouched;
			// we take no action on day of week being touched

            IMG_NoVolunteers.SetImageResource(Resource.Drawable.closed);
            IMG_PastDateNoApprovals.SetImageResource(Resource.Drawable.opennoneeds);
            IMG_PastDateNeedsApproval.SetImageResource(Resource.Drawable.opennoneedsboxed);
            IMG_FutureDateFullyStaffed.SetImageResource(Resource.Drawable.openwithneeds);
            IMG_FutureDateHaveNeeds.SetImageResource(Resource.Drawable.openwithneedsboxed);
		}

		void GVHelper_DateTouched(object sender, C_DateTouchedEventArgs e)
		{
			Global.SelectedDate = e.Date;
            StartActivity(new Intent(this, typeof(A_SCSiteVol)));
		}

		public C_DateDetails[] BuildDayStateArray()
		{
			C_DateDetails[] DayOfWeekState = new C_DateDetails[7];

			for (int ix = 0; ix != 7; ix++)
			{
				C_DateDetails dayState = new C_DateDetails()
				{
					Date = null,
					DayOfWeek = ix,

					DateType = E_DateType.Header,
					SiteState = E_SiteState.Background
				};

				DayOfWeekState[ix] = dayState;
			}

			return DayOfWeekState;
		}

		public C_DateDetails[] BuildDateStateArray(C_YMD Date)
		{
			int daysInMonth = DateTime.DaysInMonth(Date.Year, Date.Month);

			C_YMD now = C_YMD.Now;

			C_DateDetails[] DateState = new C_DateDetails[daysInMonth];

			// scan through the days to determine the state of that date
			for (int day = 1; day <= daysInMonth; day++)
			{
				C_YMD ourDate = new C_YMD(Date.Year, Date.Month, day);

				C_DateDetails dayState = new C_DateDetails()
				{
					Date = ourDate,
					DayOfWeek = (int)ourDate.DayOfWeek,

					DateType = E_DateType.DayOfMonth,
					Boxed = false
				};

				// get workitems for this date at this site
				List<C_WorkItem> wiList = Global.GetWorkItemsForSiteOnDate(ourDate, OurSite.Slug);

				if (ourDate < now)
                {
                    // if there are no signups on a date, then show as "no volunteers"
                    if (wiList.Count == 0)
                    {
                        dayState.SiteState = E_SiteState.Closed;
                        dayState.Boxed = false;
                    }
                    else
                    {
                        // at least one person is signed up
                        dayState.SiteState = E_SiteState.OpenNoNeeds;

                        // if there are any unapproved, then show as boxed
                        var ou = wiList.Where(wi => !wi.Approved);
                        dayState.Boxed = ou.Any();
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
                        dayState.SiteState = E_SiteState.Closed;
                        dayState.Boxed = false;
					}
					else if (wiList.Count == 0)
                    {
						dayState.SiteState = E_SiteState.OpenWithNeeds;
                        dayState.Boxed = true;
					}
                    else
                    {
						int needed = ce.NumEFilers;
						if (siteExceptionOnDate != null)
							needed = siteExceptionOnDate.NumEFilers;

						dayState.SiteState = E_SiteState.OpenWithNeeds;
                        dayState.Boxed = wiList.Count < needed;
                    }
				}

				DateState[day - 1] = dayState;
			}

			return DateState;
		}



		public override void OnBackPressed()
		{
            StartActivity(new Intent(this, typeof(A_SCMySite)));
		}



	}
}
