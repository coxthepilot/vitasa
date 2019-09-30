using System;
using System.Collections.Generic;

using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_AdminMenu")]
    public class A_AdminMenu : Activity
    {
        enum E_AdminMenu { Users, Sites, Notifications, Suggestions, Mobile, Settings }

        C_Global Global;

        ListView LV_Options;
        Button B_Logout;

        List<E_AdminMenu> MainMenu;

        C_PersistentSettings Settings;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;

            Settings = new C_PersistentSettings(this);

            SetContentView(Resource.Layout.AdminMenu);

            LV_Options = FindViewById<ListView>(Resource.Id.LV_Options);
            B_Logout = FindViewById<Button>(Resource.Id.B_Logout);

            C_Common.SetViewColors(this, Resource.Id.V_AdminMenu);
            B_Logout.SetBackgroundColor(C_Common.Color_LogoutButton);

            MainMenu = new List<E_AdminMenu>();
            foreach (E_AdminMenu eam in Enum.GetValues(typeof(E_AdminMenu)))
                MainMenu.Add(eam);

            B_Logout.Click += (sender, e) => 
            {
                Global.LoggedInUserId = -1;

                Settings.UserEmail = "";
                Settings.UserPassword = "";
                Settings.Save();

                StartActivity(new Intent(this, typeof(MainActivity)));
            };

            LV_Options.ItemClick += (object sender, AdapterView.ItemClickEventArgs e) =>  
            {
                E_AdminMenu menuSelected = MainMenu[e.Position];

                Intent newIntent = null;

                Global.ViewCameFrom = E_ViewCameFrom.Admin;
                switch (menuSelected)
                {
                    case E_AdminMenu.Users:
                        newIntent = new Intent(this, typeof(A_AdminUsers));
                        break;
                    case E_AdminMenu.Sites:
                        newIntent = new Intent(this, typeof(A_AdminSites));
                        break;
                    case E_AdminMenu.Notifications:
                        newIntent = new Intent(this, typeof(A_AdminNotifications));
                        break;
                    case E_AdminMenu.Suggestions:
                        newIntent = new Intent(this, typeof(A_AdminSuggestions));
                        break;
                    case E_AdminMenu.Settings:
                        newIntent = new Intent(this, typeof(A_VolEditSettings));
                        break;
                    //case E_AdminMenu.NewFeedbackEmail:
                    //    newIntent = new Intent(this, typeof(A_AdminEmailDistroMgmt));
                    //    Bundle b = new Bundle();
                    //    b.PutString("emailtype", "feedback");
                    //    newIntent.PutExtras(b);
                    //    break;
                    //case E_AdminMenu.NewUserEmail:
                        //newIntent = new Intent(this, typeof(A_AdminEmailDistroMgmt));
                        //Bundle b1 = new Bundle();
                        //b1.PutString("emailtype", "newuser");
                        //newIntent.PutExtras(b1);
                        //break;
                    case E_AdminMenu.Mobile:
                        newIntent = new Intent(this, typeof(A_AdminMobile));
                        break;
                }

                if (newIntent != null)
                    StartActivity(newIntent);
            };

            C_ListViewHelper<E_AdminMenu> la = new C_ListViewHelper<E_AdminMenu>(this, LV_Options, MainMenu);
            la.GetTextLabel += (sender, args) =>
            {
                E_AdminMenu wi = args.Item;
                return Tools.FixCamelCaseDisplay(wi.ToString());
            };
        }

        public override void OnBackPressed() =>
            StartActivity(new Intent(this, typeof(MainActivity)));
    }
}
