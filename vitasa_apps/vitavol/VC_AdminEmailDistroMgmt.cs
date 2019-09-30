using System;
using UIKit;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;
using static zsquared.C_MessageBox;

using zsquared;

namespace vitavol
{
    public partial class VC_AdminEmailDistroMgmt : UIViewController
    {

        C_Global Global;
        C_VitaUser LoggedInUser;

        C_TableSource<C_VitaUser> UsersListTableSource;
        C_ItemPicker<E_VitaUserRoles> UserRolePicker;
        List<E_VitaUserRoles> UserRoles;

        public VC_AdminEmailDistroMgmt (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            B_Back.TouchUpInside += (object sender, EventArgs e) => 
                PerformSegue("Segue_AdminEmailDistroMgmtToAdminMenu", this);
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);

            UserRoles = new List<E_VitaUserRoles>
            {
                E_VitaUserRoles.All,
                E_VitaUserRoles.Volunteer,
                E_VitaUserRoles.SiteCoordinator,
                E_VitaUserRoles.Admin
            };
            UserRolePicker = new C_ItemPicker<E_VitaUserRoles>(TB_WhichUsers, UserRoles);
            UserRolePicker.SetSelection(E_VitaUserRoles.Admin);
            UserRolePicker.PickerDone += (object sender, C_ItemPicker<E_VitaUserRoles>.C_ItemPickerSelect<E_VitaUserRoles> e) => 
            {
                List<C_VitaUser> ausers = Global.GetAllUsersNoCache();
                List<C_VitaUser> selUsers = GetUsersFiltered(ausers, UserRolePicker.Selection);
                selUsers.Sort(C_VitaUser.CompareByName);

                UsersListTableSource.List = selUsers;
                LV_Sites.ReloadData();
            };

            L_Title.Text = Global.EmailDistroType == E_DistroType.Feedback ? "Email Distribution - Feedback" : "Email Distribution - New User";

            AI_Busy.StartAnimating();
            EnableUI(false);

            Task.Run(async () => 
            {
                List<C_VitaUser> users = await Global.FetchAllUsers(LoggedInUser.Token);

                List<C_VitaUser> selUsers = GetUsersFiltered(users, UserRolePicker.Selection);
                selUsers.Sort(C_VitaUser.CompareByName);

                void p()
                {
                    AI_Busy.StopAnimating();
                    EnableUI(true);

                    UsersListTableSource = new C_TableSource<C_VitaUser>(this, LV_Sites, selUsers, "adminemaildistromgmt");
                    UsersListTableSource.GetTextLabel += (object sender, C_TableSource<C_VitaUser>.TableSourceEventArgs<C_VitaUser> args) => 
                    {
                        C_VitaUser wi = args.Item;
                        return wi.Name;
                    };
                    UsersListTableSource.GetDetailTextLabel += (object sender, C_TableSource<C_VitaUser>.TableSourceEventArgs<C_VitaUser> args) => 
                    {
                        C_VitaUser u = args.Item;
                        return u.Certification + " [" + u.RolesSummary() + "]";
                    };
                    UsersListTableSource.IncludeSwitch += (object sender, C_TableSource<C_VitaUser>.TableSourceEventArgs<C_VitaUser> args) => 
                    {
                        // find out if this user is in the email list already
                        return Global.EmailDistroType == E_DistroType.Feedback ? args.Item.SubscribeEmailFeedback : args.Item.SubscribeEmailNewUser;
                    };
                    UsersListTableSource.SwitchValueChanged += (object sender, C_TableSource<C_VitaUser>.TableSourceEventArgs<C_VitaUser> args) => 
                    {
                        if (Global.EmailDistroType == E_DistroType.Feedback)
                            args.Item.SubscribeEmailFeedback = args.SwitchState;
                        else if (Global.EmailDistroType == E_DistroType.NewUser)
                            args.Item.SubscribeEmailNewUser = args.SwitchState;

                        AI_Busy.StartAnimating();
                        EnableUI(false);

                        Task.Run(async () =>
                        {
                            C_JsonBuilder jb = new C_JsonBuilder();
                            jb.Add(args.Item.SubscribeEmailNewUser, C_VitaUser.N_SubscribeEmailNewUser);
                            jb.Add(args.Item.SubscribeEmailFeedback, C_VitaUser.N_SubscribeEmailFeedback);

                            C_IOResult ior1 = await Global.UpdateUserFields(jb, args.Item, LoggedInUser.Token);

                            async void p1()
                            {
                                AI_Busy.StopAnimating();
                                EnableUI(true);

                                if (!ior1.Success)
                                {
                                    E_MessageBoxResults mbres = await MessageBox(this,
                                        "Error",
                                        "Unable to update the email distribution list.",
                                         E_MessageBoxButtons.Ok);
                                }
                            }
                            UIApplication.SharedApplication.InvokeOnMainThread(p1);
                        });
                    };
                    LV_Sites.Source = UsersListTableSource;
                    LV_Sites.ReloadData();
                }
                UIApplication.SharedApplication.InvokeOnMainThread(p);
            });
        }

        private void EnableUI(bool en)
        {
            C_Common.EnableUI(View, en);
        }

        private List<C_VitaUser> GetUsersFiltered(List<C_VitaUser> users, E_VitaUserRoles role)
        {
            var ou = users.Where(u => (role == E_VitaUserRoles.All) || u.Roles.Contains(role));

            return ou.ToList();
        }
    }
}