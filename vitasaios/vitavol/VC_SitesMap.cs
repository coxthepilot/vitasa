using Foundation;
using System;
using UIKit;
using MapKit;
using CoreLocation;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Json;
using System.Linq;

using zsquared;

namespace vitavol
{
    public partial class VC_SitesMap : UIViewController
    {
        C_SitesMapDelegate mapDelegate;
        C_Global Global;
        C_VitaUser LoggedInUser;
        List<C_VitaSite> SelectedSites;

        C_PersistentSettings Settings;

        public VC_SitesMap(IntPtr handle) : base(handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            if (Global.LoggedInUserId != -1)
                LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
            Settings = new C_PersistentSettings();

            B_Back.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_SitesMapToMain", this);

            B_Filter.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_SitesMapToSitesFilter", this);

            B_Services.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_SitesMapToSitesFilter", this);
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            View.BackgroundColor = C_Common.StandardBackground;

            Map_SitesMap.MapType = MapKit.MKMapType.Standard;
            Map_SitesMap.AutoresizingMask = UIViewAutoresizing.FlexibleDimensions;
            Map_SitesMap.ShowsUserLocation = true;
            Map_SitesMap.Bounds = View.Bounds;

            CLLocationManager locationManager = new CLLocationManager();
            locationManager.RequestWhenInUseAuthorization();
            CLLocation loc = locationManager.Location;

            var mapCenter = new CLLocationCoordinate2D(Settings.Latitude, Settings.Longitude);
            var mapRegion = MKCoordinateRegion.FromDistance(mapCenter, 30000, 30000);
            Map_SitesMap.CenterCoordinate = mapCenter;
            Map_SitesMap.Region = mapRegion;

            SelectedSites = new List<C_VitaSite>();

            AI_Busy.StartAnimating();
            Task.Run(async () =>
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
                            LoggedInUser = ior.User;
                            Global.SelectedUser = ior.User;

                            Settings.ClearPreferedSites();
                            foreach (string ps in ior.User.PreferredSiteSlugs)
                                Settings.AddPreferedSite(ps);
                        }
                    }
                }
                bool hasMobile =
                   (Global.LoggedInUserId != -1)
                && (LoggedInUser != null)
                && LoggedInUser.HasVolunteer
                && LoggedInUser.HasMobile;

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

                //// set the flag so that the pin maker will set the appropriate color for a preferred site
                ////List<string> preferredSiteSlugs = C_PreferredSites.GetPreferredSites(this);
                //List<string> preferredSiteSlugs = Settings.GetPreferedSites();
                //foreach (C_VitaSite site in SelectedSites)
                    //site.PreferredSite = preferredSiteSlugs.Contains(site.Slug);

                void p()
                {
                    AI_Busy.StopAnimating();

                    string filterButtonTitle = Settings.SitesFilter.DateFilter.ToString();
                    if (Settings.SitesFilter.DateFilter == E_DateFilter.AllDays)
                        filterButtonTitle = "All Days";
                    else if ((Settings.SitesFilter.DateFilter != E_DateFilter.Today)
                        && (Settings.SitesFilter.DateFilter != E_DateFilter.Tomorrow))
                        filterButtonTitle = Settings.SitesFilter.GetDateForFilter().ToString("mmm dd, yyyy");
                    B_Filter.SetTitle(filterButtonTitle, UIControlState.Normal);

                    string servicesString = Settings.SitesFilter.ServicesAsString();
                    if (Settings.SitesFilter.SiteCapabilityContains(E_CapabilitiesFilter.Any))
                        servicesString = "All Services";
                    B_Services.SetTitle(servicesString, UIControlState.Normal);

                    PutPinsOnMap(SelectedSites);
                }
                UIApplication.SharedApplication.InvokeOnMainThread(p);
            });
        }

        private void PutPinsOnMap(List<C_VitaSite> Sites)
        {
            mapDelegate = new C_SitesMapDelegate(this, Sites);
            mapDelegate.SiteTouchUpInside += (object sender, C_SitesMapSelect e) => 
            {
                Global.SelectedSiteSlug = e.SelectedSite.Slug;
                PerformSegue("Segue_SitesMapToSiteDetails", this);
            };
            Map_SitesMap.Delegate = mapDelegate;

            foreach (C_VitaSite vs in Sites)
            {
                double latitude = double.NaN;
                double longitude = double.NaN;
                bool dok = double.TryParse(vs.Latitude, out latitude);
                dok &= double.TryParse(vs.Longitude, out longitude);

                if (dok)
                {
                    MKPointAnnotation pa = new MKPointAnnotation
                    {
                        Title = vs.Name,
                        Coordinate = new CLLocationCoordinate2D(latitude, longitude)
                    };

                    Map_SitesMap.AddAnnotations(pa);
                }
            }
        }
    }
}