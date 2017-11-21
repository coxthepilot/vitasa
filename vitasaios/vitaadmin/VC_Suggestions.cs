using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.IO;
using UIKit;
using Xamarin.Forms;
using zsquared;

namespace vitaadmin
{
    public partial class VC_Suggestions : UIViewController
    {
        C_Global Global;
        List<C_Suggestion> Suggestions;
        C_VitaUser LoggedInUser;

        public VC_Suggestions (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

			B_Back.TouchUpInside += (sender, e) => 
                PerformSegue("Segue_SuggestionsToMain", this);

            SC_State.ValueChanged += (sender, e) => 
            {
                int selectedSegment = (int)SC_State.SelectedSegment;
                E_SuggestionStatus selssug = E_SuggestionStatus.Unknown;
				foreach (E_SuggestionStatus ss in Enum.GetValues(typeof(E_SuggestionStatus)))
                {
                    if ((int)ss == selectedSegment)
                    {
                        selssug = ss;
                        break;
                    }
                }
                Global.SelectedSuggestion.Status = selssug;

                Task.Run(async () => 
                {
                    bool success = await Global.SelectedSuggestion.UpdateSuggestion(LoggedInUser.Token);
                });
			};

            AI_Busy.StartAnimating();
            EnableUI(false);

            Task.Run(async () => 
            {
                Suggestions = await C_Suggestion.FetchAllSuggestions(LoggedInUser.Token);

				UIApplication.SharedApplication.InvokeOnMainThread(
				new Action(() =>
				{
					AI_Busy.StopAnimating();
					EnableUI(true);

					Global.ViewCameFrom = E_ViewCameFrom.MySignUps;
                    C_SuggestionsTableSource ts = new C_SuggestionsTableSource(Global, Suggestions);
                    TV_Suggestions.Source = ts;
                    TV_Suggestions.Delegate = new C_SuggestionsTableDelegate(Global, this, ts);
					TV_Suggestions.ReloadData();
				}));
			});

            SC_State.RemoveAllSegments();
            foreach (E_SuggestionStatus ss in Enum.GetValues(typeof(E_SuggestionStatus)))
                SC_State.InsertSegment(ss.ToString(), (int)ss, true);
        }

        private void PopulateSuggestion()
        {
            C_Suggestion s = Global.SelectedSuggestion;

            L_From.Text = s.FromPublic ? "--- public ---" : s.UserId.ToString();
            L_Date.Text = s.CreateDate.ToString("mmm dd, yyyy");
            SC_State.SelectedSegment = (int)s.Status;
            L_Subject.Text = s.Subject;
            L_UpdatedDate.Text = s.UpdateDate.ToString("mmm dd, yyyy");

            string contentDirectoryPath = Path.Combine(NSBundle.MainBundle.BundlePath, "/");
            WV_Message.LoadHtmlString(s.Text, new NSUrl(contentDirectoryPath, true));

            if (!s.FromPublic)
            {
                Task.Run(async () =>
                {
                    C_VitaUser u = await Global.GetUserFromCache(s.UserId);

                    UIApplication.SharedApplication.InvokeOnMainThread(
                    new Action(() =>
                    {
                        L_From.Text = u.Name;
                    }));
                });
            }
		}

        private void EnableUI(bool en)
        {
            TV_Suggestions.UserInteractionEnabled = en;
            SC_State.Enabled = en;
            B_Back.Enabled = en;
        }

		public class C_SuggestionsTableDelegate : UITableViewDelegate
		{
			readonly C_Global Global;
            readonly VC_Suggestions OurVC;
			readonly C_SuggestionsTableSource TableSource;
            readonly string Token;

			public C_SuggestionsTableDelegate(C_Global global, VC_Suggestions vc, C_SuggestionsTableSource tsource)
			{
				Global = global;
				OurVC = vc;
				TableSource = tsource;

                C_VitaUser user = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
                Token = user.Token;
			}

			public override UITableViewRowAction[] EditActionsForRow(UITableView tableView, NSIndexPath indexPath)
			{
				UITableViewRowAction hiButton = UITableViewRowAction.Create(UITableViewRowActionStyle.Default, "Remove",
				async delegate
				{
                    C_Suggestion suggestionToRemove = TableSource.OurSuggestions[indexPath.Row];

					OurVC.AI_Busy.StartAnimating();
					OurVC.EnableUI(false);

                    bool succ = await suggestionToRemove.RemoveSuggestion(Token);
					TableSource.OurSuggestions.Remove(suggestionToRemove);

					OurVC.EnableUI(true);
					OurVC.AI_Busy.StopAnimating();

                    OurVC.TV_Suggestions.ReloadData();
				});

				return new UITableViewRowAction[] { hiButton };
			}

			public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
			{
				// identify the specific signup
                Global.SelectedSuggestion = TableSource.OurSuggestions[indexPath.Row];

                OurVC.PopulateSuggestion();
			}
		}

		public class C_SuggestionsTableSource : UITableViewSource
		{
			const string CellIdentifier = "TableCell_SuggestionsTableSource";
			public List<C_Suggestion> OurSuggestions;
			readonly C_Global Global;

            public C_SuggestionsTableSource(C_Global global, List<C_Suggestion> ourSuggestions)
			{
				Global = global;
                OurSuggestions = ourSuggestions;
			}

			public override nint RowsInSection(UITableView tableview, nint section)
			{
				int count = 0;
				if (OurSuggestions != null)
					count = OurSuggestions.Count;
				return count;
			}

			public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
			{
				UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);

				//---- if there are no cells to reuse, create a new one
				if (cell == null)
					cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

                C_Suggestion suggestion = OurSuggestions[indexPath.Row];

                cell.TextLabel.Text = suggestion.Subject;
                string subject = "";
                if (suggestion.Subject != null)
                    subject = suggestion.Subject;
                int maxLength = 100;
                if (subject.Length < maxLength)
                    maxLength = subject.Length;
                cell.DetailTextLabel.Text = subject.Substring(0, maxLength);

				return cell;
			}
		}
    }
}