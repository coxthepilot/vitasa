using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Json;
using UIKit;

namespace zsquared
{
    public enum E_SitesCellType { NameAndDate, NameAndNeeded }

	public class C_SitesTableSource : UITableViewSource
	{
        C_Global Global;
        UIViewController ourVC = null;
        string TouchSegue;
        List<C_VitaSite> Sites;
        E_SitesCellType CellType;
        C_YMD Date;

		const string CellIdentifier = "TableCell";

        public C_SitesTableSource(C_Global pac, UIViewController vc, string touchSegue, List<C_VitaSite> sites, E_SitesCellType cellType, C_YMD date)
		{
            Global = pac;
			ourVC = vc;
            Sites = sites;
            TouchSegue = touchSegue;
            CellType = cellType;
            Date = date;
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
			//---- if there are no cells to reuse, create a new one ---
			if (cell == null)
				cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

			C_VitaSite site = Sites[indexPath.Row];

            if (CellType == E_SitesCellType.NameAndDate)
            {
                cell.TextLabel.Text = site.Name;
                cell.DetailTextLabel.Text = site.Street + ", " + site.City + ", " + site.State + " " + site.Zip;
            }
            else if (CellType == E_SitesCellType.NameAndNeeded)
            {
				cell.TextLabel.Text = site.Name;
                int dayOfWeek = (int)Date.DayOfWeek;
                cell.DetailTextLabel.Text = site.SiteCalendar[dayOfWeek].OverrideNumEFilers.ToString() + " needed.";
			}

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
            Global.ViewCameFrom = E_ViewCameFrom.List;
			Global.SelectedSite = Sites[indexPath.Row];

            ourVC.PerformSegue(TouchSegue, ourVC);
		}
	}
}
