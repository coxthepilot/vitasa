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
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_VolHome")]
    public class A_VolHome : Activity
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        CheckBox CB_MobileSiteNotification;
        Button B_AddHours;
        Button B_Suggestion;
        Button B_EditSettings;
        Button B_Logout;
        Button B_MobileCalendar;
        ProgressBar PB_Busy;
        TextView L_Hours;

        C_PersistentSettings Settings;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            Settings = new C_PersistentSettings(this);

            SetContentView(Resource.Layout.VolHome);

            CB_MobileSiteNotification = FindViewById<CheckBox>(Resource.Id.CB_Mobile);
            B_AddHours = FindViewById<Button>(Resource.Id.B_EditHours);
            B_Suggestion = FindViewById<Button>(Resource.Id.B_Suggestion);
            B_EditSettings = FindViewById<Button>(Resource.Id.B_EditSettings);
            B_Logout = FindViewById<Button>(Resource.Id.B_Logout);
            PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);
            L_Hours = FindViewById<TextView>(Resource.Id.L_HoursWorked);
            B_MobileCalendar = FindViewById<Button>(Resource.Id.B_MobileCalendar);
            PB_Busy.Visibility = Android.Views.ViewStates.Invisible;

            C_Common.SetViewColors(this, Resource.Id.V_VolHome);
            B_Logout.SetBackgroundColor(C_Common.Color_LogoutButton);

            bool killChanges = false;
            CB_MobileSiteNotification.CheckedChange += (sender, e) =>
            {
                if (killChanges)
                    return;

                PB_Busy.Visibility = Android.Views.ViewStates.Visible;
                EnableUI(false);

                bool subscribe = CB_MobileSiteNotification.Checked;
                Task.Run(async () =>
                {
                    C_IOResult ior = await Global.SubscribeUserToMobileSites(LoggedInUser, LoggedInUser.Token, subscribe);

                    void p()
                    {
                        PB_Busy.Visibility = Android.Views.ViewStates.Invisible;
                        EnableUI(true);

                        if (!ior.Success)
                        {
                            C_MessageBox mbox = new C_MessageBox(this,
                                 "Error",
                                 "Unable to subscribe (or unsubscribe) to mobile site notifications.",
                                 E_MessageBoxButtons.Ok);
                            mbox.Show();
                        }
                    }
                    RunOnUiThread(p);
                });
            };

            Global.ViewCameFrom = E_ViewCameFrom.VolOptions;
            B_AddHours.Click += (object sender, EventArgs e) => 
                StartActivity(new Intent(this, typeof(A_VolHoursWorked)));

            B_Suggestion.Click += (object sender, EventArgs e) => 
                StartActivity(new Intent(this, typeof(A_Suggestion)));

            B_EditSettings.Click += (object sender, EventArgs e) => 
                StartActivity(new Intent(this, typeof(A_VolEditSettings)));

            B_MobileCalendar.Click += (object sender, EventArgs e) => 
                StartActivity(new Intent(this, typeof(A_AdminMobile)));

            B_Logout.Click += (object sender, EventArgs e) => 
            {
                Global.LoggedInUserId = -1;

                Settings.UserEmail = "";
                Settings.UserPassword = "";
                Settings.Save();

                StartActivity(new Intent(this, typeof(MainActivity)));
            };

            EnableUI(true);

            float hours = 0.0f;
            foreach (C_WorkLogItem wi in LoggedInUser.WorkItems)
                hours += wi.Hours;
            L_Hours.Text = "Hours worked: " + hours.ToString();

            killChanges = true;
            CB_MobileSiteNotification.Checked = LoggedInUser.SubscribeMobile;
            killChanges = false;
            CB_MobileSiteNotification.Visibility = LoggedInUser.HasMobile ? ViewStates.Visible : ViewStates.Invisible;
            B_MobileCalendar.Visibility = LoggedInUser.HasMobile ? ViewStates.Visible : ViewStates.Invisible;
        }

        bool UIIsEnabled;
        private void EnableUI(bool en)
        {
            UIIsEnabled = en;
            CB_MobileSiteNotification.Enabled = en;
            B_AddHours.Enabled = en;
            B_Logout.Enabled = en;
            B_Suggestion.Enabled = en;
            B_EditSettings.Enabled = en;
        }

        public override void OnBackPressed()
        {
            if (UIIsEnabled)
                StartActivity(new Intent(this, typeof(MainActivity)));
        }
    }
}
