using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Json;
using UIKit;

namespace vitasa
{
    public partial class VC_SitesList : UIViewController
    {
        public C_PassAroundContainer PassAroundContainer;

		public C_SitesTableSource SitesTableDataSource = null;

		public VC_SitesList (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            // make sure we have a container to place results in
			if (PassAroundContainer == null)
				PassAroundContainer = new C_PassAroundContainer();

            // now that we have the container, create the data source and connect it to our data
            SitesTableDataSource = new C_SitesTableSource(PassAroundContainer, this);

            // and let the control know where to get data from
			TV_SitesList.Source = SitesTableDataSource;

            // check to see if we already have data (possibly passed back to us from another view controller)
			if (PassAroundContainer.Sites != null)
            {
                // we have already loaded the sites from the back end service; just use it
                // check the time since loaded; if too long (more than 60 minutes), then reload
                TimeSpan ts = DateTime.Now - PassAroundContainer.TimeStampWhenSitesLoaded;
                if (ts.TotalMinutes > 60)
                    LoadSitesFromWebService();
                else
                    // tell the control to repaint now that we have data
	    			TV_SitesList.ReloadData();
			}
            else
                LoadSitesFromWebService();
		}

        private void LoadSitesFromWebService()
        {
			// the list of sites has NOT been loaded or has expired, therefore we need to reload it
			// this is done using a thread since it can take a while (seconds)
			Task.Run(async () =>
			{
					// get the json file of sites and details from the web service
					JsonValue jv = await C_VitaSite.FetchSitesList();

					// convert to our class object
					PassAroundContainer.Sites = C_VitaSite.ImportSites(jv);
				    PassAroundContainer.Sites.Sort(CompareSitesByNameAscending);
				    PassAroundContainer.TimeStampWhenSitesLoaded = DateTime.Now;

					// tell the control to repaint; we have to invoke on main thread
					//   or the control ignores the call
					UIApplication.SharedApplication.InvokeOnMainThread(
					new Action(() =>
					{
						TV_SitesList.ReloadData();
					}));
			});
		}

        public static int CompareSitesByNameAscending(C_VitaSite s1, C_VitaSite s2)
        {
            return s1.SiteName.CompareTo(s2.SiteName);
        }

		public class C_SitesTableSource : UITableViewSource
		{
            public C_PassAroundContainer PassAroundContainer;
            VC_SitesList ourVC = null;

			const string CellIdentifier = "TableCell";

			public C_SitesTableSource(C_PassAroundContainer pac, VC_SitesList vc)
			{
                PassAroundContainer = pac;

                ourVC = vc;
			}

			public override nint RowsInSection(UITableView tableview, nint section)
			{
                int count = 0;
                if (PassAroundContainer.Sites != null)
                    count = PassAroundContainer.Sites.Count;
                return count;
			}

			public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
			{
				UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);
				//---- if there are no cells to reuse, create a new one
				if (cell == null)
                    cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier); 

				C_VitaSite site = PassAroundContainer.Sites[indexPath.Row];

				cell.TextLabel.Text = site.SiteName;
				cell.DetailTextLabel.Text = site.SiteStreet + ", " + site.SiteCity + ", " + site.SiteState + " " + site.SiteZip;

				return cell;
			}

            public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
            {
                //base.RowSelected(tableView, indexPath);

                PassAroundContainer.SelectedSite = PassAroundContainer.Sites[indexPath.Row];

                ourVC.PerformSegue("SegueFromListToDetails", ourVC);
            }
		}

        public override void PrepareForSegue(UIStoryboardSegue segue, NSObject sender)
        {
            base.PrepareForSegue(segue, sender);

            if (segue.Identifier == "SegueFromListToDetails")
            {
                VC_SiteDetails siteDetails = (VC_SiteDetails)segue.DestinationViewController;
                siteDetails.PassAroundContainer = PassAroundContainer;
                siteDetails.CameFromList = true;
            }
            else if (segue.Identifier == "SitesListToMain")
            {
                ViewController vc = (ViewController)segue.DestinationViewController;
                vc.PassAroundContainer = PassAroundContainer;
            }
        }
	}
}