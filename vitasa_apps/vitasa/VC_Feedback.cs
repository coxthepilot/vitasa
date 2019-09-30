using Foundation;
using System;
using UIKit;
using System.Threading.Tasks;

using zsquared;

namespace vitasa
{
    public partial class VC_Feedback : UIViewController
    {
        C_Global Global;

        public VC_Feedback (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

            B_Back.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_SuggestionToMain", this);
            };

            B_Submit.TouchUpInside += (sender, e) => 
            {
                B_Submit.Enabled = false;

                AI_Busy.StartAnimating();

				C_Suggestion sug = new C_Suggestion(true)
				{
					Subject = TB_Subject.Text,
                    Text = TxV_Text.Text
				};

				Task.Run(async () => 
                {
                    bool success = await sug.AddSuggestion(null);

					UIApplication.SharedApplication.InvokeOnMainThread(
                    new Action(async () =>
                    {
                        AI_Busy.StopAnimating();

                        if (!success)
                        {
                            C_MessageBox.E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this, "Error", "Unable to post the suggestion.", C_MessageBox.E_MessageBoxButtons.Ok);
                            return;
                        }
                        else
                        {
                            C_MessageBox.E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this, "Thanks!", "Thanks for taking the time to provide feedback", C_MessageBox.E_MessageBoxButtons.Ok);
                            PerformSegue("Segue_SuggestionToMain", this);
                            return;
                        }
                    }));
				});
            };

            TB_Subject.AddTarget((sender, e) =>
			{
                B_Submit.Enabled = (TB_Subject.Text.Length > 0) && (TxV_Text.Text.Length > 0);
			}, UIControlEvent.EditingChanged);

            TxV_Text.Changed += (sender, e) =>
			{
				B_Submit.Enabled = (TB_Subject.Text.Length > 0) && (TxV_Text.Text.Length > 0);
			};
			
            L_Suggestion.Text = AppResources.Suggestion_L_Suggestion;
            L_Subject.Text = AppResources.Suggestion_L_Subject;
            L_Text.Text = AppResources.Suggestion_L_Text;
            B_Submit.SetTitle(AppResources.Suggestion_B_Submit, UIControlState.Normal);
		}

		public override void ViewDidAppear(bool animated)
		{
            View.BackgroundColor = C_Common.StandardBackground;
		}
	}
}