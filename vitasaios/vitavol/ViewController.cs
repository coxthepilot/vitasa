using System;
using System.Threading.Tasks;
using UIKit;
using System.Collections.Generic;
using System.Linq;
using Foundation;
using System.IO;

using zsquared;

namespace vitavol
{
    public partial class ViewController : UIViewController
    {
        protected ViewController(IntPtr handle) : base(handle)
        {
            // place no init logic here
        }

		public override void DidReceiveMemoryWarning()
		{
			base.DidReceiveMemoryWarning();
		}

		public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			myAppDelegate.Global = new C_Global();
            C_Global Global = myAppDelegate.Global;

            B_About.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_LoginToAbout", this);
            };

			TB_Email.AddTarget((sender, e) =>
			{
				B_Login.Enabled = (TB_Email.Text.Length > 6) && (TB_Password.Text.Length > 6);

			}, UIControlEvent.EditingChanged);

			TB_Password.AddTarget((sender, e) =>
			{
				B_Login.Enabled = (TB_Email.Text.Length > 6) && (TB_Password.Text.Length > 6);

			}, UIControlEvent.EditingChanged);

            B_Register.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_LoginToRegister", this);
            };

            B_Login.TouchUpInside += (sender, e) => 
            {
				string email = TB_Email.Text;
				string pw = TB_Password.Text;

				if ((TB_Email.Text.Length == 0) || (TB_Password.Text.Length == 0))
					return;

				B_Login.Enabled = false;

				Task.Run(async () =>
				{
                    try
                    {
                        C_VitaUser user = await C_Vita.PerformLogin(email, pw);

						if (user != null)
						{
                            // get the all sites details
                            Global.AllSites = C_VitaSite.FetchSitesList();
                            
							UIApplication.SharedApplication.InvokeOnMainThread(
							new Action(() =>
							{
                                Global.LoggedInUser = user;

								NSUserDefaults.StandardUserDefaults.SetString(TB_Email.Text, "email");
								NSUserDefaults.StandardUserDefaults.SetString(TB_Password.Text, "password");

                                if (user.HasSiteCoordinator)
                                {
                                    // get the sites for which this site coordinator is responsible
                                    // if only one, then SCSite; if more than one then SCSites
                                    List<C_VitaSite> SCSites = new List<C_VitaSite>();
                                    foreach(C_VitaSite s in Global.AllSites)
                                    {
                                        if (Global.LoggedInUser.id == s.PrimaryCoordinator)
                                            SCSites.Add(s);
                                    }
                                    if (SCSites.Count == 0)
                                    {
										// a site coordinator with no sites; treat them as a normal volunteer (?)
                                		PerformSegue("Segue_LoginToSignUps", this);
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
									Tools.MessageBox(this, 
                                                       "Not Authorized", 
                                                       "Staff has not yet acted on your registration.",
                                                     Tools.E_MessageBoxButtons.Ok);
									B_Login.Enabled = true;
								}
								else
                                {
									Tools.MessageBox(this, 
                                                     "Error", 
                                                     "Authorization failure. Expecting Volunteer or Site Coordinator",
                                                     Tools.E_MessageBoxButtons.Ok);
									B_Login.Enabled = true;
								}
							}));
						}
						else
						{
							UIApplication.SharedApplication.InvokeOnMainThread(
							new Action(() =>
							{
								Tools.MessageBox(this,
                                                 "Error", 
                                                 "Authorization failure. Bad email or password.",
                                                 Tools.E_MessageBoxButtons.Ok);
								B_Login.Enabled = true;
							}));
						}
					}
                    catch (Exception e4)
					{
						UIApplication.SharedApplication.InvokeOnMainThread(
						new Action(() =>
						{
                            Tools.MessageBox(this, 
                                             "Error", 
                                             "Error attempting login",
                                             Tools.E_MessageBoxButtons.Ok);
                            Console.WriteLine(e4.Message);
							B_Login.Enabled = true;
						}));
					}
				}); // end of Task.Run
			}; // end of B_Login lambda

            TB_Email.Text = NSUserDefaults.StandardUserDefaults.StringForKey("email");
			TB_Password.Text = NSUserDefaults.StandardUserDefaults.StringForKey("password");
			B_Login.Enabled = (TB_Email.Text.Length > 6) && (TB_Password.Text.Length > 6);

			I_BackgroundImage.Image = UIImage.FromBundle("Background.jpg");
		}
    }
}
