using Foundation;
using System;
using UIKit;
using MapKit;
using CoreLocation;
using Xamarin.Forms;

using zsquared;

namespace vitasa
{
    public partial class VC_SiteDetails : UIViewController
    {
        public const string Name_SiteCoordinatorUserName = "siteCoordinatorUserName";
		public const string Name_SiteCoordinatorPassword = "siteCoordinatorPassword";
		public const string Name_VitasaGroup = "group.net.zsquared.vitasa";

        C_MapDelegate mapDelegate;
        C_Global Global;

        C_VitaSite SelectedSite;

		public VC_SiteDetails (IntPtr handle) : base (handle)
        {
            
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

            SelectedSite = Global.GetSiteFromCacheNoFetch(Global.SelectedSiteSlug);

			// connect action code to the Back button
			B_Back.TouchUpInside += (object sender, EventArgs e) =>
			{
				string segueToPerform = "";
				if (myAppDelegate.Global.ViewCameFrom == E_ViewCameFrom.List)
					segueToPerform = "Segue_DetailsToList";
				else if (myAppDelegate.Global.ViewCameFrom == E_ViewCameFrom.Map)
					segueToPerform = "Segue_DetailsToMap";

				this.PerformSegue(segueToPerform, this);
			};

			B_GetDirections.TouchUpInside += async (sender, e) =>
			{
				// the destination is the site the user selected
				// the source address is unspecified which makes it the user's current location
				string destinationAddress = SelectedSite.Street + ", "
												  + SelectedSite.City + " "
												  + SelectedSite.State;
				string url = "http://maps.apple.com/?daddr=" + destinationAddress;  // + "&saddr=<destination>";
				url = url.Replace(" ", "%20");
				if (UIApplication.SharedApplication.CanOpenUrl(new NSUrl(url)))
					UIApplication.SharedApplication.OpenUrl(new NSUrl(url));

				else
				{
                    C_MessageBox.E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this,
									"No maps app",
									 "Maps app not supported on this device",
									 C_MessageBox.E_MessageBoxButtons.Ok);
				}
			};

			Map_SiteMap.MapType = MapKit.MKMapType.Standard;
			Map_SiteMap.AutoresizingMask = UIViewAutoresizing.FlexibleDimensions;
			Map_SiteMap.ShowsUserLocation = true;
			Map_SiteMap.Bounds = View.Bounds;

			CLLocationManager locationManager = new CLLocationManager();
			locationManager.RequestWhenInUseAuthorization();
			CLLocation loc = locationManager.Location;

			// assume a starting point of center of san antonio
			double lat = 29.4208763;
			double lon = -98.4730651;
            bool conversionOK = true;
            try
            {
                lat = Convert.ToDouble(SelectedSite.Latitude);
                lon = Convert.ToDouble(SelectedSite.Longitude);
            }
            catch { conversionOK = false; }

            mapDelegate = new C_MapDelegate(Global, this);
			Map_SiteMap.Delegate = mapDelegate;

			// use a scaling to see about 20km
			var mapCenter = new CLLocationCoordinate2D(lat, lon);
			var mapRegion = MKCoordinateRegion.FromDistance(mapCenter, 10000, 10000);
			Map_SiteMap.CenterCoordinate = mapCenter;
			Map_SiteMap.Region = mapRegion;

            if (conversionOK)
            {
                MKPointAnnotation pa = new MKPointAnnotation()
                {
                    Title = SelectedSite.Name,
                    Coordinate = new CLLocationCoordinate2D(lat, lon)
                };
                Map_SiteMap.AddAnnotations(pa);
            }

            // populate the controls to explain this site in more detail
            L_SiteName.Text = SelectedSite.Name;
            L_Address.Text = SelectedSite.Street;
            L_CityStateZip.Text = SelectedSite.City
                + ", " + SelectedSite.State 
                + " " + SelectedSite.Zip;
            B_GetDirections.SetTitle(AppResources.Main_B_Directions, UIControlState.Normal);
            switch (SelectedSite.Status)
            {
                case E_SiteStatus.Accepting:
                    I_SiteStatus.Image = UIImage.FromBundle("greenstatus.jpg");
                    L_SiteStatus.Text = AppResources.Main_N_Accepting;
                    break;
                case E_SiteStatus.Closed:
                    I_SiteStatus.Image = UIImage.FromBundle("blackstatus.jpg");
                    L_SiteStatus.Text = AppResources.Main_N_Closed;
                    break;
                case E_SiteStatus.NearLimit:
                    I_SiteStatus.Image = UIImage.FromBundle("yellowstatus.jpg");
                    L_SiteStatus.Text = AppResources.Main_N_NearLimit;
                    break;
                case E_SiteStatus.NotAccepting:
                    I_SiteStatus.Image = UIImage.FromBundle("redstatus.jpg");
                    L_SiteStatus.Text = AppResources.Main_N_At_Limit;
                    break;
            }
            L_DropOff.Enabled = SelectedSite.SiteCapabilities.Contains(E_SiteCapabilities.DropOff);
            L_Express.Enabled = SelectedSite.SiteCapabilities.Contains(E_SiteCapabilities.Express);
            L_MyFreeTaxes.Enabled = SelectedSite.SiteCapabilities.Contains(E_SiteCapabilities.MFT);
		}

		public override void ViewDidAppear(bool animated)
		{
            View.BackgroundColor = C_Common.StandardBackground;
		}

		class C_MapDelegate : MKMapViewDelegate
		{
			readonly C_Global Global;

			UIButton detailButton;

			readonly UIViewController ourVC;

			public C_MapDelegate(C_Global global, UIViewController cv)
			{
				Global = global;
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

                C_VitaSite ourSite = Global.GetSiteFromCacheByNameNoFetch(thisWhich);

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
                        Global.SelectedSiteSlug = ourSite.Slug;
						Global.ViewCameFrom = E_ViewCameFrom.Map;
						ourVC.PerformSegue("Segue_MapToDetails", ourVC);
					};
					pinView.RightCalloutAccessoryView = detailButton;
				}

				return pinView;
			}
		}
    }


}