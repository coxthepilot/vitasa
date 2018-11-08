using Foundation;
using UIKit;
using MapKit;
using System.Collections.Generic;
using System.Linq;

using zsquared;

namespace zsquared
{
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

            var ou = Sites.Where(s => s.Name == thisWhich);

            if (ou.Any())
            {
                C_VitaSite ourSite = ou.FirstOrDefault();

                ((MKPinAnnotationView)pinView).PinTintColor = UIColor.Black;

                pinView.CanShowCallout = true;

                detailButton = UIButton.FromType(UIButtonType.DetailDisclosure);
                detailButton.TouchUpInside += (s, e) =>
                {
                    Global.SelectedSiteSlug = ourSite.Slug;
                    Global.ViewCameFrom = E_ViewCameFrom.Map;
                    ourVC.PerformSegue("Segue_ClientMapToClientSiteDetails", ourVC);
                };
                pinView.RightCalloutAccessoryView = detailButton;
            }

            return pinView;
        }

        //        public override void DidUpdateUserLocation(MKMapView mapView, MKUserLocation userLocation)
        //        {
        //            if (mapView.UserLocation != null)
        //{
        //  CLLocationCoordinate2D coords = mapView.UserLocation.Coordinate;
        //                // todo; do something with this location?
        //}            
        //}
    }
}
