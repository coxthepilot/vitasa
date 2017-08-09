using Foundation;
using System;
using UIKit;
using Xamarin.Forms;
using zsquared;

namespace vitavol
{
    public partial class VC_SuggestionEdit : UIViewController
    {
        // todo: add a multi-line editor for the text of the suggestion

        public VC_SuggestionEdit (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			C_Global passAroundContainer = myAppDelegate.PassAroundContainer;
			
            // ----------- init the handlers --------

            B_Back.TouchUpInside += (sender, e) => 
            {
                // todo: if changes, save the result to the DB

                PerformSegue("Segue_SuggestionEditToSuggestions", this);
            };

            B_DeleteThisSuggestion.TouchUpInside += (sender, e) => 
            {
                // todo: confirm with the user that it is ok to delete the suggestion
                passAroundContainer.Suggestions.Remove(passAroundContainer.SelectedSuggestion);

				PerformSegue("Segue_SuggestionEditToSuggestions", this);
			};

			// ---------- init the fields --------
			L_Submitter.Text = passAroundContainer.SelectedSuggestion.Submitter;
			L_Date.Text = passAroundContainer.SelectedSuggestion.Date.ToString();
            L_Status.Text = passAroundContainer.SelectedSuggestion.Status.ToString();
            TB_Title.Text = passAroundContainer.SelectedSuggestion.Title;
            TB_Suggestion.Text = passAroundContainer.SelectedSuggestion.Text;

			//var editor = new Editor { BackgroundColor = Device.OnPlatform(Color.FromHex("#A4EAFF"), Color.FromHex("#2c3e50"), Color.FromHex("#2c3e50")) };
			//layout.Children.Add(editor);

			TB_Title.AddTarget((sender, e) =>
			{
				passAroundContainer.SelectedSuggestion.Title = TB_Title.Text;

			}, UIControlEvent.EditingChanged);

			TB_Suggestion.AddTarget((sender, e) =>
			{
                passAroundContainer.SelectedSuggestion.Text = TB_Suggestion.Text;

			}, UIControlEvent.EditingChanged);
        }
    }
}