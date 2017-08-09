using Foundation;
using System;
using UIKit;
using MapKit;
using CoreLocation;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Json;

using zsquared;

namespace vitasa
{
    public partial class VC_SitesMap : UIViewController
    {
        C_MapDelegate mapDelegate = null;

		public VC_SitesMap (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			if (myAppDelegate.PassAroundContainer == null)
				throw new ApplicationException("The pass around container may not be null");

			Map_SitesMap.MapType = MapKit.MKMapType.Standard;
            Map_SitesMap.AutoresizingMask = UIViewAutoresizing.FlexibleDimensions;
			Map_SitesMap.ShowsUserLocation = true;
            Map_SitesMap.Bounds = View.Bounds;

			CLLocationManager locationManager = new CLLocationManager();
			locationManager.RequestWhenInUseAuthorization();
			CLLocation loc = locationManager.Location;

            // assume a starting point of center of san antonio
			const double lat = 29.4208763;
			const double lon = -98.4730651;
            var mapCenter = new CLLocationCoordinate2D(lat, lon);
            // use a scaling to see about 20km
			var mapRegion = MKCoordinateRegion.FromDistance(mapCenter, 30000, 30000);
			Map_SitesMap.CenterCoordinate = mapCenter;
			Map_SitesMap.Region = mapRegion;

			// todo: get the user's current location and zoom to there on the map

			// check to see if we already have data (possibly passed back to us from another view controller)
            if (myAppDelegate.PassAroundContainer.Sites != null)
			{
				// we have already loaded the sites from the back end service; just use it
				// todo: check the time since loaded; if too long (?), then reload
				// we have already loaded the sites from the back end service; just use it
				// check the time since loaded; if too long (more than 60 minutes), then reload
				TimeSpan ts = DateTime.Now - myAppDelegate.PassAroundContainer.TimeStampWhenSitesLoaded;
                if (ts.TotalMinutes > 60)
                    LoadSitesFromWebService(myAppDelegate.PassAroundContainer);
                else
                    // tell the control to repaint now that we have data
                    PutPinsOnMap(myAppDelegate.PassAroundContainer);
			}
			else
                LoadSitesFromWebService(myAppDelegate.PassAroundContainer);
		}

        private void LoadSitesFromWebService(C_Global passAroundContainer)
        {
			// the list of sites has NOT been loaded or has expired, therefore we need to load it
			// this is done using a thread since it can take a while (seconds)
			Task.Run(async () =>
			{
					// get the json file of sites and details from the web service
					passAroundContainer.Sites = await C_VitaSite.FetchSitesList();
				    passAroundContainer.Sites.Sort(C_VitaSite.CompareSitesByNameAscending);
				    passAroundContainer.TimeStampWhenSitesLoaded = DateTime.Now;

					// tell the control to repaint; we have to invoke on main thread
					//   or the control ignores the call
					UIApplication.SharedApplication.InvokeOnMainThread(
					new Action(() =>
					{
                        PutPinsOnMap(passAroundContainer);
					}));
			});
		}

        private void PutPinsOnMap(C_Global passAroundContainer)
        {
            mapDelegate = new C_MapDelegate(passAroundContainer, this, "SiteMapToDetails");
			Map_SitesMap.Delegate = mapDelegate;

            foreach (C_VitaSite vs in passAroundContainer.Sites)
			{
				double latitude = double.NaN;
				double longitude = double.NaN;
				bool conversionOK = true;
				try
				{
					latitude = Convert.ToDouble(vs.Latitude);
					longitude = Convert.ToDouble(vs.Longitude);
				}
				catch
				{
					conversionOK = false;
				}

				if (conversionOK)
				{
					MKPointAnnotation pa = new MKPointAnnotation();
					pa.Title = vs.Name;
					pa.Coordinate = new CLLocationCoordinate2D(latitude, longitude);
					Map_SitesMap.AddAnnotations(pa);
				}
			}
		}

        public override void PrepareForSegue(UIStoryboardSegue segue, NSObject sender)
        {
            base.PrepareForSegue(segue, sender);

			if (segue.Identifier == "SiteMapToDetails")
			{
				VC_SiteDetails siteDetails = (VC_SiteDetails)segue.DestinationViewController;
				//siteDetails.PassAroundContainer = PassAroundContainer;
				AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
                myAppDelegate.PassAroundContainer.DetailsCameFrom = E_CameFrom.Map;
			}
		}

	}
}