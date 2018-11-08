using System;
using UIKit;
using System.Threading.Tasks;
using System.Collections.Generic;
using static zsquared.C_MessageBox;

using zsquared;

namespace vitavol
{
    public partial class VC_AdminUser : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;
        C_VitaUser SelectedUser;

        C_ItemPicker<E_Certification> CertificationPicker;
        C_ItemPicker<E_VitaUserRoles> RolePicker;

        public VC_AdminUser (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            SelectedUser = Global.SelectedUser ?? new C_VitaUser();

            B_Back.TouchUpInside += async (sender, e) =>
            {
                if (!GetDirty() || !ValidUser())
                {
                    GoBack();
                    return;
                }

                E_MessageBoxResults mbres = await MessageBox(this,
                    "Changes made",
                    "Changes have been made. Save the changes?",
                     E_MessageBoxButtons.YesNoCancel);

                if (mbres == E_MessageBoxResults.Cancel)
                    return;
                if (mbres == E_MessageBoxResults.No)
                {
                    GoBack();
                    return;
                }

                C_JsonBuilder jb = null;
                if (Global.SelectedUser != null)
                    jb = CaptureUserFields();

                PullValuesFromForm();

                AI_Busy.StartAnimating();
                EnableUI(false);

                await Task.Run(async () => 
                {
                    bool ok = await SaveUser(jb);

                    async void p()
                    {
                        AI_Busy.StopAnimating();
                        EnableUI(true);

                        if (ok)
                        {
                            GoBack();
                            return;
                        }
                        E_MessageBoxResults mbres3 = await MessageBox(this,
                         "Error",
                         "Unable to update the user details.",
                         E_MessageBoxButtons.Ok);
                    }
                    UIApplication.SharedApplication.InvokeOnMainThread(p);
                });
            };

            B_SitesCoordinated.TouchUpInside += (sender, e) => 
            {
                if (Global.SelectedUserTemp == null)
                    Global.SelectedUserTemp = SelectedUser;
                PerformSegue("Segue_AdminUserToAdminUserSites", this);
            };

            B_Save.TouchUpInside += async (sender, e) => 
            {
                if (!ValidUser()) 
                {
                    E_MessageBoxResults mbres = await MessageBox(this,
                        "Error",
                        "Invalid user (must have name, email, and phone).",
                        E_MessageBoxButtons.Ok);
                                                                 
                    return;
                }

                C_JsonBuilder jb = null;
                if (Global.SelectedUser != null)
                    jb = CaptureUserFields();
                PullValuesFromForm();

                AI_Busy.StartAnimating();
                EnableUI(false);

                await Task.Run(async () => 
                {
                    bool ok = await SaveUser(jb);

                    async void p()
                    {
                        AI_Busy.StopAnimating();
                        EnableUI(true);

                        if (ok)
                        {
                            GoBack();
                            return;
                        }

                        E_MessageBoxResults mbres = await MessageBox(this,
                             "Error",
                             "Unable to update the user details.",
                             E_MessageBoxButtons.Ok);
                    }
                    UIApplication.SharedApplication.InvokeOnMainThread(p);
                });
            };

            TB_Name.AddTarget((sender, e) => { SelectedUser.Dirty = true; CheckEnableSaveButton(); }, UIControlEvent.AllEditingEvents);
            TB_Email.AddTarget((sender, e) => { SelectedUser.Dirty = true; CheckEnableSaveButton(); }, UIControlEvent.AllEditingEvents);
            TB_Phone.AddTarget((sender, e) => { SelectedUser.Dirty = true; CheckEnableSaveButton(); }, UIControlEvent.AllEditingEvents);
            TB_Role.AddTarget((sender, e) => 
            {
                B_SitesCoordinated.Enabled = RolePicker.Selection == E_VitaUserRoles.SiteCoordinator;
                SelectedUser.Dirty = true; 
                CheckEnableSaveButton(); 
            }, UIControlEvent.AllEditingEvents);
            TB_Cert.AddTarget((sender, e) => { SelectedUser.Dirty = true; CheckEnableSaveButton(); }, UIControlEvent.AllEditingEvents);
            SW_Mobile.ValueChanged += (sender, e) => { SelectedUser.Dirty = true; };
            TB_Password.AddTarget((sender, e) => 
            {
                SelectedUser.Dirty = true;
                CheckEnableSaveButton();

                if (Global.SelectedUser == null)
                {
                    CheckEnableSaveButton();
                    B_Save.Enabled &= TB_Password.Text.Length > 5;
                }
            }, UIControlEvent.AllEditingEvents);

            B_DeleteUser.TouchUpInside += async (sender, e) => 
            {
                if (!ValidUser() || (Global.SelectedUser == null))
                {
                    GoBack();
                    return;
                }

                E_MessageBoxResults mbres = await MessageBox(this,
                 "Are you sure?",
                 "Do you really want to delete [" + SelectedUser.Name + "]? There is no undo.",
                 E_MessageBoxButtons.YesNo);

                if (mbres == E_MessageBoxResults.No)
                    return;

                AI_Busy.StartAnimating();
                EnableUI(false);

                await Task.Run(async () => 
                {
                    C_IOResult ior = await Global.RemoveUser(SelectedUser.id, LoggedInUser.Token);

                    async void p()
                    {
                        AI_Busy.StopAnimating();
                        EnableUI(true);

                        if (!ior.Success)
                        {
                            E_MessageBoxResults mbresx = await MessageBox(this,
                            "Error",
                            "Unable to delete the user.",
                            E_MessageBoxButtons.Ok);
                            return;
                        }
                        GoBack();
                    }
                    UIApplication.SharedApplication.InvokeOnMainThread(p);
                });
            };
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);

