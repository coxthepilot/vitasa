using Foundation;
using System;
using UIKit;
using MapKit;
using CoreLocation;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Json;
using System.Linq;

using zsquared;


namespace vitavol
{
    public partial class VC_ClientSitesMap : UIViewController
    {
        C_MapDelegate mapDelegate;
        C_Global Global;
        List<C_VitaSite> OpenSites;

        public VC_ClientSitesMap (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

            B_Back.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_ClientSitesMapToMain", this);
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

            OpenSites = new List<C_VitaSite>();

            Task.Run(async () =>
            {
                C_YMD date = C_YMD.Now;

                OpenSites = await Global.GetOpenSitesInDateRange(date, date.AddDays(14));

                UIApplication.SharedApplication.InvokeOnMainThread(
                new Action(() =>
                {
                    PutPinsOnMap(OpenSites);

                    AI_Busy.StopAnimating();
                }));
            });
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
    }

    public class C_MapDelegate : MKMapViewDelegate
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