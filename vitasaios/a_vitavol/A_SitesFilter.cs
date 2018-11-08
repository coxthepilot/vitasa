using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using Android.Util;

using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Json;

using Android.Gms.Common.Apis;

using Android.Gms.Maps;
using Android.Gms.Maps.Model;
using Android.Gms.Location;
using Android.Gms.Common;
using Android.Locations;
using Android.Views;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_SitesFilter")]
    public class A_SitesFilter : Activity
    {
        C_Global Global;
        List<string> DateValues;
        C_PersistentSettings Settings;

        C_SPinnerHelper<string> DateValuesSpinner;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;

            Settings = new C_PersistentSettings(this);

            SetContentView(Resource.Layout.SitesFilter);

            Spinner SP_Dates = FindViewById<Spinner>(Resource.Id.SP_Dates);
            CheckBox CB_Dropoff = FindViewById<CheckBox>(Resource.Id.CB_Dropoff);
            CheckBox CB_InPerson = FindViewById<CheckBox>(Resource.Id.CB_InPerson);
            CheckBox CB_MFT = FindViewById<CheckBox>(Resource.Id.CB_MFT);
            CheckBox CB_Express = FindViewById<CheckBox>(Resource.Id.CB_Express);
            CheckBox CB_Mobile = FindViewById<CheckBox>(Resource.Id.CB_Mobile);
            Button B_Save = FindViewById<Button>(Resource.Id.B_Save);

            C_Common.SetViewColors(this, Resource.Id.V_SitesFilter);

            B_Save.Click += (sender, e) => 
            {
                Settings.SitesFilter.ClearSiteCapabilities();
                if (CB_Dropoff.Checked)
                    Settings.SitesFilter.AddSiteCapability(E_CapabilitiesFilter.DropOff);
                if (CB_InPerson.Checked)
                    Settings.SitesFilter.AddSiteCapability(E_CapabilitiesFilter.InPerson);
                if (CB_MFT.Checked)
                    Settings.SitesFilter.AddSiteCapability(E_CapabilitiesFilter.MFT);
                if (CB_Express.Checked)
                    Settings.SitesFilter.AddSiteCapability(E_CapabilitiesFilter.Express);
                if (CB_Mobile.Checked)
                    Settings.SitesFilter.AddSiteCapability(E_CapabilitiesFilter.Mobile);

                if (!CB_Dropoff.Checked && !CB_InPerson.Checked && !CB_MFT.Checked && !CB_Express.Checked && !CB_Mobile.Checked)
                    Settings.SitesFilter.AddSiteCapability(E_CapabilitiesFilter.Any);

                int sdix = SP_Dates.SelectedItemPosition;

                Settings.SitesFilter.DateFilter = (E_DateFilter)sdix;
                Settings.Save();

                StartActivity(new Intent(this, typeof(A_SitesMap)));
            };

            // we don't need to log in any local user since that was done in the sitesmap screen
            bool hasMobile =
                (Global.LoggedInUserId != -1)
                && (Global.SelectedUser != null)
                && Global.SelectedUser.HasVolunteer
                && Global.SelectedUser.HasMobile;

            CB_Mobile.Visibility = hasMobile ? ViewStates.Visible : ViewStates.Invisible;

            // populate the selector for the dates and preselect the current value
            DateValues = new List<string> { "Any", "Today", "Tomorrow" };
            for (int i = 2; i != 7; i++)
            {
                C_YMD d = C_YMD.Now.AddDays(i);
                DateValues.Add(d.ToString("dow mmm dd, yyyy"));
            }

            DateValuesSpinner = new C_SPinnerHelper<string>(this, SP_Dates, DateValues);
            int dfix = (int)Settings.SitesFilter.DateFilter;
            DateValuesSpinner.SetValue(DateValues[dfix]);
            DateValuesSpinner.ItemSelected += (object sender, SpinnerEventArgs<string> args) => 
            {
                string res = args.Item;
                if (res == "Any")
                    Settings.SitesFilter.DateFilter = E_DateFilter.AllDays;
                else if (res == "Today")
                    Settings.SitesFilter.DateFilter = E_DateFilter.Today;
                else if (res == "Tomorrow")
                    Settings.SitesFilter.DateFilter = E_DateFilter.Tomorrow;
                else
                {
                    int ix = DateValues.IndexOf(res);
                    switch (ix)
                    {
                        case 3: Settings.SitesFilter.DateFilter = E_DateFilter.TodayP2; break;
                        case 4: Settings.SitesFilter.DateFilter = E_DateFilter.TodayP3; break;
                        case 5: Settings.SitesFilter.DateFilter = E_DateFilter.TodayP4; break;
                        case 6: Settings.SitesFilter.DateFilter = E_DateFilter.TodayP5; break;
                        case 7: Settings.SitesFilter.DateFilter = E_DateFilter.TodayP6; break;
                    }
                }
            };

            // set the values for the switches
            CB_Dropoff.Checked = Settings.SitesFilter.SiteCapabilityContains(E_CapabilitiesFilter.DropOff);
            CB_InPerson.Checked = Settings.SitesFilter.SiteCapabilityContains(E_CapabilitiesFilter.InPerson);
            CB_MFT.Checked = Settings.SitesFilter.SiteCapabilityContains(E_CapabilitiesFilter.MFT);
            CB_Express.Checked = Settings.SitesFilter.SiteCapabilityContains(E_CapabilitiesFilter.Express);

            CB_Mobile.Checked = Settings.SitesFilter.SiteCapabilityContains(E_CapabilitiesFilter.Mobile);
        }

        public override void OnBackPressed() => 
            StartActivity(new Intent(this, typeof(A_SitesMap)));
    }
}
