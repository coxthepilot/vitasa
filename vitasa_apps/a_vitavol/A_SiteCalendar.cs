using System;

using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using Android.Graphics;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "Site Calendar")]
    public class A_SiteCalendar : Activity
    {
        C_Global Global;
        C_VitaSite SelectedSite;

        TextView L_SiteName;
        GridView GV_Calendar;
        Button B_MonthNext;
        Button B_MonthPrev;
        TextView L_Date;

        C_GVHelper2 GVHelper;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;
            SelectedSite = Global.GetSiteFromSlugNoFetch(Global.SelectedSiteSlug);

            SetContentView(Resource.Layout.SiteCalendar);

            L_SiteName = FindViewById<TextView>(Resource.Id.L_SiteName);
            B_MonthNext = FindViewById<Button>(Resource.Id.B_NextMonth);
            B_MonthPrev = FindViewById<Button>(Resource.Id.B_PrevMonth);
            L_Date = FindViewById<TextView>(Resource.Id.L_Date);
            GV_Calendar = FindViewById<GridView>(Resource.Id.GV_Calendar);

            C_Common.SetViewColors(this, Resource.Id.V_SiteCalendar);

            L_SiteName.Text = SelectedSite.Name;

            if (Global.CalendarDate == null)
                Global.CalendarDate = C_YMD.Now;

            B_MonthNext.Click += (sender, e) =>
            {
                C_YMD d = Global.CalendarDate;
                d.Day = 1;
                d.AddMonths(1);
                Global.CalendarDate = d;

                L_Date.Text = Global.CalendarDate.ToString("mmm-yyyy");

                C_DateDetails2[] detailsx = BuildDateStateArray2(Global.CalendarDate, SelectedSite);
                GVHelper.SetNewDateDetails(detailsx);
            };

            B_MonthPrev.Click += (sender, e) =>
            {
                C_YMD d = Global.CalendarDate;
                d.Day = 1;
                d.SubtractMonths(1);
                Global.CalendarDate = d;

                L_Date.Text = Global.CalendarDate.ToString("mmm-yyyy");

                C_DateDetails2[] detailsx = BuildDateStateArray2(Global.CalendarDate, SelectedSite);
                GVHelper.SetNewDateDetails(detailsx);
            };

            C_DateDetails2[] details = BuildDateStateArray2(Global.CalendarDate, SelectedSite);

            GVHelper = new C_GVHelper2(this, GV_Calendar);
            GVHelper.SetNewDateDetails(details);
            GVHelper.DateTouched += GVHelper_DateTouched;

            L_Date.Text = Global.CalendarDate.ToString("mmm-yyyy");
        }

        void GVHelper_DateTouched(object sender, C_DateTouchedEventArgs e)
        {
            Global.CalendarDate = e.Date;
            //Global.ViewCameFrom = E_ViewCameFrom.SiteCalendar;
            Global.CalendarDateDetails = new C_CalendarDateDetails()
            {
                SaveAction = E_CalendarDateDetailsSaveAction.ReadOnly,
                MainTitle = "Site Details",
                SiteName = SelectedSite.Name,
                Date = e.Date.ToString("mmm dd, yyyy"),
                Note = "",
                CalendarEntry = SelectedSite.GetCalendarEntryForDate(e.Date),
                CameFrom = E_ViewCameFrom.SiteCalendar
            };
            StartActivity(new Intent(this, typeof(A_CalendarDateDetails)));
        }

        //public C_DateDetails[] BuildDateStateArray(C_YMD Date, C_VitaSite site)
        //{
        //    int daysInMonth = DateTime.DaysInMonth(Date.Year, Date.Month);

        //    C_YMD now = C_YMD.Now;

        //    C_DateDetails[] DateState = new C_DateDetails[daysInMonth];

        //    // scan through the days to determine the state of that date
        //    for (int day = 1; day <= daysInMonth; day++)
        //    {
        //        C_YMD ourDate = new C_YMD(Date.Year, Date.Month, day);

        //        C_DateDetails dayState = new C_DateDetails()
        //        {
        //            Date = ourDate,
        //            DayOfWeek = (int)ourDate.DayOfWeek,

        //            DateType = E_DateType.DayOfMonth,
        //            Boxed = false
        //        };

        //        C_CalendarEntry sce = site.GetCalendarEntryForDate(ourDate);

        //        if (sce == null)
        //            dayState.DateType = E_DateType.PastDate;
        //        else if (!sce.SiteIsOpen)
        //            dayState.SiteState = E_SiteState.Closed;
        //        else
        //            dayState.SiteState = E_SiteState.OpenWithNeeds;

        //        DateState[day - 1] = dayState;
        //    }

        //    return DateState;
        //}

        public C_DateDetails2[] BuildDateStateArray2(C_YMD Date, C_VitaSite site)
        {
            int daysInMonth = DateTime.DaysInMonth(Date.Year, Date.Month);

            C_DateDetails2[] DateState = new C_DateDetails2[daysInMonth];

            // scan through the days to determine the state of that date
            for (int day = 1; day <= daysInMonth; day++)
            {
                C_YMD ourDate = new C_YMD(Date.Year, Date.Month, day);

                C_DateDetails2 dayState = new C_DateDetails2(ourDate);
                dayState.TextColor = Color.White;

                C_CalendarEntry sce = site.GetCalendarEntryForDate(ourDate);

                if (sce == null)
                {
                    dayState.NormalColor = C_Common.Color_StandardBackground;
                    dayState.CanClick = false;
                }
                else if (sce.SiteIsOpen)
                {
                    dayState.NormalColor = C_Common.Color_TwoAppt;
                }
                else
                {
                    dayState.NormalColor = C_Common.Color_NoSiteOpen;
                }

                DateState[day - 1] = dayState;
            }

            return DateState;
        }

        public override void OnBackPressed() =>
            StartActivity(new Intent(this, typeof(A_SiteDetails)));
    }
}
