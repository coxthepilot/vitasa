using System.Threading.Tasks;
using System.Linq;

using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using Android.Views;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_AdminSiteLocation", WindowSoftInputMode = SoftInput.StateHidden)]
    public class A_AdminSiteLocation : Activity
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        TextView L_SiteName;

        EditText TB_Name;
        EditText TB_Street;
        EditText TB_City;
        Spinner SP_State;
        EditText TB_Zip;
        EditText TB_Latitude;
        EditText TB_Longitude;

        Button B_GetLatLong;
        Button B_Done;

        ProgressBar PB_Busy;

        C_SPinnerHelper<string> StateSpinner;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            SetContentView(Resource.Layout.AdminSiteLocation);

            TB_Name = FindViewById<EditText>(Resource.Id.TB_Name);
            TB_Street = FindViewById<EditText>(Resource.Id.TB_Street);
            TB_City = FindViewById<EditText>(Resource.Id.TB_City);
            SP_State = FindViewById<Spinner>(Resource.Id.SP_State);
            TB_Zip = FindViewById<EditText>(Resource.Id.TB_Zip);
            TB_Latitude = FindViewById<EditText>(Resource.Id.TB_Latitude);
            TB_Longitude = FindViewById<EditText>(Resource.Id.TB_Longitude);
            B_GetLatLong = FindViewById<Button>(Resource.Id.B_GetLatLong);
            B_Done = FindViewById<Button>(Resource.Id.B_Save);
            PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);
            L_SiteName = FindViewById<TextView>(Resource.Id.L_SiteName);

            C_Common.SetViewColors(this, Resource.Id.V_AdminSiteLocation);

            async void doneHandler(object sender, System.EventArgs e)
            {
                await DoTheSave();
                //SaveLocation();

                //StartActivity(new Intent(this, typeof(A_AdminSite)));
            }
            B_Done.Click += doneHandler;

            B_GetLatLong.Click += (sender, e) => 
            {
                PB_Busy.Visibility = ViewStates.Visible;
                EnableUI(false);

                Task.Run(() => 
                {
                    string address = TB_Street.Text + "," + TB_City.Text + "," + StateSpinner.GetValue() + "," + TB_Zip.Text;
                    C_GeoCode.GeoPoint loc = C_GeoCode.GetLocationFromAddress(this, address);

                    void p1()
                    {
                        TB_Latitude.Text = loc.Latitude.ToString();
                        TB_Longitude.Text = loc.Longitude.ToString();

                        PB_Busy.Visibility = ViewStates.Gone;
                        EnableUI(true);
                    }
                    RunOnUiThread(p1);
                });
            };

            StateSpinner = new C_SPinnerHelper<string>(this, SP_State, C_Global.StateNames.ToList());
            StateSpinner.SetValue(Global.SelectedSiteTemp.State);

            TB_Name.Text = Global.SelectedSiteTemp.Name;
            TB_Street.Text = Global.SelectedSiteTemp.Street;
            TB_City.Text = Global.SelectedSiteTemp.City;
            TB_Zip.Text = Global.SelectedSiteTemp.Zip;

            TB_Latitude.Text = Global.SelectedSiteTemp.Latitude;
            TB_Longitude.Text = Global.SelectedSiteTemp.Longitude;

            L_SiteName.Text = Global.SelectedSiteTemp.Name;
            EnableUI(true);
        }

        public override void OnBackPressed()
        {
            if (!UIIsEnabled)
                return;

            if (TB_Name.Text.Length == 0)
            {
                StartActivity(new Intent(this, typeof(A_AdminSite)));
                return;
            }

            if (!ChangesMade())
            {
                StartActivity(new Intent(this, typeof(A_AdminSite)));
                return;
            }

            C_MessageBox mbox1 = 
                new C_MessageBox(this,
                                 "Change",
                                 "Changes were made. Save?",
                                 E_MessageBoxButtons.YesNoCancel);
            mbox1.Show();
            async void mboxHandler(object sender, C_MessageBoxEventArgs args)
            {
                if (args.Result == E_MessageBoxResults.Cancel)
                    return;

                if (args.Result != E_MessageBoxResults.Yes)
                {
                    StartActivity(new Intent(this, typeof(A_AdminSite)));
                    return;
                }

                await DoTheSave();
            }
            mbox1.Dismissed += mboxHandler;
        }

        private async Task<bool> DoTheSave()
        {
            if (TB_Name.Text.Length < 4)
            {
                C_MessageBox mbox1 =
                    new C_MessageBox(this,
                                     "Error",
                                     "A site name is required (3 or more characters).",
                                     E_MessageBoxButtons.Ok);
                mbox1.Show();
                return true;
            }

            if (Global.SelectedSiteTemp.id == -1)
            {
                var ou = Global.SiteCache.Where(s => s.Name.ToLower() == TB_Name.Text.ToLower());
                if (ou.Any())
                {
                    C_MessageBox mbox1 =
                        new C_MessageBox(this,
                                         "Error",
                                         "A site name with that name already exists. Choose another name.",
                                         E_MessageBoxButtons.Ok);
                    mbox1.Show();
                    return true;
                }
            }

            SaveLocation();

            // if this a new site, go ahead and do the create so that the other functions can work (like calendar)
            if (Global.SelectedSiteTemp.id == -1)
            {
                C_IOResult ior = await Global.CreateSite(Global.SelectedSiteTemp, Global.SelectedSiteTemp.ToJson(false), LoggedInUser.Token);

                if (!ior.Success)
                {
                    C_MessageBox mbox1 =
                        new C_MessageBox(this,
                                         "Error",
                                         "Unable to create the site.",
                                         E_MessageBoxButtons.Ok);
                    mbox1.Show();
                    return true;
                }
                else
                {
                    Global.SelectedSiteTemp = ior.Site;
                    Global.SelectedSiteSlug = ior.Site.Slug;
                    Global.SelectedSiteName = ior.Site.Name;
                }
            }

            StartActivity(new Intent(this, typeof(A_AdminSite)));
            return true;
        }

        private void SaveLocation()
        {
            Global.SelectedSiteTemp.Name = TB_Name.Text;
            Global.SelectedSiteTemp.Street = TB_Street.Text;
            Global.SelectedSiteTemp.City = TB_City.Text;
            Global.SelectedSiteTemp.Zip = TB_Zip.Text;

            Global.SelectedSiteTemp.State = StateSpinner.GetValue();

            Global.SelectedSiteTemp.Latitude = TB_Latitude.Text;
            Global.SelectedSiteTemp.Longitude = TB_Longitude.Text;

            Global.SelectedSiteTemp.Dirty = true;
        }

        private bool ChangesMade()
        {
            bool c_name = Global.SelectedSiteTemp.Name != TB_Name.Text;
            bool c_street = Global.SelectedSiteTemp.Street != TB_Street.Text;
            bool c_city = Global.SelectedSiteTemp.City != TB_City.Text;
            bool c_state = Global.SelectedSiteTemp.State != StateSpinner.GetValue();
            bool c_zip = Global.SelectedSiteTemp.Zip != TB_Zip.Text;
            bool c_lat = Global.SelectedSiteTemp.Latitude != TB_Latitude.Text;
            bool c_long = Global.SelectedSiteTemp.Longitude != TB_Longitude.Text;

            return c_name || c_street || c_city || c_state || c_zip || c_lat || c_long;
        }

        bool UIIsEnabled;
        private void EnableUI(bool en)
        {
            UIIsEnabled = en;
            SP_State.Enabled = en;
            TB_Zip.Enabled = en;
            TB_City.Enabled = en;
            TB_Name.Enabled = en;
            TB_Street.Enabled = en;
            TB_Latitude.Enabled = en;
            TB_Longitude.Enabled = en;
            B_Done.Enabled = en;
            B_GetLatLong.Enabled = en;
        }
    }
}
