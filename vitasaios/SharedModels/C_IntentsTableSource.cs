using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Json;
using UIKit;

namespace zsquared
{
	public class C_IntentsTableSource : UITableViewSource
	{
        C_Global PassAroundContainer;
        UIViewController ourVC = null;
        string TouchSegue;
        List<string> Intents;

		const string CellIdentifier = "TableCell";

        public C_IntentsTableSource(C_Global pac, List<string> intents, UIViewController vc, string touchSegue)
		{
            PassAroundContainer = pac;

			ourVC = vc;

            TouchSegue = touchSegue;

            Intents = intents;
		}

		public override nint RowsInSection(UITableView tableview, nint section)
		{
			int count = 0;
			if (Intents != null)
				count = Intents.Count;
			return count;
		}

		public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
		{
			UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);
			//---- if there are no cells to reuse, create a new one ---
			if (cell == null)
				cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

			string intent = Intents[indexPath.Row];

            cell.TextLabel.Text = intent;

			return cell;
		}

		//public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
		//{
  //          //base.RowSelected(tableView, indexPath);

  //          PassAroundContainer.DetailsCameFrom = E_CameFrom.List;
		//	PassAroundContainer.SelectedSite = PassAroundContainer.Sites[indexPath.Row];

  //          ourVC.PerformSegue(TouchSegue, ourVC);
		//}
	}
}
