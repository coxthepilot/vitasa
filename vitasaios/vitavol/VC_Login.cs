using System;
using UIKit;
using System.Threading.Tasks;
using static zsquared.C_MessageBox;

using zsquared;

namespace vitavol
{
    public partial class VC_Login : UIViewController
    {
        C_Global Global;

        C_PersistentSettings Settings;

        public VC_Login (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

            Settings = new C_PersistentSettings();

            B_Back.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_LoginToMain", this);

            // keep track of the length of text in the email box, allow login when email and password are long enough
            TB_Email.AddTarget((sender, e) =>
            {
                B_Submit.Enabled = (TB_Email.Text.Length > 6) && (TB_Password.Text.Length > 6);

            }, UIControlEvent.EditingChanged);

            // keep track of the length of text in the password box, allow login when email and password are long enough
            TB_Password.AddTarget((sender, e) =>
            {
                B_Submit.Enabled = (TB_Email.Text.Length > 6) && (TB_Password.Text.Length > 6);

            }, UIControlEvent.EditingChanged);

            B_Submit.TouchUpInside += (sender, e) => 
            {
                string email = TB_Email.Text;
                string pw = TB_Password.Text;

                EnableUI(false);
                AI_Busy.StartAnimating();

                Task.Run(async () => 
                {
                    C_IOResult ior = await Global.PerformLogin(email, pw);

                    async void p()
                    {
                        if (!ior.Success)
                        {
                            E_MessageBoxResults mbres = await MessageBox(this, "Error", ior.ErrorMessage, E_MessageBoxButtons.Ok);
                            AI_Busy.StopAnimating();
                            EnableUI(true);
                            return;
                        }

                        C_VitaUser user = ior.User;
                        // if bad name or pass, we get null; otherwise we get a C_VitaUser
                        if (user == null)
                        {
                            E_MessageBoxResults mbres = await MessageBox(this, "Error", "Login failed. Bad email or password", E_MessageBoxButtons.Ok);
                            AI_Busy.StopAnimating();
                            EnableUI(true);
                            return;
                        }

                        if (Settings.NotificationTokenUpdated)
                        {
                            string deviceToken = Settings.NotificationToken;

                            C_IOResult iorx = await Global.RegisterNotificationToken(E_Platform.iOS, deviceToken, user.Token);

                            if (iorx.Success)
                                Settings.NotificationTokenUpdated = false;
                        }

                        AI_Busy.StopAnimating();
                        EnableUI(true);

                        Settings.UserEmail = email;
                        Settings.UserPassword = pw;

                        Settings.ClearPreferedSites();
                        foreach (string ps in ior.User.PreferredSiteSlugs)
                            Settings.AddPreferedSite(ps);

                        Global.ViewCameFrom = E_ViewCameFrom.Login;
                        if (user.HasAdmin)
                        {
                            Global.LoggedInUserId = user.id;

                            UIStoryboard adminStoryBoard = UIStoryboard.FromName("Admin", null);
                            UIViewController vc_adminmenu = adminStoryBoard.InstantiateViewController("AdminMenu");
                            PresentViewController(vc_adminmenu, false, null);
                        }
                        else if (user.HasSiteCoordinator)
                        {
                            Global.LoggedInUserId = user.id;

                            PerformSegue("Segue_LoginToSCSites", this);
                        }
                        else if (user.HasVolunteer)
                        {
                            Global.LoggedInUserId = user.id;

                            PerformSegue("Segue_LoginToVolunteerHome", this);
                        }
                        else
                        {
                            Global.LoggedInUserId = -1;

                            E_MessageBoxResults mbres = await MessageBox(this,
                                             "Error",
                                             "Authorization failure. Expecting a Role from [Volunteer, Site Coordinator, or Admin]",
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

            TB_Email.Text = Settings.UserEmail;
            TB_Password.Text = Settings.UserPassword;

            B_Submit.Enabled = (TB_Email.Text.Length > 6) && (TB_Password.Text.Length > 6);
        }

        private void EnableUI(bool en) =>
            C_Common.EnableUI(View, en);
    }
}