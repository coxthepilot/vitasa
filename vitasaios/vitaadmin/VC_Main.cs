using Foundation;
using System;
using UIKit;

using zsquared;

namespace vitaadmin
{
    public partial class VC_Main : UIViewController
    {
		C_Global Global;

		public VC_Main (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;
			
            B_Back.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_MainToLogin", this);
            };

            B_Messages.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_MainToMessages", this);
            };

            B_Suggestions.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_MainToSuggestions", this);
            };

            B_WorkItems.TouchUpInside += (sender, e) => 
            {
                Global.SelectedUser = null;
                Global.SelectedSiteSlug = null;
                Global.ViewCameFrom = E_ViewCameFrom.Main;
                PerformSegue("Segue_MainToWorkItems", this);
            };

            B_Sites.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_MainToSites", this);
            };

            B_Notifications.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_MainToNotifications", this);
            };

            B_Users.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_MainToUsers", this);
            };
        }
    }
}