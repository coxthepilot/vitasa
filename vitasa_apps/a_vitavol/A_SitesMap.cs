using System;
using System.Threading.Tasks;
using System.Collections.Generic;

using Android.App;
using Android.OS;
using Android.Widget;

using Android.Content;
using Android.Util;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_SitesFilter")]
    public class A_SitesMap : Activity
    {
        C_Global Global;

        Button B_Filter;
        Button B_Services;

        List<C_VitaSite> SelectedSites;

        C_PersistentSettings Settings;

        C_AlertBox AlertBox;

        C_MapsHelper MapsHelper;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;

            Settings = new C_PersistentSettings(this);

            SetContentView(Resource.Layout.SitesMap);

            B_Filter = FindViewById<Button>(Resource.Id.B_Filter);
            B_Services = FindViewById<Button>(Resource.Id.B_Services);

            C_Common.SetViewColors(this, Resource.Id.V_SitesMap);

            B_Filter.Click += (sender, e) => 
                StartActivity(new Intent(this, typeof(A_SitesFilter)));

            B_Services.Click += (sender, e) =>
                StartActivity(new Intent(this, typeof(A_SitesFilter)));

            SelectedSites = new List<C_VitaSite>();

            EnableUI(false);
            AlertBox = new C_AlertBox(this, "", "Loading site information...");
            AlertBox.Show();

            MapsHelper = new C_MapsHelper(this, Settings);
            MapsHelper.MapMarkerClicked += (object sender, C_MapsHelper.MapMarkerClickEventArgs args) =>
            {
                if (args.SiteName != null)
                {
                    C_VitaSite s = Global.GetSiteByNameNoFetch(args.SiteName);
                    if (s != null)
                    {
                        Global.SelectedSiteSlug = s.Slug;
                        Global.SelectedSiteName = s.Name;
                        Global.ViewCameFrom = E_ViewCameFrom.Map;

                        StartActivity(new Intent(this, typeof(A_SiteDetails)));
                    }
                }
            };

            Task.Run(async () => 
            {
                try
                {
                    // preload all the sites into the cache
                    List<C_VitaSite> allsites = await Global.FetchAllSites();

                    // if we've already logged in the user, don't do it again
                    if ((Global.LoggedInUserId == -1) || (Global.SelectedUser == null))
                    {
                        // guess we need to actually log him in if we can
                        // if we have a volunteer user that has signed in previously, use his credentials to get his mobile status
                        if (!string.IsNullOrWhiteSpace(Settings.UserEmail) && !string.IsNullOrWhiteSpace(Settings.UserPassword))
                        {
                            // we have credentials and we've not logged him in yet - so do so now
                            C_IOResult ior = await Global.PerformLogin(Settings.UserEmail, Settings.UserPassword);
                            if (ior.Success && (ior.User != null) && ior.User.HasVolunteer)
                            {
                                Global.LoggedInUserId = ior.User.id;
                                Global.SelectedUser = ior.User;

                                Settings.PreferedSites = new List<string>();
                                foreach (string ps in ior.User.PreferredSiteSlugs)
                                    Settings.AddPreferedSite(ps);
                                Settings.Save();
                            }
                        }
                    }

                    bool hasMobile =
                       (Global.LoggedInUserId != -1)
                    && (Global.SelectedUser != null)
                    && Global.SelectedUser.HasVolunteer
                    && Global.SelectedUser.HasMobile;

                    // this is for the case where a mobile user was signed in and another signin happens without
                    //  mobile, then we need to ensure that the mobile filter is off
                    if (!hasMobile)
                    {
                        Settings.SitesFilter.RemoveSiteCapability(E_CapabilitiesFilter.Mobile);
                        if (Settings.SitesFilter.SiteCapabilitiesCount == 0)
                            Settings.SitesFilter.AddSiteCapability(E_CapabilitiesFilter.Any);
                    }

                    // find the sites that match our filter
                    SelectedSites = Global.GetSitesUsingFilterNoFetch(Settings.SitesFilter, hasMobile);

                    await MapsHelper.MapsAreReady.Task;
                }
                catch (Exception ex)
                {
                    Log.Debug("vita", ex.Message);
                }

                void p()
                {
                    AlertBox.Hide();
                    EnableUI(true);

                    string filterButtonTitle = Settings.SitesFilter.DateFilter.ToString();
                    if (Settings.SitesFilter.DateFilter == E_DateFilter.AllDays)
                        filterButtonTitle = "All Days";
                    else if ((Settings.SitesFilter.DateFilter != E_DateFilter.Today)
                        && (Settings.SitesFilter.DateFilter != E_DateFilter.Tomorrow))
                        filterButtonTitle = Settings.SitesFilter.GetDateForFilter().ToString("mmm dd, yyyy");
                    B_Filter.SetText(filterButtonTitle, TextView.BufferType.Normal);

                    string servicesString = Settings.SitesFilter.ServicesAsString();
                    if (Settings.SitesFilter.SiteCapabilityContains(E_CapabilitiesFilter.Any))
                        servicesString = "Services";
                    B_Services.SetText(servicesString, TextView.BufferType.Normal);


                    MapsHelper.AddSites(SelectedSites);
                    //InitMapFragment();
                }
                RunOnUiThread(p);
            });
        }

        bool UIIsEnabled;
        private void EnableUI(bool en)
        {
            UIIsEnabled = en;
        }

        public override void OnBackPressed()
        {
            if (UIIsEnabled)
                StartActivity(new Intent(this, typeof(MainActivity)));
        }
    }
}
