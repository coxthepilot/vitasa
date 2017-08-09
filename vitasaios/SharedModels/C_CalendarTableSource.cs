using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Json;
using UIKit;

namespace zsquared
{
	public class C_CalendarTableSource : UITableViewSource
	{
        C_Global PassAroundContainer;
        UIViewController ourVC = null;
        string TouchSegue;
        List<C_CalendarEntry> CalendarEntries;

		const string CellIdentifier = "TableCell";

        public C_CalendarTableSource(C_Global pac, List<C_CalendarEntry> clist, UIViewController vc, string touchSegue)
		{
            PassAroundContainer = pac;

			ourVC = vc;

            TouchSegue = touchSegue;

            CalendarEntries = clist;
		}

		public override nint RowsInSection(UITableView tableview, nint section)
		{
			int count = 0;
            if (CalendarEntries != null)
				count = CalendarEntries.Count;
			return count;
		}

		public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
		{
			UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);
			//---- if there are no cells to reuse, create a new one ---
			if (cell == null)
				cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

            C_CalendarEntry ce = CalendarEntries[indexPath.Row];

            cell.TextLabel.Text = ce.Date.ToString("mmm dd, yyyy") 
                + " (" + ce.OpenTime.ToString("hh:mm") + " - " + ce.CloseTime.ToString("hh:mm") + ")";
            cell.DetailTextLabel.Text = ce.EfilerStatus.ToString() + " (" + ce.EFilerIntents.Count.ToString() + " of "
                + ce.EfilersNeeded.ToString() + " signed up)";

			return cell;
		}

		public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
		{
            if (TouchSegue != null)
            {
                PassAroundContainer.SelectedCalendarEntry = CalendarEntries[indexPath.Row];
                ourVC.PerformSegue(TouchSegue, ourVC);
            }
		}
	}
}
