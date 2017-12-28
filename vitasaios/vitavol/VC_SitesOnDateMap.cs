using Foundation;
using System;
using UIKit;
using System.Collections.Generic;
using System.Threading.Tasks;
using zsquared;
using MapKit;
using CoreLocation;
using System.Linq;

namespace vitavol
{
    public partial class VC_SitesOnDateMap : UIViewController
    {
        // --- used as input to the controller -----
        // SelectedDate
        // OpenSitesThatNeedHelp (from the list view)

		C_Global Global;

		public VC_SitesOnDateMap (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

			L_Date.Text = Global.SelectedDate.ToString("mmm dd, yyyy");

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

            Global.ViewCameFrom = E_ViewCameFrom.Map;
            C_MapDelegateX MapDelegate = new C_MapDelegateX(Global, this, Global.OpenSitesThatNeedHelp);
            Map_Sites.Delegate = MapDelegate;

            PutPinsOnMap();
        }

        public override void ViewDidAppear(bool animated)
        {
			// set the standard background color
            View.BackgroundColor = C_Common.StandardBackground;
		}

		private void PutPinsOnMap()
		{
            foreach (string s in Global.OpenSitesThatNeedHelp)
			{
                C_VitaSite vs = Global.GetSiteFromSlugNoFetch(s);

				double latitude = double.NaN;
				double longitude = double.NaN;
                bool conversionOK = false;
				try
				{
					latitude = Convert.ToDouble(vs.Latitude);
					longitude = Convert.ToDouble(vs.Longitude);
                    conversionOK = true;
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
            readonly C_VitaUser User;

            UIButton detailButton;

			readonly UIViewController ourVC;

			readonly List<C_VitaSite> Sites;

            public C_MapDelegateX(C_Global global, UIViewController cv, List<string> siteSlugs)
			{
				Global = global;
				ourVC = cv;

                User = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

                Sites = new List<C_VitaSite>();
                foreach(string slug in siteSlugs)
                {
                    C_VitaSite s = Global.GetSiteFromSlugNoFetch(slug);
                    if (s != null)
                        Sites.Add(s);
                }
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

                var sou = Sites.Where(s => s.Name == thisWhich);
                if (sou.Any())
				{
                    C_VitaSite ourSite = sou.First();

					C_CalendarEntry ce = ourSite.GetCalendarEntryForDate(Global.SelectedDate);
					int numNeeded = 0;
					int numHave = 0;
					foreach (C_WorkShift ws in ce.WorkShifts)
					{
						C_SiteSchedule ss = Global.GetSiteScheduleForDay(Global.SelectedDate, ourSite.Slug);
                        foreach (C_SiteScheduleShift sss in ss.Shifts)
                        {
                            numNeeded += User.Certification == E_Certification.Basic ? sss.eFilersNeededBasic : sss.eFilersNeededAdvanced;
							numHave += User.Certification == E_Certification.Basic ? sss.eFilersSignedUpBasic : sss.eFilersSignedUpAdvanced;
                        }
					}
					int numEF = numNeeded - numHave;

                    if (numEF == 0)
                        ((MKPinAnnotationView)pinView).PinTintColor = UIColor.Green;
                    else
						((MKPinAnnotationView)pinView).PinTintColor = UIColor.Red;

					pinView.CanShowCallout = true;

					detailButton = UIButton.FromType(UIButtonType.DetailDisclosure);
                    // we cannot go to the sign up from here since we need to know the shift...
					//detailButton.TouchUpInside += (s, e) =>
					//{
     //                   Global.SelectedSiteSlug = ourSite.Slug;
     //                   Global.ViewCameFrom = E_ViewCameFrom.Map;

					//	ourVC.PerformSegue("Segue_SitesOnDateMapToSignUp", ourVC);
					//};
					pinView.RightCalloutAccessoryView = detailButton;
				}

				return pinView;
			}
		}
	}
}