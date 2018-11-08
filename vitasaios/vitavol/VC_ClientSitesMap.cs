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
}