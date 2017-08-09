using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Json;
using UIKit;

namespace zsquared
{
	public class C_SitesTableSource : UITableViewSource
	{
        C_Global PassAroundContainer;
        UIViewController ourVC = null;
        string TouchSegue;

		const string CellIdentifier = "TableCell";

        public C_SitesTableSource(C_Global pac, UIViewController vc, string touchSegue)
		{
            PassAroundContainer = pac;

			ourVC = vc;

            TouchSegue = touchSegue;
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
			//---- if there are no cells to reuse, create a new one ---
			if (cell == null)
				cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

			C_VitaSite site = PassAroundContainer.Sites[indexPath.Row];

			cell.TextLabel.Text = site.Name;
			cell.DetailTextLabel.Text = site.Street + ", " + site.City + ", " + site.State + " " + site.Zip;

            if (site.Status == E_SiteStatus.Accepting)
				cell.ImageView.Image = UIImage.FromBundle("greenstatus.jpg");
			else if (site.Status == E_SiteStatus.NearLimit)
				cell.ImageView.Image = UIImage.FromBundle("yellowstatus.jpg");
			else if (site.Status == E_SiteStatus.NotAccepting)
				cell.ImageView.Image = UIImage.FromBundle("redstatus.jpg");
			else if (site.Status == E_SiteStatus.Closed)
				cell.ImageView.Image = UIImage.FromBundle("blackstatus.jpg");

			return cell;
		}

		public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
		{
            //base.RowSelected(tableView, indexPath);

            PassAroundContainer.DetailsCameFrom = E_CameFrom.List;
			PassAroundContainer.SelectedSite = PassAroundContainer.Sites[indexPath.Row];

            ourVC.PerformSegue(TouchSegue, ourVC);
		}
	}
}
