
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

        C_VitaSite SelectedSite;

		ProgressDialog AI_Busy;

        C_GVHelper GVHelper;

		GridView GV_Calendar;
		TextView L_Date;
        ImageView IMG_Closed;
        ImageView IMG_Open;

        Button B_NextMonth;
        Button B_PrevMonth;

		protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

			MyAppDelegate g = (MyAppDelegate)Application;
			if (g.Global == null)
				g.Global = new C_Global();
			Global = g.Global;

			SelectedSite = Global.GetSiteFromSlugNoFetch(Global.SelectedSiteSlug);

			if (Global.CalendarDate == null)
				Global.CalendarDate = C_YMD.Now;

			// Set our view from the "main" layout resource
            SetContentView(Resource.Layout.SCCalendar);

			GV_Calendar = FindViewById<GridView>(Resource.Id.GV_Calendar);
            L_Date = FindViewById<TextView>(Resource.Id.L_Date);
            IMG_Closed = FindViewById<ImageView>(Resource.Id.IMG_Closed);
            IMG_Open = FindViewById<ImageView>(Resource.Id.IMG_Open);
            B_NextMonth = FindViewById<Button>(Resource.Id.B_NextMonth);
            B_PrevMonth = FindViewById<Button>(Resource.Id.B_PrevMonth);

			AI_Busy = new ProgressDialog(this);
			AI_Busy.SetMessage("Please wait...");
			AI_Busy.SetCancelable(false);
			AI_Busy.SetProgressStyle(ProgressDialogStyle.Spinner);

            IMG_Open.SetImageResource(Resource.Drawable.openwithneeds);
            IMG_Closed.SetImageResource(Resource.Drawable.closed);

            B_NextMonth.Click += (sender, e) => 
            {
				C_YMD d = Global.CalendarDate;
				d.Day = 1;
				d.AddMonths(1);
				Global.CalendarDate = d;

                L_Date.Text = Global.CalendarDate.ToString("mmm yyyy");

				C_DateDetails[] detailsx = BuildDateStateArray(Global.CalendarDate, SelectedSite);
				C_DateDetails[] dayDetailsx = BuildDayStateArray();
                GVHelper.SetNewDateDetails(detailsx, dayDetailsx);
			};

            B_PrevMonth.Click += (sender, e) => 
            {
				C_YMD d = Global.CalendarDate;
				d.Day = 1;
				d.SubtractMonths(1);
				Global.CalendarDate = d;

				L_Date.Text = Global.CalendarDate.ToString("mmm yyyy");

				C_DateDetails[] detailsx = BuildDateStateArray(Global.CalendarDate, SelectedSite);
				C_DateDetails[] dayDetailsx = BuildDayStateArray();
				GVHelper.SetNewDateDetails(detailsx, dayDetailsx);
			};

			AI_Busy.Show();

			L_Date.Text = Global.CalendarDate.ToString("mmm yyyy");

            AI_Busy.Cancel();

			C_DateDetails[] details = BuildDateStateArray(Global.CalendarDate, SelectedSite);
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
		}

		void GVHelper_DateTouched(object sender, C_DateTouchedEventArgs e)
		{
            Global.CalendarDate = e.Date;
            StartActivity(new Intent(this, typeof(A_SCSiteCalShifts)));
		}

		public C_DateDetails[] BuildDayStateArray()
		{
			C_DateDetails[] DayOfWeekState = new C_DateDetails[7];

			for (int ix = 0; ix != 7; ix++)
			{
                C_DateDetails dayState = new C_DateDetails()
                {
                    Date = null,
                    DayOfWeek = 0,

                    DateType = E_DateType.Header,
                    SiteState = E_SiteState.Background
                };

				DayOfWeekState[ix] = dayState;
			}

			return DayOfWeekState;
		}

        public C_DateDetails[] BuildDateStateArray(C_YMD Date, C_VitaSite site)
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

				C_CalendarEntry sce = site.GetCalendarEntryForDate(ourDate);

				if (sce == null)
                    dayState.DateType = E_DateType.PastDate;
                else if (!sce.SiteIsOpen)
                    dayState.SiteState = E_SiteState.Closed;
                else
                    dayState.SiteState = E_SiteState.OpenWithNeeds;

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
