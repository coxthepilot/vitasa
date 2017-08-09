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

		C_MapDelegate mapDelegate = null;

		public VC_SiteDetails (IntPtr handle) : base (handle)
        {
            
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			if (myAppDelegate.PassAroundContainer == null)
                throw new ApplicationException("The pass around container may not be null");
            if (myAppDelegate.PassAroundContainer.SelectedSite == null)
                throw new ApplicationException("We must be given the selcted site");

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
                lat = Convert.ToDouble(myAppDelegate.PassAroundContainer.SelectedSite.Latitude);
                lon = Convert.ToDouble(myAppDelegate.PassAroundContainer.SelectedSite.Longitude);
            }
            catch { conversionOK = false; }

            mapDelegate = new C_MapDelegate(myAppDelegate.PassAroundContainer, this, null);
			Map_SiteMap.Delegate = mapDelegate;

			// use a scaling to see about 20km
			var mapCenter = new CLLocationCoordinate2D(lat, lon);
			var mapRegion = MKCoordinateRegion.FromDistance(mapCenter, 10000, 10000);
			Map_SiteMap.CenterCoordinate = mapCenter;
			Map_SiteMap.Region = mapRegion;

            if (conversionOK)
            {
                MKPointAnnotation pa = new MKPointAnnotation();
                pa.Title = myAppDelegate.PassAroundContainer.SelectedSite.Name;
                pa.Coordinate = new CLLocationCoordinate2D(lat, lon);
                Map_SiteMap.AddAnnotations(pa);
            }

			// connect action code to the Back button
			B_Back.TouchUpInside += (object sender, EventArgs e) =>
			{
				string segueToPerform = "";
				if (myAppDelegate.PassAroundContainer.DetailsCameFrom == E_CameFrom.List)
                    segueToPerform = "SiteDetailsToList";
                else if (myAppDelegate.PassAroundContainer.DetailsCameFrom == E_CameFrom.Map)
					segueToPerform = "SiteDetailsToMap";

                this.PerformSegue(segueToPerform, this);
			};

			// the following is required when working on a physical device
			NSUserDefaults userSettings = new NSUserDefaults(Name_VitasaGroup, NSUserDefaultsType.SuiteName);
			var whatWeAreRunningOn = ObjCRuntime.Runtime.Arch;
            // SIMULATOR or DEVICE
            if (whatWeAreRunningOn == ObjCRuntime.Arch.SIMULATOR)
                // accessing via the suite name doesn't work in the simulator
			    userSettings = new NSUserDefaults(Name_VitasaGroup);

			var userName = userSettings.StringForKey(Name_SiteCoordinatorUserName);
            var userPassword = userSettings.StringForKey(Name_SiteCoordinatorPassword);
            bool weHaveSiteCoordinatorAccountInfo = (userName != null) && (userPassword != null)
                && (userName.Length != 0) && (userPassword.Length != 0);
            B_Change.Hidden = !weHaveSiteCoordinatorAccountInfo;

            if (weHaveSiteCoordinatorAccountInfo)
            {
                B_Change.TouchUpInside += (sender, e) =>
                {
                    this.PerformSegue("Segue_DetailsToUpdate", this);
                };
            }

            // populate the controls to explain this site in more detail
            L_SiteName.Text = myAppDelegate.PassAroundContainer.SelectedSite.Name;
            L_Address.Text = myAppDelegate.PassAroundContainer.SelectedSite.Street;
            L_CityStateZip.Text = myAppDelegate.PassAroundContainer.SelectedSite.City
                + ", " + myAppDelegate.PassAroundContainer.SelectedSite.State 
                + " " + myAppDelegate.PassAroundContainer.SelectedSite.Zip;
            L_SiteCoordinator.Text = myAppDelegate.PassAroundContainer.SelectedSite.PrimaryCoordinator;
            L_SiteStatus.Text = "Site is " + myAppDelegate.PassAroundContainer.SelectedSite.Status;

            if (myAppDelegate.PassAroundContainer.SelectedSite.Status == E_SiteStatus.Accepting)
                I_SiteStatus.Image = UIImage.FromBundle("greenstatus.jpg");
            else if (myAppDelegate.PassAroundContainer.SelectedSite.Status == E_SiteStatus.Closed)
				I_SiteStatus.Image = UIImage.FromBundle("blackstatus.jpg");
			else if (myAppDelegate.PassAroundContainer.SelectedSite.Status == E_SiteStatus.NearLimit)
				I_SiteStatus.Image = UIImage.FromBundle("yellowstatus.jpg");
            else if (myAppDelegate.PassAroundContainer.SelectedSite.Status == E_SiteStatus.NotAccepting)
				I_SiteStatus.Image = UIImage.FromBundle("redstatus.jpg");
		}
    }
}