
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;

using zsquared;

namespace a_vitavol
{
    [Activity(Label = "VITA: Update User Profile")]
    public class A_Profile : Activity
    {
		C_Global Global;

        C_VitaUser LoggedInUser;

        TextView L_Email;

        EditText TB_Name;
        EditText TB_Phone;

        CheckBox CB_Advanced;

        Button B_Submit;

		ProgressDialog AI_Busy;

		protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

			MyAppDelegate g = (MyAppDelegate)Application;
			if (g.Global == null)
				g.Global = new C_Global();
            Global = g.Global;

            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            SetContentView(Resource.Layout.Profile);

			L_Email = FindViewById<TextView>(Resource.Id.L_Profile_Email);

			TB_Name = FindViewById<EditText>(Resource.Id.TB_Profile_Name);
            TB_Phone = FindViewById<EditText>(Resource.Id.TB_Profile_Phone);

            B_Submit = FindViewById<Button>(Resource.Id.B_Profile_Submit);

            CB_Advanced = FindViewById<CheckBox>(Resource.Id.CB_Profile_Advanced);

			TB_Name.Text = LoggedInUser.Name;
            L_Email.Text = LoggedInUser.Email;
            TB_Phone.Text = LoggedInUser.Phone;
            CB_Advanced.Checked = LoggedInUser.Certification == E_Certification.Advanced;

			AI_Busy = new ProgressDialog(this);
			AI_Busy.SetMessage("Please wait...");
			AI_Busy.SetCancelable(false);
			AI_Busy.SetProgressStyle(ProgressDialogStyle.Spinner);

			B_Submit.Click += async (sender, e) => 
            {
                LoggedInUser.Name = TB_Name.Text;
                LoggedInUser.Phone = TB_Phone.Text;
                LoggedInUser.Certification = CB_Advanced.Checked ? E_Certification.Advanced : E_Certification.Basic;

                AI_Busy.Show();
                EnableUI(false);

                bool success = await LoggedInUser.UpdateUserProfile(LoggedInUser.Token);

                AI_Busy.Cancel();
                EnableUI(true);

                if (!success)
                {
                    C_MessageBox mbox = new C_MessageBox(this, "Error", "Unable to update user profile.", E_MessageBoxButtons.Ok);
                    mbox.Dismissed += (sender1, args1) => 
                    {
						Intent i = new Intent(this, typeof(A_VolunteerActivity));
						StartActivity(i);
					};
                    mbox.Show();
                }
                else
                {
                    Intent i = new Intent(this, typeof(A_VolunteerActivity));
                    StartActivity(i);
                }
			};
		}

		public override void OnBackPressed()
		{
            if (Global.ViewCameFrom == E_ViewCameFrom.VolOptions)
                StartActivity(new Intent(this, typeof(A_VolunteerActivity)));
            else if (Global.ViewCameFrom == E_ViewCameFrom.SCSite)
                StartActivity(new Intent(this, typeof(A_SCMySite)));
            else
                throw new ApplicationException("unknown view came from");
		}

		private void EnableUI(bool en)
        {
            TB_Name.Enabled = en;
            TB_Phone.Enabled = en;
            CB_Advanced.Enabled = en;
            B_Submit.Enabled = en;
        }
    }
}
