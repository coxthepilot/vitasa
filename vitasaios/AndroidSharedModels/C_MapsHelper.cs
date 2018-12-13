using System;
using System.Collections.Generic;

using Android.OS;
using Android.App;
using Android.Support.V4.App;

using Android.Gms.Common.Apis;
using Android.Gms.Maps;
using Android.Gms.Maps.Model;
using Android.Gms.Location;
using Android.Gms.Common;
using Android.Locations;

namespace zsquared
{
    // ---------- not in use; only create as a diagnostic ----------

    public class C_MapsHelper : 
        Java.Lang.Object, 
        IOnMapReadyCallback,
        GoogleApiClient.IConnectionCallbacks,
        GoogleApiClient.IOnConnectionFailedListener

    {
        GoogleMap _map;
        MapFragment _mapFragment;
        GoogleApiClient apiClient;
        readonly Activity activity;
        C_PersistentSettings Settings;
        readonly List<C_VitaSite> SelectedSites;

        public delegate void MapMarkerClickEventHandler(object sender, MapMarkerClickEventArgs args);
        public event MapMarkerClickEventHandler MapMarkerClicked;

        public class MapMarkerClickEventArgs : EventArgs
        {
            public string SiteName;

            public MapMarkerClickEventArgs(string sname)
            {
                SiteName = sname;
            }
        }

        public C_MapsHelper(Activity a, C_PersistentSettings settings, List<C_VitaSite> sites)
        {
            activity = a;
            Settings = settings;
            SelectedSites = sites;

            try
            {
                //_mapFragment = FragmentManager.FindFragmentByTag("map") as MapFragment;
                //if (_mapFragment == null)
                //{
                    GoogleMapOptions mapOptions = new GoogleMapOptions()
                        .InvokeMapType(GoogleMap.MapTypeNormal)
                        .InvokeZoomControlsEnabled(true)
                        .InvokeCompassEnabled(true);

                    //FragmentTransaction fragTx = FragmentManager.BeginTransaction();

                    _mapFragment = MapFragment.NewInstance(mapOptions);
                    activity.FragmentManager.BeginTransaction()
                        .Add(a_vitavol.Resource.Id.Map_Sites, _mapFragment, "map")
                        .Commit();
                //}
                _mapFragment.GetMapAsync(this);
            }
            catch (Exception ex)
            {
                C_MessageBox mbox = new C_MessageBox(activity, "Error", "Failed in InitMapFragment [" + ex.Message + "]", E_MessageBoxButtons.Ok);
                mbox.Show();
            }
        }

        public void OnMapReady(GoogleMap map)
        {
            try
            {
                _map = map;

                float zoom = Settings.Zoom;
                float lat = Settings.Latitude;
                float longi = Settings.Longitude;

                // default starting location, center of San Antonio
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
                        bool siteIsPrefered = Settings.IsPreferedSite(site.Slug);
                        BitmapDescriptor bmd = siteIsPrefered ?
                                                   BitmapDescriptorFactory.FromAsset("MarkerPinFlagBlack50.png") :
                                                   BitmapDescriptorFactory.FromAsset("MarkerPinFlagGreen50.png");
                        markerOpt1.SetIcon(bmd);
                        _map.AddMarker(markerOpt1);
                    }
                }
            }
            catch (Exception ex)
            {
                C_MessageBox mbox = new C_MessageBox(activity, "Error", "Failed in OnMapReady [" + ex.Message + "]", E_MessageBoxButtons.Ok);
                mbox.Show();
            }
        }

        void MapOnInfoWindowClick(object sender, GoogleMap.InfoWindowClickEventArgs e)
        {
            Marker myMarker = e.Marker;
            if (myMarker != null)
            {

                MapMarkerClicked?.Invoke(this, new MapMarkerClickEventArgs(e.Marker.Title));

                //C_VitaSite s = Global.GetSiteByNameNoFetch(e.Marker.Title);
                //if (s != null)
                //{
                //    Global.SelectedSiteSlug = s.Slug;
                //    Global.SelectedSiteName = s.Name;
                //    Global.ViewCameFrom = E_ViewCameFrom.Map;

                //    StartActivity(new Intent(this, typeof(A_SiteDetails)));
                //}
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
                //else
                    //Log.Debug("vita", "OnConnected with _map and apiConnected but no location");
            }
            //else
                //Log.Debug("vita", "OnConnected but _map is null or apiClient is not connected!");
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
