using System;
using System.Collections.Generic;
using System.Linq;

using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_AdminSiteCalReset")]
    public class A_AdminSiteCalReset : Activity
    {
        C_Global Global;

        TextView L_SiteName;
        ProgressBar PB_Busy;
        Button B_Save;
        ListView LV_Days;

        List<DayOfWeek> DOWList;
        C_ListViewHelper<DayOfWeek> DOWAdapter;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;

            SetContentView(Resource.Layout.AdminSiteCalReset);

            L_SiteName = FindViewById<TextView>(Resource.Id.L_SiteName);
            PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);
            B_Save = FindViewById<Button>(Resource.Id.B_Save);
            LV_Days = FindViewById<ListView>(Resource.Id.LV_Days);

            C_Common.SetViewColors(this, Resource.Id.V_AdminSiteCalReset);

            if (Global.DOWCalendar == null)
            {
                Global.DOWCalendar = new List<C_CalendarEntry>();
                foreach (DayOfWeek dow in Enum.GetValues(typeof(DayOfWeek)))
                {
                    C_CalendarEntry ce = new C_CalendarEntry()
                    {
                        OpenTime = new C_HMS(8, 0, 0),
                        CloseTime = new C_HMS(17, 0, 0),
                        SiteIsOpen = false,
                        DOW = dow,
                        Dirty = false
                    };
                    Global.DOWCalendar.Add(ce);
                }
            }

            B_Save.Click += (sender, e) =>
                StartActivity(new Intent(this, typeof(A_AdminSiteCalResetAction)));

            LV_Days.ItemClick += (object sender, AdapterView.ItemClickEventArgs e) => 
            {
                int ix = e.Position;
                Global.SelectedDOW = DOWList[ix];
                C_CalendarEntry ce = Global.DOWCalendar[ix];
                Global.ViewCameFrom = E_ViewCameFrom.AdminSiteCalReset;
                Global.CalendarDateDetails = new C_CalendarDateDetails()
                {
                    SaveAction = E_CalendarDateDetailsSaveAction.None,
                    MainTitle = "Site Coordinator",
                    SiteName = Global.SelectedSiteTemp.Name,
                    Date = Global.SelectedDOW.ToString(),
                    Note = null,
                    CalendarEntry = ce
                };
                StartActivity(new Intent(this, typeof(A_CalendarDateDetails)));
            };

            DOWList = Tools.DaysOfWeekList();

            DOWAdapter = new C_ListViewHelper<DayOfWeek>(this, LV_Days, DOWList);
            DOWAdapter.GetTextLabel += (sender, args) =>
            {
                DayOfWeek dow = args.Item;
                return dow.ToString();
            };
            DOWAdapter.GetDetailTextLabel += (sender, args) =>
            {
                DayOfWeek dow = args.Item;
                var ou = Global.DOWCalendar.Where(ce1 => ce1.DOW == dow);
                C_CalendarEntry ce = ou.FirstOrDefault();

                string res = ce.SiteIsOpen ? "Open" : "Closed";
                if (ce.SiteIsOpen)
                    res += " [" + ce.OpenTime.ToString("hh:mm p") + " - " + ce.CloseTime.ToString("hh:mm p") + "]";

                return res;
            };

            L_SiteName.Text = Global.SelectedSiteTemp.Name;
        }

        public override void OnBackPressed()
        {
            Global.DOWCalendar = null;
            StartActivity(new Intent(this, typeof(A_AdminSiteCalendar)));
        }

        private void EnableUI(bool en)
        {
            B_Save.Enabled = en;
            LV_Days.Enabled = en;
        }
    }
}
