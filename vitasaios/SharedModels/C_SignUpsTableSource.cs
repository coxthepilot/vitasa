using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Json;
using UIKit;

namespace zsquared
{
	public class C_SignUpsTableSourceZ : UITableViewSource
	{
        C_Global Global;
        UIViewController ourVC = null;
        List<C_SignUp> SignUps;
        string TouchSegueForSelection;
		const string CellIdentifier = "TableCell";

        public C_SignUpsTableSourceZ(C_Global pac, UIViewController vc, string touchSegueForSelection, List<C_SignUp> signups)
		{
            Global = pac;
            SignUps = signups;
			ourVC = vc;

            TouchSegueForSelection = touchSegueForSelection;
		}

		public override nint RowsInSection(UITableView tableview, nint section)
		{
			int count = 0;
            if (SignUps != null)
                count = SignUps.Count;
			return count;
		}

		public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
		{
			UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);
			//---- if there are no cells to reuse, create a new one
			if (cell == null)
				cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

            C_SignUp signup = SignUps[indexPath.Row];

            cell.TextLabel.Text = signup.SiteSlug; // todo: should be the site name
            cell.DetailTextLabel.Text = signup.Date.ToString();

			return cell;
		}

		public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
		{
            if (TouchSegueForSelection != null)
            {
                Global.SelectedSignUp = SignUps[indexPath.Row];

                ourVC.PerformSegue(TouchSegueForSelection, ourVC);
            }
		}
	}
}
