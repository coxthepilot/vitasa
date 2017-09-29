using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using Android.Util;

using zsquared;
using System;
using System.Threading.Tasks;

using Android.Gms.Common.Apis;

// how to send message through the api
// curl --header "Authorization: key=<YOUR_KEY_GOES_HERE>" --header Content-Type:"application/json" https://fcm.googleapis.com/fcm/send  -d "{\"to\":\"/topics/news\",\"notification\": {\"title\": \"Click Action Message\",\"text\": \"Sample message\",\"click_action\":\"OPEN_ACTIVITY_1\"}}"

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

   //         if (Intent.Extras != null)
			//{
			//	foreach (var key in Intent.Extras.KeySet())
			//	{
			//		var value = Intent.Extras.GetString(key);
			//		Log.Debug("VITA", "Key: {0} Value: {1}", key, value);
			//	}
			//}			

            MyAppDelegate g = (MyAppDelegate)Application;
			if (g.Global == null)
				g.Global = new C_Global();
			Global = g.Global;

            // to ensure a fresh messaging token, delete the app from the emulator or device, then clear and RE-build
            // only needed once when the app starts; this lets us handle the certificate from abandonedfactory.net
            C_Vita.SetupCertificateHandling();

			// Set our view from the "main" layout resource
			SetContentView(Resource.Layout.Main);

			TB_Email = FindViewById<EditText>(Resource.Id.TB_Email);
			TB_Password = FindViewById<EditText>(Resource.Id.TB_Password);

			B_Login = FindViewById<Button>(Resource.Id.B_Login);
			B_Register = FindViewById<Button>(Resource.Id.B_Register);
			B_About = FindViewById<Button>(Resource.Id.B_About);

			var sharedPreferences = GetSharedPreferences("vitasa", FileCreationMode.MultiProcess);

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
					C_VitaUser user = await Global.PerformLogin(TB_Email.Text, TB_Password.Text);

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
								bool success = await C_Notifications.RegisterNotificationToken(C_Notifications.E_Platform.Android, messagingToken, user.Token);
#if DEBUG
								if (!success)
									Console.WriteLine("unable to register token");
#endif
								if (success)
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
						if (user == null)
						{
							EnableUI_Login(true);
							AI_Busy.Cancel();

							C_MessageBox mbox = new C_MessageBox(this, "Error", "Unable to login. Might be bad email or password", E_MessageBoxButtons.Ok);
							mbox.Show();

							return;
						}

						EnableUI_Login(true);
						AI_Busy.Cancel();

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

