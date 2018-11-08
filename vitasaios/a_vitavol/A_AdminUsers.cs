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
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_AdminUsers")]
    public class A_AdminUsers : Activity
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        Button B_NewUser;
        Spinner SP_TypeOfUser;
        ListView LV_Users;
        ProgressBar PB_Busy;

        List<E_VitaUserRoles> UserRoles;
        List<C_VitaUser> OurUsers;
        C_ListViewHelper<C_VitaUser> UsersAdapter;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            SetContentView(Resource.Layout.AdminUsers);

            B_NewUser = FindViewById<Button>(Resource.Id.B_NewUser);
            SP_TypeOfUser = FindViewById<Spinner>(Resource.Id.SP_WhichUsers);
            LV_Users = FindViewById<ListView>(Resource.Id.LV_Users);
            PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);

            C_Common.SetViewColors(this, Resource.Id.V_AdminUsers);

            B_NewUser.Click += (sender, e) => 
            {
                Global.SelectedUser = null;
                StartActivity(new Intent(this, typeof(A_AdminUser)));
            };

            SP_TypeOfUser.ItemSelected += (object sender, AdapterView.ItemSelectedEventArgs e) => 
            {
                int pos = e.Position;
                E_VitaUserRoles userrole = UserRoles[pos];

                List<C_VitaUser> allUsers = Global.GetAllUsersNoCache();
                var ou = allUsers.Where(u => (userrole == E_VitaUserRoles.All) || (u.Roles.Contains(userrole)));
                List<C_VitaUser> selUsers = ou.ToList();
                selUsers.Sort(C_VitaUser.CompareByNameToLower);

                StartLV(selUsers);
            };

            LV_Users.ItemClick += (object sender, AdapterView.ItemClickEventArgs e) => 
            {
                Global.SelectedUser = UsersAdapter.Items[e.Position];
                Global.SelectedUser.Dirty = false;
                Global.SelectedUserTemp = null;

                StartActivity(new Intent(this, typeof(A_AdminUser)));
            };

            UserRoles = new List<E_VitaUserRoles>
            {
                E_VitaUserRoles.All,
                E_VitaUserRoles.Volunteer,
                E_VitaUserRoles.SiteCoordinator,
                E_VitaUserRoles.Admin
            };

            PB_Busy.Visibility = ViewStates.Visible;
            EnableUI(false);

            Task.Run(async () =>
            {
                OurUsers = await Global.FetchAllUsers(LoggedInUser.Token);
                OurUsers.Sort(C_VitaUser.CompareByNameToLower);

                void p()
                {
                    PB_Busy.Visibility = ViewStates.Gone;
                    EnableUI(true);

                    StartLV(OurUsers);

                    ArrayAdapter UserRolesAdapter = new ArrayAdapter(this, Resource.Layout.SpinnerItem, UserRoles);
                    UserRolesAdapter.SetDropDownViewResource(Resource.Layout.SpinnerItem);
                    SP_TypeOfUser.Adapter = UserRolesAdapter;
                }
                RunOnUiThread(p);
            });
        }

        private void StartLV(List<C_VitaUser> userList)
        {
            UsersAdapter = new C_ListViewHelper<C_VitaUser>(this, LV_Users, userList);
            UsersAdapter.GetTextLabel += (sender, args) =>
            {
                C_VitaUser wi = args.Item;
                return wi.Name;
            };
            UsersAdapter.GetDetailTextLabel += (sender, args) =>
            {
                C_VitaUser u = args.Item;
                return u.Certification + " [" + u.RolesSummary() + "]";
            };
        }

        public override void OnBackPressed() =>
            StartActivity(new Intent(this, typeof(A_AdminMenu)));

        private void EnableUI(bool en)
        {
            B_NewUser.Enabled = en;
            SP_TypeOfUser.Enabled = en;
            LV_Users.Enabled = en;
        }
    }
}
