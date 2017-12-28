using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;

using zsquared;

namespace a_vitavol
{
    [Activity(Label = "VITA: Select Date")]
    public class A_VolCalendar : Activity
    {
		C_Global Global;
		C_VitaUser LoggedInUser;

		C_GVHelper GVHelper;

		ProgressDialog AI_Busy;

		GridView GV_Calendar;
		Button B_NextMonth;
		Button B_PrevMonth;
        TextView L_Date;
		ImageView IMG_Closed;
		ImageView IMG_OpenNoNeeds;
		ImageView IMG_OpenWithNeeds;
        ImageView IMG_OpenNoNeedsBoxed;
        ImageView IMG_OpenWithNeedsBoxed;

		protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

			MyAppDelegate g = (MyAppDelegate)Application;
			if (g.Global == null)
				g.Global = new C_Global();
            
			Global = g.Global;
			LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

			SetContentView(Resource.Layout.VolCalendar);

			GV_Calendar = FindViewById<GridView>(Resource.Id.GV_Calendar);
			L_Date = FindViewById<TextView>(Resource.Id.L_Date);
			B_NextMonth = FindViewById<Button>(Resource.Id.B_NextMonth);
			B_PrevMonth = FindViewById<Button>(Resource.Id.B_PrevMonth);
			IMG_Closed = FindViewById<ImageView>(Resource.Id.IMG_Closed);
            IMG_OpenNoNeeds = FindViewById<ImageView>(Resource.Id.IMG_OpenNoNeeds);
            IMG_OpenWithNeeds = FindViewById<ImageView>(Resource.Id.IMG_OpenWithNeeds);
            IMG_OpenNoNeedsBoxed = FindViewById<ImageView>(Resource.Id.IMG_OpenNoNeedsBoxed);
            IMG_OpenWithNeedsBoxed = FindViewById<ImageView>(Resource.Id.IMG_OpenWithNeedsBoxed);

			AI_Busy = new ProgressDialog(this);
			AI_Busy.SetMessage("Please wait...");
			AI_Busy.SetCancelable(false);
			AI_Busy.SetProgressStyle(ProgressDialogStyle.Spinner);

            if (Global.CalendarDate == null)
                Global.CalendarDate = C_YMD.Now;

			IMG_Closed.SetImageResource(Resource.Drawable.closed);
            IMG_OpenNoNeeds.SetImageResource(Resource.Drawable.opennoneeds);
            IMG_OpenWithNeeds.SetImageResource(Resource.Drawable.openwithneeds);
			IMG_OpenNoNeedsBoxed.SetImageResource(Resource.Drawable.opennoneedsboxed);
			IMG_OpenWithNeedsBoxed.SetImageResource(Resource.Drawable.openwithneedsboxed);

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
					Global.SitesSchedule = await Global.GetSitesScheduleCached(Global.CalendarDate.Year, Global.CalendarDate.Month);

					C_DateDetails[] details = BuildDateStateArray(Global.CalendarDate);
					C_DateDetails[] dayDetails = BuildDayStateArray();

					RunOnUiThread(() =>
					{
                        AI_Busy.Cancel();
						GVHelper.SetNewDateDetails(details, dayDetails);
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
					Global.SitesSchedule = await Global.GetSitesScheduleCached(Global.CalendarDate.Year, Global.CalendarDate.Month);
					
					C_DateDetails[] details = BuildDateStateArray(Global.CalendarDate);
					C_DateDetails[] dayDetails = BuildDayStateArray();

					RunOnUiThread(() => 
                    {
                        AI_Busy.Cancel();
						GVHelper.SetNewDateDetails(details, dayDetails);
					});
                });
			};

			AI_Busy.Show();

			Task.Run(async () =>
			{
				L_Date.Text = Global.CalendarDate.ToString("mmm yyyy");

				Global.SitesSchedule = await Global.GetSitesScheduleCached(Global.CalendarDate.Year, Global.CalendarDate.Month);
				// todo: need a timeout on the SitesSchedule

				RunOnUiThread(() =>
				{
					AI_Busy.Cancel();

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
				});
			});
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

                if (ourDate < now)
                {
					dayState.DateType = E_DateType.PastDate;
				}
                else
                {
                    // see if the user is already signed up somewhere that day
                    List<C_SignUp> LoggedInUserWorkItems = Global.GetSignUpsForUser(Global.LoggedInUserId);
                    var oux = LoggedInUserWorkItems.Where(wi => wi.Date == ourDate);
                    dayState.Boxed = oux.Any();

                    List<C_SiteSchedule> sitesOnDateSchedule = C_SiteSchedule.GetSiteScheduleForSiteOnDate(null, ourDate, Global.SitesSchedule);
                    bool allClosed = C_SiteSchedule.AllSitesClosed(sitesOnDateSchedule);
                    if (allClosed)
                    {
                        dayState.SiteState = E_SiteState.Closed;
                    }
                    else
                    {
						List<C_SiteSchedule> slist = new List<C_SiteSchedule>();
						foreach (C_SiteSchedule ss in sitesOnDateSchedule)
						{
							bool anyNeed = false;
							foreach (C_SiteScheduleShift sss in ss.Shifts)
							{
								if (
									((sss.eFilersSignedUpBasic < sss.eFilersNeededBasic) && (LoggedInUser.Certification == E_Certification.Basic))
									|| ((sss.eFilersSignedUpAdvanced < sss.eFilersNeededAdvanced) && (LoggedInUser.Certification == E_Certification.Advanced))
								)
								{
									anyNeed = true;
									break;
								}
							}
							if (anyNeed)
								slist.Add(ss);
						}


                        dayState.SiteState = (slist.Count != 0) ? E_SiteState.OpenWithNeeds : E_SiteState.OpenNoNeeds;
                    }
                }

				DateState[day - 1] = dayState;
			}

			return DateState;
		}

		void GVHelper_DateTouched(object sender, C_DateTouchedEventArgs e)
		{
			Global.SelectedDate = e.Date;
            StartActivity(new Intent(this, typeof(A_VolPickSite)));
		}

		public override void OnBackPressed()
		{
			StartActivity(new Intent(this, typeof(A_VolunteerActivity)));
		}
	}
}
