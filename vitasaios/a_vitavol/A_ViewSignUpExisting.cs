
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

        C_VitaUser LoggedInUser;

		C_YMD SelectedDate;
		C_VitaSite SelectedSite;
		C_WorkShift SelectedShift;
		C_SignUp SelectedSignUp;

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

        bool HoursAreDirty;

		protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

			MyAppDelegate g = (MyAppDelegate)Application;
			if (g.Global == null)
				g.Global = new C_Global();
			Global = g.Global;

            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

			SelectedSite = Global.GetSiteNoFetch(Global.SelectedSiteSlug);
			SelectedDate = Global.SelectedDate;
			SelectedSignUp = Global.SelectedSignUp;
			SelectedShift = Global.SelectedShift;
#if DEBUG
			if ((LoggedInUser == null)
				|| (SelectedDate == null)
				|| (SelectedSite == null)
				|| (SelectedSignUp == null)
				|| (SelectedShift == null)
			   )
				throw new ApplicationException("missing a value");
#endif
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

			B_GetDirections.Click += (sender, e) => 
            {
                var geoUri = Android.Net.Uri.Parse("geo:" + SelectedSite.Latitude + "," + SelectedSite.Longitude);
				var mapIntent = new Intent(Intent.ActionView, geoUri);
				StartActivity(mapIntent);            
            };

            B_RemoveSignup.Click += async (sender, e) =>
            {
                AI_Busy.Show();
                EnableUI(false);

                bool success = await SelectedSignUp.RemoveIntent(LoggedInUser.Token);

				Global.RemoveFromSignUps(SelectedSignUp);
                Global.AdjustSiteSchedueCacheForRemovedSignUp(SelectedSignUp, LoggedInUser, SelectedSite);
				// remove from the calendar entry, shifts, signups
				C_CalendarEntry calEntry = SelectedSite.GetCalendarEntryForDate(SelectedSignUp.Date);
				foreach (C_WorkShift ws in calEntry.WorkShifts)
				{
					C_WorkShiftSignUp str = null;
					foreach (C_WorkShiftSignUp wssu in ws.SignUps)
					{
						if (wssu.User.UserId == Global.LoggedInUserId)
						{
							str = wssu;
							break;
						}
					}
					if (str != null)
					{
						ws.SignUps.Remove(str);

						break;
					}
				}

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
				try { Global.SelectedSignUp.Hours = Convert.ToSingle(TB_Hours.Text); }
				catch { }

                AI_Busy.Show();
                EnableUI(false);

                bool success = await SelectedSignUp.UpdateSignUp(LoggedInUser.Token);

                AI_Busy.Cancel();
                EnableUI(true);

                if (!success)
                {
                    C_MessageBox mbox = new C_MessageBox(this, "Error", "Unable to update hours", E_MessageBoxButtons.Ok);
                    mbox.Show();

                    return;
                }
                else
                    HoursAreDirty = false;
			};

            TB_Hours.TextChanged += (sender, e) => 
            {
                HoursAreDirty = true;
            };

            EnableUI(false);
            AI_Busy.Show();

			Task.Run(() => 
            {
				// Build a list of user names to display. Keep watch for our user in the list
				UserNames = new List<string>();

				// get a list of all work items at this site on this date, regardless of shift
				List<C_WorkShiftSignUp> signUpsAtSiteOnDateOnShift = SelectedShift.SignUps;

				foreach (C_WorkShiftSignUp wi in signUpsAtSiteOnDateOnShift)
				{
					if (wi.User.UserId != LoggedInUser.id)
						UserNames.Add(wi.User.UserName);
				}

				RunOnUiThread(() =>
				{
                    AI_Busy.Cancel();
                    EnableUI(true);

                    TB_Hours.Text = Global.SelectedSignUp.Hours.ToString();
                    B_SaveHours.Enabled = !Global.SelectedSignUp.Approved;
                    TB_Hours.Enabled = !Global.SelectedSignUp.Approved;
                    HoursAreDirty = false; // required after the init of the field

                    LV_OtherVolunteers.Adapter = new ArrayAdapter<String>(this, Android.Resource.Layout.SimpleListItem1, UserNames);

					L_Site.Text = SelectedSite.Name;
					L_DateAndHours.Text = SelectedDate.ToString("mmm dd, yyyy")
						+ " [" + SelectedShift.OpenTime.ToString("hh:mm p") + " - " + SelectedShift.CloseTime.ToString("hh:mm p") + "]";

					L_Address.Text = SelectedSite.Street;
					L_CityStateZip.Text = SelectedSite.City + ", " + SelectedSite.State + " " + SelectedSite.Zip;
				});
			});
		}

        private void EnableUI(bool en)
        {
            B_SaveHours.Enabled = en && !Global.SelectedSignUp.Approved;
            B_RemoveSignup.Enabled = en;
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
