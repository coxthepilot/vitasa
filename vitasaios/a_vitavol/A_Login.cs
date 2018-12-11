using System;
using System.Threading.Tasks;
using System.Collections.Generic;

using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using Android.Util;
using Android.Gms.Common.Apis;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_Login")]
    public class A_Login : Activity
    {
        C_Global Global;

        Button B_Submit;

        EditText TB_Email;
        EditText TB_Password;

        ProgressBar PB_Busy;

        C_PersistentSettings Settings;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;

            Settings = new C_PersistentSettings(this);

            SetContentView(Resource.Layout.Login);

            TB_Email = FindViewById<EditText>(Resource.Id.TB_Email);
            TB_Password = FindViewById<EditText>(Resource.Id.TB_Password);
            B_Submit = FindViewById<Button>(Resource.Id.B_Submit);
            PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);

            C_Common.SetViewColors(this, Resource.Id.V_Login);

            B_Submit.Click += (object sender, EventArgs e) => 
            {
                PB_Busy.Visibility = Android.Views.ViewStates.Visible;
                EnableUI(false);

                Task.Run(async () => 
                {
                    C_IOResult ior = await Global.PerformLogin(TB_Email.Text, TB_Password.Text);

                    if ((ior.User != null) && (C_GooglePlayHelper.IsGooglePlayServicesInstalled(this)))
                    {

                        // see if we need to update the messaging token on the backend
                        if (Settings.FirebaseTokenUpdated)
                        {
                            string messagingToken = Settings.FirebaseToken;
                            if (!string.IsNullOrEmpty(messagingToken))
                            {
                                // the current token can be found at: FirebaseInstanceId.Instance.Token
                                C_IOResult ior1 = await Global.RegisterNotificationToken(E_Platform.Android, messagingToken, ior.User.Token);
#if DEBUG
                                if (!ior1.Success)
                                    Log.Debug("vita", "unable to register token");
#endif
                                if (ior1.Success)
                                {
                                    // show that we have updated the token on the backend
                                    Settings.FirebaseTokenUpdated = false;
                                    Settings.Save();
                                }
                            }
                        }
                    }

                    void p()
                    {
                        PB_Busy.Visibility = Android.Views.ViewStates.Invisible;
                        EnableUI(true);

                        if (!ior.Success)
                        {
                            C_MessageBox mbox = new C_MessageBox(this, "Error", ior.ErrorMessage, E_MessageBoxButtons.Ok);
                            mbox.Show();

                            return;
                        }

                        if (ior.User == null)
                        {
                            C_MessageBox mbox = new C_MessageBox(this, "Error", "Unable to login. Might be bad email or password", E_MessageBoxButtons.Ok);
                            mbox.Show();

                            return;
                        }

                        Global.LoggedInUserId = ior.User.id;

                        Settings.UserEmail = TB_Email.Text;
                        Settings.UserPassword = TB_Password.Text;

                        Settings.PreferedSites = new List<string>();
                        foreach (string ps in ior.User.PreferredSiteSlugs)
                            Settings.AddPreferedSite(ps);
                        Settings.Save();

                        if (ior.User.HasAdmin)
                            StartActivity(new Intent(this, typeof(A_AdminMenu)));
                        else if (ior.User.HasSiteCoordinator)
                            StartActivity(new Intent(this, typeof(A_SCSites)));
                        else if (ior.User.HasVolunteer)
                            StartActivity(new Intent(this, typeof(A_VolHome)));
                        else
                        {
                            C_MessageBox mbox = new C_MessageBox(this, "Error", "Authorization failure. Expecting Admin, Volunteer or Site Coordinator.", E_MessageBoxButtons.Ok);
                            mbox.Show();

                            return;
                        }
                    }
                    RunOnUiThread(p);
                });
            };

            TB_Email.TextChanged += (sender, e) => 
                B_Submit.Enabled = CheckSubmitEnabled();

            TB_Password.TextChanged += (sender, e) => 
                B_Submit.Enabled = CheckSubmitEnabled();

            EnableUI(true);
        }

        bool UIIsEnabled;
        private void EnableUI(bool en)
        {
            UIIsEnabled = en;
            TB_Email.Enabled = en;
            TB_Password.Enabled = en;

            B_Submit.Enabled = en && CheckSubmitEnabled();
        }

        public override void OnBackPressed()
        {
            if (UIIsEnabled)
                StartActivity(new Intent(this, typeof(MainActivity)));
        }

        private bool CheckSubmitEnabled()
        {
            return (TB_Email.Text.Length > 6) && (TB_Password.Text.Length > 6);
        }
    }
}
