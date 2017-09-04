using Foundation;
using System;
using UIKit;
using System.Collections.Generic;
using System.Threading.Tasks;
using zsquared;
using MapKit;
using CoreLocation;

namespace vitavol
{
    public partial class VC_SitesOnDateMap : UIViewController
    {
        // --- used as input to the controller -----
        // SelectedDate
        // OpenSitesThatNeedHelp

		C_Global Global;

		public VC_SitesOnDateMap (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            if ((Global.SelectedDate == null)
                || (Global.OpenSitesThatNeedHelp == null))
                throw new ApplicationException("expected input is incomplete");

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

			L_Date.Text = "Date: " + Global.SelectedDate.ToString("mmm dd, yyyy");

			B_Back.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_SitesOnDateMapToSitesOnDateList", this);
            };

			Map_Sites.MapType = MapKit.MKMapType.Standard;
			Map_Sites.AutoresizingMask = UIViewAutoresizing.FlexibleDimensions;
			Map_Sites.ShowsUserLocation = true;
			Map_Sites.Bounds = View.Bounds;

			CLLocationManager locationManager = new CLLocationManager();
			locationManager.RequestWhenInUseAuthorization();
			CLLocation loc = locationManager.Location;

			// assume a starting point of center of san antonio
			const double lat = 29.4208763;
			const double lon = -98.4730651;
			var mapCenter = new CLLocationCoordinate2D(lat, lon);
			// use a scaling to see about 20km
			var mapRegion = MKCoordinateRegion.FromDistance(mapCenter, 30000, 30000);
			Map_Sites.CenterCoordinate = mapCenter;
			Map_Sites.Region = mapRegion;

            Global.DetailsCameFrom = E_CameFrom.Map;
            C_MapDelegateX MapDelegate = new C_MapDelegateX(Global, this, Global.OpenSitesThatNeedHelp);
            Map_Sites.Delegate = MapDelegate;

            PutPinsOnMap();
        }

		private void PutPinsOnMap()
		{
            foreach (C_VitaSite vs in Global.OpenSitesThatNeedHelp)
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
                    Map_Sites.AddAnnotations(pa);
				}
			}
		}

		public class C_MapDelegateX : MKMapViewDelegate
		{
            readonly C_Global Global;

            UIButton detailButton;

			readonly UIViewController ourVC;

			readonly List<C_VitaSite> Sites;

            public C_MapDelegateX(C_Global global, UIViewController cv, List<C_VitaSite> sites)
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
                        // required for SignUp
                        // SelectedDate - from Calendar
						Global.SelectedSite = ourSite;
                        Global.DetailsCameFrom = E_CameFrom.Map;

						ourVC.PerformSegue("Segue_SitesOnDateMapToSignUp", ourVC);
					};
					pinView.RightCalloutAccessoryView = detailButton;
				}

				return pinView;
			}
		}

	}
}