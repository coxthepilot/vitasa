using System;
using System.Threading.Tasks;

using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using Android.Views;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_VolEditSettings", WindowSoftInputMode = SoftInput.StateHidden)]
    public class A_VolEditSettings : Activity
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        EditText TB_Name;
        EditText TB_Email;
        EditText TB_Password;
        EditText TB_PasswordConfirm;
        EditText TB_Phone;
        Button B_Save;
        Button B_Cancel;
        ProgressBar PB_Busy;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            SetContentView(Resource.Layout.VolEditSettings);

            B_Save = FindViewById<Button>(Resource.Id.B_Save);
            B_Cancel = FindViewById<Button>(Resource.Id.B_Cancel);
            TB_Name = FindViewById<EditText>(Resource.Id.TB_Name);
            TB_Email = FindViewById<EditText>(Resource.Id.TB_Email);
            TB_Password = FindViewById<EditText>(Resource.Id.TB_Password);
            TB_PasswordConfirm = FindViewById<EditText>(Resource.Id.TB_PasswordConfirmation);
            TB_Phone = FindViewById<EditText>(Resource.Id.TB_Phone);
            PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);

            C_Common.SetViewColors(this, Resource.Id.V_VolEditSettings);

            B_Save.Click += (sender, e) =>
            {
                C_JsonBuilder jb = new C_JsonBuilder();

                if (TB_Name.Text != LoggedInUser.Name)
                {
                    jb.Add(TB_Name.Text, C_VitaUser.N_Name);
                    LoggedInUser.Name = TB_Name.Text;
                }
                if ((LoggedInUser.Email != TB_Email.Text) && Tools.EmailAddressIsValid(TB_Email.Text))
                {
                    jb.Add(TB_Email.Text, C_VitaUser.N_Email);
                    LoggedInUser.Email = TB_Email.Text;
                }
                if (LoggedInUser.Phone != TB_Phone.Text)
                {
                    jb.Add(TB_Phone.Text, C_VitaUser.N_Phone);
                    LoggedInUser.Phone = TB_Phone.Text;
                }
                if  (   !string.IsNullOrWhiteSpace(TB_Password.Text)
                    &&  !string.IsNullOrWhiteSpace(TB_PasswordConfirm.Text)
                    && (TB_Password.Text == TB_PasswordConfirm.Text)
                    && (TB_Password.Text.Length > 7))
                {
                    jb.Add(TB_Password.Text, C_VitaUser.N_Password);
                    jb.Add(TB_Password.Text, C_VitaUser.N_PasswordConfirmation);
                }

                PB_Busy.Visibility = ViewStates.Visible;
                EnableUI(false);

                Task.Run(async () =>
                {
                    C_IOResult ior = await Global.UpdateUserFields(jb, LoggedInUser, LoggedInUser.Token);

                    void p()
                    {
                        PB_Busy.Visibility = ViewStates.Gone;
                        EnableUI(true);

                        if (!ior.Success)
                        {
                            C_MessageBox mbox = new C_MessageBox(this,
                                "Error",
                                "Unable to save the user settings.",
                                E_MessageBoxButtons.Ok);
                            mbox.Show();
                        }
                        else
                            GoBack();
                    }
                    RunOnUiThread(p);
                });
            };

            B_Cancel.Click += (sender, e) => 
            {
                GoBack();
            };

            TB_Name.TextChanged += (object sender, Android.Text.TextChangedEventArgs e) => SomeTextFieldChanged(sender, e);
            TB_Email.TextChanged += (object sender, Android.Text.TextChangedEventArgs e) => SomeTextFieldChanged(sender, e);
            TB_Password.TextChanged += (object sender, Android.Text.TextChangedEventArgs e) => SomeTextFieldChanged(sender, e);
            TB_PasswordConfirm.TextChanged += (object sender, Android.Text.TextChangedEventArgs e) => SomeTextFieldChanged(sender, e);
            TB_Phone.TextChanged += (object sender, Android.Text.TextChangedEventArgs e) => SomeTextFieldChanged(sender, e);

            TB_Name.Text = LoggedInUser.Name;
            TB_Email.Text = LoggedInUser.Email;
            TB_Phone.Text = LoggedInUser.Phone;

            SomeTextFieldChanged(null, null);
        }

        void SomeTextFieldChanged(object sender, EventArgs e)
        {
            B_Save.Enabled = OkToSave();
        }

        private bool OkToSave()
        {
            C_VitaUser user = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            bool nameChanged = user.Name != TB_Name.Text;
            bool emailChanged = user.Email != TB_Email.Text;
            bool phoneChanged = user.Phone != TB_Phone.Text;

            bool nameOK = !string.IsNullOrWhiteSpace(TB_Name.Text) && (TB_Name.Text.Length > 3);
            bool emailOK = Tools.EmailAddressIsValid(TB_Email.Text);
            bool passwordChanged = !string.IsNullOrWhiteSpace(TB_Password.Text) || !string.IsNullOrWhiteSpace(TB_PasswordConfirm.Text);
            bool passwordOK = (TB_Password.Text == TB_PasswordConfirm.Text) && (TB_Password.Text.Length > 7);

            bool okToSave = (nameChanged && nameOK) || (emailChanged && emailOK) || phoneChanged || (passwordChanged && passwordOK);

            return okToSave;
        }

        private void EnableUI(bool en)
        {
            TB_Email.Enabled = en;
            TB_Name.Enabled = en;
            TB_Password.Enabled = en;
            TB_PasswordConfirm.Enabled = en;
            TB_Phone.Enabled = en;

            B_Save.Enabled = en && OkToSave();
        }

        public override void OnBackPressed() =>
            GoBack();

        private void GoBack()
        {
            switch (Global.ViewCameFrom)
            {
                case E_ViewCameFrom.VolOptions:
                    StartActivity(new Intent(this, typeof(A_VolHome)));
                    break;
                case E_ViewCameFrom.SCOptions:
                    StartActivity(new Intent(this, typeof(A_SCSites)));
                    break;
                case E_ViewCameFrom.Admin:
                    StartActivity(new Intent(this, typeof(A_AdminMenu)));
                    break;
                default:
                    throw new ApplicationException("unknown vire came from");
            }
        }
    }
}
