using System;
using UIKit;
using System.Threading.Tasks;
using System.Net;

using zsquared;

namespace vitavol
{
    public partial class VC_AdminSuggestion : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        public VC_AdminSuggestion (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            B_Back.TouchUpInside += (sender, e) =>
            {
                Global.SelectedSuggestion = null;
                PerformSegue("Segue_AdminSuggestionToAdminSuggestions", this);
            };

            B_SendTo.TouchUpInside += (sender, e) => 
            {
                string email = LoggedInUser.Email;
                string subject = "VITA Suggest";
                string body = TxV_Message.Text;
                string shareurl = "mailto:" + email + "?subject=" + WebUtility.UrlEncode(subject) + "&body=" + WebUtility.UrlEncode(body);
                Xamarin.Forms.Device.OpenUri(new Uri("mailto:" + shareurl));
            };

            TB_Date.Enabled = false;
            TB_From.Enabled = false;
            TB_Subject.Enabled = false;
            TxV_Message.UserInteractionEnabled = false;
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);
            TxV_Message.BackgroundColor = C_Common.StandardButton;

            AI_Busy.StartAnimating();
            EnableUI(false);

            Task.Run(async () =>
            {
                C_VitaUser user = await Global.FetchUserWithId(Global.SelectedSuggestion.UserId);

                void p()
                {
                    AI_Busy.StopAnimating();
                    EnableUI(true);

                    TB_From.Text = Global.SelectedSuggestion.FromPublic ? "Public" : user.Name;
                    TB_Date.Text = Global.SelectedSuggestion.CreateDate.ToString("dow mmm dd, yyyy");
                    TB_Subject.Text = Global.SelectedSuggestion.Subject;
                    TxV_Message.Text = Global.SelectedSuggestion.Text;
                }
                UIApplication.SharedApplication.InvokeOnMainThread(p);
            });
        }

        private void EnableUI(bool en) =>
            C_Common.EnableUI(View, en);
    }
}