
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

			TB_Name.Text = LoggedInUser.Name;
            L_Email.Text = LoggedInUser.Email;
            TB_Phone.Text = LoggedInUser.Phone;

			AI_Busy = new ProgressDialog(this);
			AI_Busy.SetMessage("Please wait...");
			AI_Busy.SetCancelable(false);
			AI_Busy.SetProgressStyle(ProgressDialogStyle.Spinner);

			B_Submit.Click += async (sender, e) => 
            {
                LoggedInUser.Name = TB_Name.Text;
                LoggedInUser.Phone = TB_Phone.Text;

                AI_Busy.Show();
                EnableUI(false);

                C_IOResult ior = await Global.UpdateUserProfile(LoggedInUser);

                AI_Busy.Cancel();
                EnableUI(true);

                if (!ior.Success)
                {
                    C_MessageBox mbox = new C_MessageBox(this, "Error", "Unable to update user profile [" + ior.ErrorMessage + "]", E_MessageBoxButtons.Ok);
                    mbox.Dismissed += (sender1, args1) => 
                    {
						Intent i = new Intent(this, typeof(A_VolunteerActivity));
						StartActivity(i);
					};
                    mbox.Show();
                }
                else
                {
                    if (Global.ViewCameFrom == E_ViewCameFrom.VolOptions)
                        StartActivity(new Intent(this, typeof(A_VolunteerActivity)));
                    else if (Global.ViewCameFrom == E_ViewCameFrom.SCSite)
                        StartActivity(new Intent(this, typeof(A_SCMySite)));
                    else
                        throw new ApplicationException("unknown view came from");
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
            B_Submit.Enabled = en;
        }
    }
}
