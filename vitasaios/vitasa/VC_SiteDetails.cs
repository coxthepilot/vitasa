using Foundation;
using System;
using UIKit;
using MapKit;
using CoreLocation;
using Xamarin.Forms;

namespace vitasa
{
    public partial class VC_SiteDetails : UIViewController
    {
        //public bool CameFromList = false;
		
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
                lat = Convert.ToDouble(myAppDelegate.PassAroundContainer.SelectedSite.SiteLatitude);
                lon = Convert.ToDouble(myAppDelegate.PassAroundContainer.SelectedSite.SiteLongitude);
            }
            catch { conversionOK = false; }

            mapDelegate = new C_MapDelegate(myAppDelegate.PassAroundContainer, this);
			Map_SiteMap.Delegate = mapDelegate;

			// use a scaling to see about 20km
			var mapCenter = new CLLocationCoordinate2D(lat, lon);
			var mapRegion = MKCoordinateRegion.FromDistance(mapCenter, 10000, 10000);
			Map_SiteMap.CenterCoordinate = mapCenter;
			Map_SiteMap.Region = mapRegion;

            if (conversionOK)
            {
                MKPointAnnotation pa = new MKPointAnnotation();
                pa.Title = myAppDelegate.PassAroundContainer.SelectedSite.SiteName;
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

            NSUserDefaults userSettings = new NSUserDefaults("group.net.zsquared.vitasa");
			var userName = userSettings.StringForKey("siteCoordinatorUserName");
			var userPassword = userSettings.StringForKey("siteCoordinatorPassword");
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
            L_SiteName.Text = myAppDelegate.PassAroundContainer.SelectedSite.SiteName;
            L_Address.Text = myAppDelegate.PassAroundContainer.SelectedSite.SiteStreet;
            L_CityStateZip.Text = myAppDelegate.PassAroundContainer.SelectedSite.SiteCity
                + ", " + myAppDelegate.PassAroundContainer.SelectedSite.SiteState 
                + " " + myAppDelegate.PassAroundContainer.SelectedSite.SiteZip;
            L_SiteCoordinator.Text = myAppDelegate.PassAroundContainer.SelectedSite.SiteCoordinator;
            L_SiteStatus.Text = "Site is " + myAppDelegate.PassAroundContainer.SelectedSite.SiteStatus;

            if (myAppDelegate.PassAroundContainer.SelectedSite.SiteStatus == C_VitaSite.E_SiteStatus.Open)
                I_SiteStatus.Image = UIImage.FromBundle("greenstatus.jpg");
            else if (myAppDelegate.PassAroundContainer.SelectedSite.SiteStatus == C_VitaSite.E_SiteStatus.Closed)
				I_SiteStatus.Image = UIImage.FromBundle("blackstatus.jpg");
			else if (myAppDelegate.PassAroundContainer.SelectedSite.SiteStatus == C_VitaSite.E_SiteStatus.NearLimit)
				I_SiteStatus.Image = UIImage.FromBundle("yellowstatus.jpg");
            else if (myAppDelegate.PassAroundContainer.SelectedSite.SiteStatus == C_VitaSite.E_SiteStatus.NotAccepting)
				I_SiteStatus.Image = UIImage.FromBundle("redstatus.jpg");
		}
    }
}