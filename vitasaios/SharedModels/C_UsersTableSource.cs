using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Json;
using UIKit;

namespace zsquared
{
	public class C_UsersTableSource : UITableViewSource
	{
        C_Global passAroundContainer;
        UIViewController ourVC = null;
        string TouchSegue;

		const string CellIdentifier = "TableCell";

        public C_UsersTableSource(C_Global pac, UIViewController vc, string touchSegue)
		{
            passAroundContainer = pac;

			ourVC = vc;

            TouchSegue = touchSegue;
		}

		public override nint RowsInSection(UITableView tableview, nint section)
		{
			int count = 0;
            if (passAroundContainer.Users != null)
                count = passAroundContainer.Users.Count;
			return count;
		}

		public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
		{
			UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);
			//---- if there are no cells to reuse, create a new one
			if (cell == null)
				cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

            C_VitaUser user = passAroundContainer.Users[indexPath.Row];

            cell.TextLabel.Text = user.email;
            cell.DetailTextLabel.Text = user.RolesSummary();

			return cell;
		}

		public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
		{
            passAroundContainer.SelectedUser = passAroundContainer.Users[indexPath.Row];

            ourVC.PerformSegue(TouchSegue, ourVC);
		}
	}
}
