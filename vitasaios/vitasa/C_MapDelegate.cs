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
	public class C_MapDelegate : MKMapViewDelegate
	{
		C_PassAroundContainer PassAroundContainer;

		UIButton detailButton = null;

		UIViewController ourVC = null;

        public C_MapDelegate(C_PassAroundContainer pac, UIViewController cv)
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
				if (ourSite.SiteStatus == C_VitaSite.E_SiteStatus.Open)
					((MKPinAnnotationView)pinView).PinTintColor = UIColor.Green;
				else if (ourSite.SiteStatus == C_VitaSite.E_SiteStatus.Closed)
					((MKPinAnnotationView)pinView).PinTintColor = UIColor.Black;
				else if (ourSite.SiteStatus == C_VitaSite.E_SiteStatus.NearLimit)
					((MKPinAnnotationView)pinView).PinTintColor = UIColor.Yellow;
				else if (ourSite.SiteStatus == C_VitaSite.E_SiteStatus.NotAccepting)
					((MKPinAnnotationView)pinView).PinTintColor = UIColor.Red;

				pinView.CanShowCallout = true;

				detailButton = UIButton.FromType(UIButtonType.DetailDisclosure);
				detailButton.TouchUpInside += (s, e) =>
				{
					AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
					myAppDelegate.PassAroundContainer.SelectedSite = ourSite;
						//ourVC.PassAroundContainer.SelectedSite = ourSite;
						ourVC.PerformSegue("SiteMapToDetails", ourVC);
				};
				pinView.RightCalloutAccessoryView = detailButton;
			}

			return pinView;
		}
	}
}