            TB_Name.Text = SelectedUser.Name;
            TB_Email.Text = SelectedUser.Email;
            TB_Phone.Text = SelectedUser.Phone;
            SW_Mobile.On = SelectedUser.HasMobile;

            List<E_Certification> certifications = new List<E_Certification>
            {
                E_Certification.None,
                E_Certification.Basic,
                E_Certification.Advanced
            };
            CertificationPicker = new C_ItemPicker<E_Certification>(TB_Cert, certifications);
            CertificationPicker.SetSelection(SelectedUser.Certification);

            List<E_VitaUserRoles> roles = new List<E_VitaUserRoles>
            {
                E_VitaUserRoles.None,
                E_VitaUserRoles.Volunteer,
                E_VitaUserRoles.SiteCoordinator,
                E_VitaUserRoles.Admin
            };
            RolePicker = new C_ItemPicker<E_VitaUserRoles>(TB_Role, roles);
            if (SelectedUser.HasAdmin)
                RolePicker.SetSelection(E_VitaUserRoles.Admin);
            else if (SelectedUser.HasSiteCoordinator)
                RolePicker.SetSelection(E_VitaUserRoles.SiteCoordinator);
            else if (SelectedUser.HasVolunteer)
                RolePicker.SetSelection(E_VitaUserRoles.Volunteer);
            else
                RolePicker.SetSelection(E_VitaUserRoles.None);

