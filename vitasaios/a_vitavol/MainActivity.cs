using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using Android.Util;

using zsquared;
using System;
using System.Threading.Tasks;

using Android.Gms.Common.Apis;

namespace a_vitavol
{
    [Activity(Label = "VITA San Antonio", MainLauncher = true)]
    public class MainActivity : Activity
    {
        C_Global Global;

        EditText TB_Email;
        EditText TB_Password;

        Button B_Login;
        Button B_Register;
        Button B_About;

		ProgressDialog AI_Busy;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            // reset the global values on each login; this avoids some issues on login with different credentials (SC -> vol -> SC)
            long bytes = 0;
            if (g.Global != null)
                bytes = g.Global.BytesReceived;
			g.Global = new C_Global();
			Global = g.Global;
            Global.BytesReceived = bytes;

			// Set our view from the "main" layout resource
			SetContentView(Resource.Layout.Main);

			TB_Email = FindViewById<EditText>(Resource.Id.TB_Email);
			TB_Password = FindViewById<EditText>(Resource.Id.TB_Password);

			B_Login = FindViewById<Button>(Resource.Id.B_Login);
			B_Register = FindViewById<Button>(Resource.Id.B_Register);
			B_About = FindViewById<Button>(Resource.Id.B_About);

			var sharedPreferences = GetSharedPreferences("vitasa", FileCreationMode.MultiProcess);

            if (Intent.Extras != null)
            {
                //Console.WriteLine("found extras");
                string m_id = Intent.Extras.GetString("google.message_id");
                if (m_id != null)
                {
                    //Console.WriteLine("id: " + m_id);
                    string fb_message = sharedPreferences.GetString("firebase_message", "");
                    string fb_id = sharedPreferences.GetString("firebase_messageid", "");

                    if (m_id == fb_id)
                    {
                        //Console.WriteLine("Found message: " + fb_message);
                        C_MessageBox mbox = new C_MessageBox(this, "Notification", fb_message, E_MessageBoxButtons.Ok);
						mbox.Show();
					}
                }
            }

			AI_Busy = new ProgressDialog(this);
			AI_Busy.SetMessage("Please wait...");
			AI_Busy.SetCancelable(false);
            AI_Busy.SetProgressStyle(ProgressDialogStyle.Spinner);

			B_Login.Click += (sender, e) =>
			{
                AI_Busy.Show();
				EnableUI_Login(false);

                Task.Run(async () => 
                {
                    C_IOResult ior = await Global.PerformLogin(TB_Email.Text, TB_Password.Text);
                    C_VitaUser user = ior.User;

                    if ((user != null) && (C_GooglePlayHelper.IsGooglePlayServicesInstalled(this)))
					{
						// see if we need to update the messaging token on the backend
						string tokenHasBeenUpdated = sharedPreferences.GetString("firebasetoken_updated", "false");
						if (tokenHasBeenUpdated == "true")
						{
							string messagingToken = sharedPreferences.GetString("firebasetoken", "");
							if (!string.IsNullOrEmpty(messagingToken))
							{
								// the current token can be found at: FirebaseInstanceId.Instance.Token
                                C_IOResult ior1 = await Global.RegisterNotificationToken(E_Platform.Android, messagingToken, user.Token);
#if DEBUG
                                if (!ior1.Success)
									Console.WriteLine("unable to register token");
#endif
                                if (ior1.Success)
								{
									// show that we have updated the token on the backend
									var editorx = sharedPreferences.Edit();
									editorx.PutString("firebasetoken_updated", "false");
									editorx.Commit();
								}
							}
						}
					}

					RunOnUiThread(() => 
                    {
						EnableUI_Login(true);
						AI_Busy.Cancel();

                        if (!ior.Success)
                        {
                            C_MessageBox mbox = new C_MessageBox(this, "Error", ior.ErrorMessage, E_MessageBoxButtons.Ok);
                            mbox.Show();

                            return;
                        }

						if (user == null)
						{
							C_MessageBox mbox = new C_MessageBox(this, "Error", "Unable to login. Might be bad email or password", E_MessageBoxButtons.Ok);
							mbox.Show();

							return;
						}

						Global.LoggedInUserId = user.id;

						var editor = sharedPreferences.Edit();
						editor.PutString("email", TB_Email.Text);
						editor.PutString("password", TB_Password.Text);
						editor.Commit();

						if (user.HasSiteCoordinator)
						{
							if (user.SitesCoordinated.Count == 1)
							{
								Global.SelectedSiteSlug = user.SitesCoordinated[0].Slug;

								Intent i = new Intent(this, typeof(A_SCMySite));
								StartActivity(i);
							}
							else
							{
								Intent i = new Intent(this, typeof(A_SCMySites));
								StartActivity(i);
							}
						}
						else if (user.HasVolunteer)
						{
							StartActivity(new Intent(this, typeof(A_VolunteerActivity)));
						}
						else if (user.HasNewUser)
						{
							C_MessageBox mbox = new C_MessageBox(this, "Pending", "Staff has not yet acted on your registration.", E_MessageBoxButtons.Ok);
							mbox.Show();

							return;
						}
						else
						{
							C_MessageBox mbox = new C_MessageBox(this, "Error", "Authorization failure. Expecting Volunteer or Site Coordinator.", E_MessageBoxButtons.Ok);
							mbox.Show();

							return;
						}
					});
                });
			};

			B_Register.Click += (sender, e) =>
			{
                Intent register = new Intent(this, typeof(A_Registration));
				StartActivity(register);
			};

			B_About.Click += (sender, e) =>
			{
				Intent about = new Intent(this, typeof(A_About));
				StartActivity(about);
			};

			TB_Email.TextChanged += (sender, e) =>
			{
				B_Login.Enabled = (TB_Email.Text.Length > 6) && (TB_Password.Text.Length > 6);
			};

			TB_Password.TextChanged += (sender, e) =>
			{
				B_Login.Enabled = (TB_Email.Text.Length > 6) && (TB_Password.Text.Length > 6);
			};

			string t_email = sharedPreferences.GetString("email", "");
			string t_password = sharedPreferences.GetString("password", "");

			TB_Email.Text = t_email;
			TB_Password.Text = t_password;
			B_Login.Enabled = (TB_Email.Text.Length > 6) && (TB_Password.Text.Length > 6);

            C_GooglePlayHelper.IsGooglePlayServicesInstalled(this);
		}

        private void EnableUI_Login(bool en)
		{
			TB_Email.Enabled = en;
			TB_Password.Enabled = en;
			B_Login.Enabled = en;
			B_Register.Enabled = en;
			B_About.Enabled = en;
		}

		public override void OnBackPressed()
		{
			// don't do anything...
		}
	}
}

