using Foundation;
using System;
using UIKit;
using zsquared;

namespace vitavol
{
    public partial class VC_Suggestions : UIViewController
    {
        // todo: slide to delete
        // todo: only show suggestions from the logged in user

        public C_SuggestionsTableSource suggestionTableSource;

        public VC_Suggestions (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            C_Global passAroundContainer = myAppDelegate.PassAroundContainer;

			// --------- button handlers -----------

			B_Back.TouchUpInside += (sender, e) => 
            {
                string segueTo;
                if (passAroundContainer.DetailsCameFrom == E_CameFrom.List)
                    segueTo = "Segue_SuggestionsToList";
                else if (passAroundContainer.DetailsCameFrom == E_CameFrom.Map)
                    segueTo = "Segue_SuggestionsToMap";
                else
                    throw new ApplicationException("unexpected value in detailscamefrom");

                PerformSegue(segueTo, this);
            };

            B_NewSuggestion.TouchUpInside += OnNewSuggestion;

            // ------------ init the table -----------
            suggestionTableSource = new C_SuggestionsTableSource(passAroundContainer, this, "Segue_SuggestionsToSuggestionEdit");
            TV_ListOfSuggestions.Source = suggestionTableSource;

        }

        public void OnNewSuggestion(object s, EventArgs e)
        {
			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			C_Global passAroundContainer = myAppDelegate.PassAroundContainer;

            // create the new suggestion
			C_Suggestion sug = new C_Suggestion();
            sug.Date = C_YMD.Now;
            sug.ManagingRegion = passAroundContainer.LoggedInUser.ManagingRegion;
            sug.Status = E_SuggestionStatus.Submitted;
            sug.Submitter = passAroundContainer.LoggedInUser.email;
            sug.Title = "";
            sug.Text = "";
                
            // add it to the list
            passAroundContainer.Suggestions.Add(sug);

            // show it as the selected one for the editor to find
            passAroundContainer.SelectedSuggestion = sug;

            // and move to the editor
            PerformSegue("Segue_SuggestionsToSuggestionEdit", this);
        }
    }
}