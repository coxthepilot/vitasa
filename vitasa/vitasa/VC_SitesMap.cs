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
		List<C_VitaSite> SitesList = null;
		MapDelegate mapDelegate = null;

		public VC_SitesMap (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			Map_SitesMap.MapType = MapKit.MKMapType.Standard;
			Map_SitesMap.ShowsUserLocation = true;

            bool useDebugData = true;
			Task.Run(async () =>
            {
                if (useDebugData)
                {
					// use the following 2 lines only in debug
					SitesList = new List<C_VitaSite>();
					C_VitaSite.AddDummySites(SitesList);
				}
                else
                {
					JsonValue jv = await C_VitaSite.FetchSitesList();

					SitesList = C_VitaSite.ImportSites(jv);
				}

            	UIApplication.SharedApplication.InvokeOnMainThread(
	            new Action(() =>
	            {
					mapDelegate = new MapDelegate(SitesList);
					Map_SitesMap.Delegate = mapDelegate;

					foreach (C_VitaSite vs in SitesList)
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
							Map_SitesMap.AddAnnotations(new MKPointAnnotation()
							{
								Title = vs.SiteName,
								Coordinate = new CLLocationCoordinate2D(latitude, longitude)
							});
						}
					}
				}));
            });

			CLLocationManager locationManager = new CLLocationManager();
			locationManager.RequestWhenInUseAuthorization();
		}

		public class MapDelegate : MKMapViewDelegate
		{
			List<C_VitaSite> SitesList = null;

			public MapDelegate(List<C_VitaSite> sites)
			{
				SitesList = sites;
			}

			string pId = "PinAnnotation";

			[Export("mapView:viewForAnnotation:")]
			public override MKAnnotationView GetViewForAnnotation(MKMapView mapView, IMKAnnotation annotation)
			{
				if (annotation is MKUserLocation)
					return null;

				// create pin annotation view
				MKAnnotationView pinView = (MKPinAnnotationView)mapView.DequeueReusableAnnotation(pId);

				if (pinView == null)
					pinView = new MKPinAnnotationView(annotation, pId);

				string thisWhich = annotation.GetTitle();
				C_VitaSite ourSite = null;
				foreach (C_VitaSite s in SitesList)
				{
					if (s.SiteName == thisWhich)
					{
						ourSite = s;
						break;
					}
				}

				if (ourSite.SiteIsOpen.ToLower() == "true")
					((MKPinAnnotationView)pinView).PinColor = MKPinAnnotationColor.Green;
				else
					((MKPinAnnotationView)pinView).PinColor = MKPinAnnotationColor.Red;
				pinView.CanShowCallout = true;

				return pinView;
			}

		}

	}
}