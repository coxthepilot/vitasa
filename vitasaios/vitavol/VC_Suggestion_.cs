using Foundation;
using System;
using System.Threading.Tasks;
using UIKit;
using zsquared;
using static zsquared.C_MessageBox;

namespace vitavol
{
    public partial class VC_Suggestion : UIViewController
    {
        C_Global Global;

        public VC_Suggestion (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

            B_Back.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_SuggestionToVolHome", this);
            };

            B_Cancel.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_SuggestionToVolHome", this);
            };

            TB_Subject.AddTarget((sender, e) =>
            {
                B_Save.Enabled = (TB_Subject.Text.Length > 0) && (TxV_Message.Text.Length > 0);

            }, UIControlEvent.EditingChanged);

            TxV_Message.Changed += (sender, e) => 
            {
                B_Save.Enabled = (TB_Subject.Text.Length > 0) && (TxV_Message.Text.Length > 0);
            };

            B_Save.TouchUpInside += (sender, e) => 
            {
                C_VitaUser user = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
                C_Suggestion sug = new C_Suggestion(Global.LoggedInUserId, C_YMD.Now, false)
                {
                    Text = TxV_Message.Text,
                    Subject = TB_Subject.Text,
                    id = Global.LoggedInUserId,
                    Status = E_SuggestionStatus.Open
                };

                AI_Busy.StartAnimating();
                EnableUI(false);

                Task.Run(async () => 
                {
                    C_IOResult ior = await Global.CreateSuggestion(sug, user.Token);

                    async void p() 
                    {
                        AI_Busy.StopAnimating();
                        EnableUI(true);

                        if (ior.Success)
                            PerformSegue("Segue_SuggestionToVolHome", this);
                        else
                        {
                            E_MessageBoxResults mbres = await MessageBox(this,
                                 "Error. Unable to save the Suggestion.",
                                 ior.ErrorMessage,
                                 E_MessageBoxButtons.Ok);
                        }
                    }
                    UIApplication.SharedApplication.InvokeOnMainThread(p);
                });
            };
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);

            TxV_Message.BackgroundColor = C_Common.StandardButton;
        }

        private void EnableUI(bool en) =>
            C_Common.EnableUI(View, en);
    }
}