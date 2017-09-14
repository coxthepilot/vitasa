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
        C_MapDelegate mapDelegate;
        C_Global Global;
        List<C_VitaSite> OpenSites;

		public VC_SitesMap (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

            View.BackgroundColor = C_Global.StandardBackground;

            B_Back.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_MapToMain", this);
            };

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

			AI_Busy.StartAnimating();

			bool reload = Global.AllSites == null;
			if (!reload)
			{
				TimeSpan ts = DateTime.Now - Global.AllSitesSampleDateTime;
				reload = ts.TotalMinutes > 30;
			}

			OpenSites = new List<C_VitaSite>();

			Task.Run(async () =>
			{
				if (reload)
				{
					// get the json file of sites and details from the web service
					Global.AllSites = await C_VitaSite.FetchSitesListX();
					Global.AllSitesSampleDateTime = DateTime.Now;
				}

				C_YMD date = C_YMD.Now;
				for (int ix = 0; ix != 7; ix++)
				{
					List<C_VitaSite> sitesOnDay = C_VitaSite.SitesOpenOnDay(date, Global.AllSites);

					foreach (C_VitaSite s in sitesOnDay)
					{
						if (!OpenSites.Contains(s))
							OpenSites.Add(s);
					}

					date = date.AddDays(1);
				}
				OpenSites.Sort(C_VitaSite.CompareSitesByNameAscending);

				UIApplication.SharedApplication.InvokeOnMainThread(
				new Action(() =>
				{
                    PutPinsOnMap(OpenSites);

					AI_Busy.StopAnimating();
				}));
			});
		}

		public override void ViewDidAppear(bool animated)
		{
			View.BackgroundColor = C_Global.StandardBackground;
		}

        private void PutPinsOnMap(List<C_VitaSite> Sites)
        {
            mapDelegate = new C_MapDelegate(Global, this, Sites);
			Map_SitesMap.Delegate = mapDelegate;

            foreach (C_VitaSite vs in Sites)
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
                    MKPointAnnotation pa = new MKPointAnnotation()
                    {
                        Title = vs.Name,
                        Coordinate = new CLLocationCoordinate2D(latitude, longitude)
                    };
                    Map_SitesMap.AddAnnotations(pa);
				}
			}
		}

		class C_MapDelegate : MKMapViewDelegate
		{
			readonly C_Global Global;
			UIButton detailButton;
			readonly UIViewController ourVC;
            readonly List<C_VitaSite> Sites;

            public C_MapDelegate(C_Global global, UIViewController cv, List<C_VitaSite> sites)
			{
				Global = global;
				ourVC = cv;
                Sites = sites;
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
				foreach (C_VitaSite s in Sites)
				{
					if (s.Name == thisWhich)
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
					switch (ourSite.Status)
					{
						case E_SiteStatus.Accepting:
							((MKPinAnnotationView)pinView).PinTintColor = UIColor.Green;
							break;
						case E_SiteStatus.Closed:
							((MKPinAnnotationView)pinView).PinTintColor = UIColor.Black;
							break;
						case E_SiteStatus.NearLimit:
							((MKPinAnnotationView)pinView).PinTintColor = UIColor.Yellow;
							break;
						case E_SiteStatus.NotAccepting:
							((MKPinAnnotationView)pinView).PinTintColor = UIColor.Red;
							break;
					}

					pinView.CanShowCallout = true;

					detailButton = UIButton.FromType(UIButtonType.DetailDisclosure);
					detailButton.TouchUpInside += (s, e) =>
					{
						Global.SelectedSite = ourSite;
						Global.DetailsCameFrom = E_CameFrom.Map;
						ourVC.PerformSegue("Segue_MapToDetails", ourVC);
					};
					pinView.RightCalloutAccessoryView = detailButton;
				}

				return pinView;
			}
		}
	}
}