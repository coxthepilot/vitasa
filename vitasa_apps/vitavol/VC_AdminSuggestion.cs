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

            UITapGestureRecognizer labelTap = new UITapGestureRecognizer(() =>
            {
                C_Common.DropFirstResponder(View);
            });

            L_Title.UserInteractionEnabled = true;
            L_Title.AddGestureRecognizer(labelTap);

            B_Back.TouchUpInside += (sender, e) =>
            {
                Global.SelectedSuggestion = null;
                PerformSegue("Segue_AdminSuggestionToAdminSuggestions", this);
            };

            B_SendTo.TouchUpInside += (sender, e) => 
            {
                Task.Run(async () => 
                {
                    string from = "public";
                    if (!Global.SelectedSuggestion.FromPublic && (Global.SelectedSuggestion.UserId != -1))
                    {
                        C_VitaUser u = await Global.FetchUserWithId(Global.SelectedSuggestion.UserId);
                        if (u != null)
                            from = u.Name;
                    }

                    void p()
                    {
                        string email = LoggedInUser.Email;
                        string subject = "VITA Suggest";
                        string body = "From: " + from +
                            "\nSubject: " + Global.SelectedSuggestion.Subject +
                            "\nMessage: " + TxV_Message.Text;
                        string shareurl = "mailto:" + email + "?subject=" + subject + "&body=" + body;

                        Xamarin.Forms.Device.OpenUri(new Uri("mailto:" + shareurl));
                    }
                    UIApplication.SharedApplication.InvokeOnMainThread(p);
                });
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
                C_VitaUser user = null;
                if (!Global.SelectedSuggestion.FromPublic)
                    user = await Global.FetchUserWithId(Global.SelectedSuggestion.UserId);

                void p()
                {
                    AI_Busy.StopAnimating();
                    EnableUI(true);

                    string uname = user == null ? "" : user.Name;
                    TB_From.Text = Global.SelectedSuggestion.FromPublic ? "Public" : uname;
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