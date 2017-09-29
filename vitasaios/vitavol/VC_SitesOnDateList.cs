using Foundation;
using System;
using UIKit;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using zsquared;

namespace vitavol
{
    public partial class VC_SitesOnDateList : UIViewController
    {
        C_Global Global;

        public VC_SitesOnDateList (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

			// set the standard background color
            View.BackgroundColor = C_Common.StandardBackground;

			L_Date.Text = "Date: " + Global.SelectedDate.ToString("mmm dd, yyyy");

			B_Back.TouchUpInside += (sender, e) => 
            {
                Global.OpenSitesThatNeedHelp = null;
                PerformSegue("Segue_SitesOnDateListToCalendar", this);
            };

            B_ShowOnMap.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_SitesOnDateListToSitesOnDateMap", this);
            };


            Task.Run(async () => 
            {
				// build a list of all open sites on this date
				List<C_VitaSite> openSitesOnDate = await Global.GetOpenSitesOnDate(Global.SelectedDate);

				// then filter to those sites that need help on this date
				List<C_VitaSite> openSitesThatNeedHelp = new List<C_VitaSite>();
    	        foreach(C_VitaSite site in openSitesOnDate)
    	        {
	                int numRequired = site.GetNumEFilersRequiredOnDate(Global.SelectedDate);


                    List<C_WorkItem> workItemsForSiteOnDate = Global.GetWorkItemsForSiteOnDate(Global.SelectedDate, site.Slug);

    				if (numRequired > workItemsForSiteOnDate.Count)
	                    openSitesThatNeedHelp.Add(site);
				}

                List<string> openSitesThatNeedHelpSlugs = new List<string>();
                foreach (C_VitaSite site in openSitesThatNeedHelp)
                    openSitesThatNeedHelpSlugs.Add(site.Slug);

				Global.OpenSitesThatNeedHelp = openSitesThatNeedHelpSlugs; // we save this so Maps doesn't have to recompute

				UIApplication.SharedApplication.InvokeOnMainThread(
				new Action(() =>
				{
					TV_Sites.Source = new C_TableSourceSitesOnDateList(Global, this, openSitesThatNeedHelp);
					TV_Sites.ReloadData();
				}));
			});
		}

		public class C_TableSourceSitesOnDateList : UITableViewSource
		{
            readonly C_Global Global;
            readonly UIViewController ourVC;
			readonly List<C_VitaSite> Sites;

            const string CellIdentifier = "TableCell";

            public C_TableSourceSitesOnDateList(C_Global pac, UIViewController vc, List<C_VitaSite> sites)
			{
				Global = pac;
				ourVC = vc;
				Sites = sites;
			}

			public override nint RowsInSection(UITableView tableview, nint section)
			{
				int count = Sites.Count;
				return count;
			}

			public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
			{
				UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);
				//---- if there are no cells to reuse, create a new one ---
				if (cell == null)
					cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

				C_VitaSite site = Sites[indexPath.Row];

                // figure out if the user is already signed up for this date at this site
                // get all of this users work items
                List<C_WorkItem> LoggedInUserWorkItems = Global.GetWorkItemsForUser(Global.LoggedInUserId);
                // filter for this date
                var ou = LoggedInUserWorkItems.Where(wi => wi.Date == Global.SelectedDate);
                List<C_WorkItem> LoggedInUserWorksItemsOnSelectedDate = ou.ToList();
                // filter for this site
                var ou1 = LoggedInUserWorksItemsOnSelectedDate.Where(wi => wi.SiteSlug == site.Slug);
                // if any remain, then the user is signed up for this site on this date
                bool LoggedInUserWorkingThisDateThisSite = ou1.Any();

				cell.TextLabel.Text = site.Name;

                int numEF = site.GetNumEFilersRequiredOnDate(Global.SelectedDate);

                if (LoggedInUserWorkingThisDateThisSite)
					cell.DetailTextLabel.Text = "Already signed up at this site.";
				else
				    cell.DetailTextLabel.Text = numEF.ToString() + " needed.";


				return cell;
			}

			public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
			{
				//// figure out if the user is already signed up for this date
				//List<C_WorkItem> LoggedInUserWorkItems = Global.GetWorkItemsForUser(Global.LoggedInUserId);
				//var ou = LoggedInUserWorkItems.Where(wi => wi.Date == Global.SelectedDate);

                //if (!ou.Any())
                //{
                    Global.SelectedSiteSlug = Sites[indexPath.Row].Slug;
                    Global.WorkItemsOnSiteOnDate = Global.GetWorkItemsForSiteOnDate(Global.SelectedDate, Global.SelectedSiteSlug);

                    Global.ViewCameFrom = E_ViewCameFrom.List;

                    ourVC.PerformSegue("Segue_SitesOnDateListToSignUp", ourVC);
                //}
			}
		}
    }
}