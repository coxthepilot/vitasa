using Foundation;
using System;
using System.Threading.Tasks;
using UIKit;

using zsquared;
using static zsquared.C_MessageBox;

namespace vitavol
{
    public partial class VC_VolHome : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;
        C_PersistentSettings Settings;

        public VC_VolHome (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
            Settings = new C_PersistentSettings();

            B_Back.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_VolunteerHomeToMain", this);

            SW_Mobile.ValueChanged += (sender, e) => 
            {
                AI_Busy.StartAnimating();
                EnableUI(false);
                bool subscribe = SW_Mobile.On;
                Task.Run(async () =>
                {
                    C_IOResult ior = await Global.SubscribeUserToMobileSites(LoggedInUser, LoggedInUser.Token, subscribe);

                    async void p()
                    {
                        if (!ior.Success)
                        {
                            E_MessageBoxResults mbres = await MessageBox(this,
                                 "Error",
                                 "Unable to subscribe (or unsubscribe) to mobile site notifications.",
                                 E_MessageBoxButtons.Ok);
                        }

                        AI_Busy.StopAnimating();
                        EnableUI(true);
                    }
                    UIApplication.SharedApplication.InvokeOnMainThread(p);
                });
            };

            Global.ViewCameFrom = E_ViewCameFrom.VolOptions;
            B_ViewOrAddWorkItems.TouchUpInside += (sender, e) => 
                PerformSegue("Segue_VolHomeToVolHours", this);

            B_PostSuggestion.TouchUpInside += (sender, e) => 
                PerformSegue("Segue_VolHomeToSuggestion", this);

            B_EditSettings.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_VolHomeToVolEditSettings", this);

            B_Mobile.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_VolHomeToVolMobileCalendar", this);

            B_Logout.TouchUpInside += (sender, e) => 
            {
                Global.LoggedInUserId = -1;

                Settings.UserEmail = "";
                Settings.UserPassword = "";

                PerformSegue("Segue_VolunteerHomeToMain", this);
            };
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);
            TB_Hours.TextColor = UIColor.White;

            float hours = 0.0f;
            foreach (C_WorkLogItem wi in LoggedInUser.WorkItems)
                hours += wi.Hours;
            TB_Hours.Text = hours.ToString();

            SW_Mobile.On = LoggedInUser.SubscribeMobile;

            SW_Mobile.Hidden = !LoggedInUser.HasMobile;
            L_Mobile.Hidden = !LoggedInUser.HasMobile;
            B_Mobile.Hidden = !LoggedInUser.HasMobile;
        }

        private void EnableUI(bool en) =>
            C_Common.EnableUI(View, en);
    }
}