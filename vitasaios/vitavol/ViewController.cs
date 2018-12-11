using System;
using System.Threading.Tasks;
using UIKit;
using Foundation;
using static zsquared.C_MessageBox;
using EventKit;
using System.Collections.Generic;

using System.Reflection;
using System.IO;

using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;


using zsquared;

namespace vitavol
{
    public partial class ViewController : UIViewController
    {
        C_Global Global;

        C_PersistentSettings Settings;

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
            Global = myAppDelegate.Global;
            if (Global == null)
            {
                myAppDelegate.Global = new C_Global();
                Global = myAppDelegate.Global;
            }

            //Task.Run(async () => 
            //{

            //    try
            //    {
            //        WebClient wc = new WebClient()
            //        {
            //            BaseAddress = "https://bexarmg.org/"
            //        };
            //        wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
            //        wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

            //        string response = await wc.DownloadStringTaskAsync("index.html");

            //        int x = response.Length;
            //    }
            //    catch (Exception ex)
            //    {
            //        Console.WriteLine(ex.Message);
            //    }
            //});



            //// the following installs the test data and tells Global to use it rather than the api's
            //if (!Global.UsingTestData)
            //{
            //    try
            //    {
            //        Assembly assembly = typeof(VC_SitesMap).Assembly;

            //        //string[] rnames = assembly.GetManifestResourceNames();
            //        using (Stream stream_s = assembly.GetManifestResourceStream("vitavol.testdata_sites.json"))
            //        {
            //            using (StreamReader sr_s = new StreamReader(stream_s))
            //            {
            //                using (Stream stream_u = assembly.GetManifestResourceStream("vitavol.testdata_users.json"))
            //                {
            //                    using (StreamReader sr_u = new StreamReader(stream_u))
            //                    {
            //                        string sitesjson = sr_s.ReadToEnd();

            //                        string usersjson = sr_u.ReadToEnd();

            //                        Global.UseTestData(sitesjson, usersjson);

            //                        C_Suggestion sug = new C_Suggestion(-1, C_YMD.Now, true)
            //                        {
            //                            Subject = "123 subject",
            //                            Text = "new message\nand more"
            //                        };
            //                        Global._SuggestionCache.Add(sug);

            //                        C_Notification not = new C_Notification
            //                        {
            //                            Audience = E_NotificationAudience.Volunteers,
            //                            CreatedDT = DateTime.Now,
            //                            Message = "the notification text",
            //                            SentDT = DateTime.MinValue,
            //                            id = 1
            //                        };
            //                        Global._NotificationCache.Add(not);
            //                    }
            //                }
            //            }
            //        }
            //    }
            //    catch (Exception ex)
            //    {
            //        Console.WriteLine(ex.Message);
            //    }
            //}

            // on a new instance, reset a few of the values
            Settings = new C_PersistentSettings
            {
                // must not use the short form of the initializer
                Zoom = 10.0f,
                Latitude = 29.415411f,
                Longitude = -98.4918232f
            };

            B_About.TouchUpInside += (sender, e) =>
            {
                Global.ViewCameFrom = E_ViewCameFrom.Main;
                PerformSegue("Segue_MainToAbout", this);
            };

            B_FindASiteNearYou.TouchUpInside += (sender, e) =>
            {
                PerformSegue("Segue_MainToSitesMap", this);
            };

            B_BeforeYouGo.TouchUpInside += (sender, e) =>
            {
                PerformSegue("Segue_MainToClientBeforeYouGo", this);
            };

            B_StaffLogin.TouchUpInside += (sender, e) => 
            {
                // there are no credentials, then just go to the login screen
                if (string.IsNullOrWhiteSpace(Settings.UserEmail) || string.IsNullOrWhiteSpace(Settings.UserPassword))
                {
                    PerformSegue("Segue_MainToLogin", this);
                    return;
                }

                // we have user credentials, so try to login with those credentials
                AI_Busy.StartAnimating();
                EnableUI(false);

                Task.Run(async () => 
                {
                    C_IOResult ior = await Global.PerformLogin(Settings.UserEmail, Settings.UserPassword);

                    // the default destination is the login screen
                    string segueDestination = "Segue_MainToLogin";
                    string storyBoard = null;
                    string vc_name = null;
                    if (ior.Success && (ior.User != null))
                    {
                        Global.LoggedInUserId = ior.User.id;

                        Settings.ClearPreferedSites();
                        foreach (string ps in ior.User.PreferredSiteSlugs)
                            Settings.AddPreferedSite(ps);

                        Global.ViewCameFrom = E_ViewCameFrom.Main;
                        if (ior.User.HasAdmin)
                        {
                            segueDestination = null;
                            storyBoard = "Admin";
                            vc_name = "AdminMenu";
                        }
                        else if (ior.User.HasSiteCoordinator)
                            segueDestination = "Segue_MainToSCSites";
                        else if (ior.User.HasVolunteer)
                            segueDestination = "Segue_MainToVolunteerHome";

                        if (Settings.NotificationTokenUpdated)
                        {
                            string deviceToken = Settings.NotificationToken;

                            C_IOResult iorx = await Global.RegisterNotificationToken(E_Platform.iOS, deviceToken, ior.User.Token);

                            if (iorx.Success)
                                Settings.NotificationTokenUpdated = false;
                        }
                    }

                    UIApplication.SharedApplication.InvokeOnMainThread(
                    new Action(() =>
                    {
                        AI_Busy.StopAnimating();
                        EnableUI(true);

                        if (segueDestination != null)
                            PerformSegue(segueDestination, this);
                        else
                        {
                            UIStoryboard adminStoryBoard = UIStoryboard.FromName(storyBoard, null);
                            UIViewController vc_adminmenu = adminStoryBoard.InstantiateViewController(vc_name);
                            PresentViewController(vc_adminmenu, false, null);
                        }
                    }));
                });
            };
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            I_BackgroundImage.Image = UIImage.FromBundle("newbackground");

            C_Common.SetUIColors(View);
        }

        private void EnableUI(bool en) =>
            C_Common.EnableUI(View, en);
    }
}
