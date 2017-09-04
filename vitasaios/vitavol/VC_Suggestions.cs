using Foundation;
using System;
using UIKit;
using System.Collections.Generic;
using System.Threading.Tasks;
using zsquared;

namespace vitavol
{
    public partial class VC_Suggestions : UIViewController
    {
        C_Global Global;

        public VC_Suggestions (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

			// --------- button handlers -----------

			B_Back.TouchUpInside += (sender, e) => 
                PerformSegue("Segue_SuggestionsToSignUps", this);

            B_NewSuggestion.TouchUpInside += OnNewSuggestion;

			// since the login process provides us this users suggestions, we don't need to pull anything additional
			// todo: does this list get stale?

            C_SuggestionsTableSource ts = new C_SuggestionsTableSource(Global, this, Global.LoggedInUser.Suggestions);
			TV_ListOfSuggestions.Source = ts;
            TV_ListOfSuggestions.Delegate = new C_SuggestionsTableDelegate(Global, this, Global.LoggedInUser.Suggestions, ts);
			TV_ListOfSuggestions.ReloadData();
		}

		public void OnNewSuggestion(object s, EventArgs e)
		{
			// create the new suggestion
			C_Suggestion sug = new C_Suggestion()
			{
				Date = C_YMD.Now,
				Status = E_SuggestionStatus.Open,
				UserId = Global.LoggedInUser.id,
				Subject = "",
				Text = "",
				dirty = true
			};
			Global.SelectedSuggestion = sug;

			// and move to the editor
			PerformSegue("Segue_SuggestionsToSuggestion", this);
		}

		public class C_SuggestionsTableDelegate : UITableViewDelegate
		{
			readonly C_Global Global;
			readonly VC_Suggestions OurVC;
			readonly List<C_Suggestion> Suggestions;
			C_SuggestionsTableSource TableSource;

            public C_SuggestionsTableDelegate(C_Global global, VC_Suggestions vc, List<C_Suggestion> suggestions, C_SuggestionsTableSource tsource)
			{
				Global = global;
				OurVC = vc;
                Suggestions = suggestions;
				TableSource = tsource;
			}

			public override UITableViewRowAction[] EditActionsForRow(UITableView tableView, NSIndexPath indexPath)
			{
				UITableViewRowAction hiButton = UITableViewRowAction.Create(UITableViewRowActionStyle.Default, "Remove",
				async delegate
				{
                    C_Suggestion suggestionToRemove = Suggestions[indexPath.Row];

                    await Global.LoggedInUser.RemoveSuggestion(suggestionToRemove);

                    UIApplication.SharedApplication.InvokeOnMainThread(new Action(OurVC.TV_ListOfSuggestions.ReloadData));
				});

				return new UITableViewRowAction[] { hiButton };
			}

			public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
			{
				// identify the specific suggestion
                Global.SelectedSuggestion = Suggestions[indexPath.Row];

				OurVC.PerformSegue("Segue_SuggestionsToSuggestion", OurVC);
			}
		}

		public class C_SuggestionsTableSource : UITableViewSource
		{
            readonly C_Global Global;
            readonly UIViewController ourVC;
            readonly List<C_Suggestion> Suggestions;

            const string CellIdentifier = "TableCell";

			public C_SuggestionsTableSource(C_Global pac, UIViewController vc, List<C_Suggestion> suggestions)
			{
				Global = pac;
				Suggestions = suggestions;
				ourVC = vc;
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
                cell.DetailTextLabel.Text = suggestion.Date.ToString("mmm dd,yyyy") + ":" + suggestion.Text;

				return cell;
			}

			public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
			{
				Global.SelectedSuggestion = Suggestions[indexPath.Row];

				ourVC.PerformSegue("Segue_SuggestionsToSuggestion", ourVC);
			}
		}
    }
}