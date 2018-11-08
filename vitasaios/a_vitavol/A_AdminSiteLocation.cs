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

            B_Done.Click += (sender, e) => 
            {
                SaveLocation();

                StartActivity(new Intent(this, typeof(A_AdminSite)));
            };

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

            StateSpinner = new C_SPinnerHelper<string>(this, SP_State, C_Global.States.ToList());
            StateSpinner.SetValue(Global.SelectedSiteTemp.State);

            TB_Name.Text = Global.SelectedSiteTemp.Name;
            TB_Street.Text = Global.SelectedSiteTemp.Street;
            TB_City.Text = Global.SelectedSiteTemp.City;
            TB_Zip.Text = Global.SelectedSiteTemp.Zip;

            TB_Latitude.Text = Global.SelectedSiteTemp.Latitude;
            TB_Longitude.Text = Global.SelectedSiteTemp.Longitude;

            L_SiteName.Text = Global.SelectedSiteTemp.Name;
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

        public override void OnBackPressed()
        {
            SaveLocation();
            StartActivity(new Intent(this, typeof(A_AdminSite)));
        }

        private void EnableUI(bool en)
        {
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
