using System;
using System.Threading.Tasks;
using System.IO;

using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using Android.Util;
using Android.Gms.Common.Apis;
using Android.Views;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "VITA San Antonio", MainLauncher = true)]
    public class MainActivity : Activity
    {
        C_Global Global;

        Button B_FindASite;
        Button B_BeforeYouGo;
        Button B_StaffAccess;
        Button B_About;

        TextView L_Title;

        ProgressBar PB_Busy;

        C_PersistentSettings Settings;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            // retain the number of bytes receive across re-initialization of the Global
            long bytes = g.Global == null ? 0 : g.Global.BytesReceived;
            Global = g.Global = new C_Global();
            Global.BytesReceived = bytes;

            // Set our view from the "main" layout resource
            SetContentView(Resource.Layout.Main);

            B_FindASite = FindViewById<Button>(Resource.Id.B_FindASite);
            B_BeforeYouGo = FindViewById<Button>(Resource.Id.B_BeforeYouGo);
            B_StaffAccess = FindViewById<Button>(Resource.Id.B_StaffAccess);
            B_About = FindViewById<Button>(Resource.Id.B_About);
            L_Title = FindViewById<TextView>(Resource.Id.L_Title);
            PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);

            C_Common.SetViewColors(this, Resource.Id.V_MainActivity, false);

            // on a new instance, reset a few of the values
            Settings = new C_PersistentSettings(this)
            {
                Zoom = 10.0f,
                Latitude = 29.415411f,
                Longitude = -98.4918232f
            };
            Settings.Save();

            // the following installs the test data and tells Global to use it rather than the api's
            if (!Global.UsingTestData)
            {
                try
                {
                    Android.Content.Res.AssetManager assets = Assets;

                    //string[] rnames = assembly.GetManifestResourceNames();
                    using (Stream stream_s = assets.Open("testdata_sites.json"))
                    {
                        using (StreamReader sr_s = new StreamReader(stream_s))
                        {
                            using (Stream stream_u = assets.Open("testdata_users.json"))
                            {
                                using (StreamReader sr_u = new StreamReader(stream_u))
                                {
                                    string sitesjson = sr_s.ReadToEnd();

                                    string usersjson = sr_u.ReadToEnd();

                                    Global.UseTestData(sitesjson, usersjson);

                                    C_Suggestion sug = new C_Suggestion(-1, C_YMD.Now, true)
                                    {
                                        Subject = "123 subject",
                                        Text = "new message\nand more\nnew message\nand more\nnew message\nand more\nnew message\nand more\nnew message\nand more\n"
                                    };
                                    Global._SuggestionCache.Add(sug);

                                    C_Notification not = new C_Notification
                                    {
                                        Audience = E_NotificationAudience.Volunteers,
                                        CreatedDT = DateTime.Now,
                                        Message = "the notification text",
                                        SentDT = DateTime.MinValue,
                                        id = 1
                                    };
                                    Global._NotificationCache.Add(not);
                                }
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    Log.Debug("vita", ex.Message);
                }
            }

            if (Intent.Extras != null)
            {
                string m_id = Intent.Extras.GetString("google.message_id");
                if (m_id != null)
                {
                    //string fb_message = C_SharedPreferences.GetSharedPreferences(this, "firebase_message", "");
                    //string fb_id = C_SharedPreferences.GetSharedPreferences(this, "firebase_messageid", "");
                    string fb_message = Settings.FirebaseMessage;
                    string fb_id = Settings.FirebaseID;

                    if (m_id == fb_id)
                    {
                        C_MessageBox mbox = new C_MessageBox(this, "Notification", fb_message, E_MessageBoxButtons.Ok);
						mbox.Show();
					}
                }
            }

            C_GooglePlayHelper.IsGooglePlayServicesInstalled(this);

            B_About.Click += (sender, e) => StartActivity(new Intent(this, typeof(A_About)));

            B_FindASite.Click += (sender, e) => StartActivity(new Intent(this, typeof(A_SitesMap)));

            B_BeforeYouGo.Click += (sender, e) => StartActivity(new Intent(this, typeof(A_BeforeYouGo)));

            B_StaffAccess.Click += (object sender, EventArgs e) => 
            {
                // get any stored user's credentials
                string email = Settings.UserEmail;
                string password = Settings.UserPassword;

                if (string.IsNullOrWhiteSpace(email) || (string.IsNullOrWhiteSpace(email)))
                {
                    StartActivity(new Intent(this, typeof(A_Login)));
                    return;
                }

                // we have user credentials, so try to login with those credentials
                PB_Busy.Visibility = Android.Views.ViewStates.Visible;
                EnableUI(false);
                Task.Run(async () =>
                {
                    C_IOResult ior = await Global.PerformLogin(email, password);

                    void p()
                    {
                        PB_Busy.Visibility = Android.Views.ViewStates.Gone;
                        EnableUI(true);

                        // the default destination is the login screen
                        Intent nextIntent = null;
                        if (ior.Success && (ior.User != null))
                        {
                            Global.LoggedInUserId = ior.User.id;
                            Global.ViewCameFrom = E_ViewCameFrom.Main;

                            if (ior.User.HasAdmin)
                                nextIntent = new Intent(this, typeof(A_AdminMenu));
                            else if (ior.User.HasSiteCoordinator)
                                nextIntent = new Intent(this, typeof(A_SCSites));
                            else if (ior.User.HasVolunteer)
                                nextIntent = new Intent(this, typeof(A_VolHome));
                        }
                        else
                            nextIntent = new Intent(this, typeof(A_Login));

                        StartActivity(nextIntent);
                    }
                    RunOnUiThread(p);
                });
            };
        }

        private void EnableUI(bool en)
        {
            B_About.Enabled = en;
            B_FindASite.Enabled = en;
            B_BeforeYouGo.Enabled = en;
            B_StaffAccess.Enabled = en;
		}

		public override void OnBackPressed()
		{
			// don't do anything, on purpose...
		}
	}
}

