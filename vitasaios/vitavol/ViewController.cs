using System;
using System.Threading.Tasks;
using UIKit;
using Foundation;
using static zsquared.C_MessageBox;
using EventKit;

using zsquared;

namespace vitavol
{
    public partial class ViewController : UIViewController
    {
		protected ViewController(IntPtr handle) : base(handle)
        {
        }

		public override void DidReceiveMemoryWarning()
		{
			base.DidReceiveMemoryWarning();
		}

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            long bytes = 0; // save the amount of data transfered across logins
            if (myAppDelegate.Global != null)
                bytes = myAppDelegate.Global.BytesReceived;
            myAppDelegate.Global = new C_Global();
            C_Global Global = myAppDelegate.Global;
            Global.BytesReceived = bytes;

            View.BackgroundColor = C_Common.StandardBackground;

            B_About.TouchUpInside += (sender, e) =>
            {
                Global.ViewCameFrom = E_ViewCameFrom.Main;
                PerformSegue("Segue_MainToAbout", this);
            };

            B_StaffLogin.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_MainToLogin", this);
            };

            B_FindASiteNearYou.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_MainToClientSitesMap", this);
            };

            B_BeforeYouGo.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_MainToClientBeforeYouGo", this);
            };

            I_BackgroundImage.Image = UIImage.FromBundle("Background.jpg");
        }
    }
}
