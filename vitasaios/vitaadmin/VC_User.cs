using Foundation;
using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using UIKit;
using System.Linq;

using zsquared;

namespace vitaadmin
{
    public partial class VC_User : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;
        C_VitaUser SelectedUser;

        bool killChanges;

        public VC_User (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            SelectedUser = Global.SelectedUser;

            B_Back.TouchUpInside += async (sender, e) =>
            {
                if (UserDetailsHaveChanged())
                {
                    C_MessageBox.E_MessageBoxResults mbresx = await C_MessageBox.MessageBox(this, "User Changed", "User values have changed and not been saved. Save the changes?", C_MessageBox.E_MessageBoxButtons.YesNoCancel);
                    if (mbresx == C_MessageBox.E_MessageBoxResults.Yes)
                    {
                        C_IOResult ior = await SaveChangedFields();

                        PerformSegue("Segue_UserToUsers", this);
                    }
                    else if (mbresx == C_MessageBox.E_MessageBoxResults.No)
                    {
                        PerformSegue("Segue_UserToUsers", this);
                    }
                }
                else
                    PerformSegue("Segue_UserToUsers", this);
            };

            B_SaveUserDetails.TouchUpInside += async (sender, e) =>
            {
                C_IOResult ior = await SaveChangedFields();
            };

            B_ViewSignups.TouchUpInside += (sender, e) =>
            {
                Global.SelectedUser = SelectedUser;
                Global.ViewCameFrom = E_ViewCameFrom.User;
                PerformSegue("Segue_UserToSignUps", this);
            };

            killChanges = true;
            EnableUI(false);

            TB_Name.Text = SelectedUser.Name;
            TB_Name.AddTarget(TextField_ValueChanged, UIControlEvent.EditingChanged);
            SW_NameChanged.On = false;
            SW_NameChanged.UserInteractionEnabled = false;

            TB_Email.Text = SelectedUser.Email;
            TB_Email.AddTarget(TextField_ValueChanged, UIControlEvent.EditingChanged);
            SW_EmailChanged.On = false;
            SW_EmailChanged.UserInteractionEnabled = false;

            TB_Phone.Text = SelectedUser.Phone;
            TB_Phone.AddTarget(TextField_ValueChanged, UIControlEvent.EditingChanged);
            SW_PhoneChanged.On = false;
            SW_PhoneChanged.UserInteractionEnabled = false;

            SC_Certification.SelectedSegment = SelectedUser.Certification == E_Certification.Basic ? 0 : 1;
            SC_Certification.ValueChanged += TextField_ValueChanged;
            SW_CertificationChanged.On = false;
            SW_CertificationChanged.UserInteractionEnabled = false;

            SW_RolesChanged.On = false;
            SW_RolesChanged.UserInteractionEnabled = false;

            SW_NewUser.On = SelectedUser.HasNewUser;
            SW_NewUser.ValueChanged += Switch_ValueChanged;

            SW_Administrator.On = SelectedUser.HasAdmin;
            SW_Administrator.ValueChanged += Switch_ValueChanged;

            SW_Volunteer.On = SelectedUser.HasVolunteer;
            SW_Volunteer.ValueChanged += Switch_ValueChanged;

            SW_SiteCoordinator.On = SelectedUser.HasSiteCoordinator;
            SW_SiteCoordinator.ValueChanged += Switch_ValueChanged;

            TB_Password1.Text = "";
            TB_Password2.Text = "";
            TB_Password1.AddTarget(PasswordField_ValueChanged, UIControlEvent.EditingChanged);
            TB_Password2.AddTarget(PasswordField_ValueChanged, UIControlEvent.EditingChanged);
            SW_PasswordChanged.On = false;
            SW_PasswordChanged.UserInteractionEnabled = false;

            killChanges = false;

            if (SelectedUser.HasVolunteer)
            {
                var ou = Global.SignUpsList.Where(su => su.UserId == SelectedUser.id);
                List<C_SignUp> ourSignUps = ou.ToList();

                AI_Busy.StartAnimating();

                Task.Run(async () =>
                {
                    bool success = await Global.EnsureShiftsInCacheForSignUps(LoggedInUser.Token, ourSignUps);

                    UIApplication.SharedApplication.InvokeOnMainThread(
                    new Action(() =>
                    {
                        AI_Busy.StopAnimating();

                        C_WorkItemsTableSource ts = new C_WorkItemsTableSource(Global, ourSignUps, SelectedUser);
                        TV_SignUps.Source = ts;
                        TV_SignUps.ReloadData();

                        EnableUI(true);
                    }));
                });
            }
            else if (SelectedUser.HasSiteCoordinator)
            {
                L_SignUps.Text = "Sites Coordinated";
                B_ViewSignups.Hidden = true;

                List<string> sitesNamesCoordinated = new List<string>();
                foreach(C_SiteCoordinated sc in SelectedUser.SitesCoordinated)
                    sitesNamesCoordinated.Add(sc.Name);
                sitesNamesCoordinated.Sort();

                C_SiteNamesTableSource tsn = new C_SiteNamesTableSource(sitesNamesCoordinated);
                TV_SignUps.Source = tsn;
                TV_SignUps.ReloadData();

            EnableUI(true);
            }
            else
            {
                L_SignUps.Hidden = true;
                TV_SignUps.Hidden = true;
                B_ViewSignups.Hidden = true;

            EnableUI(true);
            }
        }

