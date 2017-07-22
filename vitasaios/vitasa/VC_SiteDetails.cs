using Foundation;
using System;
using UIKit;

namespace vitasa
{
    public partial class VC_SiteDetails : UIViewController
    {
        public C_PassAroundContainer PassAroundContainer;

        public bool CameFromList = false;

        public VC_SiteDetails (IntPtr handle) : base (handle)
        {
            
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            if (PassAroundContainer == null)
                throw new ApplicationException("The pass around container may not be null");
            if (PassAroundContainer.SelectedSite == null)
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
            L_SiteName.Text = PassAroundContainer.SelectedSite.SiteName;
            L_Address.Text = PassAroundContainer.SelectedSite.SiteStreet;
            L_City.Text = PassAroundContainer.SelectedSite.SiteCity;
            L_StatePlusZip.Text = PassAroundContainer.SelectedSite.SiteState + " " + PassAroundContainer.SelectedSite.SiteZip;
            L_SiteCoordinator.Text = PassAroundContainer.SelectedSite.SiteCoordinator;
            L_SiteStatus.Text = "Site is " + (PassAroundContainer.SelectedSite.SiteIsOpen ? "Open" : "Closed");
		}

        public override void PrepareForSegue(UIStoryboardSegue segue, NSObject sender)
        {
            base.PrepareForSegue(segue, sender);

			if (segue.Identifier == "SiteDetailsToMap")
			{
				VC_SitesMap siteDetails = (VC_SitesMap)segue.DestinationViewController;
                siteDetails.PassAroundContainer = PassAroundContainer;
			}
            else if (segue.Identifier == "SiteDetailsToList")
            {
                VC_SitesList sitesList = (VC_SitesList)segue.DestinationViewController;
                sitesList.PassAroundContainer = PassAroundContainer;
            }

		}
    }
}