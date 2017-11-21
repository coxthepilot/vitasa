using Foundation;
using Xamarin.Forms;
using System;
using UIKit;
using System.IO;

using zsquared;

namespace vitavol
{
    public partial class VC_About : UIViewController
    {
        public VC_About (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			// set the standard background color
            View.BackgroundColor = C_Common.StandardBackground;

			string fileName = "about.htm"; // remember case-sensitive
			string localHtmlUrl = Path.Combine(NSBundle.MainBundle.BundlePath, fileName);
            WV_About.LoadRequest(new NSUrlRequest(new NSUrl(localHtmlUrl, false)));

			B_Back.TouchUpInside += (sender, e) =>
			{
				PerformSegue("Segue_AboutToLogin", this);
			};

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            C_Global Global = myAppDelegate.Global;

			I_Global iad = myAppDelegate as I_Global;
            long br = iad.GetBytesReceived();

			var verString = NSBundle.MainBundle.InfoDictionary["CFBundleShortVersionString"];
            L_Version.Text = verString.ToString();

			B_BytesReceived.Text = br.ToString("N0");
		}
    }

    public class C_WebViewDelegateAbout : UIWebViewDelegate
    {
        ViewController viewController;

        public C_WebViewDelegateAbout(ViewController vc)
        {
            viewController = vc;
        }

        public override bool ShouldStartLoad(UIWebView webView, NSUrlRequest request, UIWebViewNavigationType navigationType)
        {
            if (navigationType == UIWebViewNavigationType.LinkClicked)
                // launch safari
                UIApplication.SharedApplication.OpenUrl(request.Url);

            return true;
        }
    }
}