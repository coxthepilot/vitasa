using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;

using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using Android.Util;
using Android.Views;


using Android.Gms.Common.Apis;
using Android.Gms.Maps;
using Android.Gms.Maps.Model;
using Android.Gms.Location;
using Android.Gms.Common;
using Android.Locations;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_VolHoursWorked")]
    public class A_VolHoursWorked : Activity
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        TextView L_VolHoursWorked_HoursWorked;
        ListView LV_VolHoursWorked_Hours;
        Button B_VolHoursWorked_AddHours;
        //ProgressBar PB_Busy;
        C_BusyBox BusyBox;

        C_ListViewHelper<C_WorkLogItem> WorkItemsAdapter;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;

            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            SetContentView(Resource.Layout.VolHoursWorked);

            B_VolHoursWorked_AddHours = FindViewById<Button>(Resource.Id.B_AddHours);
            LV_VolHoursWorked_Hours = FindViewById<ListView>(Resource.Id.L_Hours);
            L_VolHoursWorked_HoursWorked = FindViewById<TextView>(Resource.Id.L_HoursWorked);
            //PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);
            BusyBox = new C_BusyBox(this, "Loading...");

            C_Common.SetViewColors(this, Resource.Id.V_VolHoursWorked);

            B_VolHoursWorked_AddHours.Click += (sender, e) =>
            {
                Global.SelectedWorkItem = null;
                StartActivity(new Intent(this, typeof(A_EditHours)));
            };

            //PB_Busy.Visibility = ViewStates.Visible;
            if (!Global.AllSitesFetched)
                BusyBox.Show();
            EnableUI(false);
            Task.Run(async () =>
            {
                List<C_VitaSite> sites = await Global.FetchAllSites();

                void p()
                {
                    //PB_Busy.Visibility = ViewStates.Gone;
                    BusyBox.Hide();
                    EnableUI(true);

                    float hours = 0.0f;
                    foreach (C_WorkLogItem wi in LoggedInUser.WorkItems)
                        hours += wi.Hours;
                    L_VolHoursWorked_HoursWorked.Text = "Hours Worked: " + hours.ToString();

                    LoggedInUser.WorkItems.Sort(C_WorkLogItem.CompareByDateReverse);
                    WorkItemsAdapter = new C_ListViewHelper<C_WorkLogItem>(this, LV_VolHoursWorked_Hours, LoggedInUser.WorkItems);
                    WorkItemsAdapter.GetTextLabel += (sender, args) =>
                    {
                        C_WorkLogItem wi = args.Item;
                        return wi.Date.ToString("dow mmm dd, yyyy");
                    };
                    WorkItemsAdapter.GetDetailTextLabel += (sender, args) =>
                    {
                        C_WorkLogItem wi = args.Item;
                        C_VitaSite site = Global.GetSiteFromSlugNoFetch(wi.SiteSlug);
                        string msg = site == null ? "" : " at " + site.Name;
                        string am = wi.Approved ? " [approved]" : " [not approved]";
                        return wi.Hours.ToString() + " hours" + msg + am;
                    };
                    LV_VolHoursWorked_Hours.ItemClick += (object sender, AdapterView.ItemClickEventArgs e) =>
                    {
                        Global.SelectedWorkItem = WorkItemsAdapter.Items[e.Position];
                        if (!Global.SelectedWorkItem.Approved)
                            StartActivity(new Intent(this, typeof(A_EditHours)));
                    };
                }
                RunOnUiThread(p);
            });
        }

        bool UIIsEnabled;
        private void EnableUI(bool en)
        {
            UIIsEnabled = en;
            B_VolHoursWorked_AddHours.Enabled = en;
            LV_VolHoursWorked_Hours.Enabled = en;
        }

        public override void OnBackPressed()
        {
            if (UIIsEnabled)
                StartActivity(new Intent(this, typeof(A_VolHome)));
        }
    }
}
