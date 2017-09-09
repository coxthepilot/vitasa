using System;
using System.Threading.Tasks;
using UIKit;
using System.Collections.Generic;
using System.Linq;
using Foundation;
using System.IO;
using static zsquared.Tools;
using Xamarin.Forms;
using System.Json;

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

		public static readonly string N_KnownEventsJson = "knowneventsjson";

		public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			//myAppDelegate.Global = new C_Global(); // only do this when the app starts up the first time
            C_Global Global = myAppDelegate.Global;

            if (Global == null)
                throw new ApplicationException("hoping it would get set in app delegate");

			// only needed once when the app starts
			C_Vita.SetupCertificateHandling();

            B_CellView.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_LoginToCellView", this);
            };

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

            B_Login.TouchUpInside += async (sender, e) => 
            {
				string email = TB_Email.Text;
				string pw = TB_Password.Text;

				if ((TB_Email.Text.Length == 0) || (TB_Password.Text.Length == 0))
					return;

                EnableUI(false);
                AI_Spinner.StartAnimating();

                try
                {
                    C_VitaUser user = await C_Vita.PerformLogin(email, pw);

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

                    // testing
                    List<C_WorkItem> wlist = await C_WorkItem.GetWorkItemsForUser(user.Token, user.id);
                    //wlist.Sort(C_WorkItem.CompareByDateAscending);
                    C_YMD dateToLookFor = C_YMD.Now;
                    dateToLookFor = dateToLookFor.AddDays(1); // tomorrow
                    List<C_WorkItem> workItemsForDate = C_WorkItem.GetWorkItemsForDate(dateToLookFor, wlist);

                    Console.WriteLine(workItemsForDate.Count.ToString());
                    // end of testing

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
                        E_MessageBoxResults mbres = await MessageBox(this, 
                                           "Not Authorized", 
                                           "Staff has not yet acted on your registration.",
                                         Tools.E_MessageBoxButtons.Ok);
					}
					else
                    {
                        E_MessageBoxResults mbres = await MessageBox(this, 
                                         "Error", 
                                         "Authorization failure. Expecting Volunteer or Site Coordinator",
                                         Tools.E_MessageBoxButtons.Ok);
					}
				}
                catch (Exception e4)
				{
                    ShowMessageOnUIThreadAndEnableUI("Error", "Error attempting login.", true);
                    Console.WriteLine(e4.Message);
				}
			}; // end of B_Login lambda

            TB_Email.Text = NSUserDefaults.StandardUserDefaults.StringForKey("email");
			TB_Password.Text = NSUserDefaults.StandardUserDefaults.StringForKey("password");
			B_Login.Enabled = (TB_Email.Text.Length > 6) && (TB_Password.Text.Length > 6);

			I_BackgroundImage.Image = UIImage.FromBundle("Background.jpg");

            L_Fetch.Text = Global.LastFecthRunTime.ToString("O");
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
