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
        string LoginToken;
        C_Global passAroundContainer;

        protected ViewController(IntPtr handle) : base(handle)
        {
            // Note: this .ctor should not contain any initialization logic.
        }

		public override void DidReceiveMemoryWarning()
		{
			base.DidReceiveMemoryWarning();
			// Release any cached data, images, etc that aren't in use.
		}

		public override void ViewDidLoad()
        {
            base.ViewDidLoad();
            // Perform any additional setup after loading the view, typically from a nib.

            // -------- for testing, we pre-load the globals from a json file ----------
            string initjs = File.ReadAllText("GlobalInitForTesting.js");
            passAroundContainer = new C_Global(initjs);
            passAroundContainer.TimeStampWhenSitesLoaded = DateTime.Now;
            // ------- end of testing init -------------

			//passAroundContainer = new C_Global(); // <---- this is the normal method
			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			myAppDelegate.PassAroundContainer = passAroundContainer;

			TB_Email.Text = NSUserDefaults.StandardUserDefaults.StringForKey("email");
			TB_Password.Text = NSUserDefaults.StandardUserDefaults.StringForKey("password");
			B_Login.Enabled = (TB_Email.Text.Length > 7) && (TB_Password.Text.Length > 6);

			I_BackgroundImage.Image = UIImage.FromBundle("Background.jpg");

			TB_Email.AddTarget((sender, e) =>
			{
				B_Login.Enabled = (TB_Email.Text.Length > 7) && (TB_Password.Text.Length > 6);

			}, UIControlEvent.EditingChanged);

			TB_Password.AddTarget((sender, e) =>
			{
				B_Login.Enabled = (TB_Email.Text.Length > 7) && (TB_Password.Text.Length > 6);

			}, UIControlEvent.EditingChanged);

            B_Login.TouchUpInside += (sender, e) => 
            {
				string email = TB_Email.Text;
				string pw = TB_Password.Text;

				if ((TB_Email.Text.Length == 0) || (TB_Password.Text.Length == 0))
					return;

				B_Login.Enabled = false;

                // testing only --------------------
                var ou = passAroundContainer.Users.Where(u => u.email == TB_Email.Text);
                if (ou.Count() != 0)
                {
					// our name was found in the list
                    NSUserDefaults.StandardUserDefaults.SetString(TB_Email.Text, "email");
	                NSUserDefaults.StandardUserDefaults.SetString(TB_Password.Text, "password");

                    passAroundContainer.LoggedInUser = (C_VitaUser)(ou.First());

	                PerformSegue("Segue_LoginToMap", this);
				}
                else
                {
                    Tools.MessageBoxOK("error", "email not valid");
                }
                // end of testing --------------------

				//Task.Run(async () =>
				//{
				//	try
				//	{
				//		string token = await C_Vita.PerformLogin(email, pw);

				//		if (token != null)
				//		{
				//			LoginToken = token;

				//			// get user record for this user
				//			List<C_VitaUser> usersList = await C_VitaUser.FetchUsersList(LoginToken);
				//			passAroundContainer.Users = usersList;

				//			if (usersList != null)
				//			{
				//				C_VitaUser ourUser = null;
				//				var ou = usersList.Where(user => user.email == email);
				//				if (ou.Count() != 0)
				//					ourUser = ou.First();

    //                            if ((ourUser != null) && ((ourUser.HasSiteCoordinator) || (ourUser.HasAdmin)))
				//				{
				//					UIApplication.SharedApplication.InvokeOnMainThread(
				//					new Action(() =>
				//					{
				//						passAroundContainer.LoginToken = LoginToken;

				//						NSUserDefaults.StandardUserDefaults.SetString(TB_Email.Text, "email");
				//						NSUserDefaults.StandardUserDefaults.SetString(TB_Password.Text, "password");

				//						PerformSegue("Segue_LoginToMap", this);
				//					}));
				//				}
				//				else
				//				{
				//					Tools.MessageBox("Error", "Not a User or does not have Admin priviledge");
    //                                B_Login.Enabled = true;
				//				}
				//			}
				//			else
				//			{
				//				Tools.MessageBox("Error", "Unable to get users. Probably do not have Admin priviledges.");
				//				B_Login.Enabled = true;
				//			}
				//		}
				//		else
				//		{
				//			UIApplication.SharedApplication.InvokeOnMainThread(
				//			new Action(() =>
				//			{
				//				Tools.MessageBox("Error", "Authorization failure.");
				//				B_Login.Enabled = true;
				//			}));
				//		}
				//	}
				//	catch (Exception e1)
				//	{
				//		Console.WriteLine(e1.Message);
				//		B_Login.Enabled = true;
				//	}
				//});
			};
        }
    }
}
