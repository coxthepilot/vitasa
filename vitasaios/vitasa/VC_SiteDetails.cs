using Foundation;
using System;
using UIKit;

namespace vitasa
{
    public partial class VC_SiteDetails : UIViewController
    {
        public bool CameFromList = false;

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

            // connect action code to the Back button
			B_Back.TouchUpInside += (object sender, EventArgs e) =>
			{
				if (CameFromList)
				{
					this.PerformSegue("SiteDetailsToList", this);
				}
				else
				{
					this.PerformSegue("SiteDetailsToMap", this);
				}
			};

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