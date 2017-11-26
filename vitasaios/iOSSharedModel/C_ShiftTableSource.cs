using System;
using System.Collections.Generic;
using UIKit;
using Foundation;

namespace zsquared
{
	public class C_ShiftsTableSource : UITableViewSource
	{
		readonly C_CalendarEntry CalendarEntry;
		readonly List<C_WorkShift> Shifts;
		readonly C_Global Global;
		readonly UIViewController ourVC;
		readonly string SelectedSegue;

		const string CellIdentifier = "TableCell_ShiftsTableSource";

		public C_ShiftsTableSource(C_CalendarEntry centry, C_Global global, UIViewController ovc, string selSeg)
		{
			CalendarEntry = centry;
			Shifts = CalendarEntry.WorkShifts;
			Global = global;
			ourVC = ovc;
			SelectedSegue = selSeg;
		}

		public override nint RowsInSection(UITableView tableview, nint section)
		{
			return Shifts.Count;
		}

		public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
		{
			UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);
			//---- if there are no cells to reuse, create a new one
			if (cell == null)
				cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

			C_WorkShift shift = Shifts[indexPath.Row];
			cell.TextLabel.Text = shift.OpenTime.ToString("hh:mm p") + " - " + shift.CloseTime.ToString("hh:mm p");

            int numBasic = 0;
            int numAdv = 0;
            foreach (C_WorkShiftSignUp wssu in shift.SignUps)
            {
                if (wssu.User.Certification == E_Certification.Basic)
                    numBasic++;
                else if (wssu.User.Certification == E_Certification.Advanced)
                    numAdv++;
            }

            cell.DetailTextLabel.Text = "eFilers: " + numBasic.ToString() + " of " + shift.NumBasicEFilers.ToString() + " Basic; "
                + numAdv.ToString() + " of " + shift.NumAdvEFilers.ToString() + " Advanced";

			return cell;
		}

		public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
		{
			if (SelectedSegue == null)
				return;

			Global.SelectedShift = Shifts[indexPath.Row];

			Global.ViewCameFrom = E_ViewCameFrom.CalEntry;

			ourVC.PerformSegue(SelectedSegue, ourVC);
		}
	}
}
