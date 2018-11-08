using System;

using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_AdminSiteCalendar")]
    public class A_AdminSiteCalendar : Activity
    {
        C_Global Global;

        TextView L_SiteName;
        TextView L_MonthYear;

        Button B_MonthNext;
        Button B_MonthPrev;
        GridView GV_Calendar;

        Button B_Done;
        Button B_Reset;

        C_GVHelper GVHelper;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;

            if (Global.CalendarDate == null)
                Global.CalendarDate = C_YMD.Now;

            SetContentView(Resource.Layout.AdminSiteCalendar);

            B_MonthNext = FindViewById<Button>(Resource.Id.B_NextMonth);
            B_MonthPrev = FindViewById<Button>(Resource.Id.B_PrevMonth);
            L_SiteName = FindViewById<TextView>(Resource.Id.L_SiteName);
            B_Done = FindViewById<Button>(Resource.Id.B_Save);
            L_MonthYear = FindViewById<TextView>(Resource.Id.L_MonthYear);
            B_Reset = FindViewById<Button>(Resource.Id.B_Reset);
            GV_Calendar = FindViewById<GridView>(Resource.Id.GV_Calendar);

            C_Common.SetViewColors(this, Resource.Id.V_AdminSiteCalendar);

            B_Done.Click += (sender, e) => 
                StartActivity(new Intent(this, typeof(A_AdminSite)));

            B_Reset.Click += (sender, e) => 
                StartActivity(new Intent(this, typeof(A_AdminSiteCalReset)));

            B_MonthNext.Click += (sender, e) => 
            {
                C_YMD d = Global.CalendarDate;
                d.Day = 1;
                d.AddMonths(1);
                Global.CalendarDate = d;

                L_MonthYear.Text = Global.CalendarDate.ToString("mmm-yyyy");

                C_DateDetails[] detailsx = BuildDateStateArray(Global.CalendarDate, Global.SelectedSiteTemp);
                C_DateDetails[] dayDetailsx = BuildDayStateArray();
                GVHelper.SetNewDateDetails(detailsx, dayDetailsx);
            };

            B_MonthPrev.Click += (sender, e) => 
            {
                C_YMD d = Global.CalendarDate;
                d.Day = 1;
                d.SubtractMonths(1);
                Global.CalendarDate = d;

                L_MonthYear.Text = Global.CalendarDate.ToString("mmm-yyyy");

                C_DateDetails[] detailsx = BuildDateStateArray(Global.CalendarDate, Global.SelectedSiteTemp);
                C_DateDetails[] dayDetailsx = BuildDayStateArray();
                GVHelper.SetNewDateDetails(detailsx, dayDetailsx);
            };

            C_DateDetails[] details = BuildDateStateArray(Global.CalendarDate, Global.SelectedSiteTemp);
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

            L_MonthYear.Text = Global.CalendarDate.ToString("mmm-yyyy");
            L_SiteName.Text = Global.SelectedSiteTemp.Name;
        }

        public override void OnBackPressed()
        {
            StartActivity(new Intent(this, typeof(A_AdminSite)));
        }

        void GVHelper_DateTouched(object sender, C_DateTouchedEventArgs e)
        {
            Global.CalendarDate = e.Date;
            Global.ViewCameFrom = E_ViewCameFrom.AdminSiteCalendar;
            Global.CalendarDateDetails = new C_CalendarDateDetails()
            {
                SaveAction = E_CalendarDateDetailsSaveAction.None,
                MainTitle = "Site Coordinator",
                SiteName = Global.SelectedSiteTemp.Name,
                Date = e.Date.ToString("mmm dd, yyyy"),
                Note = null,
                CalendarEntry = Global.SelectedSiteTemp.GetCalendarEntryForDate(e.Date)
            };
            StartActivity(new Intent(this, typeof(A_CalendarDateDetails)));
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
                else 
                    dayState.SiteState = !sce.SiteIsOpen ? E_SiteState.Closed : E_SiteState.OpenWithNeeds;

                DateState[day - 1] = dayState;
            }

            return DateState;
        }
    }
}
