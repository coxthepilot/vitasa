using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Json;
using UIKit;

namespace zsquared
{
	public class C_SuggestionsTableSource : UITableViewSource
	{
        C_Global Global;
        UIViewController ourVC = null;
        string TouchSegueForSelection;
        List<C_Suggestion> Suggestions;

		const string CellIdentifier = "TableCell";

        public C_SuggestionsTableSource(C_Global pac, UIViewController vc, string touchSegueForSelection, List<C_Suggestion> suggestions)
		{
            Global = pac;
            Suggestions = suggestions;
			ourVC = vc;

            TouchSegueForSelection = touchSegueForSelection;
		}

		public override nint RowsInSection(UITableView tableview, nint section)
		{
			int count = 0;
            if (Suggestions != null)
                count = Suggestions.Count;
			return count;
		}

		public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
		{
			UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);
			//---- if there are no cells to reuse, create a new one
			if (cell == null)
				cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

            C_Suggestion suggestion = Suggestions[indexPath.Row];

            cell.TextLabel.Text = suggestion.Subject;
            cell.DetailTextLabel.Text = suggestion.Date.ToString() + ":" + suggestion.Body;

			return cell;
		}

		public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
		{
            Global.SelectedSuggestion = Suggestions[indexPath.Row];

            ourVC.PerformSegue(TouchSegueForSelection, ourVC);
		}
	}
}
