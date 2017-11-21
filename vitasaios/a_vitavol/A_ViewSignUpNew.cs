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
using Android.Provider;
using Android.Database;

using zsquared;

using Java.Util;


namespace a_vitavol
{
    [Activity(Label = "VITA: New Sign Up")]
    public class A_ViewSignUpNew : Activity
    {
        C_Global Global;
		
        Button B_SignMeUp;
        Button B_Directions;
		ListView LV_Others;
        TextView L_Site;
        TextView L_Address;
        TextView L_DateAndTime;
        TextView L_CityStateZip;

		ProgressDialog AI_Busy;

        C_VitaUser LoggedInUser;
        C_VitaSite SelectedSite;

        List<string> UserNames;

		protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

			MyAppDelegate g = (MyAppDelegate)Application;
			if (g.Global == null)
				g.Global = new C_Global();
			Global = g.Global;

            SetContentView(Resource.Layout.ViewSignUpNew);

			LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
			SelectedSite = Global.GetSiteNoFetch(Global.SelectedSiteSlug);

            LV_Others = FindViewById<ListView>(Resource.Id.LV_ViewSignUpNew_OtherVolunteers);
			B_SignMeUp = FindViewById<Button>(Resource.Id.B_ViewSignUpNew_SignMeUp);
            B_Directions = FindViewById<Button>(Resource.Id.B_ViewSignUpNew_GetDirections);

			L_Site = FindViewById<TextView>(Resource.Id.L_ViewSignUpNew_Site);
            L_Address = FindViewById<TextView>(Resource.Id.L_ViewSignUpNew_Address);
            L_DateAndTime = FindViewById<TextView>(Resource.Id.L_ViewSignUpNew_DateAndTimes);
            L_CityStateZip = FindViewById<TextView>(Resource.Id.L_ViewSignUpNew_CityStateZip);

			AI_Busy = new ProgressDialog(this);
			AI_Busy.SetMessage("Please wait...");
			AI_Busy.SetCancelable(false);
			AI_Busy.SetProgressStyle(ProgressDialogStyle.Spinner);

			B_Directions.Click += (sender, e) => 
            {
				var geoUri = Android.Net.Uri.Parse("geo:" + SelectedSite.Latitude + "," + SelectedSite.Longitude);
				var mapIntent = new Intent(Intent.ActionView, geoUri);
				StartActivity(mapIntent);
			};

			B_SignMeUp.Click += async (sender, e) => 
            {
                AI_Busy.Show();
				EnableUI(false);

				C_SignUp wi = new C_SignUp(Global.SelectedSiteSlug, Global.SelectedDate, LoggedInUser.id, 0);

				bool success = await wi.AddSignUp(Global, LoggedInUser.id);

                AI_Busy.Cancel();
				EnableUI(true);

				if (!success)
				{
                    C_MessageBox mbox1 = new C_MessageBox(this,
                                     "Error",
                                     "Add SignUp failed", 
                                     E_MessageBoxButtons.Ok);
                    mbox1.Show();

					return;
				}

                C_MessageBox mbox = new C_MessageBox(this, 
                                                     "Add to Calendar?", 
                                                     "Add this signup to your calendar?", 
                                                     E_MessageBoxButtons.YesNo);
                mbox.Dismissed += (sender1, args1) => 
                {
                    if (args1.Result == E_MessageBoxResults.Yes)
                    {
                        // first job is to find the calendar to add our item into; we choose to add to the primary calendar
						var calendarsUri = CalendarContract.Calendars.ContentUri;

						string[] calendarsProjection = {
            			   CalendarContract.Calendars.InterfaceConsts.Id,
            			   //CalendarContract.Calendars.InterfaceConsts.CalendarDisplayName,
            			   //CalendarContract.Calendars.InterfaceConsts.AccountName,
                           CalendarContract.Calendars.InterfaceConsts.IsPrimary
            			};

						var loader = new CursorLoader(this, calendarsUri, calendarsProjection, null, null, null);
						var cursor = (ICursor)loader.LoadInBackground();

						int _calId = -1;

						int ccount = cursor.Count;
                        cursor.MoveToFirst();
                        for (int ix = 0; ix != ccount; ix++)
                        {
                            int id = cursor.GetInt(0);
                            //string displayName = cursor.GetString(1);
                            //string accountName = cursor.GetString(2);
                            int isPrimary = cursor.GetInt(3);

                            if (isPrimary != 0)
                            {
                                _calId = id;
                                break;
                            }

                            cursor.MoveToNext();
                        }

						C_HMS[] openCloseTimes = SelectedSite.GetOpenCloseTimeOnDate(wi.Date);
						C_HMS openTime = openCloseTimes[0];
						C_HMS closeTime = openCloseTimes[1];

						ContentValues eventValues = new ContentValues();

						eventValues.Put(CalendarContract.Events.InterfaceConsts.CalendarId, _calId);
						eventValues.Put(CalendarContract.Events.InterfaceConsts.Title, "VITA Sign-Up");
                        eventValues.Put(CalendarContract.Events.InterfaceConsts.Description, SelectedSite.Street + ", " + SelectedSite.City + " " + SelectedSite.Zip);
                        eventValues.Put(CalendarContract.Events.InterfaceConsts.Dtstart, GetDateTimeMS(Global.SelectedDate, openTime));
                        eventValues.Put(CalendarContract.Events.InterfaceConsts.Dtend, GetDateTimeMS(Global.SelectedDate, closeTime));

						eventValues.Put(CalendarContract.Events.InterfaceConsts.EventTimezone, "CST");
						eventValues.Put(CalendarContract.Events.InterfaceConsts.EventEndTimezone, "CST");

						var uri = ContentResolver.Insert(CalendarContract.Events.ContentUri, eventValues);

						StartActivity(new Intent(this, typeof(A_VolunteerActivity)));
					}
				};
				mbox.Show();
			};

