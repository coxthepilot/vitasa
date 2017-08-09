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
		List<C_VitaSite> Sites;
		C_VitaSite SelectedSite;
        vitasa.VC_SitesList ourVC = null;

		const string CellIdentifier = "TableCell";

		public C_SitesTableSource(List<C_VitaSite> slist, C_VitaSite selSite, vitasa.VC_SitesList vc)
		{
			Sites = slist;
			SelectedSite = selSite;

			ourVC = vc;
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

			C_VitaSite site = Sites[indexPath.Row];

			cell.TextLabel.Text = site.SiteName;
			cell.DetailTextLabel.Text = site.SiteStreet + ", " + site.SiteCity + ", " + site.SiteState + " " + site.SiteZip;

			if (site.SiteStatus == C_VitaSite.E_SiteStatus.Open)
				cell.ImageView.Image = UIImage.FromBundle("greenstatus.jpg");
			else if (site.SiteStatus == C_VitaSite.E_SiteStatus.NearLimit)
				cell.ImageView.Image = UIImage.FromBundle("yellowstatus.jpg");
			else if (site.SiteStatus == C_VitaSite.E_SiteStatus.NotAccepting)
				cell.ImageView.Image = UIImage.FromBundle("redstatus.jpg");
			else if (site.SiteStatus == C_VitaSite.E_SiteStatus.Closed)
				cell.ImageView.Image = UIImage.FromBundle("blackstatus.jpg");

			return cell;
		}

		public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
		{
			//base.RowSelected(tableView, indexPath);

			SelectedSite = Sites[indexPath.Row];

			ourVC.PerformSegue("SegueFromListToDetails", ourVC);
		}
	}
}
