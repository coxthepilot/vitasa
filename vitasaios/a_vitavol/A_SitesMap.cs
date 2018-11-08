﻿using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using Android.Util;

using System;
using System.Threading.Tasks;
using System.Collections.Generic;

using Android.Gms.Common.Apis;

using Android.Gms.Maps;
using Android.Gms.Maps.Model;
using Android.Gms.Location;
using Android.Gms.Common;
using Android.Locations;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "VITA: Sites Map")]
    public class A_SitesMap : Activity,
        IOnMapReadyCallback,
        GoogleApiClient.IConnectionCallbacks,
        GoogleApiClient.IOnConnectionFailedListener,
        Android.Gms.Location.ILocationListener
    {
        C_Global Global;

        GoogleMap _map;
        MapFragment _mapFragment;
        GoogleApiClient apiClient;

        Button B_Filter;

        List<C_VitaSite> SelectedSites;

        C_PersistentSettings Settings;

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

            C_Common.SetViewColors(this, Resource.Id.V_SitesMap);

            B_Filter.Click += (sender, e) => 
                StartActivity(new Intent(this, typeof(A_SitesFilter)));

            SelectedSites = new List<C_VitaSite>();

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
                            }
                        }
                    }

                    bool hasMobile =
                       (Global.LoggedInUserId != -1)
                    && (Global.SelectedUser != null)
                    && Global.SelectedUser.HasVolunteer
                    && Global.SelectedUser.HasMobile;

                    if (((Global.LoggedInUserId == -1) || (Global.SelectedUser == null))
                        && Settings.SitesFilter.SiteCapabilityContains(E_CapabilitiesFilter.Mobile))
                    {
                        Settings.SitesFilter.RemoveSiteCapability(E_CapabilitiesFilter.Mobile);
                        if (Settings.SitesFilter.SiteCapabilitiesCount == 0)
                            Settings.SitesFilter.AddSiteCapability(E_CapabilitiesFilter.Any);
                    }

                    // find the sites that match our filter
                    SelectedSites = Global.GetSitesUsingFilterNoFetch(Settings.SitesFilter, hasMobile);

                    // set the flag so that the pin maker will set the appropriate color for a preferred site
                    //List<string> preferredSiteSlugs = C_PreferredSites.GetPreferredSites(this);
                    List<string> preferredSiteSlugs = Settings.PreferedSites;
                    foreach (C_VitaSite site in SelectedSites)
                        site.PreferredSite = preferredSiteSlugs.Contains(site.Slug);

                    if (C_GooglePlayHelper.IsGooglePlayServicesInstalled(this))
                    {
                        // pass in the Context, ConnectionListener and ConnectionFailedListener
                        apiClient = new GoogleApiClient.Builder(this, this, this)
                            .AddApi(LocationServices.API).Build();
                    }
                }
                catch (Exception ex)
                {
                    Log.Debug("vita", ex.Message);
                }

                void p()
                {
                    string buttontext = Settings.SitesFilter.FilterIsActive() ? "Filter Active" : "Set Filter";
                    B_Filter.SetText(buttontext, TextView.BufferType.Normal);

                    InitMapFragment();
                }
                RunOnUiThread(p);
            });
        }

        private void InitMapFragment()
        {
            _mapFragment = FragmentManager.FindFragmentByTag("map") as MapFragment;
            if (_mapFragment == null)
            {
                GoogleMapOptions mapOptions = new GoogleMapOptions()
                    .InvokeMapType(GoogleMap.MapTypeNormal)
                    .InvokeZoomControlsEnabled(true)
                    .InvokeCompassEnabled(true);

                FragmentTransaction fragTx = FragmentManager.BeginTransaction();
                _mapFragment = MapFragment.NewInstance(mapOptions);
                fragTx.Add(Resource.Id.Map_Sites, _mapFragment, "map");
                fragTx.Commit();
            }
            _mapFragment.GetMapAsync(this);
        }

        public override void OnBackPressed() =>
            StartActivity(new Intent(this, typeof(MainActivity)));

        protected override void OnResume()
        {
            base.OnResume();

            if (apiClient != null)
                apiClient.Connect();
        }

        protected override void OnPause()
        {
            base.OnPause();

            Task.Run(async () => 
            {
                //Log.Debug("OnPause", "OnPause called, stopping location updates");

                if (apiClient.IsConnected)
                {
                    // stop location updates, passing in the LocationListener
                    await LocationServices.FusedLocationApi.RemoveLocationUpdates(apiClient, this);

                    apiClient.Disconnect();
                }
            });
        }

        // ---------- maps api helper ----------------

        public void OnMapReady(GoogleMap map)
        {
            _map = map;

            float zoom = Settings.Zoom;
            float lat = Settings.Latitude;
            float longi = Settings.Longitude;

            Log.Debug("vita", "Map zoom: " + zoom.ToString() + " at: " + lat.ToString() + " / " + longi.ToString());

            // default starting location, center of San Antonio
            //LatLng location = new LatLng(29.415411, -98.4918232);
            LatLng location = new LatLng(lat, longi);
            CameraPosition.Builder builder = CameraPosition.InvokeBuilder();
            builder.Target(location);
            builder.Zoom(zoom);
            CameraPosition cameraPosition = builder.Build();
            CameraUpdate cameraUpdate = CameraUpdateFactory.NewCameraPosition(cameraPosition);
            _map.MoveCamera(cameraUpdate);

            _map.InfoWindowClick += MapOnInfoWindowClick;
            _map.CameraChange += (object sender, GoogleMap.CameraChangeEventArgs e) => 
            {
                CameraPosition cpos = e.Position;
                Settings.Zoom = cpos.Zoom;
                Settings.Latitude = (float)e.Position.Target.Latitude;
                Settings.Longitude = (float)e.Position.Target.Longitude;
                Settings.Save();
            };

            foreach (C_VitaSite site in SelectedSites)
            {
                double latitude = double.NaN;
                double longitude = double.NaN;
                bool dok = double.TryParse(site.Latitude, out latitude);
                dok &= double.TryParse(site.Longitude, out longitude);

                if (dok)
                {
                    MarkerOptions markerOpt1 = new MarkerOptions();
                    markerOpt1.SetPosition(new LatLng(latitude, longitude));
                    markerOpt1.SetTitle(site.Name);
                    BitmapDescriptor bmd = site.PreferredSite ?
                                               BitmapDescriptorFactory.FromAsset("MarkerPinFlagBlack50.png") :
                                               BitmapDescriptorFactory.FromAsset("MarkerPinFlagGreen50.png");
                    markerOpt1.SetIcon(bmd);
                    _map.AddMarker(markerOpt1);
                }
            }
        }

        void MapOnInfoWindowClick(object sender, GoogleMap.InfoWindowClickEventArgs e)
        {
            Marker myMarker = e.Marker;
            if (myMarker != null)
            {
                C_VitaSite s = Global.GetSiteByNameNoFetch(e.Marker.Title);
                if (s != null)
                {
                    Global.SelectedSiteSlug = s.Slug;
                    Global.SelectedSiteName = s.Name;
                    Global.ViewCameFrom = E_ViewCameFrom.Map;

                    StartActivity(new Intent(this, typeof(A_SiteDetails)));
                }
            }
        }

        public void OnConnected(Bundle bundle)
        {
            // This method is called when we connect to the LocationClient. We can start location updated directly from
            // here if desired, or we can do it in a lifecycle method, as shown above 

            // You must implement this to implement the IGooglePlayServicesClientConnectionCallbacks Interface
            if (apiClient.IsConnected && (_map != null))
            {
                Location locationx = LocationServices.FusedLocationApi.GetLastLocation(apiClient);
                if (locationx != null)
                {
                    LatLng location = new LatLng(locationx.Latitude, locationx.Longitude);
                    CameraPosition.Builder builder = CameraPosition.InvokeBuilder();
                    builder.Target(location);
                    builder.Zoom(10);
                    CameraPosition cameraPosition = builder.Build();
                    CameraUpdate cameraUpdate = CameraUpdateFactory.NewCameraPosition(cameraPosition);

                    _map.MoveCamera(cameraUpdate);
                }
                else
                    Log.Debug("vita", "OnConnected with _map and apiConnected but no location");
            }
            else
                Log.Debug("vita", "OnConnected but _map is null or apiClient is not connected!");
        }

        public void OnConnectionSuspended(int i)
        {

        }

        public void OnConnectionFailed(ConnectionResult bundle)
        {
            // This method is used to handle connection issues with the Google Play Services Client (LocationClient). 
            // You can check if the connection has a resolution (bundle.HasResolution) and attempt to resolve it

            // You must implement this to implement the IGooglePlayServicesClientOnConnectionFailedListener Interface
            //Log.Info("LocationClient", "Connection failed, attempting to reach google play services");
        }

        public void OnLocationChanged(Location location)
        {
            // This method returns changes in the user's location if they've been requested

            // You must implement this to implement the Android.Gms.Locations.ILocationListener Interface
            //Log.Debug("LocationClient", "Location updated");
        }
    }
}