using System;
using System.Threading.Tasks;
using System.Collections.Generic;

using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using Android.Views;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_AdminSiteContactAndNotes")]
    public class A_AdminSiteContactAndNotes : Activity
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        TextView L_SiteName;
        EditText TB_ContactName;
        EditText TB_ContactPhone;
        EditText TB_Notes;
        Button B_Save;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            SetContentView(Resource.Layout.ContactAndNotes);

            TB_ContactName = FindViewById<EditText>(Resource.Id.TB_ContactName);
            TB_ContactPhone = FindViewById<EditText>(Resource.Id.TB_ContactPhone);
            TB_Notes = FindViewById<EditText>(Resource.Id.TB_Notes);
            B_Save = FindViewById<Button>(Resource.Id.B_Save);
            L_SiteName = FindViewById<TextView>(Resource.Id.L_SiteName);

            C_Common.SetViewColors(this, Resource.Id.V_AdminSiteContactAndNotes);

            B_Save.Click += (sender, e) => 
            {
                SaveContactAndNotes();
                StartActivity(new Intent(this, typeof(A_AdminSite)));
            };

            L_SiteName.Text = Global.SelectedSiteTemp.Name;

            TB_ContactName.Text = Global.SelectedSiteTemp.ContactName;
            TB_ContactPhone.Text = Global.SelectedSiteTemp.ContactPhone;
            TB_Notes.Text = Global.SelectedSiteTemp.Notes;
        }

        public override void OnBackPressed()
        {
            SaveContactAndNotes();
            StartActivity(new Intent(this, typeof(A_AdminSite)));
        }

        private void SaveContactAndNotes()
        {
            Global.SelectedSiteTemp.ContactName = TB_ContactName.Text;
            Global.SelectedSiteTemp.ContactPhone = TB_ContactPhone.Text;
            Global.SelectedSiteTemp.Notes = TB_Notes.Text;

            Global.SelectedSiteTemp.Dirty = true;
        }
    }
}
