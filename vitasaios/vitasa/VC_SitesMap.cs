using Foundation;
using System;
using UIKit;
using MapKit;
using CoreLocation;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Json;

namespace vitasa
{
    public partial class VC_SitesMap : UIViewController
    {
        public C_PassAroundContainer PassAroundContainer;

        MapDelegate mapDelegate = null;

		public VC_SitesMap (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

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
			var mapRegion = MKCoordinateRegion.FromDistance(mapCenter, 20000, 20000);
			Map_SitesMap.CenterCoordinate = mapCenter;
			Map_SitesMap.Region = mapRegion;

			// todo: get the user's current location and zoom to there on the map

			// make sure we have a container to place results in
			if (PassAroundContainer == null)
				PassAroundContainer = new C_PassAroundContainer();

			// check to see if we already have data (possibly passed back to us from another view controller)
			if (PassAroundContainer.Sites != null)
			{
				// we have already loaded the sites from the back end service; just use it
				// todo: check the time since loaded; if too long (?), then reload
				// we have already loaded the sites from the back end service; just use it
				// check the time since loaded; if too long (more than 60 minutes), then reload
				TimeSpan ts = DateTime.Now - PassAroundContainer.TimeStampWhenSitesLoaded;
                if (ts.TotalMinutes > 60)
                    LoadSitesFromWebService();
                else
                    // tell the control to repaint now that we have data
                    PutPinsOnMap();
			}
			else
                LoadSitesFromWebService();
		}

        private void LoadSitesFromWebService()
        {
			// the list of sites has NOT been loaded or has expired, therefore we need to load it
			// this is done using a thread since it can take a while (seconds)
			Task.Run(async () =>
			{
					// get the json file of sites and details from the web service
					JsonValue jv = await C_VitaSite.FetchSitesList();

					// convert to our class object
					PassAroundContainer.Sites = C_VitaSite.ImportSites(jv);
				    PassAroundContainer.Sites.Sort(VC_SitesList.CompareSitesByNameAscending);
				    PassAroundContainer.TimeStampWhenSitesLoaded = DateTime.Now;

					// tell the control to repaint; we have to invoke on main thread
					//   or the control ignores the call
					UIApplication.SharedApplication.InvokeOnMainThread(
					new Action(() =>
					{
						PutPinsOnMap();
					}));
			});
		}

        private void PutPinsOnMap()
        {
            mapDelegate = new MapDelegate(PassAroundContainer, this);
			Map_SitesMap.Delegate = mapDelegate;

            foreach (C_VitaSite vs in PassAroundContainer.Sites)
			{
				double latitude = double.NaN;
				double longitude = double.NaN;
				bool conversionOK = true;
				try
				{
					latitude = Convert.ToDouble(vs.SiteLatitude);
					longitude = Convert.ToDouble(vs.SiteLongitude);
				}
				catch
				{
					conversionOK = false;
				}

				if (conversionOK)
				{
					MKPointAnnotation pa = new MKPointAnnotation();
					pa.Title = vs.SiteName;
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
                siteDetails.PassAroundContainer = PassAroundContainer;
                siteDetails.CameFromList = false;
			}
			else if (segue.Identifier == "SitesMapToMain")
			{
				ViewController vc = (ViewController)segue.DestinationViewController;
				vc.PassAroundContainer = PassAroundContainer;
			}
		}

		public class MapDelegate : MKMapViewDelegate
		{
            C_PassAroundContainer PassAroundContainer;

            UIButton detailButton = null;

            VC_SitesMap ourVC = null;

            public MapDelegate(C_PassAroundContainer pac, VC_SitesMap cv)
			{
                PassAroundContainer = pac;
                ourVC = cv;
			}

			string pId = "PinAnnotation";

			[Export("mapView:viewForAnnotation:")]
			public override MKAnnotationView GetViewForAnnotation(MKMapView mapView, IMKAnnotation annotation)
			{
				if (annotation is MKUserLocation)
					return null;
				string thisWhich = annotation.GetTitle();
                if (thisWhich == "My Location")
                    return null;

				// create pin annotation view
				MKAnnotationView pinView = (MKPinAnnotationView)mapView.DequeueReusableAnnotation(pId);

				if (pinView == null)
					pinView = new MKPinAnnotationView(annotation, pId);

				C_VitaSite ourSite = null;
                foreach (C_VitaSite s in PassAroundContainer.Sites)
				{
					if (s.SiteName == thisWhich)
					{
						ourSite = s;
						break;
					}
				}

                if (ourSite == null)
                {
                    Console.WriteLine("Expected site name: " + thisWhich);
                }
                else
                {
                    if (ourSite.SiteIsOpen)
                        ((MKPinAnnotationView)pinView).PinColor = MKPinAnnotationColor.Green;
                    else
                        ((MKPinAnnotationView)pinView).PinColor = MKPinAnnotationColor.Red;

                    pinView.CanShowCallout = true;

                    detailButton = UIButton.FromType(UIButtonType.DetailDisclosure);
                    detailButton.TouchUpInside += (s, e) =>
                    {
                        ourVC.PassAroundContainer.SelectedSite = ourSite;
                        ourVC.PerformSegue("SiteMapToDetails", ourVC);
                    };
                    pinView.RightCalloutAccessoryView = detailButton;
                }

				return pinView;
			}
		}
	}
}