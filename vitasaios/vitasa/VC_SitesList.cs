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
        C_Global Global;

        public C_SitesTableSourceX SitesTableDataSource;

		public VC_SitesList (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

			AI_Busy.StartAnimating();

			bool reload = Global.AllSites == null;
			if (!reload)
			{
				TimeSpan ts = DateTime.Now - Global.AllSitesSampleDateTime;
				reload = ts.TotalMinutes > 30;
			}

			List<C_VitaSite> openSites = new List<C_VitaSite>();

			Task.Run(async () =>
			{
				if (reload)
                {
                    // get the json file of sites and details from the web service
                    Global.AllSites = await C_VitaSite.FetchSitesListX();
                    Global.AllSitesSampleDateTime = DateTime.Now;
				}

				C_YMD date = C_YMD.Now;
                for (int ix = 0; ix != 7; ix++)
                {
                    List<C_VitaSite> sitesOnDay = C_VitaSite.SitesOpenOnDay(date, Global.AllSites);

                    foreach(C_VitaSite s in sitesOnDay)
                    {
                        if (!openSites.Contains(s))
                            openSites.Add(s);
                    }

                    date = date.AddDays(1);
                }                                      
                openSites.Sort(C_VitaSite.CompareSitesByNameAscending);

                UIApplication.SharedApplication.InvokeOnMainThread(
				new Action(() =>
				{
					// now that we have the container, create the data source and connect it to our data
					SitesTableDataSource = new C_SitesTableSourceX(this, Global, openSites);

					// and let the control know where to get data from
					TV_SitesList.Source = SitesTableDataSource;

					TV_SitesList.ReloadData();

                    AI_Busy.StopAnimating();
				}));
			});
		}

        public override void ViewDidAppear(bool animated)
        {
            View.BackgroundColor = C_Global.StandardBackground;
			TV_SitesList.BackgroundColor = C_Global.StandardBackground;
		}

		public class C_SitesTableSourceX : UITableViewSource
		{
            readonly C_Global Global;
            List<C_VitaSite> Sites;
            readonly UIViewController ourVC;

            const string CellIdentifier = "VITAClientSitesList";

            public C_SitesTableSourceX(UIViewController vc, C_Global global, List<C_VitaSite> sites)
			{
				ourVC = vc;
                Global = global;
                Sites = sites;
			}

			public override nint RowsInSection(UITableView tableview, nint section)
			{
                return Sites.Count;
			}

			public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
			{
				UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);
				//---- if there are no cells to reuse, create a new one ---
				if (cell == null)
					cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

                cell.BackgroundColor = C_Global.StandardBackground;

                C_VitaSite site = Sites[indexPath.Row];

				cell.TextLabel.Text = site.Name;
				cell.DetailTextLabel.Text = site.Street + ", " + site.City + ", " + site.State + " " + site.Zip;

                switch (site.Status)
                {
                    case E_SiteStatus.Accepting:
                        cell.ImageView.Image = UIImage.FromBundle("greenstatus.jpg");
                        break;
                    case E_SiteStatus.NearLimit:
                        cell.ImageView.Image = UIImage.FromBundle("yellowstatus.jpg");
                        break;
                    case E_SiteStatus.NotAccepting:
                        cell.ImageView.Image = UIImage.FromBundle("redstatus.jpg");
                        break;
                    case E_SiteStatus.Closed:
                        cell.ImageView.Image = UIImage.FromBundle("blackstatus.jpg");
                        break;
                }

                return cell;
			}

			public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
			{
				Global.DetailsCameFrom = E_CameFrom.List;
                Global.SelectedSite = Sites[indexPath.Row];

				ourVC.PerformSegue("Segue_ListToDetails", ourVC);
			}
		}
	}
}