using Foundation;
using System;
using UIKit;
using System.Collections.Generic;
using System.Threading.Tasks;
using static zsquared.C_MessageBox;

using zsquared;

namespace vitavol
{
    public partial class VC_SCSites : UIViewController
    {
        // Input
        //   SCSites
        //   DetailsCameFrom
        //   SelectedSite

        C_Global Global;

        public VC_SCSites (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

			B_Back.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_SCSitesToLogin", this);
            };

            TV_Sites.Source = new C_SitesTableSourceSCSites(Global, this);
            TV_Sites.ReloadData();
        }

        public override void ViewDidAppear(bool animated)
        {
			// set the standard background color
            View.BackgroundColor = C_Common.StandardBackground;
		}

		public class C_SitesTableSourceSCSites : UITableViewSource
		{
			readonly C_Global Global;
			const string CellIdentifier = "TableCell_SitesTableSourceSCSites";
            readonly VC_SCSites OurVC;
            readonly C_VitaUser LoggedInUser;

            public C_SitesTableSourceSCSites(C_Global pac, VC_SCSites vc)
			{
				Global = pac;
                OurVC = vc;
				LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
			}

			public override nint RowsInSection(UITableView tableview, nint section)
			{
                return LoggedInUser.SitesCoordinated.Count;
			}

			public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
			{
				UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);
				//---- if there are no cells to reuse, create a new one
				if (cell == null)
					cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

                C_SiteCoordinated sc = LoggedInUser.SitesCoordinated[indexPath.Row];

				cell.TextLabel.Text = sc.Name;

				return cell;
			}

            public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
            {
                C_SiteCoordinated sc = LoggedInUser.SitesCoordinated[indexPath.Row];

                Task.Run(async () => 
                {
					bool success = await Global.EnsureSiteInCache(sc.Slug);

					Global.ViewCameFrom = E_ViewCameFrom.SCSites;
                    Global.SelectedSiteName = sc.Name;
					Global.SelectedSiteSlug = sc.Slug;

					UIApplication.SharedApplication.InvokeOnMainThread(
					new Action(async () =>
					{
    					if (success)
    					{
							OurVC.PerformSegue("Segue_SCSitesToSCSite", OurVC);
    					}
    					else
    					{
							E_MessageBoxResults mbres = await MessageBox(OurVC, "Error", "Error loading the site data.", E_MessageBoxButtons.Ok);
    					}
					}));
				});
			}
		}
    }
}