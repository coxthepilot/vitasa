using Foundation;
using Xamarin.Forms;
using System;
using UIKit;
using System.IO;
using MessageUI;

using zsquared;


namespace vitavol
{
    public partial class VC_ClientBeforeYouGo : UIViewController
    {
        C_Global Global;
        
        public VC_ClientBeforeYouGo (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

            B_Back.TouchUpInside += (sender, e) =>
            {
                PerformSegue("Segue_ClientBeforeYouGoToMain", this);
            };

            WV_BeforeYouGo.Delegate = new C_WebViewDelegateAbout(this);
            string fileName = "beforeyougo.html"; // remember case-sensitive
            string localHtmlUrl = Path.Combine(NSBundle.MainBundle.BundlePath, fileName);
            WV_BeforeYouGo.LoadRequest(new NSUrlRequest(new NSUrl(localHtmlUrl, false)));
        }
    }
}