        private void EnableUI(bool en)
        {
            TB_Name.Enabled = en;
            TB_Email.Enabled = en;
            TB_Phone.Enabled = en;
            SC_Certification.Enabled = en;
            SW_NewUser.Enabled = en;
            SW_Administrator.Enabled = en;
            SW_Volunteer.Enabled = en;
            SW_SiteCoordinator.Enabled = en;
            TB_Password1.Enabled = en;
            TB_Password2.Enabled = en;

            B_SaveUserDetails.Enabled = en && UserDetailsHaveChanged();
            B_ViewSignups.Enabled = en && SelectedUser.HasVolunteer;
        }

        private void UpdateUserDetails()
        {
            SelectedUser.Name = TB_Name.Text;
            SelectedUser.Email = TB_Email.Text;
            SelectedUser.Phone = TB_Phone.Text;
            SelectedUser.Certification = SC_Certification.SelectedSegment == 0 ? E_Certification.Basic : E_Certification.Advanced;
            SelectedUser.Roles = new List<E_VitaUserRoles>();
            if (SW_NewUser.On)
                SelectedUser.Roles.Add(E_VitaUserRoles.NewUser);
            if (SW_Administrator.On)
                SelectedUser.Roles.Add(E_VitaUserRoles.Admin);
            if (SW_Volunteer.On)
                SelectedUser.Roles.Add(E_VitaUserRoles.Volunteer);
            if (SW_SiteCoordinator.On)
                SelectedUser.Roles.Add(E_VitaUserRoles.SiteCoordinator);
        }

        void TextField_ValueChanged(object sender, EventArgs e)
        {
            if (killChanges)
                return;

            if (sender is UITextField)
            {
                UITextField uitf = sender as UITextField;

                SW_NameChanged.On |= uitf == TB_Name;
                SW_EmailChanged.On |= uitf == TB_Email;
                SW_PhoneChanged.On |= uitf == TB_Phone;
            } 
            else if (sender is UISegmentedControl) 
            {
                UISegmentedControl uisc = sender as UISegmentedControl;

                SW_CertificationChanged.On |= uisc == SC_Certification;
            }

            B_SaveUserDetails.Enabled = UserDetailsHaveChanged();
        }

        void Switch_ValueChanged(object sender, EventArgs e)
        {
            if (killChanges)
                return;

            if (SW_Administrator.On || SW_Volunteer.On || SW_SiteCoordinator.On)
                SW_NewUser.On = false;

            if (sender is UISwitch)
            {
                UISwitch uis = sender as UISwitch;

                SW_RolesChanged.On |= uis == SW_NewUser;
                SW_RolesChanged.On |= uis == SW_Administrator;
                SW_RolesChanged.On |= uis == SW_Volunteer;
                SW_RolesChanged.On |= uis == SW_SiteCoordinator;
            }

            B_SaveUserDetails.Enabled = UserDetailsHaveChanged();
        }

        void PasswordField_ValueChanged(object sender, EventArgs e)
        {
            SW_PasswordChanged.On = (TB_Password1.Text.Length > 7) && (TB_Password2.Text.Length > 7) && (TB_Password1.Text == TB_Password2.Text);

            B_SaveUserDetails.Enabled = UserDetailsHaveChanged();
        }