            EnableUI(true);
        }

        private void EnableUI(bool en)
        {
            C_Common.EnableUI(View, en);

            CheckEnableSaveButton();
            B_Save.Enabled &= en;

            B_DeleteUser.Enabled = en && (LoggedInUser.id != SelectedUser.id);
            B_SitesCoordinated.Enabled = en && SelectedUser.HasSiteCoordinator;
        }

        private void GoBack()
        {
            Global.SelectedUserTemp = null;
            PerformSegue("Segue_AdminUserToAdminUsers", this);
        }

        private bool GetDirty()
        {
            bool nameDirty = (TB_Name.Text != SelectedUser.Name)
                && !string.IsNullOrWhiteSpace(TB_Name.Text) && !string.IsNullOrWhiteSpace(SelectedUser.Name);
            bool emailDirty = TB_Email.Text != SelectedUser.Email
                && !string.IsNullOrWhiteSpace(TB_Email.Text) && !string.IsNullOrWhiteSpace(SelectedUser.Email);
            bool phoneDirty = TB_Phone.Text != SelectedUser.Phone
                && !string.IsNullOrWhiteSpace(TB_Phone.Text) && !string.IsNullOrWhiteSpace(SelectedUser.Phone);

            bool mobileDirty = SW_Mobile.On != SelectedUser.HasMobile;
            bool certDirty = CertificationPicker.Selection != SelectedUser.Certification;
            bool roleDirty = !SelectedUser.Roles.Contains(RolePicker.Selection);
            bool sitesCoordinatedDirty = (Global.SelectedUserTemp != null) && Global.SelectedUserTemp.Dirty;

            bool passwordChanged = !string.IsNullOrWhiteSpace(TB_Password.Text) || !string.IsNullOrWhiteSpace(TB_PasswordConfirm.Text);
            //bool passwordOK = (TB_Password.Text == TB_PasswordConfirm.Text) && (TB_Password.Text.Length > 7);

            return nameDirty || emailDirty || phoneDirty || mobileDirty || certDirty || roleDirty || sitesCoordinatedDirty || passwordChanged;
        }

        private void PullValuesFromForm()
        {
            SelectedUser.Name = TB_Name.Text;
            SelectedUser.Email = TB_Email.Text;
            SelectedUser.Password = TB_Password.Text;
            SelectedUser.Phone = TB_Phone.Text;

            SelectedUser.Roles = new List<E_VitaUserRoles>();
            if (SW_Mobile.On)
                    SelectedUser.Roles.Add(E_VitaUserRoles.Mobile);
            E_VitaUserRoles r = Tools.StringToEnum<E_VitaUserRoles>(TB_Role.Text);
            SelectedUser.Roles.Add(r);

            SelectedUser.Certification = CertificationPicker.Selection;
        }

        private void CheckEnableSaveButton()
        {
            bool valuesOk = true;

            valuesOk &= TB_Name.Text.Length > 3;
            valuesOk &= Tools.EmailAddressIsValid(TB_Email.Text);
            valuesOk &= TB_Phone.Text.Length > 10;
            valuesOk &= TB_Cert.Text.Length > 0;
            valuesOk &= TB_Role.Text.Length > 0;
            if (!string.IsNullOrWhiteSpace(TB_Password.Text) || !string.IsNullOrWhiteSpace(TB_PasswordConfirm.Text))
                valuesOk &= (TB_Password.Text.Length > 7) && (TB_Password.Text == TB_PasswordConfirm.Text);

            B_Save.Enabled = valuesOk;
        }

        private bool ValidUser()
        {
            bool okName = !string.IsNullOrWhiteSpace(TB_Name.Text) && (TB_Name.Text.Length > 3);
            bool okEmail = !string.IsNullOrWhiteSpace(TB_Email.Text) && Tools.EmailAddressIsValid(TB_Email.Text);
            bool okPhone = !string.IsNullOrWhiteSpace(TB_Phone.Text) && (TB_Phone.Text.Length > 7);

            return okName || okEmail || okPhone;
        }

        private async Task<bool> SaveUser(C_JsonBuilder jb)
        {
            C_IOResult ior = null;
            if (Global.SelectedUser == null)
            {
                // new user
                if (Global.SelectedUserTemp != null)
                    SelectedUser.SitesCoordinated = Global.SelectedUserTemp.SitesCoordinated;
                ior = await Global.CreateUser(SelectedUser, LoggedInUser.Token);
            }
            else
                ior = await Global.UpdateUserFields(jb, SelectedUser, LoggedInUser.Token);

            return ior.Success;
        }

        private C_JsonBuilder CaptureUserFields()
        {
            // must be an update; find the fields that have changed
            C_JsonBuilder jb = new C_JsonBuilder();

            if (TB_Name.Text.Length > 3)
                jb.Add(TB_Name.Text, C_VitaUser.N_Name);
            if (Tools.EmailAddressIsValid(TB_Email.Text))
                jb.Add(TB_Email.Text, C_VitaUser.N_Email);
            jb.Add(TB_Phone.Text, C_VitaUser.N_Phone);
            if (!string.IsNullOrWhiteSpace(TB_Password.Text) && (TB_Password.Text.Length > 7))
            {
                jb.Add(TB_Password.Text, C_VitaUser.N_Password);
                jb.Add(TB_Password.Text, C_VitaUser.N_PasswordConfirmation);
            }

            if ((SelectedUser.HasMobile && !SW_Mobile.On) || (!SelectedUser.HasMobile && SW_Mobile.On))
                jb.Add(SW_Mobile.On, C_VitaUser.N_SubscribeMobile);

            jb.Add(CertificationPicker.Selection.ToString(), C_VitaUser.N_Certification);

            jb.StartArray(C_VitaUser.N_Roles);
            foreach (E_VitaUserRoles role in SelectedUser.Roles)
                jb.AddArrayElement(role.ToString());
            jb.EndArray();

            if (Global.SelectedUserTemp == null)
            {
                jb.StartArray(C_VitaUser.N_SitesCoordinated);
                foreach (C_SiteCoordinated sc in SelectedUser.SitesCoordinated)
                    jb.AddArrayObject(sc.ToJson());
                jb.EndArray();
            }
            else
            {
                jb.StartArray(C_VitaUser.N_SitesCoordinated);
                foreach (C_SiteCoordinated sc in Global.SelectedUserTemp.SitesCoordinated)
                    jb.AddArrayObject(sc.ToJson());
                jb.EndArray();
            }

            return jb;
        }
    }
}