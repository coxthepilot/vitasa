using System.Linq;
using System.Threading.Tasks;

using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using Android.Views;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "VITA: Site Details")]
    public class A_SiteDetails : Activity
    {
        C_Global Global;
        C_VitaSite SelectedSite;
        C_VitaUser LoggedInUser;

        TextView L_SiteName;
        TextView L_Address;
        TextView L_CSZ;
        TextView L_HoursToday;
        TextView L_Mobile;
        TextView L_DropOff;
        TextView L_InPerson;
        TextView L_Express;
        TextView L_MFT;

        Button B_Directions;
        Button B_SiteCalendar;

        CheckBox CB_PreferedSite;

        ProgressBar PB_Busy;

        C_PersistentSettings Settings;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;
            SelectedSite = Global.GetSiteFromSlugNoFetch(Global.SelectedSiteSlug);
            LoggedInUser = null;
            if (Global.LoggedInUserId != -1)
                LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            Settings = new C_PersistentSettings(this);

            SetContentView(Resource.Layout.SiteDetails);

            L_SiteName = FindViewById<TextView>(Resource.Id.L_SiteName);
            L_Address = FindViewById<TextView>(Resource.Id.L_Street);
            L_CSZ = FindViewById<TextView>(Resource.Id.L_CSZ);
            L_HoursToday = FindViewById<TextView>(Resource.Id.L_HoursWorked);
            L_Mobile = FindViewById<TextView>(Resource.Id.L_Mobile);
            L_DropOff = FindViewById<TextView>(Resource.Id.L_Dropoff);
            L_InPerson = FindViewById<TextView>(Resource.Id.L_InPerson);
            L_Express = FindViewById<TextView>(Resource.Id.L_Express);
            L_MFT = FindViewById<TextView>(Resource.Id.L_MFT);
            B_Directions = FindViewById<Button>(Resource.Id.B_Directions);
            B_SiteCalendar = FindViewById<Button>(Resource.Id.B_SiteCalendar);
            CB_PreferedSite = FindViewById<CheckBox>(Resource.Id.CB_PreferredSite);
            PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);

            C_Common.SetViewColors(this, Resource.Id.V_SiteDetails);

            L_SiteName.Text = SelectedSite.Name;
            L_Address.Text = SelectedSite.Street;
            L_CSZ.Text = SelectedSite.City + ", " + SelectedSite.State + " " + SelectedSite.Zip;

            C_YMD today = C_YMD.Now;
            var lo = SelectedSite.SiteCalendar.Where(ce => ce.Date == today);
            if (lo.Any())
            {
                C_CalendarEntry cef = lo.First();
                L_HoursToday.Text = "Hours today: " + cef.OpenTime.ToString("hh:mm p") + "-" + cef.CloseTime.ToString("hh:mm p");
            }
            else
                L_HoursToday.Text = "Hours today: closed";

            L_Mobile.Visibility = (SelectedSite.SiteType == E_SiteType.Mobile) ? ViewStates.Visible : ViewStates.Invisible;
            L_DropOff.Visibility = SelectedSite.SiteCapabilities.Contains(E_SiteCapabilities.DropOff) ? ViewStates.Visible : ViewStates.Invisible;
            L_InPerson.Visibility = SelectedSite.SiteCapabilities.Contains(E_SiteCapabilities.InPersonTaxPrep) ? ViewStates.Visible : ViewStates.Invisible;
            L_Express.Visibility = SelectedSite.SiteCapabilities.Contains(E_SiteCapabilities.Express) ? ViewStates.Visible : ViewStates.Invisible;
            L_MFT.Visibility = SelectedSite.SiteCapabilities.Contains(E_SiteCapabilities.MFT) ? ViewStates.Visible : ViewStates.Invisible;

            CB_PreferedSite.Checked = Settings.IsPreferedSite(SelectedSite.Slug);

            B_Directions.Click += (sender, e) => 
            {
                var geoUri = Android.Net.Uri.Parse("geo:" + SelectedSite.Latitude + "," + SelectedSite.Longitude);
                var mapIntent = new Intent(Intent.ActionView, geoUri);
                StartActivity(mapIntent);
            };

            B_SiteCalendar.Click += (sender, e) => 
                StartActivity(new Intent(this, typeof(A_SiteCalendar)));

            CB_PreferedSite.CheckedChange += (sender, e) => 
            {
                // for all users, save this in our list so that the map reflects the change
                if ((LoggedInUser != null) && LoggedInUser.HasVolunteer)
                {
                    PB_Busy.Visibility = ViewStates.Visible;
                    EnableUI(false);

                    if (CB_PreferedSite.Checked)
                    {
                        if (!LoggedInUser.PreferredSiteSlugs.Contains(SelectedSite.Slug))
                            LoggedInUser.PreferredSiteSlugs.Add(SelectedSite.Slug);
                    }
                    else
                    {
                        if (LoggedInUser.PreferredSiteSlugs.Contains(SelectedSite.Slug))
                            LoggedInUser.PreferredSiteSlugs.Remove(SelectedSite.Slug);
                    }


                    Task.Run(async () =>
                    {
                        C_IOResult ior = await Global.UpdateUserFields(LoggedInUser.ToJsonAsJsonBuilder(), LoggedInUser, LoggedInUser.Token);

                        void p()
                        {
                            PB_Busy.Visibility = ViewStates.Gone;
                            EnableUI(true);

                            if (!ior.Success)
                            {
                                C_MessageBox mbox = new C_MessageBox(this, "Error", "Unable to save the save preferences.", E_MessageBoxButtons.Ok);
                                mbox.Show();
                            }
                            else
                            {
                                if (CB_PreferedSite.Checked)
                                {
                                    Settings.AddPreferedSite(SelectedSite.Slug);
                                    Settings.Save();
                                }
                                else
                                {
                                    Settings.RemovePreferedSite(SelectedSite.Slug);
                                    Settings.Save();
                                }
                            }
                        }
                        RunOnUiThread(p);

                    });
                }
                else
                {
                    if (CB_PreferedSite.Checked)
                    {
                        Settings.AddPreferedSite(SelectedSite.Slug);
                        Settings.Save();
                    }
                    else
                    {
                        Settings.RemovePreferedSite(SelectedSite.Slug);
                        Settings.Save();
                    }
                }
            };
            EnableUI(true);
        }

        public override void OnBackPressed()
        {
            if (UIIsEnabled)
                StartActivity(new Intent(this, typeof(A_SitesMap)));
        }

        bool UIIsEnabled;
        private void EnableUI(bool en)
        {
            UIIsEnabled = en;
            B_Directions.Enabled = en;
            B_SiteCalendar.Enabled = en;
            CB_PreferedSite.Enabled = en;
        }

        private async Task<bool> DoLogin()
        {
            C_IOResult ior = await Global.PerformLogin(Settings.UserEmail, Settings.UserPassword);

            if (ior.Success && (ior.User != null) && ior.User.HasVolunteer)
            {
                Global.LoggedInUserId = ior.User.id;
                Global.SelectedUser = ior.User;
            }

            return ior.Success;
        }
    }
}
