
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Json;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;

using zsquared;

namespace a_vitavol
{
    [Activity(Label = "VITA: Volunteer Registration")]
    public class A_Registration : Activity
    {
  //      C_Global Global;

		//EditText TB_Register_Name;
		//EditText TB_Register_Email;
		//EditText TB_Register_Password;
		//EditText TB_Register_VerifyPassword;
		//EditText TB_Register_Phone;
		//Button B_Register_Submit;
  //      Button B_PrivacyPolicy;
		//CheckBox CB_Register_Advanced;

		//protected override void OnCreate(Bundle savedInstanceState)
  //      {
  //          base.OnCreate(savedInstanceState);

		//	MyAppDelegate g = (MyAppDelegate)Application;
		//	if (g.Global == null)
		//		g.Global = new C_Global();
		//	Global = g.Global;

  //          C_VitaUser loggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

		//	// Set our view from the "main" layout resource
		//	SetContentView(Resource.Layout.Registration);

		//	TB_Register_Name = FindViewById<EditText>(Resource.Id.TB_Register_Name);
		//	TB_Register_Email = FindViewById<EditText>(Resource.Id.TB_Register_Email);
		//	TB_Register_Password = FindViewById<EditText>(Resource.Id.TB_Register_Password);
		//	TB_Register_VerifyPassword = FindViewById<EditText>(Resource.Id.TB_Register_VerifyPassword);
		//	TB_Register_Phone = FindViewById<EditText>(Resource.Id.TB_Register_Phone);

		//	B_Register_Submit = FindViewById<Button>(Resource.Id.B_Register_Submit);
  //          B_PrivacyPolicy = FindViewById<Button>(Resource.Id.B_Register_PrivacyPolicy);

		//	CB_Register_Advanced = FindViewById<CheckBox>(Resource.Id.CB_Register_Advanced);
		//	CB_Register_Advanced.Visibility = Android.Views.ViewStates.Visible;

  //          TB_Register_Name.TextChanged += CheckSubmitEnabled;
  //          TB_Register_Email.TextChanged += CheckSubmitEnabled;
		//	TB_Register_Password.TextChanged += CheckSubmitEnabled;
		//	TB_Register_VerifyPassword.TextChanged += CheckSubmitEnabled;
		//	TB_Register_Phone.TextChanged += CheckSubmitEnabled;

		//	B_Register_Submit.Click += async (sender, e) =>
		//	{
		//		// send the registration to the backend
		//		bool advanced = CB_Register_Advanced.Checked;
		//		E_Certification loc = advanced ? E_Certification.Advanced : E_Certification.Basic;

		//		// need to get these values before we leave the UI thread
		//		string uname = TB_Register_Name.Text;
		//		string uemail = TB_Register_Email.Text;
		//		string upassword = TB_Register_Password.Text;
		//		string uphone = TB_Register_Phone.Text;

		//		ProgressDialog AI_Submitting = new ProgressDialog(this);
		//		AI_Submitting.SetMessage("Please wait...");
		//		AI_Submitting.SetCancelable(false);
		//		AI_Submitting.SetProgressStyle(ProgressDialogStyle.Spinner);

		//		try
		//		{
		//			AI_Submitting.Show();
		//			EnableUI_Register(false);

  //                  C_IOResult ior = await Global.SubmitRegistration(uname, uemail, upassword, uphone, loc);

		//			AI_Submitting.Cancel();
		//			EnableUI_Register(true);

  //                  if (ior.Success)
		//			{
		//				// tell the user that the staff will approve, check back later
		//				C_MessageBox mbox = new C_MessageBox(this, "Registration Submitted",
		//								 "Your registration has been submitted. Staff will respond shortly.",
		//													 E_MessageBoxButtons.Ok);
		//				mbox.Dismissed += (sender1, args1) =>
		//				{
		//					mbox = null;

