using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;

using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using Android.Views;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_AdminSiteCoord")]
    public class A_AdminSiteCoord : Activity
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        List<C_VitaUser> AllSiteCoordinators;

        TextView L_SiteName;
        Button B_Done;
        ListView LV_Coordinators;
        ProgressBar PB_Busy;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            SetContentView(Resource.Layout.AdminSiteCoord);

            L_SiteName = FindViewById<TextView>(Resource.Id.L_SiteName);
            B_Done = FindViewById<Button>(Resource.Id.B_Save);
            LV_Coordinators = FindViewById<ListView>(Resource.Id.LV_Coordinators);
            PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);

            C_Common.SetViewColors(this, Resource.Id.V_AdminSiteCoord);

            B_Done.Click += (sender, e) =>
            {
                SaveSiteCoord();

                StartActivity(new Intent(this, typeof(A_AdminSite)));
            };

            L_SiteName.Text = Global.SelectedSiteTemp.Name;

            PB_Busy.Visibility = ViewStates.Visible;
            EnableUI(false);
            Task.Run(async () =>
            {
                List<C_VitaUser> users = await Global.FetchAllUsers(LoggedInUser.Token);

                // filter the list to only site coordinators
                AllSiteCoordinators = users.Where(u => u.HasSiteCoordinator).ToList();
                AllSiteCoordinators.Sort(C_VitaUser.CompareByName);

                // set the flag state for each user; set to true if that user is a site coord for our site
                foreach (C_VitaUser u in AllSiteCoordinators)
                {
                    bool found = Global.SelectedSiteTemp.SiteCoordinatorsIds.Contains(u.id);
                    u.IV_Flag = u.Flag = found;
                }

                void p()
                {
                    PB_Busy.Visibility = ViewStates.Gone;
                    EnableUI(true);

                    C_ListViewHelper<C_VitaUser> la = new C_ListViewHelper<C_VitaUser>(this, LV_Coordinators, AllSiteCoordinators);
                    la.GetTextLabel += (sender, args) =>
                    {
                        C_VitaUser sc = args.Item;
                        return sc.Name;
                    };
                    la.GetDetailTextLabel += (sender, args) =>
                    {
                        C_VitaUser sc = args.Item;
                        return sc.Phone + " " + sc.Email;
                    };
                    la.IncludeSwitch += (object sender, ListAdapterEventArgs<C_VitaUser> args) => 
                    {
                        C_VitaUser sc = args.Item;

                        return sc.Flag;
                    };
                    la.SwitchValueChanged += (object sender, ListAdapterEventArgs<C_VitaUser> args) => 
                    {
                        C_VitaUser sc = args.Item;
                        sc.Flag = args.SwitchState;
                    };
                }
                RunOnUiThread(p);
            });
        }

        public override void OnBackPressed()
        {
            SaveSiteCoord();

            StartActivity(new Intent(this, typeof(A_AdminSite)));
        }

        private void SaveSiteCoord()
        {
            // get the list from the users that have the flag set
            List<C_VitaUser> flaggedUsers = AllSiteCoordinators.Where(u => u.Flag).ToList();
            // convert to a list of user ids
            List<int> flaggedUserIds = flaggedUsers.Select(u => u.id).ToList();
            // convert to a list of user names
            List<string> flaggedUserNames = flaggedUsers.Select(u => u.Name).ToList();

            Global.SelectedSiteTemp.SiteCoordinatorsIds = flaggedUserIds;
            Global.SelectedSiteTemp.SiteCoordinatorNames = flaggedUserNames;

            Global.SelectedSiteTemp.Dirty = true;
        }

        private void EnableUI(bool en)
        {
            B_Done.Enabled = en;
            LV_Coordinators.Enabled = en;
        }
    }
}
