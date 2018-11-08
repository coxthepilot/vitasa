using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;

using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using Android.Views;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_AdminMobile")]
    public class A_AdminMobile : Activity
    {
        C_Global Global;

        TextView L_MonthYear;

        Button B_MonthNext;
        Button B_MonthPrev;
        GridView GV_Calendar;
        ProgressBar PB_Busy;
        Button B_Done;

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

            SetContentView(Resource.Layout.AdminMobile);

            B_MonthNext = FindViewById<Button>(Resource.Id.B_NextMonth);
            B_MonthPrev = FindViewById<Button>(Resource.Id.B_PrevMonth);
            B_Done = FindViewById<Button>(Resource.Id.B_Done);
            L_MonthYear = FindViewById<TextView>(Resource.Id.L_MonthYear);
            GV_Calendar = FindViewById<GridView>(Resource.Id.GV_Calendar);
            PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);

            C_Common.SetViewColors(this, Resource.Id.V_AdminMobile);

            B_Done.Click += (sender, e) => GoBack();

            B_MonthNext.Click += (sender, e) =>
            {
                C_YMD d = Global.CalendarDate;
                d.Day = 1;
                d.AddMonths(1);
                Global.CalendarDate = d;

                L_MonthYear.Text = Global.CalendarDate.ToString("mmm-yyyy");

                List<C_VitaSite> sites = Global.GetAllSitesNoFetch();
                var ou = sites.Where(site => site.SiteType == E_SiteType.Mobile);
                sites = ou.ToList();
                sites.Sort(C_VitaSite.CompareSitesByNameAscending);

                C_DateDetails[] detailsx = BuildDateStateArray(Global.CalendarDate, sites);
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

                List<C_VitaSite> sites = Global.GetAllSitesNoFetch();
                var ou = sites.Where(site => site.SiteType == E_SiteType.Mobile);
                sites = ou.ToList();
                sites.Sort(C_VitaSite.CompareSitesByNameAscending);

                C_DateDetails[] detailsx = BuildDateStateArray(Global.CalendarDate, sites);
                C_DateDetails[] dayDetailsx = BuildDayStateArray();
                GVHelper.SetNewDateDetails(detailsx, dayDetailsx);
            };

            PB_Busy.Visibility = ViewStates.Visible;
            EnableUI(false);
            Task.Run(async () => 
            {
                List<C_VitaSite> sites = await Global.FetchAllSites();

                var ou = sites.Where(site => site.SiteType == E_SiteType.Mobile);
                sites = ou.ToList();
                sites.Sort(C_VitaSite.CompareSitesByNameAscending);

                void p()
                {
                    PB_Busy.Visibility = ViewStates.Gone;
                    EnableUI(true);

                    C_DateDetails[] details = BuildDateStateArray(Global.CalendarDate, sites);
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
                }
                RunOnUiThread(p);
            });
        }

        public override void OnBackPressed() => GoBack();

        private void GoBack()
        {
            if (Global.ViewCameFrom == E_ViewCameFrom.Admin)
                StartActivity(new Intent(this, typeof(A_AdminMenu)));
            else if (Global.ViewCameFrom == E_ViewCameFrom.VolOptions)
                StartActivity(new Intent(this, typeof(A_VolHome)));
            else
                throw new ApplicationException("Unknow view cam from");
        }

        void GVHelper_DateTouched(object sender, C_DateTouchedEventArgs e)
        {
            Global.CalendarDate = e.Date;

            StartActivity(new Intent(this, typeof(A_AdminMobileDate)));
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

        public C_DateDetails[] BuildDateStateArray(C_YMD Date, List<C_VitaSite> sites)
        {
            int daysInMonth = DateTime.DaysInMonth(Date.Year, Date.Month);

            //C_YMD now = C_YMD.Now;

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

                // we are looking for
                // - [bkgd]   no calendar event for any site (outside season)
                // - [grey]   no mobile site has an appointment on this date
                // - [orange] only one mobile site has an appointment
                // - [green]  exactly 2 mobile sites have appointments that don't overlap
                // - [green/boxed]    more than 2 one one day or 2 that overlap

                // build a list of all calendar entries for this date
                List<C_CalendarEntry> calendarEntries = new List<C_CalendarEntry>();
                foreach(C_VitaSite site in sites)
                {
                    foreach(C_CalendarEntry ce in site.SiteCalendar)
                    {
                        if (ce.Date == ourDate)
                            calendarEntries.Add(ce);
                    }
                }

                if (calendarEntries.Count == 0)
                    dayState.DateType = E_DateType.PastDate; // bkgd
                else
                {
                    // see how many are open
                    var ou = calendarEntries.Where(ce => ce.SiteIsOpen);
                    if (!ou.Any())
                        dayState.SiteState = E_SiteState.Closed; // grey
                    else
                    {
                        List<C_CalendarEntry> ceOpenOnOurDate = ou.ToList();
                        if (ceOpenOnOurDate.Count == 1)
                            dayState.SiteState = E_SiteState.OpenWithNeeds;
                        else
                        { // 2 or more
                            if ((ceOpenOnOurDate.Count == 2) && !Overlap(ceOpenOnOurDate))
                                dayState.SiteState = E_SiteState.OpenNoNeeds;
                            else
                            {
                                dayState.SiteState = E_SiteState.OpenNoNeeds;
                                dayState.Boxed = true;
                            }
                        }
                    }
                }

                DateState[day - 1] = dayState;
            }

            return DateState;
        }

        private bool Overlap(List<C_CalendarEntry> ceList)
        {
            bool res = false;
            for (int ceix = 0; ceix != ceList.Count; ceix++)
            {
                C_CalendarEntry ce = ceList[ceix];

                // with this one, see if any other entry overlaps
                for (int cetix = 0; cetix != ceList.Count; cetix++)
                {
                    C_CalendarEntry cet = ceList[cetix];

                    if (ceix != cetix)
                    {
                        res = ((ce.OpenTime >= cet.OpenTime) && (ce.OpenTime < cet.CloseTime))
                            || ((ce.CloseTime > cet.OpenTime) && (ce.CloseTime <= cet.CloseTime));
                    }
                    if (res)
                        break;
                }
                if (res)
                    break;
            }

            return res;
        }

        private void EnableUI(bool en)
        {
            B_MonthNext.Enabled = en;
            B_MonthPrev.Enabled = en;
            GV_Calendar.Enabled = en;
            B_Done.Enabled = en;
        }
    }
}
