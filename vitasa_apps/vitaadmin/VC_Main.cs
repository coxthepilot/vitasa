using Foundation;
using System;
using System.Collections.Generic;
using UIKit;
using MessageUI;

using zsquared;

namespace vitaadmin
{
    public partial class VC_Main : UIViewController
    {
		C_Global Global;
        C_VitaUser LoggedInUser;

		public VC_Main (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
			
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

            B_CheckSignUps.TouchUpInside += (sender, e) =>
            {
                PerformSegue("Segue_MainToCheckSignUps", this);
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

            B_OpenSites.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_MainToOpenSites", this);
            };

            B_Notifications.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_MainToNotifications", this);
            };

            B_Users.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_MainToUsers", this);
            };

            B_Config.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_MainToConfig", this);
            };

            B_EmailToUsers.TouchUpInside += async (sender, e) => 
            {
                if (MFMailComposeViewController.CanSendMail)
                {
                    // build a list of all users
                    List<C_VitaUser> Users = await Global.FetchAllUsers(LoggedInUser.Token);
                    // compile a list of unique email addresses
                    List<string> emailAddresses = new List<string>();
                    foreach(C_VitaUser u in Users)
                    {
                        if (!emailAddresses.Contains(u.Email))
                            emailAddresses.Add(u.Email);
                    }

                    MFMailComposeViewController mailController = new MFMailComposeViewController();
                    mailController.SetToRecipients(emailAddresses.ToArray());
                    mailController.SetSubject("For VITA App Team");
                    mailController.SetMessageBody("<message goes here>", false);

                    mailController.Finished += (object s, MFComposeResultEventArgs args) => {
                        Console.WriteLine(args.Result.ToString());
                        args.Controller.DismissViewController(true, null);
                    };

                    PresentViewController(mailController, true, null);
                }
            };

            B_Stats.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_MainToStats", this);
            };
        }
    }
}