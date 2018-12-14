using Foundation;
using Xamarin.Forms;
using System;
using UIKit;
using System.IO;
using MessageUI;

using zsquared;

namespace vitavol
{
    public partial class VC_About : UIViewController
    {
		C_Global Global;
		
        public VC_About (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;
			B_Back.TouchUpInside += (sender, e) =>
			{
                if (Global.ViewCameFrom == E_ViewCameFrom.Main)
				    PerformSegue("Segue_AboutToMain", this);
                else if (Global.ViewCameFrom == E_ViewCameFrom.Login)
                    PerformSegue("Segue_AboutToLogin", this);
			};
		}

        public override void ViewDidAppear(bool animated)
        {
            C_Common.SetUIColors(View);

            WV_About.Delegate = new C_WebViewDelegateAbout(this);
            string fileName = "about.htm"; // remember case-sensitive
            string localHtmlUrl = Path.Combine(NSBundle.MainBundle.BundlePath, fileName);
            WV_About.LoadRequest(new NSUrlRequest(new NSUrl(localHtmlUrl, false)));

            var verString = NSBundle.MainBundle.InfoDictionary["CFBundleShortVersionString"];
            L_Version.Text = verString.ToString();

            B_BytesReceived.Text = Global.BytesReceived.ToString("N0");
        }
    }

    public class C_WebViewDelegateAbout : UIWebViewDelegate
    {
        UIViewController viewController;

        public C_WebViewDelegateAbout(UIViewController vc)
        {
            viewController = vc;
        }

        public override bool ShouldStartLoad(UIWebView webView, NSUrlRequest request, UIWebViewNavigationType navigationType)
        {
            if (navigationType == UIWebViewNavigationType.LinkClicked)
            {
                if ((request.Url.Scheme == "http") || (request.Url.Scheme == "https"))
                {
                    UIApplicationOpenUrlOptions u = new UIApplicationOpenUrlOptions
                    {
                        OpenInPlace = false,
                        SourceApplication = "VITA SA"
                    };
                    UIApplication.SharedApplication.OpenUrl(request.Url, u, null);

                    return false;
                }
                else if (request.Url.Scheme == "mailto")
                {
                    if (MFMailComposeViewController.CanSendMail)
                    {
                        string toAddress = request.Url.AbsoluteString.Replace("mailto:", "");

                        MFMailComposeViewController mailController = new MFMailComposeViewController();
                        mailController.SetToRecipients(new string[] { toAddress });
                        mailController.SetSubject("For VITA App Team");
                        mailController.SetMessageBody("<message goes here>", false);

                        mailController.Finished += (object s, MFComposeResultEventArgs args) => {
                            Console.WriteLine(args.Result.ToString());
                            args.Controller.DismissViewController(true, null);
                        };

                        viewController.PresentViewController(mailController, true, null);
                    }

                    return false;
                }
            }

            return true;
        }
    }
}