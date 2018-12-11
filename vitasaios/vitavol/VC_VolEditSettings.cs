using Foundation;
using System;
using System.Threading.Tasks;
using UIKit;
using zsquared;
using static zsquared.C_MessageBox;

namespace vitavol
{
    public partial class VC_VolEditSettings : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;
        C_PersistentSettings Settings;

        public VC_VolEditSettings (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
            Settings = new C_PersistentSettings();

            UITapGestureRecognizer labelTap = new UITapGestureRecognizer(() =>
            {
                C_Common.DropFirstResponder(View);
            });

            L_Title.UserInteractionEnabled = true;
            L_Title.AddGestureRecognizer(labelTap);

            B_Back.TouchUpInside += (sender, e) =>
                GoBack();

            B_Save.TouchUpInside += (sender, e) => 
            {
                LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

                LoggedInUser.Name = TB_Name.Text;
                LoggedInUser.Email = TB_Email.Text;
                LoggedInUser.Phone = TB_Phone.Text;

                if (!string.IsNullOrWhiteSpace(TB_Password.Text) 
                    && (TB_Password.Text == TB_PasswordVerify.Text) && (TB_Password.Text.Length > 7))
                    LoggedInUser.Password = TB_Password.Text;

                AI_Busy.StartAnimating();
                EnableUI(false);

                Task.Run(async () => 
                {
                    C_IOResult ior = await Global.UpdateUserFields(LoggedInUser.ToJsonAsJsonBuilder(), LoggedInUser, LoggedInUser.Token);

                    async void p()
                    {
                        AI_Busy.StopAnimating();
                        EnableUI(true);

                        if (!ior.Success)
                        {
                            E_MessageBoxResults mbres = await MessageBox(this,
                                "Error",
                                "Unable to save the user settings.",
                                E_MessageBoxButtons.Ok);
                        }
                        else
                        {
                            // update the local copy of the email and password in case they changed
                            Settings.UserEmail = LoggedInUser.Email;
                            if (!string.IsNullOrWhiteSpace(TB_Password.Text)
                                            && (TB_Password.Text == TB_PasswordVerify.Text) && (TB_Password.Text.Length > 7))
                                Settings.UserPassword = LoggedInUser.Password;
                            GoBack();
                        }
                    }
                    UIApplication.SharedApplication.InvokeOnMainThread(p);
                });
            };

            TB_Name.AddTarget(SomeTextFieldChanged, UIControlEvent.AllEditingEvents);
            TB_Email.AddTarget(SomeTextFieldChanged, UIControlEvent.AllEditingEvents);
            TB_Password.AddTarget(SomeTextFieldChanged, UIControlEvent.AllEditingEvents);
            TB_PasswordVerify.AddTarget(SomeTextFieldChanged, UIControlEvent.AllEditingEvents);
            TB_Phone.AddTarget(SomeTextFieldChanged, UIControlEvent.AllEditingEvents);
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);

            TB_Name.Text = LoggedInUser.Name;
            TB_Email.Text = LoggedInUser.Email;
            TB_Phone.Text = LoggedInUser.Phone;

            SomeTextFieldChanged(null, null);
        }

        void SomeTextFieldChanged(object sender, EventArgs e)
        {
            B_Save.Enabled = OkToSave();
        }

        private bool OkToSave()
        {
            bool nameChanged = LoggedInUser.Name != TB_Name.Text;
            bool emailChanged = LoggedInUser.Email != TB_Email.Text;
            bool phoneChanged = LoggedInUser.Phone != TB_Phone.Text;
            bool passwordChanged = !string.IsNullOrWhiteSpace(TB_Password.Text) || !string.IsNullOrWhiteSpace(TB_PasswordVerify.Text);

            bool nameOK = !string.IsNullOrWhiteSpace(TB_Name.Text) && (TB_Name.Text.Length > 3);
            bool emailOK = Tools.EmailAddressIsValid(TB_Email.Text);
            bool passwordOK = (TB_Password.Text == TB_PasswordVerify.Text) && (TB_Password.Text.Length > 7);

            bool okToSave = (nameChanged && nameOK) || (emailChanged && emailOK) || phoneChanged || (passwordChanged && passwordOK);

            return okToSave;
        }

        private void EnableUI(bool en)
        {
            C_Common.EnableUI(View, en);

            B_Save.Enabled = en && OkToSave();
        }

        private void GoBack()
        {
            switch (Global.ViewCameFrom)
            {
                case E_ViewCameFrom.VolOptions:
                    PerformSegue("Segue_VolEditSettingsToVolHome", this);
                    break;
                case E_ViewCameFrom.SCOptions:
                    PerformSegue("Segue_VolEditSettingsToSCSites", this);
                    break;
                case E_ViewCameFrom.Admin:
                    UIStoryboard adminStoryBoard = UIStoryboard.FromName("Admin", null);
                    UIViewController vc_adminmenu = adminStoryBoard.InstantiateViewController("AdminMenu");
                    PresentViewController(vc_adminmenu, false, null);
                    break;
            }
        }
    }
}