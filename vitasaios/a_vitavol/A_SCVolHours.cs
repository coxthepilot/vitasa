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
    [Activity(Label = "VITA: Volunteer Hours")]
    public class A_SCVolHours : Activity
    {
		C_Global Global;

		ProgressDialog AI_Busy;

        TextView L_Date;
        TextView L_Site;
        TextView L_User;
        TextView L_Approval;
        TextView L_Phone;

        EditText TB_Hours;

		const float EPSILON = 0.001f;

		protected override void OnCreate(Bundle savedInstanceState)
        {
			base.OnCreate(savedInstanceState);

			MyAppDelegate g = (MyAppDelegate)Application;
			if (g.Global == null)
				g.Global = new C_Global();
			Global = g.Global;

			if (Global.SelectedDate == null)
				Global.SelectedDate = C_YMD.Now;

			// Set our view from the "main" layout resource
            SetContentView(Resource.Layout.SCVolHours);

			AI_Busy = new ProgressDialog(this);
			AI_Busy.SetMessage("Please wait...");
			AI_Busy.SetCancelable(false);
			AI_Busy.SetProgressStyle(ProgressDialogStyle.Spinner);

            L_Date = FindViewById<TextView>(Resource.Id.L_Date);
            L_Site = FindViewById<TextView>(Resource.Id.L_Site);
            L_User = FindViewById<TextView>(Resource.Id.L_User);
            L_Approval = FindViewById<TextView>(Resource.Id.L_Approval);
			L_Phone = FindViewById<TextView>(Resource.Id.L_Phone);

			TB_Hours = FindViewById<EditText>(Resource.Id.TB_Hours);

            L_Phone.Click += (sender, e) => 
            {
				string phoneNumber = Global.VolunteerWorkShiftSignUp.User.Phone;
				// clean up the number before we use it to make the call
				phoneNumber = phoneNumber.Replace("-", "");
				phoneNumber = phoneNumber.Trim();
				phoneNumber = phoneNumber.Replace(" ", "");
				phoneNumber = phoneNumber.Replace("(", "");
				phoneNumber = phoneNumber.Replace(")", "");

                var uri = Android.Net.Uri.Parse("tel:" + phoneNumber);

				StartActivity(new Intent(Intent.ActionDial, uri));            
            };

			L_Date.Text = Global.VolunteerWorkShiftSignUp.TheSignUp.Date.ToString("dow mmm dd, yyyy");
			L_Site.Text = Global.VolunteerWorkShiftSignUp.TheSignUp.SiteName;
			L_User.Text = Global.VolunteerWorkShiftSignUp.User.UserName;
			L_Approval.Text = Global.VolunteerWorkShiftSignUp.TheSignUp.Approved ? "Approved" : "not approved";
			L_Phone.Text = Global.VolunteerWorkShiftSignUp.User.Phone;

			TB_Hours.Text = Global.VolunteerWorkShiftSignUp.TheSignUp.Hours.ToString();

            TB_Hours.Enabled = (Global.VolunteerWorkShiftSignUp.TheSignUp.Date <= C_YMD.Now);
		}

		public override void OnBackPressed()
		{
			try
			{
				float h = Convert.ToSingle(TB_Hours.Text);
				if (Math.Abs(h - Global.VolunteerWorkShiftSignUp.TheSignUp.Hours) > EPSILON)
				{
					Global.VolunteerWorkShiftSignUp.TheSignUp.Dirty = true;
					Global.VolunteerWorkShiftSignUp.TheSignUp.Hours = h;
				}
			}
			catch
			{
				Global.VolunteerWorkShiftSignUp.TheSignUp.Dirty = false;
			}

            StartActivity(new Intent(this, typeof(A_SCSiteVol)));
		}
	}
}