		//					Intent login = new Intent(this, typeof(MainActivity));
		//					StartActivity(login);
		//				};
		//				mbox.Show();
		//				return;
		//			}
		//			else
		//			{
		//				C_MessageBox mbox = new C_MessageBox(this,
		//							"Error",
  //                                  "Unable to submit registration, possibly due to a duplicate registration [" + ior.ErrorMessage + "]",
		//							E_MessageBoxButtons.Ok);
		//				mbox.Show();
		//				return;
		//			}
		//		}
		//		catch (Exception e1)
		//		{
		//			Console.WriteLine(e1.Message);
		//		}
		//	};

  //          B_PrivacyPolicy.Click += (sender, e) => 
  //          {
  //              var uri = Android.Net.Uri.Parse("http://vitasa.org/en/privacy-policy.html");
  //              var intent = new Intent(Intent.ActionView, uri);
  //              StartActivity(intent);                
  //          };
		//}

		//void CheckSubmitEnabled(object sender, Android.Text.TextChangedEventArgs e)
		//{
  //          bool ok = true;

  //          ok &= TB_Register_Name.Text.Length > 4;
  //          ok &= TB_Register_Email.Text.Length > 4;
  //          ok &= TB_Register_Password.Text.Length > 7;
  //          ok &= TB_Register_VerifyPassword.Text.Length > 7;

  //          ok &= ValidPhoneNumber(TB_Register_Phone.Text);
		//	ok &= TB_Register_Email.Text.Contains("@");
		//	ok &= TB_Register_Password.Text == TB_Register_VerifyPassword.Text;

  //          B_Register_Submit.Enabled = ok;

  //          Android.Graphics.Color nc = TB_Register_Name.Text.Length > 4 ? Android.Graphics.Color.DarkGreen : Android.Graphics.Color.DarkGray;
  //          TB_Register_Name.SetBackgroundColor(nc);

  //          bool emailOk = (TB_Register_Email.Text.Length > 4) && (TB_Register_Email.Text.Contains("@"));
  //          Android.Graphics.Color ec = emailOk ? Android.Graphics.Color.DarkGreen : Android.Graphics.Color.DarkGray;
  //          TB_Register_Email.SetBackgroundColor(ec);

  //          bool passOk = (TB_Register_Password.Text.Length > 7) && (TB_Register_VerifyPassword.Text.Length > 7)
  //              && (TB_Register_Password.Text == TB_Register_VerifyPassword.Text);
		//	Android.Graphics.Color pwc = passOk ? Android.Graphics.Color.DarkGreen : Android.Graphics.Color.DarkGray;
  //          TB_Register_Password.SetBackgroundColor(pwc);
  //          TB_Register_VerifyPassword.SetBackgroundColor(pwc);

  //          bool phoneOk = ValidPhoneNumber(TB_Register_Phone.Text);
		//	Android.Graphics.Color phc = phoneOk ? Android.Graphics.Color.DarkGreen : Android.Graphics.Color.DarkGray;
  //          TB_Register_Phone.SetBackgroundColor(phc);
		//}

		//private bool ValidPhoneNumber(string pn)
		//{
		//	// we consider a phone number valid if it has 10 numerics, no alphas, only dashes
		//	bool res = true;

		//	int numCount = 0;
		//	foreach (char c in pn)
		//	{
		//		if (char.IsDigit(c))
		//		{
		//			numCount++;
		//			continue;
		//		}
		//		else if (char.IsLetter(c))
		//		{
		//			res = false;
		//			break;
		//		}
		//		else if (c != '-')
		//		{
		//			res = false;
		//			break;
		//		}
		//	}

		//	return res && (numCount == 10);
		//}

  //      private void EnableUI_Register(bool en)
		//{
		//	TB_Register_Name.Enabled = en;
		//	TB_Register_Email.Enabled = en;
		//	TB_Register_Password.Enabled = en;
		//	TB_Register_VerifyPassword.Enabled = en;
		//	TB_Register_Phone.Enabled = en;

		//	B_Register_Submit.Enabled = en;
		//}

	}
}