        private bool UserDetailsHaveChanged()
        {
            bool res = false;

            // as a check to make sure the value has actually changed (or been set back to the original value)
            SW_NameChanged.On = SelectedUser.Name != TB_Name.Text;
            SW_EmailChanged.On = SelectedUser.Email != TB_Email.Text;
            SW_PhoneChanged.On = SelectedUser.Phone != TB_Phone.Text;
            int selCertSeg = SelectedUser.Certification == E_Certification.Basic ? 0 : 1;
            SW_CertificationChanged.On = selCertSeg != SC_Certification.SelectedSegment;
            SW_RolesChanged.On = (SW_NewUser.On != SelectedUser.HasNewUser)
                || (SW_Administrator.On != SelectedUser.HasAdmin)
                || (SW_Volunteer.On != SelectedUser.HasVolunteer)
                || (SW_SiteCoordinator.On != SelectedUser.HasSiteCoordinator);
            SW_PasswordChanged.On =
                   (TB_Password1.Text.Length > 7)
                && (TB_Password2.Text.Length > 7)
                && (TB_Password1.Text == TB_Password2.Text);

            res |= SW_NameChanged.On || SW_EmailChanged.On || SW_PhoneChanged.On || SW_CertificationChanged.On || SW_RolesChanged.On || SW_PasswordChanged.On;

            return res;
        }

        private async Task<C_IOResult> SaveChangedFields()
        {
            if (!UserDetailsHaveChanged())
                return new C_IOResult() { ResultCode = E_IOResultCode.NoError };

            UpdateUserDetails();

            AI_Busy.StartAnimating();
            EnableUI(false);

            C_JsonBuilder jb = new C_JsonBuilder();
            //if (SW_NameChanged.On)
                jb.Add(SelectedUser.Name, C_VitaUser.N_Name);
            //if (SW_PhoneChanged.On)
                jb.Add(SelectedUser.Phone, C_VitaUser.N_Phone);
            //if (SW_EmailChanged.On)
                jb.Add(SelectedUser.Email, C_VitaUser.N_Email);
            if (SW_CertificationChanged.On)
                jb.Add(SelectedUser.Certification.ToString(), C_VitaUser.N_Certification);
            if (SW_RolesChanged.On)
            {
                jb.StartArray(C_VitaUser.N_Roles);
                foreach (E_VitaUserRoles role in SelectedUser.Roles)
                    jb.AddArrayElement(role.ToString());
                jb.EndArray();
            }
            if (SW_PasswordChanged.On)
            {
                jb.Add(SelectedUser.Password, C_VitaUser.N_Password);
                jb.Add(SelectedUser.Password, C_VitaUser.N_PasswordConfirmation);
            }

            C_IOResult ior = await Global.UpdateUserFields(jb, SelectedUser, LoggedInUser.Token);

            AI_Busy.StopAnimating();
            EnableUI(true);

            if (!ior.Success)
            {
                C_MessageBox.E_MessageBoxResults mbresx = await C_MessageBox.MessageBox(this, "Error", ior.ErrorMessage, C_MessageBox.E_MessageBoxButtons.Ok);
            }
            else
            {
                B_SaveUserDetails.Enabled = false;
            }

            return ior;
        }

        public class C_WorkItemsTableSource : UITableViewSource
        {
            const string CellIdentifier = "TableCell_WorkItemsTableSource";
            public List<C_SignUp> OurWorkItems;
            readonly C_Global Global;
            readonly C_VitaUser User;

            public C_WorkItemsTableSource(C_Global global, List<C_SignUp> ourWorkitems, C_VitaUser user)
            {
                Global = global;
                User = user;
                OurWorkItems = ourWorkitems;
            }

            public override nint RowsInSection(UITableView tableview, nint section)
            {
                int count = 0;
                if (OurWorkItems != null)
                    count = OurWorkItems.Count;
                return count;
            }

            public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
            {
                UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);

                //---- if there are no cells to reuse, create a new one
                if (cell == null)
                    cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

                C_SignUp workitem = OurWorkItems[indexPath.Row];
                cell.TextLabel.Text = workitem.SiteName;

                C_WorkShift workShift = Global.GetWorkShiftById(workitem.ShiftId);

                cell.DetailTextLabel.Text = workitem.Date.ToString("mmm dd, yyyy")
                    + "[" + workShift.OpenTime.ToString("hh:mm p") + " - " + workShift.CloseTime.ToString("hh:mm p") + "]";
                return cell;
            }
        }

        public class C_SiteNamesTableSource : UITableViewSource
        {
            const string CellIdentifier = "TableCell_WorkItemsTableSource";
            public List<string> Names;

            public C_SiteNamesTableSource(List<string> names)
            {
                Names = names;
            }

            public override nint RowsInSection(UITableView tableview, nint section)
            {
                return Names.Count;
            }

            public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
            {
                UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);

                //---- if there are no cells to reuse, create a new one
                if (cell == null)
                    cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

                cell.TextLabel.Text = Names[indexPath.Row];

                return cell;
            }
        }

    }
}