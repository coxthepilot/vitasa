using System;
using System.Threading.Tasks;
using UIKit;
using System.Collections.Generic;
using System.Linq;
using Foundation;
using System.IO;
using static zsquared.C_MessageBox;
using Xamarin.Forms;
using System.Json;
using EventKit;
using EventKitUI;

using zsquared;

namespace vitavol
{
    public partial class ViewController : UIViewController
    {
		public EKEventStore EventStore;

		protected ViewController(IntPtr handle) : base(handle)
        {
            // place no init logic here
        }

		public override void DidReceiveMemoryWarning()
		{
			base.DidReceiveMemoryWarning();
		}

		public static readonly string N_KnownEventsJson = "knowneventsjson";

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            C_Global Global = myAppDelegate.Global;
            EventStore = myAppDelegate.EventStore;

            View.BackgroundColor = C_Common.StandardBackground;

            B_About.TouchUpInside += (sender, e) =>
            {
                PerformSegue("Segue_LoginToAbout", this);
            };

            // keep track of the length of text in the email box, allow login when email and password are long enought
            TB_Email.AddTarget((sender, e) =>
            {
                B_Login.Enabled = (TB_Email.Text.Length > 6) && (TB_Password.Text.Length > 6);

            }, UIControlEvent.EditingChanged);

            // keep track of the length of text in the passwrd box, allow login when email and password are long enought
            TB_Password.AddTarget((sender, e) =>
            {
                B_Login.Enabled = (TB_Email.Text.Length > 6) && (TB_Password.Text.Length > 6);

            }, UIControlEvent.EditingChanged);

            // if the user asks to register, take then to the registration page
            B_Register.TouchUpInside += (sender, e) =>
            {
                PerformSegue("Segue_LoginToRegister", this);
            };

            // Login is requested; we can only get this when the email and password are long enough
            B_Login.TouchUpInside += async (sender, e) =>
            {
				string email = TB_Email.Text;
                string pw = TB_Password.Text;

                // Disable the UI since this is a long running process
                EnableUI(false);
                AI_Spinner.StartAnimating();

                try
                {
                    // do the actual login API call
                    C_VitaUser user = await C_Vita.PerformLogin(email, pw);
                    // if bad name or pass, we get null; otherwise we get a C_VitaUser
                    if (user == null)
                    {
                        E_MessageBoxResults mbres = await MessageBox(this,
                                                                     "Error",
                                                                     "Login failed. Bad email or password",
                                                                     E_MessageBoxButtons.Ok);
                        AI_Spinner.StopAnimating();
                        EnableUI(true);
                        return;
                    }

                    // get the list of all sites. We need this list to find out which sites the user might be a site coordinator in.
                    // todo: can Chris include this with User
                    // todo: lots of places downstream use this for slug to site name translation
                    bool getSitesSuccess = await Global.GetAllSites();
                    if (!getSitesSuccess)
                    {
                        E_MessageBoxResults mbres = await MessageBox(this,
                                                                     "Error",
                                                                     "Unable to access Sites list",
                                                                     E_MessageBoxButtons.Ok);
                        AI_Spinner.StopAnimating();
                        EnableUI(true);
                        return;
                    }

                    AI_Spinner.StopAnimating();
                    EnableUI(true);
                    Global.LoggedInUser = user;

                    NSUserDefaults.StandardUserDefaults.SetString(TB_Email.Text, "email");
                    NSUserDefaults.StandardUserDefaults.SetString(TB_Password.Text, "password");

                    if (user.HasSiteCoordinator)
                    {
                        // get the sites for which this site coordinator is responsible (as primary or backup)
                        // if only one, then SCSite; if more than one then SCSites
                        var sou = Global.AllSites.Where(s => (s.PrimaryCoordinator == Global.LoggedInUser.id)
                                                          || (s.BackupCoordinator == Global.LoggedInUser.id));
                        List<C_VitaSite> SCSites = sou.ToList();

                        if (SCSites.Count == 0)
                        {
                            // a site coordinator with no sites; treat them as a site coordinator with no sites
                            E_MessageBoxResults mbres = await MessageBox(this,
                                "No Sites",
                                "Site Coordinator but no Sites assigned.",
                                E_MessageBoxButtons.Ok);

                            Global.SelectedSite = null;
                            Global.SCSites = SCSites;
                            Global.DetailsCameFrom = E_CameFrom.Login;
                            PerformSegue("Segue_LoginToSCSites", this);
                        }
                        else if (SCSites.Count == 1)
                        {
                            Global.SelectedSite = SCSites[0];
                            Global.SCSites = SCSites;
                            Global.DetailsCameFrom = E_CameFrom.Login;
                            PerformSegue("Segue_LoginToSCSite", this);
                        }
                        else
                        {
                            Global.SelectedSite = null;
                            Global.SCSites = SCSites;
                            Global.DetailsCameFrom = E_CameFrom.Login;
                            PerformSegue("Segue_LoginToSCSites", this);
                        }
                    }
                    else if (user.HasVolunteer)
                    {
                        PerformSegue("Segue_LoginToSignUps", this);
                    }
                    else if (user.HasNewUser)
                    {
                        E_MessageBoxResults mbres = await MessageBox(this,
                                           "Not Authorized",
                                           "Staff has not yet acted on your registration.",
                                           E_MessageBoxButtons.Ok);
                    }
                    else
                    {
                        E_MessageBoxResults mbres = await MessageBox(this,
                                         "Error",
                                         "Authorization failure. Expecting Volunteer or Site Coordinator",
                                         E_MessageBoxButtons.Ok);
                    }
                }
                catch
                {
                    ShowMessageOnUIThreadAndEnableUI("Error", "Error attempting login.", true);
                }

            }; // end of B_Login lambda

            // set the defaults from the settings
            TB_Email.Text = NSUserDefaults.StandardUserDefaults.StringForKey("email");
            TB_Password.Text = NSUserDefaults.StandardUserDefaults.StringForKey("password");
            B_Login.Enabled = (TB_Email.Text.Length > 6) && (TB_Password.Text.Length > 6);

            I_BackgroundImage.Image = UIImage.FromBundle("Background.jpg");
        }

		private void ShowMessageOnUIThreadAndEnableUI(string title, string message, bool en)
        {
			UIApplication.SharedApplication.InvokeOnMainThread(
			new Action(() =>
			{
                MessageBox(this, title, message, E_MessageBoxButtons.Ok);
                EnableUI(en);
			}));
		}

        private void EnableUI(bool enable)
        {
            TB_Email.Enabled = enable;
            TB_Password.Enabled = enable;
			B_Login.Enabled = enable && (TB_Email.Text.Length > 6) && (TB_Password.Text.Length > 6);
			B_Register.Enabled = enable;
            B_About.Enabled = enable;
        }
    }
}