            AI_Busy.Show();
			EnableUI(false);

			Task.Run(async () =>
			{
				// Build a list of user names to display. Keep watch for our user in the list
				UserNames = new List<string>();
				C_SignUp ourUserWorkItem = null;

				foreach (C_SignUp wi in Global.SignUpsOnSiteOnDate)
				{
					C_VitaUser user = await Global.GetUserFromCache(wi.UserId);
					if (!UserNames.Contains(user.Name))
						UserNames.Add(user.Name);

					if (wi.UserId == LoggedInUser.id)
						ourUserWorkItem = wi;
				}

    			RunOnUiThread(() =>
    			{
                    AI_Busy.Cancel();
					EnableUI(true);

                    LV_Others.Adapter = new ArrayAdapter<String>(this, Android.Resource.Layout.SimpleListItem1, UserNames);

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

					L_Site.Text = SelectedSite.Name;
					L_DateAndTime.Text = Global.SelectedDate.ToString("mmm dd, yyyy")
						+ " [" + openTime.ToString("hh:mm p") + " - " + closeTime.ToString("hh:mm p") + "]";

					L_Address.Text = SelectedSite.Street;
					L_CityStateZip.Text = SelectedSite.City + ", " + SelectedSite.State + " " + SelectedSite.Zip;

					B_Directions.Enabled = true;
				});
			});
        }

		public override void OnBackPressed()
		{
            if (Global.ViewCameFrom == E_ViewCameFrom.List)
    			StartActivity(new Intent(this, typeof(A_VolPickSite)));
            else
                StartActivity(new Intent(this, typeof(A_VolPickSiteMap)));
		}

		private void EnableUI(bool en)
        {
            B_SignMeUp.Enabled = en;
            LV_Others.Enabled = en;
        }

        long GetDateTimeMS(C_YMD ymd, C_HMS hms)
		{
            //string[] tzid = Java.Util.TimeZone.GetAvailableIDs();
            var tz = Java.Util.TimeZone.GetTimeZone("US/Central");
			Calendar c = Calendar.GetInstance(tz);

			c.Set(CalendarField.Minute, hms.Minutes);
			c.Set(CalendarField.HourOfDay, hms.Hour);
			c.Set(CalendarField.DayOfMonth, ymd.Day);
			c.Set(CalendarField.Month, ymd.Month - 1);
			c.Set(CalendarField.Year, ymd.Year);

			long reft = c.TimeInMillis;

            return reft;
		}
    }
}
