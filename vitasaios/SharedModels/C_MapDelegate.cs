﻿using Foundation;
using System;
using UIKit;
using MapKit;
using CoreLocation;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Json;

using zsquared;

namespace zsquared
{
	public class C_MapDelegate : MKMapViewDelegate
	{
		C_Global PassAroundContainer;

		UIButton detailButton = null;

		UIViewController ourVC = null;

        string segueOnMapTouch;

        public C_MapDelegate(C_Global pac, UIViewController cv, string segue)
		{
			PassAroundContainer = pac;
			ourVC = cv;

            segueOnMapTouch = segue;
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
                if (ourSite.Status == E_SiteStatus.Accepting)
					((MKPinAnnotationView)pinView).PinTintColor = UIColor.Green;
				else if (ourSite.Status == E_SiteStatus.Closed)
					((MKPinAnnotationView)pinView).PinTintColor = UIColor.Black;
				else if (ourSite.Status == E_SiteStatus.NearLimit)
					((MKPinAnnotationView)pinView).PinTintColor = UIColor.Yellow;
				else if (ourSite.Status == E_SiteStatus.NotAccepting)
					((MKPinAnnotationView)pinView).PinTintColor = UIColor.Red;

				pinView.CanShowCallout = true;

				detailButton = UIButton.FromType(UIButtonType.DetailDisclosure);
				detailButton.TouchUpInside += (s, e) =>
				{
                    if (segueOnMapTouch != null)
                    {
                        PassAroundContainer.SelectedSite = ourSite;
                        PassAroundContainer.DetailsCameFrom = E_CameFrom.Map;
                        ourVC.PerformSegue(segueOnMapTouch, ourVC);
                        //"SiteMapToDetails"
                    }
				};
				pinView.RightCalloutAccessoryView = detailButton;
			}

			return pinView;
		}
	}
}
