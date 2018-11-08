using Foundation;
using System;
using UIKit;
using MapKit;
using CoreLocation;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Json;
using System.Linq;

namespace zsquared
{
    public class C_SitesMapDelegate : MKMapViewDelegate
    {
        UIButton detailButton;

        readonly UIViewController ourVC;
        readonly List<C_VitaSite> Sites;

        public event SitesMapEventHandler SiteTouchUpInside;

        public C_SitesMapDelegate(UIViewController cv, List<C_VitaSite> sites)
        {
            ourVC = cv;
            Sites = sites;
        }

        readonly string pId = "PinAnnotation";

        [Export("mapView:viewForAnnotation:")]
        public override MKAnnotationView GetViewForAnnotation(MKMapView mapView, IMKAnnotation annotation)
        {
            if (annotation is MKUserLocation)
                return null;
            string thisWhich = annotation.GetTitle();
            if (thisWhich == "My Location")
                return null;

            // try to create pin annotation view for the queue of reusable pins
            MKAnnotationView pinView = (MKPinAnnotationView)mapView.DequeueReusableAnnotation(pId);

            // if we fail, just create one anyway
            if (pinView == null)
                pinView = new MKPinAnnotationView(annotation, pId);

            // find the site that matches the name
            var sou = Sites.Where(s => s.Name == thisWhich);
            if (!sou.Any())
                return pinView;

            C_VitaSite ourSite = sou.First();

            ((MKPinAnnotationView)pinView).PinTintColor = ourSite.PreferredSite ? UIColor.Black : UIColor.Green;

            pinView.CanShowCallout = true;

            detailButton = UIButton.FromType(UIButtonType.DetailDisclosure);
            detailButton.SetTitle(ourSite.Name, UIControlState.Normal);
            detailButton.TouchUpInside += (s, e) =>
            {
                if (s is UIButton)
                {
                    UIButton sb = s as UIButton;
                    string siteName = sb.Title(UIControlState.Normal);
                    var sou1 = Sites.Where(s1 => s1.Name == siteName);
                    if (sou1.Any())
                        SiteTouchUpInside?.Invoke(this, new C_SitesMapSelect(sou.First()));
                }
            };
            pinView.RightCalloutAccessoryView = detailButton;

            return pinView;
        }
    }

    public class C_SitesMapSelect : EventArgs
    {
        public C_VitaSite SelectedSite;

        public C_SitesMapSelect(C_VitaSite site)
        {
            SelectedSite = site;
        }
    }

    public delegate void SitesMapEventHandler(object sender, C_SitesMapSelect e);
}
