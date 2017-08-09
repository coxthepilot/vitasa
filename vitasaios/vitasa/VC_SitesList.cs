using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Json;
using UIKit;

using zsquared;

namespace vitasa
{
    public partial class VC_SitesList : UIViewController
    {
		public C_SitesTableSource SitesTableDataSource = null;

		public VC_SitesList (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            if (myAppDelegate.PassAroundContainer == null)
                throw new ApplicationException("Pass around container must not be null");

            // now that we have the container, create the data source and connect it to our data
            SitesTableDataSource = new C_SitesTableSource(myAppDelegate.PassAroundContainer, this, "SegueFromListToDetails");

            // and let the control know where to get data from
			TV_SitesList.Source = SitesTableDataSource;

            // check to see if we already have data (possibly passed back to us from another view controller)
			if (myAppDelegate.PassAroundContainer.Sites != null)
            {
                // we have already loaded the sites from the back end service; just use it
                // check the time since loaded; if too long (more than 60 minutes), then reload
                TimeSpan ts = DateTime.Now - myAppDelegate.PassAroundContainer.TimeStampWhenSitesLoaded;
                if (ts.TotalMinutes > 60)
                    LoadSitesFromWebService(myAppDelegate.PassAroundContainer);
                else
                    // tell the control to repaint now that we have data
	    			TV_SitesList.ReloadData();
			}
            else
                LoadSitesFromWebService(myAppDelegate.PassAroundContainer);
		}

        private void LoadSitesFromWebService(C_Global passAroundContainer)
        {
			// the list of sites has NOT been loaded or has expired, therefore we need to reload it
			// this is done using a thread since it can take a while (seconds)
			Task.Run(async () =>
			{
					// get the json file of sites and details from the web service
					passAroundContainer.Sites = await C_VitaSite.FetchSitesList();

		    		// convert to our class object
				    passAroundContainer.Sites.Sort(C_VitaSite.CompareSitesByNameAscending);
				    passAroundContainer.TimeStampWhenSitesLoaded = DateTime.Now;

					// tell the control to repaint; we have to invoke on main thread
					//   or the control ignores the call
					UIApplication.SharedApplication.InvokeOnMainThread(
					new Action(() =>
					{
						TV_SitesList.ReloadData();
					}));
			});
		}


        public override void PrepareForSegue(UIStoryboardSegue segue, NSObject sender)
        {
            base.PrepareForSegue(segue, sender);

            if (segue.Identifier == "SegueFromListToDetails")
            {
                VC_SiteDetails siteDetails = (VC_SiteDetails)segue.DestinationViewController;
				AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
                myAppDelegate.PassAroundContainer.DetailsCameFrom = E_CameFrom.List;
            }
        }
	}
}