using Foundation;
using System;
using UIKit;
using System.Collections.Generic;

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

            if ((Global.SCSites == null)
                || (Global.SelectedSite == null))
                throw new ApplicationException("required parameters not present");

			B_Back.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_SCSitesToLogin", this);
            };

            TV_Sites.Source = new C_SitesTableSourceSCSites(Global, Global.SCSites, this);
            TV_Sites.ReloadData();
        }

		public class C_SitesTableSourceSCSites : UITableViewSource
		{
			readonly C_Global Global;
            public List<C_VitaSite> Sites; // this is public so a remove operations doesn't require a re-fetch of the list
			const string CellIdentifier = "TableCell_SitesTableSourceSCSites";
            readonly VC_SCSites OurVC;

            public C_SitesTableSourceSCSites(C_Global pac, List<C_VitaSite> sites, VC_SCSites vc)
			{
				Global = pac;
				Sites = sites;
                OurVC = vc;
			}

			public override nint RowsInSection(UITableView tableview, nint section)
			{
				int count = 0;
				if (Sites != null)
					count = Sites.Count;
				return count;
			}

			public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
			{
				UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);
				//---- if there are no cells to reuse, create a new one
				if (cell == null)
					cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

                C_VitaSite oursite = Sites[indexPath.Row];

				cell.TextLabel.Text = oursite.Name;
                cell.DetailTextLabel.Text = oursite.Street;

				return cell;
			}

            public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
            {
				C_VitaSite SelectedSite = Sites[indexPath.Row];

				// these are required by VC_SCSite
				Global.DetailsCameFrom = E_CameFrom.SCSites;
				Global.SelectedSite = SelectedSite;

				OurVC.PerformSegue("Segue_SCSitesToSCSite", OurVC);
			}
		}
    }
}