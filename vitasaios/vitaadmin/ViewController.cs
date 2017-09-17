using System;
using System.Threading.Tasks;
using System.Linq;
using System.Collections.Generic;

using UIKit;

using Foundation;

using zsquared;
using static zsquared.C_MessageBox;

namespace vitaadmin
{
    public partial class ViewController : UIViewController
    {
        C_Global Global;

        protected ViewController(IntPtr handle) : base(handle)
        {
            // Note: this .ctor should not contain any initialization logic.
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();
			// Perform any additional setup after loading the view, typically from a nib.

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

			B_Login.TouchUpInside += async (sender, e) =>
            {
                if ((TB_Email.Text.Length == 0) || (TB_Password.Text.Length == 0))
                    return;

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

					AI_Spinner.StopAnimating();
					EnableUI(true);

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

					Global.LoggedInUser = user;

					NSUserDefaults.StandardUserDefaults.SetString(TB_Email.Text, "email");
					NSUserDefaults.StandardUserDefaults.SetString(TB_Password.Text, "password");

                    PerformSegue("Segue_LoginToMain", this);
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                    ShowMessageOnUIThreadAndEnableUI("Error", "Error attempting login.", true);
                }
            };

			// set the defaults from the settings
			TB_Email.Text = NSUserDefaults.StandardUserDefaults.StringForKey("email");
			TB_Password.Text = NSUserDefaults.StandardUserDefaults.StringForKey("password");
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


		private void EnableUI(bool en)
        {
            TB_Email.Enabled = en;
            TB_Password.Enabled = en;
            B_Login.Enabled = en;
        }

        public override void DidReceiveMemoryWarning()
        {
            base.DidReceiveMemoryWarning();
            // Release any cached data, images, etc that aren't in use.
        }
    }
}
