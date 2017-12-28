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
                PerformSegue("Segue_LoginToAbout", this);
            };

            // keep track of the length of text in the email box, allow login when email and password are long enough
            TB_Email.AddTarget((sender, e) =>
            {
                B_Login.Enabled = (TB_Email.Text.Length > 6) && (TB_Password.Text.Length > 6);

            }, UIControlEvent.EditingChanged);

            // keep track of the length of text in the password box, allow login when email and password are long enough
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
            B_Login.TouchUpInside += (sender, e) =>
            {
				string email = TB_Email.Text;
                string pw = TB_Password.Text;

                // Disable the UI since this is a long running process
                EnableUI(false);
                AI_Spinner.StartAnimating();

                Task.Run(async () =>
                {
                    // do the actual login API call
                    C_IOResult ior = await Global.PerformLogin(email, pw);
                    //C_VitaUser user = await Global.PerformLogin(email, pw);


					UIApplication.SharedApplication.InvokeOnMainThread(
					new Action(async () =>
					{
                        if (!ior.Success)
                        {
							E_MessageBoxResults mbres = await MessageBox(this,
																		 "Error",
                                                                         ior.ErrorMessage,
																		 E_MessageBoxButtons.Ok);
							AI_Spinner.StopAnimating();
							EnableUI(true);
							return;
						}

                        C_VitaUser user = ior.User;
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

						// do the device registration if present
                        string deviceTokenUpdated = NSUserDefaults.StandardUserDefaults.StringForKey(AppDelegate.N_PushDeviceTokenUpdated);
                        if (deviceTokenUpdated == "true")
                        {
							string deviceToken = NSUserDefaults.StandardUserDefaults.StringForKey(AppDelegate.N_PushDeviceToken);

                            C_IOResult iorx = await Global.RegisterNotificationToken(E_Platform.iOS, deviceToken, user.Token);

                            if (iorx.Success)
    							NSUserDefaults.StandardUserDefaults.SetString("false", AppDelegate.N_PushDeviceTokenUpdated);
						}

						AI_Spinner.StopAnimating();
						EnableUI(true);

						Global.LoggedInUserId = user.id;

						NSUserDefaults.StandardUserDefaults.SetString(TB_Email.Text, "email");
						NSUserDefaults.StandardUserDefaults.SetString(TB_Password.Text, "password");

						if (user.HasSiteCoordinator)
						{
							if (user.SitesCoordinated.Count == 0)
							{
								// a site coordinator with no sites
								E_MessageBoxResults mbres = await MessageBox(this,
									"No Sites",
									"Site Coordinator but no Sites assigned.",
									E_MessageBoxButtons.Ok);

								Global.SelectedSiteSlug = null;
								Global.ViewCameFrom = E_ViewCameFrom.Login;

								PerformSegue("Segue_LoginToSCSites", this);
							}
							else if (user.SitesCoordinated.Count == 1)
							{
								C_SiteCoordinated sc = user.SitesCoordinated[0];

								Global.SelectedSiteSlug = sc.Slug;
								Global.ViewCameFrom = E_ViewCameFrom.Login;
                                Console.WriteLine("[login]: " + Global.SelectedSiteSlug);

								PerformSegue("Segue_LoginToSCSite", this);
							}
							else // manages more than one site
							{
								Global.SelectedSiteSlug = null;
								Global.ViewCameFrom = E_ViewCameFrom.Login;

								PerformSegue("Segue_LoginToSCSites", this);
							}
						}
						else if (user.HasVolunteer)
						{
							PerformSegue("Segue_LoginToVolunteerOptions", this);
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
											 "Authorization failure. Expecting Volunteer, Site Coordinator, or New User",
											 E_MessageBoxButtons.Ok);
						}
					}));
                });
            }; // end of B_Login lambda

            // set the defaults from the settings
            TB_Email.Text = NSUserDefaults.StandardUserDefaults.StringForKey("email");
            TB_Password.Text = NSUserDefaults.StandardUserDefaults.StringForKey("password");
            B_Login.Enabled = (TB_Email.Text.Length > 6) && (TB_Password.Text.Length > 6);

            I_BackgroundImage.Image = UIImage.FromBundle("Background.jpg");
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
