using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;

using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using Android.Views;
using Android.Graphics;

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

        C_GVHelper2 GVHelper;

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

                C_DateDetails2[] detailsx = BuildDateStateArray2(Global.CalendarDate, sites);
                GVHelper.SetNewDateDetails(detailsx);
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

                C_DateDetails2[] detailsx = BuildDateStateArray2(Global.CalendarDate, sites);
                GVHelper.SetNewDateDetails(detailsx);
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

                    C_DateDetails2[] details = BuildDateStateArray2(Global.CalendarDate, sites);

                    GVHelper = new C_GVHelper2(this, GV_Calendar);
                    GVHelper.SetNewDateDetails(details);
                    GVHelper.DateTouched += GVHelper_DateTouched;

                    L_MonthYear.Text = Global.CalendarDate.ToString("mmm-yyyy");
                }
                RunOnUiThread(p);
            });
        }

        public override void OnBackPressed()
        {
            if (UIIsEnabled)
                GoBack();
        }

        private void GoBack()
        {
            if (Global.ViewCameFrom == E_ViewCameFrom.Admin)
                StartActivity(new Intent(this, typeof(A_AdminMenu)));
            else if (Global.ViewCameFrom == E_ViewCameFrom.VolOptions)
                StartActivity(new Intent(this, typeof(A_VolHome)));
            else
                throw new ApplicationException("Unknow view came from");
        }

        void GVHelper_DateTouched(object sender, C_DateTouchedEventArgs e)
        {
            if (e.Date == null)
                return;

            Global.CalendarDate = e.Date;

            StartActivity(new Intent(this, typeof(A_AdminMobileDate)));
        }

        public C_DateDetails2[] BuildDateStateArray2(C_YMD Date, List<C_VitaSite> sites)
        {
            int daysInMonth = DateTime.DaysInMonth(Date.Year, Date.Month);

            C_DateDetails2[] DateState = new C_DateDetails2[daysInMonth];

            // scan through the days to determine the state of that date
            for (int day = 1; day <= daysInMonth; day++)
            {
                C_YMD ourDate = new C_YMD(Date.Year, Date.Month, day);

                C_DateDetails2 dayState = new C_DateDetails2(ourDate);

                // build a list of all calendar entries for this date
                List<C_CalendarEntry> calendarEntries = new List<C_CalendarEntry>();
                foreach (C_VitaSite site in sites)
                {
                    foreach (C_CalendarEntry ce in site.SiteCalendar)
                    {
                        if (ce.Date == ourDate)
                            calendarEntries.Add(ce);
                    }
                }

                if (calendarEntries.Count == 0)
                {
                    dayState.NormalColor = C_Common.Color_StandardBackground;
                    dayState.TextColor = Color.White;
                    dayState.CanClick = false;
                }
                else
                {
                    // see how many are open
                    var ou = calendarEntries.Where(ce => ce.SiteIsOpen);
                    if (!ou.Any())
                    {
                        dayState.NormalColor = C_Common.Color_NoSiteOpen;
                        dayState.TextColor = Color.White;
                        dayState.CanClick = false;
                    }
                    else
                    {
                        List<C_CalendarEntry> ceOpenOnOurDate = ou.ToList();
                        if (ceOpenOnOurDate.Count == 1)
                        {
                            dayState.NormalColor = C_Common.Color_OneAppt;
                            dayState.TextColor = Color.White;
                        }
                        else
                        { // 2 or more
                            if ((ceOpenOnOurDate.Count == 2) && !C_CalendarEntry.Overlap(ceOpenOnOurDate))
                            {
                                dayState.NormalColor = C_Common.Color_TwoAppt;
                                dayState.TextColor = Color.White;
                            }
                            else
                            {
                                dayState.NormalColor = C_Common.Color_BadAppt;
                                dayState.TextColor = Color.White;
                                dayState.ShowBox = true;
                            }
                        }
                    }
                }

                DateState[day - 1] = dayState;
            }

            return DateState;
        }

        bool UIIsEnabled;
        private void EnableUI(bool en)
        {
            UIIsEnabled = en;
            B_MonthNext.Enabled = en;
            B_MonthPrev.Enabled = en;
            GV_Calendar.Enabled = en;
            B_Done.Enabled = en;
        }
    }
}
