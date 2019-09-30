using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;

using Android.Gms.Maps;
using Android.Gms.Maps.Model;
using Android.Gms.Location;
using Android.Gms.Common;
using Android.Gms.Common.Apis;
using Android.Util;
using Android.Locations;

using zsquared;

namespace a_vitavol
{
    [Activity(Label = "VITA: Select Site")]
	public class A_VolPickSiteMap : Activity, 
        IOnMapReadyCallback, 
        GoogleApiClient.IConnectionCallbacks,
		GoogleApiClient.IOnConnectionFailedListener, 
        Android.Gms.Location.ILocationListener
    {
		C_Global Global;
        C_VitaUser OurUser;

        GoogleMap _map;
		MapFragment _mapFragment;
        GoogleApiClient apiClient;

        List<C_VitaSite> OpenSitesThatNeedHelp;

		protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

			MyAppDelegate g = (MyAppDelegate)Application;
			if (g.Global == null)
				g.Global = new C_Global();
			Global = g.Global;

            OurUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            OpenSitesThatNeedHelp = new List<C_VitaSite>();
            foreach(string s in Global.OpenSitesThatNeedHelp)
            {
                C_VitaSite site = Global.GetSiteFromSlugNoFetch(s);
                OpenSitesThatNeedHelp.Add(site);
            }

			// Set our view from the "main" layout resource
            SetContentView(Resource.Layout.VolPickSiteMap);

			if (C_GooglePlayHelper.IsGooglePlayServicesInstalled(this))
			{
				// pass in the Context, ConnectionListener and ConnectionFailedListener
				apiClient = new GoogleApiClient.Builder(this, this, this)
					.AddApi(LocationServices.API).Build();
			}

			InitMapFragment();
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

		public override void OnBackPressed()
		{
            StartActivity(new Intent(this, typeof(A_VolPickSite)));
		}

		protected override void OnResume()
		{
			base.OnResume();

            if (apiClient != null)
                apiClient.Connect();
        }

		protected override async void OnPause()
		{
			base.OnPause();

			//Log.Debug("OnPause", "OnPause called, stopping location updates");

			if (apiClient.IsConnected)
			{
				// stop location updates, passing in the LocationListener
				await LocationServices.FusedLocationApi.RemoveLocationUpdates(apiClient, this);

				apiClient.Disconnect();
			}
		}

        // ---------- maps api helper ----------------

		public void OnMapReady(GoogleMap map)
		{
			_map = map;

            //_map.InfoWindowClick += MapOnInfoWindowClick;

            // default starting location, center of San Antonio
			LatLng location = new LatLng(29.415411, -98.4918232);
			CameraPosition.Builder builder = CameraPosition.InvokeBuilder();
			builder.Target(location);
			builder.Zoom(10);
			CameraPosition cameraPosition = builder.Build();
			CameraUpdate cameraUpdate = CameraUpdateFactory.NewCameraPosition(cameraPosition);

            _map.MoveCamera(cameraUpdate);

            foreach(C_VitaSite site in OpenSitesThatNeedHelp)
            {
                try
                {
                    double lat = Convert.ToDouble(site.Latitude);
                    double longitude = Convert.ToDouble(site.Longitude);
                    MarkerOptions markerOpt1 = new MarkerOptions();
                    markerOpt1.SetPosition(new LatLng(lat, longitude));
                    markerOpt1.SetTitle(site.Name);
                    _map.AddMarker(markerOpt1);
                }
                catch (Exception e)
                {
                    Console.WriteLine(e.Message);
                }
            }
		}
		//private void MapOnInfoWindowClick(object sender, GoogleMap.InfoWindowClickEventArgs e)
		//{
  //          Marker myMarker = e.Marker;
  //          C_VitaSite s = GetSiteFromName(e.Marker.Title);
  //          if (s != null)
  //          {
  //              Global.SelectedSiteSlug = s.Slug;
  //              Global.SelectedSiteName = s.Name;
		//		Global.SignUpsOnSiteOnDate = Global.GetSignUpsForSiteOnDate(Global.SelectedDate, Global.SelectedSiteSlug);
  //              Global.ViewCameFrom = E_ViewCameFrom.Map;

		//		StartActivity(new Intent(this, typeof(A_ViewSignUpNew)));
		//	}
		//}

        private C_VitaSite GetSiteFromName(string name)
        {
            var ou = OpenSitesThatNeedHelp.Where(sx => sx.Name == name);

            C_VitaSite s = ou.FirstOrDefault();

            return s;
        }

		public void OnConnected(Bundle bundle)
		{
			// This method is called when we connect to the LocationClient. We can start location updated directly form
			// here if desired, or we can do it in a lifecycle method, as shown above 

			// You must implement this to implement the IGooglePlayServicesClientConnectionCallbacks Interface
			//Log.Info("LocationClient", "Now connected to client");

			if (apiClient.IsConnected)
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
			}
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

        public void OnProviderEnabled(string s)
        {
            
        }

		public void OnProviderDisabled(string s)
		{

		}

		public void OnStatusChanged(string s, Availability a, Bundle b)
		{

		}
	}
}
