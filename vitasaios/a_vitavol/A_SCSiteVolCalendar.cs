using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
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
        C_VitaSite SelectedSite;
        C_VitaUser LoggedInUser;

		ProgressDialog AI_Busy;

		C_GVHelper GVHelper;

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

			if (Global.CalendarDate == null)
				Global.CalendarDate = C_YMD.Now;

            SelectedSite = Global.GetSiteFromSlugNoFetch(Global.SelectedSiteSlug);
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

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
				C_YMD d = Global.CalendarDate;
				d.Day = 1;
				d.AddMonths(1);
				Global.CalendarDate = d;

				L_Date.Text = Global.CalendarDate.ToString("mmm yyyy");

                AI_Busy.Show();
                Task.Run(async () => 
                {
					Global.SitesSchedule = await Global.GetSitesScheduleForSiteCached(Global.CalendarDate.Year, Global.CalendarDate.Month, SelectedSite.Slug);

                    // we don't need the results here but this causes the items to be pulled from the backend if needed, so they are in place
                    List<C_SignUp> suList = await Global.GetSignUpsForSiteInDateRangeCached(LoggedInUser.Token, Global.CalendarDate.Year, Global.CalendarDate.Month, SelectedSite.Slug);

					RunOnUiThread(() => 
                    {
                        AI_Busy.Cancel();

						C_DateDetails[] detailsx = BuildDateStateArray(Global.CalendarDate);
						C_DateDetails[] dayDetailsx = BuildDayStateArray();
						GVHelper.SetNewDateDetails(detailsx, dayDetailsx);
					});
                });
			};

			B_PrevMonth.Click += (sender, e) =>
			{
				C_YMD d = Global.CalendarDate;
				d.Day = 1;
				d.SubtractMonths(1);
				Global.CalendarDate = d;

				L_Date.Text = Global.CalendarDate.ToString("mmm yyyy");

				AI_Busy.Show();
				Task.Run(async () =>
				{
					Global.SitesSchedule = await Global.GetSitesScheduleForSiteCached(Global.CalendarDate.Year, Global.CalendarDate.Month, SelectedSite.Slug);

                    // we don't need the results here but this causes the items to be pulled from the backend if needed, so they are in place
                    List<C_SignUp> suList = await Global.GetSignUpsForSiteInDateRangeCached(LoggedInUser.Token, Global.CalendarDate.Year, Global.CalendarDate.Month, SelectedSite.Slug);

					RunOnUiThread(() =>
					{
						AI_Busy.Cancel();

						C_DateDetails[] detailsx = BuildDateStateArray(Global.CalendarDate);
						C_DateDetails[] dayDetailsx = BuildDayStateArray();
						GVHelper.SetNewDateDetails(detailsx, dayDetailsx);
					});
				});
			};

			L_Date.Text = Global.CalendarDate.ToString("mmm yyyy");

            Task.Run(async () => 
            {
				Global.SitesSchedule = await Global.GetSitesScheduleForSiteCached(Global.CalendarDate.Year, Global.CalendarDate.Month, SelectedSite.Slug);

                // we don't need the results here but this causes the items to be pulled from the backend if needed, so they are in place
                List<C_SignUp> suList = await Global.GetSignUpsForSiteInDateRangeCached(LoggedInUser.Token, Global.CalendarDate.Year, Global.CalendarDate.Month, SelectedSite.Slug);

                //List<C_SignUp> suAll = await Global.FetchAllSignUps(LoggedInUser.Token);

                //foreach (C_SignUp su1 in suAll)
                    //Console.WriteLine(su1.id.ToString() 
                                     // + ", " + su1.Date.ToString("yyyymmdd") 
                                     // + ", " + su1.UserId.ToString() 
                                     // + ", " + su1.ShiftId.ToString()
                                     // + ", " + su1.Hours.ToString()
                                     // + ", " + su1.Approved.ToString()
                                     //);

                RunOnUiThread(() => 
                {
					C_DateDetails[] details = BuildDateStateArray(Global.CalendarDate);
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
				});
			});
		}

		void GVHelper_DateTouched(object sender, C_DateTouchedEventArgs e)
		{
			Global.SelectedDate = e.Date;
            StartActivity(new Intent(this, typeof(A_SCSiteShifts)));
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

				List<C_SiteSchedule> siteOnDateSchedule = C_SiteSchedule.GetSiteScheduleForSiteOnDate(Global.SelectedSiteSlug, ourDate, Global.SitesSchedule);
				C_SiteSchedule ourSiteSchedule = null;
				if (siteOnDateSchedule.Count != 0)
					ourSiteSchedule = siteOnDateSchedule[0];

				// get workitems for this date at this site
                List<C_SignUp> wiList = Global.GetSignUpsForSiteOnDate(ourDate, SelectedSite.Slug);

				// find out how many we need today
				C_CalendarEntry ce = SelectedSite.GetCalendarEntryForDate(ourDate);

                if (ce == null)
                {
                    dayState.SiteState = E_SiteState.Background;
                }
				else if (ourDate < now)
                {
                    // if there are no signups on a date, then show as "no volunteers"
                    if (!ce.SiteIsOpen)
                    {
                        dayState.SiteState = E_SiteState.Closed;
                        dayState.Boxed = false;
                    }
                    else
                    {
                        // the site is open
                        dayState.SiteState = E_SiteState.OpenNoNeeds;

                        // if there are any unapproved, then show as boxed
                        var ou = wiList.Where(wi => !wi.Approved);
                        dayState.Boxed = ou.Any();
                    }
                }
				else
				{
                    if (!ce.SiteIsOpen)
					{
                        dayState.SiteState = E_SiteState.Closed;
                        dayState.Boxed = false;
					}
                    else
                    {
						dayState.SiteState = E_SiteState.OpenWithNeeds;
                        dayState.Boxed = AnyShiftIsUnderStaffed(ourSiteSchedule);
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

		public override void OnBackPressed()
		{
            StartActivity(new Intent(this, typeof(A_SCMySite)));
		}
	}
}
