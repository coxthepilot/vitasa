using System.Collections.Generic;

using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using Android.Views;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_AdminSiteDetails")]
    public class A_AdminSiteDetails : Activity
    {
        C_Global Global;

        TextView L_SiteName;

        CheckBox CB_Mobile;
        CheckBox CB_Dropoff;
        CheckBox CB_Express;
        CheckBox CB_MFT;
        CheckBox CB_InPerson;

        Button B_Done;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;

            SetContentView(Resource.Layout.AdminSiteDetails);

            CB_Mobile = FindViewById<CheckBox>(Resource.Id.CB_Mobile);
            CB_Dropoff = FindViewById<CheckBox>(Resource.Id.CB_Dropoff);
            CB_Express = FindViewById<CheckBox>(Resource.Id.CB_Express);
            CB_MFT = FindViewById<CheckBox>(Resource.Id.CB_MFT);
            CB_InPerson = FindViewById<CheckBox>(Resource.Id.CB_InPerson);
            B_Done = FindViewById<Button>(Resource.Id.B_Save);
            L_SiteName = FindViewById<TextView>(Resource.Id.L_SiteName);

            C_Common.SetViewColors(this, Resource.Id.V_AdminSiteDetails);

            B_Done.Click += (sender, e) => 
            {
                SaveDetails();
                StartActivity(new Intent(this, typeof(A_AdminSite)));
            };

            L_SiteName.Text = Global.SelectedSiteTemp.Name;

            CB_Mobile.Checked = Global.SelectedSiteTemp.SiteType == E_SiteType.Mobile;
            CB_MFT.Checked = Global.SelectedSiteTemp.SiteCapabilities.Contains(E_SiteCapabilities.MFT);
            CB_Dropoff.Checked = Global.SelectedSiteTemp.SiteCapabilities.Contains(E_SiteCapabilities.DropOff);
            CB_Express.Checked = Global.SelectedSiteTemp.SiteCapabilities.Contains(E_SiteCapabilities.Express);
            CB_InPerson.Checked = Global.SelectedSiteTemp.SiteCapabilities.Contains(E_SiteCapabilities.InPersonTaxPrep);
        }

        public override void OnBackPressed()
        {
            SaveDetails();
            StartActivity(new Intent(this, typeof(A_AdminSite)));
        }

        private void SaveDetails()
        {
            Global.SelectedSiteTemp.SiteType = CB_Mobile.Checked ? E_SiteType.Mobile : E_SiteType.Fixed;

            Global.SelectedSiteTemp.SiteCapabilities = new List<E_SiteCapabilities>();
            if (CB_MFT.Checked) Global.SelectedSiteTemp.SiteCapabilities.Add(E_SiteCapabilities.MFT);
            if (CB_Dropoff.Checked) Global.SelectedSiteTemp.SiteCapabilities.Add(E_SiteCapabilities.DropOff);
            if (CB_Express.Checked) Global.SelectedSiteTemp.SiteCapabilities.Add(E_SiteCapabilities.Express);
            if (CB_InPerson.Checked) Global.SelectedSiteTemp.SiteCapabilities.Add(E_SiteCapabilities.InPersonTaxPrep);

            Global.SelectedSiteTemp.Dirty = true;
        }
    }
}
