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
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_AdminUser", WindowSoftInputMode = SoftInput.StateHidden)]
    public class A_AdminUser : Activity
    {
        C_Global Global;
        C_VitaUser LoggedInUser;
        C_VitaUser SelectedUser;

        EditText TB_Name;
        EditText TB_Email;
        EditText TB_Password;
        EditText TB_PasswordConfirm;
        EditText TB_Phone;
        CheckBox CB_Mobile;
        Spinner SP_Certification;
        Spinner SP_Role;
        Button B_SitesCoordinated;
        Button B_Save;
        Button B_DeleteUser;
        ProgressBar PB_Busy;

        List<E_Certification> Certifications;
        C_SPinnerHelper<E_Certification> CertificationsSpinnerHelper;
        List<E_VitaUserRoles> Roles;
        C_SPinnerHelper<E_VitaUserRoles> RolesSpinnerHelper;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            SelectedUser = Global.SelectedUser ?? new C_VitaUser();

            SetContentView(Resource.Layout.AdminUser);

            TB_Name = FindViewById<EditText>(Resource.Id.TB_Name);
            TB_Email = FindViewById<EditText>(Resource.Id.TB_Email);
            TB_Password = FindViewById<EditText>(Resource.Id.TB_Password);
            TB_PasswordConfirm = FindViewById<EditText>(Resource.Id.TB_PasswordConfirm);
            TB_Phone = FindViewById<EditText>(Resource.Id.TB_Phone);
            CB_Mobile = FindViewById<CheckBox>(Resource.Id.CB_Mobile);
            SP_Certification = FindViewById<Spinner>(Resource.Id.SP_Certification);
            SP_Role = FindViewById<Spinner>(Resource.Id.SP_Role);
            B_SitesCoordinated = FindViewById<Button>(Resource.Id.B_SitesCoordinated);
            B_Save = FindViewById<Button>(Resource.Id.B_SaveUser);
            B_DeleteUser = FindViewById<Button>(Resource.Id.B_DeleteUser);
            PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);

            C_Common.SetViewColors(this, Resource.Id.V_AdminUser);

            B_SitesCoordinated.Click += (sender, e) => 
            {
                if (RolesSpinnerHelper.GetValue() != E_VitaUserRoles.SiteCoordinator)
                    return;

                if (Global.SelectedUserTemp == null)
                    Global.SelectedUserTemp = SelectedUser;

                StartActivity(new Intent(this, typeof(A_AdminUserSites)));
            };

            B_Save.Click += (sender, e) => 
            {
                if (!ValidUser())
                {
                    C_MessageBox mbox = new C_MessageBox(this,
                         "Error",
                         "Invalid user (must have name, email, and phone).",
                     E_MessageBoxButtons.Ok);
                    mbox.Show();
                    return;
                }

                C_VitaUser u = Global.GetUserFromCacheNoFetch(TB_Email.Text);
                if (u != null)
                {
                    C_MessageBox mbox1 = new C_MessageBox(this,
                     "Error",
                     "That email is already in use.",
                     E_MessageBoxButtons.Ok);
                    mbox1.Show();
                    return;
                }

                PullValuesFromForm();

                PB_Busy.Visibility = ViewStates.Visible;
                EnableUI(false);

                Task.Run(async () => 
                {
                    C_JsonBuilder jb = null;
                    if (Global.SelectedUser != null)
                        jb = CaptureSiteCoordFields();

                    bool ok = await SaveUser(jb);

                    void p()
                    {
                        PB_Busy.Visibility = ViewStates.Gone;
                        EnableUI(true);

                        if (ok)
                        {
                            GoBack();
                            return;
                        }

                        C_MessageBox mbox = new C_MessageBox(this,
                         "Error",
                         "Unable to update the user details.",
                         E_MessageBoxButtons.Ok);
                        mbox.Show();
                    }
                    RunOnUiThread(p);
                });
            };

            B_DeleteUser.Click += (sender, e) => 
            {
                if (!ValidUser() || (Global.SelectedUser == null))
                {
                    GoBack();
                    return;
                }

                C_MessageBox mbox = new C_MessageBox(this,
                 "Are you sure?",
                 "Do you really want to delete [" + SelectedUser.Name + "]? There is no undo.",
                 E_MessageBoxButtons.YesNo);
                mbox.Show();
                mbox.Dismissed += (object sender1, C_MessageBoxEventArgs args) => 
                {
                    if (args.Result == E_MessageBoxResults.No)
                        return;

                    PB_Busy.Visibility = ViewStates.Visible;
                    EnableUI(false);

                    Task.Run(async () =>
                    {
                        C_IOResult ior = await Global.RemoveUser(SelectedUser.id, LoggedInUser.Token);

                        void p()
                        {
                            PB_Busy.Visibility = ViewStates.Gone;
                            EnableUI(true);

                            if (!ior.Success)
                            {
                                C_MessageBox mbox1 = new C_MessageBox(this,
                                "Error",
                                "Unable to delete the user.",
                                E_MessageBoxButtons.Ok);
                                mbox1.Show();
                                return;
                            }

                            GoBack();
                        }
                        RunOnUiThread(p);
                    });
                };
            };

            TB_Name.Text = SelectedUser.Name;
            TB_Email.Text = SelectedUser.Email;
            TB_Phone.Text = SelectedUser.Phone;
            CB_Mobile.Checked = SelectedUser.HasMobile;

            TB_Name.TextChanged += (object sender, Android.Text.TextChangedEventArgs e) => { CheckEnableSaveButton(); };
            TB_Email.TextChanged += (object sender, Android.Text.TextChangedEventArgs e) => { CheckEnableSaveButton(); };
            TB_Phone.TextChanged += (object sender, Android.Text.TextChangedEventArgs e) => { CheckEnableSaveButton(); };
            TB_Password.TextChanged += (object sender, Android.Text.TextChangedEventArgs e) => { CheckEnableSaveButton(); };
            TB_PasswordConfirm.TextChanged += (object sender, Android.Text.TextChangedEventArgs e) => { CheckEnableSaveButton(); };

            Certifications = new List<E_Certification>
            {
                E_Certification.None,
                E_Certification.Greeter,
                E_Certification.Basic,
                E_Certification.Advanced
            };

            CertificationsSpinnerHelper = new C_SPinnerHelper<E_Certification>(this, SP_Certification, Certifications);
            CertificationsSpinnerHelper.ItemSelected += (object sender, SpinnerEventArgs<E_Certification> args) => CheckEnableSaveButton();
            CertificationsSpinnerHelper.SetValue(SelectedUser.Certification);

            Roles = new List<E_VitaUserRoles>
            {
                E_VitaUserRoles.None,
                E_VitaUserRoles.Volunteer,
                E_VitaUserRoles.SiteCoordinator,
                E_VitaUserRoles.Admin
            };

            RolesSpinnerHelper = new C_SPinnerHelper<E_VitaUserRoles>(this, SP_Role, Roles);
            RolesSpinnerHelper.ItemSelected += (object sender, SpinnerEventArgs<E_VitaUserRoles> args) =>
            {
                B_SitesCoordinated.Enabled = RolesSpinnerHelper.GetValue() == E_VitaUserRoles.SiteCoordinator;

                CheckEnableSaveButton();
            };
            if (SelectedUser.HasAdmin)
                RolesSpinnerHelper.SetValue(E_VitaUserRoles.Admin);
            else if (SelectedUser.HasSiteCoordinator)
                RolesSpinnerHelper.SetValue(E_VitaUserRoles.SiteCoordinator);
            else if (SelectedUser.HasVolunteer)
                RolesSpinnerHelper.SetValue(E_VitaUserRoles.Volunteer);
            else
                RolesSpinnerHelper.SetValue(E_VitaUserRoles.None);

            EnableUI(true);

            CheckEnableSaveButton();
            B_SitesCoordinated.Enabled = RolesSpinnerHelper.GetValue() == E_VitaUserRoles.SiteCoordinator;
        }

        public override void OnBackPressed()
        {
            if (!UIIsEnabled)
                return;

            if (!GetDirty() || !ValidUser())
            {
                GoBack();
                return;
            }

            C_MessageBox mbox = new C_MessageBox(this,
                "Changes made",
                "Changes have been made. Save the changes?",
                 E_MessageBoxButtons.YesNoCancel);
            mbox.Show();
            mbox.Dismissed += (object sender, C_MessageBoxEventArgs args) =>
            {
                if (args.Result == E_MessageBoxResults.Cancel)
                    return;

                if (args.Result == E_MessageBoxResults.No)
                {
                    GoBack();
                    return;
                }

                if (!ValidUser())
                {
                    C_MessageBox mbox2 = new C_MessageBox(this,
                         "Error",
                         "Invalid user (must have name, email, and phone).",
                     E_MessageBoxButtons.Ok);
                    mbox2.Show();
                    return;
                }

                C_VitaUser u = Global.GetUserFromCacheNoFetch(TB_Email.Text);
                if (u != null)
                {
                    C_MessageBox mbox1 = new C_MessageBox(this,
                     "Error",
                     "That email is already in use.",
                     E_MessageBoxButtons.Ok);
                    mbox1.Show();
                    return;
                }

                PullValuesFromForm();

                PB_Busy.Visibility = ViewStates.Visible;
                EnableUI(false);

                Task.Run(async () =>
                {
                    C_JsonBuilder jb = null;
                    if (Global.SelectedUser != null)
                        jb = CaptureSiteCoordFields();

                    bool ok = await SaveUser(jb);

                    void p()
                    {
                        PB_Busy.Visibility = ViewStates.Gone;
                        EnableUI(true);

                        if (ok)
                            GoBack();
                        else
                        {
                            C_MessageBox mbox1 = new C_MessageBox(this,
                             "Error",
                             "Unable to update the user details.",
                             E_MessageBoxButtons.Ok);
                            mbox1.Show();
                        }
                    }
                    RunOnUiThread(p);
                });
            };
        }

        private void GoBack()
        {
            Global.SelectedUserTemp = null;
            StartActivity(new Intent(this, typeof(A_AdminUsers)));
        }

        private bool GetDirty()
        {
            bool nameDirty = (TB_Name.Text != SelectedUser.Name) 
                && !string.IsNullOrWhiteSpace(TB_Name.Text) && !string.IsNullOrWhiteSpace(SelectedUser.Name);
            bool emailDirty = TB_Email.Text != SelectedUser.Email
                && !string.IsNullOrWhiteSpace(TB_Email.Text) && !string.IsNullOrWhiteSpace(SelectedUser.Email);
            bool phoneDirty = TB_Phone.Text != SelectedUser.Phone
                && !string.IsNullOrWhiteSpace(TB_Phone.Text) && !string.IsNullOrWhiteSpace(SelectedUser.Phone);

            bool mobileDirty = CB_Mobile.Checked != SelectedUser.HasMobile;
            bool certDirty = CertificationsSpinnerHelper.GetValue() != SelectedUser.Certification;
            bool roleDirty = !SelectedUser.Roles.Contains(RolesSpinnerHelper.GetValue());
            bool sitesCoordinatedDirty = (Global.SelectedUserTemp != null) && Global.SelectedUserTemp.Dirty;

            bool passwordChanged = !string.IsNullOrWhiteSpace(TB_Password.Text) || !string.IsNullOrWhiteSpace(TB_PasswordConfirm.Text);
            //bool passwordOK = (TB_Password.Text == TB_PasswordConfirm.Text) && (TB_Password.Text.Length > 7);

            return nameDirty || emailDirty || phoneDirty || mobileDirty || certDirty || roleDirty || sitesCoordinatedDirty || passwordChanged;
        }

        bool UIIsEnabled;
        private void EnableUI(bool en)
        {
            UIIsEnabled = en;
            TB_Name.Enabled = en;
            TB_Email.Enabled = en;
            TB_Password.Enabled = en;
            TB_PasswordConfirm.Enabled = en;
            TB_Phone.Enabled = en;
            CB_Mobile.Enabled = en;
            SP_Certification.Enabled = en;
            SP_Role.Enabled = en;
            B_SitesCoordinated.Enabled = en;
            B_Save.Enabled = en;
            B_DeleteUser.Enabled = en;
        }

        private void CheckEnableSaveButton()
        {
            bool valuesOk = true;

            valuesOk &= TB_Name.Text.Length > 3;
            valuesOk &= Tools.EmailAddressIsValid(TB_Email.Text);
            valuesOk &= TB_Phone.Text.Length > 10;

            if (!string.IsNullOrWhiteSpace(TB_Password.Text) || !string.IsNullOrWhiteSpace(TB_PasswordConfirm.Text))
                valuesOk &= (TB_Password.Text.Length > 7) && (TB_Password.Text == TB_PasswordConfirm.Text);

            bool sitesCoordinatedDirty = (Global.SelectedUserTemp != null) && Global.SelectedUserTemp.Dirty;

            B_Save.Enabled = valuesOk || sitesCoordinatedDirty;
        }

        private void PullValuesFromForm()
        {
            SelectedUser.Name = TB_Name.Text;
            SelectedUser.Email = TB_Email.Text;

            if (!string.IsNullOrWhiteSpace(TB_Password.Text)
                && (TB_Password.Text.Length > 7)
                && (TB_Password.Text == TB_PasswordConfirm.Text))
            {
                SelectedUser.Password = TB_Password.Text;
            }

            SelectedUser.Password = TB_Password.Text;

            SelectedUser.Phone = TB_Phone.Text;

            SelectedUser.Roles = new List<E_VitaUserRoles>();
            if (CB_Mobile.Checked)
                SelectedUser.Roles.Add(E_VitaUserRoles.Mobile);
            E_VitaUserRoles selrole = RolesSpinnerHelper.GetValue();
            SelectedUser.Roles.Add(selrole);

            SelectedUser.Certification = CertificationsSpinnerHelper.GetValue();
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
                {
                    SelectedUser.SitesCoordinated = Global.SelectedUserTemp.SitesCoordinated;
                    await AdjustSiteCoordinators();
                }
                ior = await Global.CreateUser(SelectedUser, LoggedInUser.Token);
            }
            else
            {
                await AdjustSiteCoordinators();

                ior = await Global.UpdateUserFields(jb, SelectedUser, LoggedInUser.Token);
            }

            return ior.Success;
        }

        private C_JsonBuilder CaptureSiteCoordFields()
        {
            C_JsonBuilder jb = SelectedUser.ToJsonAsJsonBuilder();

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

        private async Task<bool> AdjustSiteCoordinators()
        {
            foreach (C_VitaSite site in Global.SiteCache)
            {
                var ou = SelectedUser.SitesCoordinated.Where(sc => sc.SiteId == site.id);
                if (ou.Any())
                {
                    // make sure this user is listed in the site
                    var ou1 = site.SiteCoordinators.Where(sc => sc.UserId == SelectedUser.id);
                    if (!ou1.Any())
                    {
                        C_SiteCoordinator sc = new C_SiteCoordinator(SelectedUser);
                        site.SiteCoordinators.Add(sc);

                        await Global.UpdateSite(site, LoggedInUser.Token);
                    }
                }
                else
                {
                    // make sure this user is not listed in the site
                    var ou1 = site.SiteCoordinators.Where(sc => sc.UserId == SelectedUser.id);
                    if (ou1.Any())
                    {
                        C_SiteCoordinator sc = ou1.First();
                        int ix = site.SiteCoordinators.IndexOf(sc);
                        site.SiteCoordinators.RemoveAt(ix);

                        await Global.UpdateSite(site, LoggedInUser.Token);
                    }
                }
            }

            return true;
        }
    }
}
