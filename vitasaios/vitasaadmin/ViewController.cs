using System;
using System.Threading.Tasks;
using System.Json;
using UIKit;
using System.Collections.Generic;
using System.Linq;
using Foundation;

using zsquared;

namespace vitasaadmin
{
    public partial class ViewController : UIViewController
    {
        // todo: enable/disable the Go button based on the text in the email and password textfields

        C_Global passAroundContainer;
        string loginToken;


        protected ViewController(IntPtr handle) : base(handle)
        {
            // Note: this .ctor should not contain any initialization logic.
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();
            // Perform any additional setup after loading the view, typically from a nib.

            passAroundContainer = new C_Global();
			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            myAppDelegate.PassAroundContiner = passAroundContainer;

            string defEmail = NSUserDefaults.StandardUserDefaults.StringForKey("email");
            string defPw = NSUserDefaults.StandardUserDefaults.StringForKey("password");

            TB_Email.Text = defEmail;
            TB_Password.Text = defPw;

			B_Go.TouchUpInside += (sender, e) => 
            {
				string email = TB_Email.Text;
				string pw = TB_Password.Text;

				if ((TB_Email.Text.Length == 0) || (TB_Password.Text.Length == 0))
					return;

                B_Go.Enabled = false;

				Task.Run(async () =>
				{
                    try
                    {
                        string token = await C_Vita.PerformLogin(email, pw);

                        if (token != null)
                        {
                            loginToken = token;

                            // get user record for this user
                            List<C_VitaUser> usersList = await C_VitaUser.FetchUsersList(loginToken);
                            passAroundContainer.Users = usersList;

                            if (usersList != null)
                            {
								C_VitaUser ourUser = null;
								var ou = usersList.Where(user => user.email == email);
                                if (ou.Count() != 0)
    								ourUser = ou.First();

								if ((ourUser != null) && (ourUser.HasAdmin))
                                {
                                    UIApplication.SharedApplication.InvokeOnMainThread(
                                    new Action(() =>
                                    {
                                        passAroundContainer.LoginToken = loginToken;

                                        NSUserDefaults.StandardUserDefaults.SetString(TB_Email.Text, "email");
                                        NSUserDefaults.StandardUserDefaults.SetString(TB_Password.Text, "password");

										PerformSegue("Segue_LoginToShowLists", this);
                                    }));
                                }
                                else
                                {
                                    Tools.MessageBoxOK("Error", "Not a User or does not have Admin priviledge");
                                    B_Go.Enabled = true;
                                }
                            }
                            else
                            {
								Tools.MessageBoxOK("Error", "Unable to get users. Probably do not have Admin priviledges.");
								B_Go.Enabled = true;
							}
                        }
                        else
                        {
                            UIApplication.SharedApplication.InvokeOnMainThread(
                            new Action(() =>
                            {
								Tools.MessageBoxOK("Error", "Authorization failure.");
								B_Go.Enabled = true;
                        }));
                        }
                    }
                    catch (Exception e1)
                    {
                        Console.WriteLine(e1.Message);
                        B_Go.Enabled = true;
                    }
				});
			};
        }

        public override void DidReceiveMemoryWarning()
        {
            base.DidReceiveMemoryWarning();
            // Release any cached data, images, etc that aren't in use.
        }
    }
}
