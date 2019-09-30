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
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_AdminEmailDistroMgmt")]
    public class A_AdminEmailDistroMgmt : Activity
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        TextView L_MainTitle;
        ProgressBar PB_Busy;
        Spinner SP_WhichUsers;
        ListView LV_Users;

        C_SPinnerHelper<E_VitaUserRoles> UserRoleHelper;
        C_ListViewHelper<C_VitaUser> UsersListHelper;

        List<E_VitaUserRoles> UserRoles;

        E_DistroType DistroType;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            SetContentView(Resource.Layout.AdminEmailDistroMgmt);

            L_MainTitle = FindViewById<TextView>(Resource.Id.L_MainTitle);
            PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);
            SP_WhichUsers = FindViewById<Spinner>(Resource.Id.SP_WhichUsers);
            LV_Users = FindViewById<ListView>(Resource.Id.LV_Users);

            C_Common.SetViewColors(this, Resource.Id.V_AdminEmailDistroMgmt);

            string emailtype = Intent.Extras.GetString("emailtype");
            DistroType = emailtype == "feedback" ? E_DistroType.Feedback : E_DistroType.NewUser;
            L_MainTitle.Text = emailtype == "feedback" ? "Email Distribution - Feedback" : "Email Distribution - New User";

            UserRoles = new List<E_VitaUserRoles>
            {
                E_VitaUserRoles.All,
                E_VitaUserRoles.Volunteer,
                E_VitaUserRoles.SiteCoordinator,
                E_VitaUserRoles.Admin
            };

            UserRoleHelper = new C_SPinnerHelper<E_VitaUserRoles>(this, SP_WhichUsers, UserRoles);
            UserRoleHelper.SetValue(E_VitaUserRoles.All);
            UserRoleHelper.ItemSelected += (object sender, SpinnerEventArgs<E_VitaUserRoles> args) => 
            {
                if (UsersListHelper != null) // only at init time
                {
                    List<C_VitaUser> ausers = Global.GetAllUsersNoCache();
                    List<C_VitaUser> selUsers = GetUsersFiltered(ausers, UserRoleHelper.GetValue());
                    selUsers.Sort(C_VitaUser.CompareByName);

                    StartLV(selUsers);
                }
            };

            PB_Busy.Visibility = ViewStates.Visible;
            EnableUI(false);
            Task.Run(async () =>
            {
                List<C_VitaUser> users = await Global.FetchAllUsers(LoggedInUser.Token);

                List<C_VitaUser> selUsers = GetUsersFiltered(users, UserRoleHelper.GetValue());
                selUsers.Sort(C_VitaUser.CompareByName);

                void p()
                {
                    PB_Busy.Visibility = ViewStates.Gone;
                    EnableUI(true);

                    StartLV(selUsers);
                }
                RunOnUiThread(p);
            });
        }

        private void StartLV(List<C_VitaUser> userList)
        {
            UsersListHelper = new C_ListViewHelper<C_VitaUser>(this, LV_Users, userList);
            UsersListHelper.GetTextLabel += (object sender, ListAdapterEventArgs<C_VitaUser> args) =>
            {
                C_VitaUser wi = args.Item;
                return wi.Name;
            };
            UsersListHelper.GetDetailTextLabel += (sender, args) =>
            {
                C_VitaUser u = args.Item;
                return u.Certification + " [" + u.RolesSummary() + "]";
            };
            UsersListHelper.IncludeSwitch += (object sender, ListAdapterEventArgs<C_VitaUser> args) =>
            {
                // find out if this user is in the email list already
                return DistroType == E_DistroType.Feedback ? args.Item.SubscribeEmailFeedback : args.Item.SubscribeEmailNewUser;
            };
            UsersListHelper.SwitchValueChanged += (object sender, ListAdapterEventArgs<C_VitaUser> args) =>
            {
                if (DistroType == E_DistroType.Feedback)
                    args.Item.SubscribeEmailFeedback = args.SwitchState;
                else if (DistroType == E_DistroType.NewUser)
                    args.Item.SubscribeEmailNewUser = args.SwitchState;

                PB_Busy.Visibility = ViewStates.Visible;
                EnableUI(false);

                Task.Run(async () =>
                {
                    C_JsonBuilder jb = new C_JsonBuilder();
                    jb.Add(args.Item.SubscribeEmailNewUser, C_VitaUser.N_SubscribeEmailNewUser);
                    jb.Add(args.Item.SubscribeEmailFeedback, C_VitaUser.N_SubscribeEmailFeedback);

                    C_IOResult ior1 = await Global.UpdateUserFields(jb, args.Item, LoggedInUser.Token);

                    void p1()
                    {
                        PB_Busy.Visibility = ViewStates.Gone;
                        EnableUI(true);

                        if (!ior1.Success)
                        {
                            C_MessageBox mbox = new C_MessageBox(this,
                             "Error",
                             "Unable to update the email distribution list.",
                             E_MessageBoxButtons.Ok);
                            mbox.Show();
                        }
                    }
                    RunOnUiThread(p1);
                });
            };
        }


        private void EnableUI(bool en)
        {
            SP_WhichUsers.Enabled = en;
            LV_Users.Enabled = en;
        }

        private List<C_VitaUser> GetUsersFiltered(List<C_VitaUser> users, E_VitaUserRoles role)
        {
            var ou = users.Where(u => (role == E_VitaUserRoles.All) || u.Roles.Contains(role));

            return ou.ToList();
        }

        public override void OnBackPressed() =>
            StartActivity(new Intent(this, typeof(A_AdminMenu)));
    }
}
