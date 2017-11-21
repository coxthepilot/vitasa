
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;

using zsquared;

namespace a_vitavol
{
    [Activity(Label = "VITA: Current SignUp")]
    public class A_ViewSignUpExisting : Activity
    {
		C_Global Global;

		EditText TB_Hours;

		Button B_GetDirections;
		Button B_RemoveSignup;
        Button B_SaveHours;

        TextView L_Site;
        TextView L_DateAndHours;
        TextView L_Address;
        TextView L_CityStateZip;

        ListView LV_OtherVolunteers;

        ProgressDialog AI_Busy;

        List<string> UserNames;

		protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

			MyAppDelegate g = (MyAppDelegate)Application;
			if (g.Global == null)
				g.Global = new C_Global();
			Global = g.Global;

			// Set our view from the "main" layout resource
            SetContentView(Resource.Layout.ViewSignUpExisting);

            TB_Hours = FindViewById<EditText>(Resource.Id.TB_Hours);

            B_GetDirections = FindViewById<Button>(Resource.Id.B_GetDirections);
            B_RemoveSignup = FindViewById<Button>(Resource.Id.B_RemoveThisSignup);
            B_SaveHours = FindViewById<Button>(Resource.Id.B_SaveHours);

            L_Site = FindViewById<TextView>(Resource.Id.L_Site);
            L_DateAndHours = FindViewById<TextView>(Resource.Id.L_DateAndTimes);
            L_Address = FindViewById<TextView>(Resource.Id.L_Address);
            L_CityStateZip = FindViewById<TextView>(Resource.Id.L_CityStateZip);

            LV_OtherVolunteers = FindViewById<ListView>(Resource.Id.LV_OtherVolunteers);

			AI_Busy = new ProgressDialog(this);
			AI_Busy.SetMessage("Please wait...");
			AI_Busy.SetCancelable(false);
			AI_Busy.SetProgressStyle(ProgressDialogStyle.Spinner);

			B_GetDirections.Click += async (sender, e) => 
            {
				C_VitaSite SelectedSite = await Global.GetSiteFromCache(Global.SelectedSiteSlug);

                var geoUri = Android.Net.Uri.Parse("geo:" + SelectedSite.Latitude + "," + SelectedSite.Longitude);
				var mapIntent = new Intent(Intent.ActionView, geoUri);
				StartActivity(mapIntent);            
            };

            B_RemoveSignup.Click += async (sender, e) =>
            {
                AI_Busy.Show();
                EnableUI(false);

                bool success = await Global.VolunteerSignUp.RemoveIntent(Global);

                AI_Busy.Cancel();
                EnableUI(true);

                if (success)
                {
                    Intent i = new Intent(this, typeof(A_MySignUps));
                    StartActivity(i);
                }
                else
                {
                    C_MessageBox mbox = new C_MessageBox(this, "Error", "Unable to remove signup", E_MessageBoxButtons.Ok);
                    mbox.Show();

                    return;
                }
            };

            B_SaveHours.Click += async (sender, e) => 
            {
				try { Global.VolunteerSignUp.Hours = Convert.ToSingle(TB_Hours.Text); }
				catch { }

                AI_Busy.Show();
                EnableUI(false);

				bool success = await Global.VolunteerSignUp.UpdateSignUp(Global);

                AI_Busy.Cancel();
                EnableUI(true);

                if (!success)
                {
					C_MessageBox mbox = new C_MessageBox(this, "Error", "Unable to update hours", E_MessageBoxButtons.Ok);
					mbox.Show();

					return;
				}
			};

            EnableUI(false);
            AI_Busy.Show();

			Task.Run(async () => 
            {
				Global.SignUpsOnSiteOnDate = Global.GetSignUpsForSiteOnDate(Global.SelectedDate, Global.SelectedSiteSlug);

				UserNames = new List<string>();

				foreach (C_SignUp wi in Global.SignUpsOnSiteOnDate)
				{
					C_VitaUser user = await Global.GetUserFromCache(wi.UserId);
                    if (!UserNames.Contains(user.Name))
    					UserNames.Add(user.Name);
				}
				UserNames.Sort();

                C_VitaSite SelectedSite = await Global.GetSiteFromCache(Global.SelectedSiteSlug);

				int dayOfWeek = (int)Global.SelectedDate.DayOfWeek;
				C_HMS openTime = SelectedSite.SiteCalendar[dayOfWeek].OpenTime;
				C_HMS closeTime = SelectedSite.SiteCalendar[dayOfWeek].CloseTime;
                // see if there is an exception for today
                C_CalendarEntry ce = SelectedSite.GetCalendarExceptionForDateForSite(Global.SelectedDate);
                if (ce != null)
                {
                    openTime = ce.OpenTime;
                    closeTime = ce.CloseTime;
                }

				RunOnUiThread(() =>
				{
                    AI_Busy.Cancel();
                    EnableUI(true);

                    TB_Hours.Text = Global.VolunteerSignUp.Hours.ToString();
                    B_SaveHours.Enabled = !Global.VolunteerSignUp.Approved;
                    TB_Hours.Enabled = !Global.VolunteerSignUp.Approved;

                    LV_OtherVolunteers.Adapter = new ArrayAdapter<String>(this, Android.Resource.Layout.SimpleListItem1, UserNames);

					L_Site.Text = SelectedSite.Name;
                    L_DateAndHours.Text = Global.SelectedDate.ToString("mmm dd, yyyy")
						+ " [" + openTime.ToString("hh:mm p") + " - " + closeTime.ToString("hh:mm p") + "]";

					L_Address.Text = SelectedSite.Street;
					L_CityStateZip.Text = SelectedSite.City + ", " + SelectedSite.State + " " + SelectedSite.Zip;
				});
			});
		}

        private void EnableUI(bool en)
        {
            B_SaveHours.Enabled = en;
            B_RemoveSignup.Enabled = en && !Global.VolunteerSignUp.Approved;
            B_GetDirections.Enabled = en;

            TB_Hours.Enabled = en;

            LV_OtherVolunteers.Enabled = en;
        }

		public override void OnBackPressed()
		{
            Intent i = new Intent(this, typeof(A_MySignUps));
			StartActivity(i);
		}
	}
}
