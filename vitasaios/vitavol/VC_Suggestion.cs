using Foundation;
using System;
using UIKit;
using Xamarin.Forms;
using System.Threading.Tasks;
using zsquared;
using static zsquared.Tools;

namespace vitavol
{
    public partial class VC_Suggestion : UIViewController
    {
		C_Global Global;
        bool Dirty;

		public VC_Suggestion (IntPtr handle) : base (handle)
        {
        }

		public override void ViewDidLoad()
		{
			base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

			// ----------- init the button handlers --------

			B_Back.TouchUpInside += async (sender, e) =>
			{
                if (Dirty)
                {
                    E_MessageBoxResults mbres = await MessageBox(this,
                                                                  "Changes have been made",
                                                                  "Changes were made to the suggestion and not saved. Save them?",
                                                                   E_MessageBoxButtons.YesNo);
                    if (mbres == E_MessageBoxResults.Yes)
                    {
                        bool success = await SaveSuggestion();

                        if (!success)
                        {
                            await MessageBox(this, "Error", "Unable to add or update the suggestion", E_MessageBoxButtons.Ok);

                            return;
                        }
                    }
                }

				PerformSegue("Segue_SuggestionToSuggestions", this);
			};

			B_DeleteThisSuggestion.TouchUpInside += async (sender, e) =>
			{
                E_MessageBoxResults mbRes = await MessageBox(this, 
                                                               "Delete item?", 
                                                               "Are you sure you want to delete this suggestion?", 
                                                               E_MessageBoxButtons.YesNo);
                
                if ((mbRes == E_MessageBoxResults.No) || (Global.SelectedSuggestion.id == -1))
                {
					PerformSegue("Segue_SuggestionToSuggestions", this);

                    return;
				}

                bool success = await Global.LoggedInUser.RemoveSuggestion(Global.SelectedSuggestion);
                Global.LoggedInUser.Suggestions.Remove(Global.SelectedSuggestion);

                await MessageBox(this,
                                  "Error",
                                  "Unable to delete the suggestion.",
                                   E_MessageBoxButtons.Ok);

				PerformSegue("Segue_SuggestionToSuggestions", this);
			};

            B_Save.TouchUpInside += (sender, e) => 
            {
                Task.Run(async () =>
                {
                    bool success = await SaveSuggestion();

                    if (!success)
                    {
                        await MessageBox(this, "Error", "Unable to add or update the suggestion", E_MessageBoxButtons.Ok);

                        return;
                    }

					UIApplication.SharedApplication.InvokeOnMainThread(
                    new Action(() =>
                    {
						PerformSegue("Segue_SuggestionToSuggestions", this);
					}));
				});
			};

            B_Cancel.TouchUpInside += (sender, e) => 
            {
                // don't save this suggestion; if new, then all is lost, otherwise just the changes are lost
				PerformSegue("Segue_SuggestionToSuggestions", this);
			};

			TB_Title.AddTarget((sender, e) =>
			{
                Dirty = true;
			}, UIControlEvent.EditingChanged);

			TB_Suggestion.AddTarget((sender, e) =>
			{
                Dirty = true;
			}, UIControlEvent.EditingChanged);

			// ---------- init the fields --------
			L_Submitter.Text = Global.LoggedInUser.Name;
			L_Date.Text = Global.SelectedSuggestion.Date.ToString();
			L_Status.Text = Global.SelectedSuggestion.Status.ToString();
			TB_Title.Text = Global.SelectedSuggestion.Subject;
			TB_Suggestion.Text = Global.SelectedSuggestion.Text;

            Dirty = Global.SelectedSuggestion.id == -1;
		}

        private async Task<bool> SaveSuggestion()
        {
			Global.SelectedSuggestion.Subject = TB_Title.Text;
			Global.SelectedSuggestion.Text = TB_Suggestion.Text;

			bool success = false;
			if (Global.SelectedSuggestion.id == -1)
			{
				success = await Global.LoggedInUser.AddSuggestion(Global.SelectedSuggestion);
				Global.LoggedInUser.Suggestions.Add(Global.SelectedSuggestion);
			}
			else
				success = await Global.LoggedInUser.UpdateSuggestion(Global.SelectedSuggestion);
            Dirty = false;

            return success;
		}
 	}
}