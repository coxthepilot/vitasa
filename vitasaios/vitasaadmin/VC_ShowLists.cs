using Foundation;
using System;
using UIKit;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Json;

using zsquared;

namespace vitasaadmin
{
    public partial class VC_ShowLists : UIViewController
    {
		public C_SitesTableSource SitesTableDataSource = null;

        C_Global passAroundContainer;

        VC_ShowLists OurVC;

		public VC_ShowLists (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            OurVC = this;

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            passAroundContainer = myAppDelegate.PassAroundContiner;
            if (passAroundContainer == null)
                throw new ApplicationException("pass around container may not be null");

			B_Back.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_ShowListsToLogin", this);
            };

            // setup the users table data source
            // connect to the table
            C_UsersTableSource usersTableSource = new C_UsersTableSource(passAroundContainer, OurVC, "Segue_ListsToShowUserDetails");
            TV_Users.Source = usersTableSource;

			// the list of sites has NOT been loaded or has expired, therefore we need to reload it
			// this is done using a thread since it can take a while (seconds)
			Task.Run(async () =>
			{
				// get the json file of sites and details from the web service
				passAroundContainer.Sites = await C_VitaSite.FetchSitesList();
                SitesTableDataSource = new C_SitesTableSource(passAroundContainer, OurVC, "Segue_ListsToShowSiteDetails");

                UIApplication.SharedApplication.InvokeOnMainThread(
                new Action(() =>
                {
                    TV_Sites.Source = SitesTableDataSource;
                    TV_Sites.ReloadData();
                }));
			});
		}
    }
}