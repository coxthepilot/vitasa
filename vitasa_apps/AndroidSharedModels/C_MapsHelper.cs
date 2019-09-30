using System;
using System.Collections.Generic;
using System.Threading.Tasks;

using Android.OS;
using Android.App;
using Android.Support.V7.App;

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
        IOnMapReadyCallback
        //GoogleApiClient.IConnectionCallbacks,
        //GoogleApiClient.IOnConnectionFailedListener

    {
        GoogleMap _map;
        MapFragment _mapFragment;
        //GoogleApiClient apiClient;
        //readonly AppCompatActivity activity;
        readonly Activity activity;
        C_PersistentSettings Settings;
        List<C_VitaSite> SelectedSites;
        public TaskCompletionSource<bool> MapsAreReady;

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

        public C_MapsHelper(Android.App.Activity a, C_PersistentSettings settings)
        {
            activity = a;
            Settings = settings;
            //SelectedSites = sites;
            MapsAreReady = new TaskCompletionSource<bool>();

            try
            {
                _mapFragment = (MapFragment)activity.FragmentManager.FindFragmentById(a_vitavol.Resource.Id.Map_Sites);

                GoogleMapOptions mapOptions = new GoogleMapOptions()
                    .InvokeMapType(GoogleMap.MapTypeNormal)
                    .InvokeZoomControlsEnabled(true)
                    .InvokeCompassEnabled(true);

                var fragTx = activity.FragmentManager.BeginTransaction();

                _mapFragment = MapFragment.NewInstance(mapOptions);
                fragTx.Add(a_vitavol.Resource.Id.Map_Sites, _mapFragment, "map");
                fragTx.Commit();

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

                MapsAreReady.TrySetResult(true);
            }
            catch (Exception ex)
            {
                C_MessageBox mbox = new C_MessageBox(activity, "Error", "Failed in OnMapReady [" + ex.Message + "]", E_MessageBoxButtons.Ok);
                mbox.Show();
            }
        }

        public void AddSites(List<C_VitaSite> sites)
        {
            SelectedSites = sites;

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

        void MapOnInfoWindowClick(object sender, GoogleMap.InfoWindowClickEventArgs e)
        {
            Marker myMarker = e.Marker;
            if (myMarker != null)
            {

                MapMarkerClicked?.Invoke(this, new MapMarkerClickEventArgs(e.Marker.Title));
            }
        }
    }
}
