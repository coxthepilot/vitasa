
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
    [Activity(Label = "VITA: Site Calendar")]
    public class A_SCCalendar : Activity
    {
        C_Global Global;

        C_VitaSite OurSite;

		ProgressDialog AI_Busy;

        C_GVHelper GVHelper;

		GridView GV_Calendar;
		TextView L_Date;
        ImageView IMG_Closed;
        ImageView IMG_Open;
        ImageView IMG_Exception;

        Button B_NextMonth;
        Button B_PrevMonth;

		protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

			MyAppDelegate g = (MyAppDelegate)Application;
			if (g.Global == null)
				g.Global = new C_Global();
			Global = g.Global;

			if (Global.SelectedDate == null)
				Global.SelectedDate = C_YMD.Now;

			// Set our view from the "main" layout resource
            SetContentView(Resource.Layout.SCCalendar);

			GV_Calendar = FindViewById<GridView>(Resource.Id.GV_Calendar);
            L_Date = FindViewById<TextView>(Resource.Id.L_Date);
            IMG_Closed = FindViewById<ImageView>(Resource.Id.IMG_Closed);
            IMG_Open = FindViewById<ImageView>(Resource.Id.IMG_Open);
            IMG_Exception = FindViewById<ImageView>(Resource.Id.IMG_Exception);
            B_NextMonth = FindViewById<Button>(Resource.Id.B_NextMonth);
            B_PrevMonth = FindViewById<Button>(Resource.Id.B_PrevMonth);

			AI_Busy = new ProgressDialog(this);
			AI_Busy.SetMessage("Please wait...");
			AI_Busy.SetCancelable(false);
			AI_Busy.SetProgressStyle(ProgressDialogStyle.Spinner);

            IMG_Open.SetImageResource(Resource.Drawable.openwithneeds);
            IMG_Closed.SetImageResource(Resource.Drawable.closed);
            IMG_Exception.SetImageResource(Resource.Drawable.openwithneedsboxed);

            B_NextMonth.Click += (sender, e) => 
            {
				C_YMD d = Global.SelectedDate;
				d.Day = 1;
				d.AddMonths(1);
				Global.SelectedDate = d;

                L_Date.Text = Global.SelectedDate.ToString("mmm yyyy");

				C_DateDetails[] detailsx = BuildDateStateArray(Global.SelectedDate);
				C_DateDetails[] dayDetailsx = BuildDayStateArray(OurSite);
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
				C_DateDetails[] dayDetailsx = BuildDayStateArray(OurSite);
				GVHelper.SetNewDateDetails(detailsx, dayDetailsx);
			};

			AI_Busy.Show();

			L_Date.Text = Global.SelectedDate.ToString("mmm yyyy");

            OurSite = Global.GetSiteFromCacheNoFetch(Global.SelectedSiteSlug);

            AI_Busy.Cancel();

			C_DateDetails[] details = BuildDateStateArray(Global.SelectedDate);
            C_DateDetails[] dayDetails = BuildDayStateArray(OurSite);
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
            GVHelper.DayOfWeekTouched += GVHelper_DayOfWeekTouched;
		}

		void GVHelper_DateTouched(object sender, C_DateTouchedEventArgs e)
		{
            Global.SelectedDate = e.Date;
            StartActivity(new Intent(this, typeof(A_SCSiteException)));
		}

		void GVHelper_DayOfWeekTouched(object sender, C_DayOfWeekTouchedEventArgs e)
		{
            Global.SelectedDayOfWeek = e.DayOfWeek;
            StartActivity(new Intent(this, typeof(A_SCSiteDefault)));
		}

		public C_DateDetails[] BuildDayStateArray(C_VitaSite site)
		{
			C_DateDetails[] DayOfWeekState = new C_DateDetails[7];

			for (int ix = 0; ix != 7; ix++)
			{
                C_DateDetails dayState = new C_DateDetails()
                {
                    Date = null,
                    DayOfWeek = -1,

                    DateType = E_DateType.Header
                };

				C_SiteCalendarEntry sce = site.SiteCalendar[ix];
				bool isOpen = sce.OpenTime != sce.CloseTime;

				if (isOpen)
				{
                    dayState.DayOfWeek = ix;
                    dayState.SiteState = E_SiteState.OpenWithNeeds;
				}
				else
				{
					dayState.DayOfWeek = ix;
                    dayState.SiteState = E_SiteState.Closed;
				}
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
                    dayState.DateType = E_DateType.PastDate;
                else
                {
                    C_SiteCalendarEntry sce = OurSite.SiteCalendar[dayState.DayOfWeek];
                    bool defOpen = sce.OpenTime != sce.CloseTime;
                    dayState.SiteState = defOpen ? E_SiteState.OpenWithNeeds : E_SiteState.Closed;

                    // see if this date has an exception
                    C_CalendarEntry siteExceptionOnDate = OurSite.GetCalendarExceptionForDateForSite(ourDate);
                    if (siteExceptionOnDate != null)
                    {
                        dayState.SiteState = siteExceptionOnDate.IsClosed ? E_SiteState.Closed : E_SiteState.OpenWithNeeds;
                        dayState.Boxed = true;
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
