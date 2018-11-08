using System;
using UIKit;
using System.Threading.Tasks;
using System.Collections.Generic;

using zsquared;

namespace vitavol
{
    public partial class VC_AdminUsers : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        C_ItemPicker<E_VitaUserRoles> RoleItemPicker;

        public VC_AdminUsers (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            B_Back.TouchUpInside += (sender, e) => 
                PerformSegue("Segue_AdminUsersToAdminMenu", this);

            B_NewUser.TouchUpInside += (sender, e) => 
            {
                Global.SelectedUser = null;
                PerformSegue("Segue_AdminUsersToAdminUser", this);
            };

            TB_FilterBy.AddTarget((sender, e) =>
            {
                E_VitaUserRoles role = RoleItemPicker.Selection;

                List<C_VitaUser> allUsers = Global.GetAllUsersNoCache();
                List<C_VitaUser> users = new List<C_VitaUser>();
                foreach (C_VitaUser user in allUsers)
                {
                    if ((role == E_VitaUserRoles.All) || (user.Roles.Contains(role)))
                        users.Add(user);
                }

                SetUserTableSource(users);

            }, UIControlEvent.AllEditingEvents);
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);

            List<E_VitaUserRoles> roles = new List<E_VitaUserRoles>
            {
                E_VitaUserRoles.All,
                E_VitaUserRoles.Volunteer,
                E_VitaUserRoles.SiteCoordinator,
                E_VitaUserRoles.Admin
            };
            RoleItemPicker = new C_ItemPicker<E_VitaUserRoles>(TB_FilterBy, roles);
            RoleItemPicker.SetSelection(E_VitaUserRoles.All);

            AI_Busy.StartAnimating();
            EnableUI(false);

            Task.Run(async () =>
            {
                List<C_VitaUser> users = await Global.FetchAllUsers(LoggedInUser.Token);
                users.Sort(C_VitaUser.CompareByNameToLower);

                void p()
                {
                    AI_Busy.StopAnimating();
                    EnableUI(true);

                    SetUserTableSource(users);
                }
                UIApplication.SharedApplication.InvokeOnMainThread(p);
            });
        }

        private void SetUserTableSource(List<C_VitaUser> users)
        {
            C_TableSource<C_VitaUser> UserTableSource = new C_TableSource<C_VitaUser>(this, TV_Users, users, "usercell");
            UserTableSource.GetTextLabel += (sender, args) =>
            {
                C_VitaUser u = args.Item;
                return u.Name;
            };
            UserTableSource.GetDetailTextLabel += (sender, args) =>
            {
                C_VitaUser u = args.Item;
                return u.Certification + " [" + u.RolesSummary() + "]";
            };
            UserTableSource.Selected += (sender, args) =>
            {
                Global.SelectedUser = args.Item;
                Global.SelectedUser.Dirty = false;
                PerformSegue("Segue_AdminUsersToAdminUser", this);
            };
            TV_Users.BackgroundColor = C_Common.StandardBackground;

            TV_Users.Source = UserTableSource;
            TV_Users.ReloadData();
        }

        private void EnableUI(bool en) =>
            C_Common.EnableUI(View, en);
    }
}