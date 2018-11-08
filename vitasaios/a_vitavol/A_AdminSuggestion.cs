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
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_AdminSuggestion")]
    public class A_AdminSuggestion : Activity
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        ProgressBar PB_Busy;
        Button B_Send;
        TextView L_From;
        TextView L_Date;
        TextView L_Subject;
        TextView L_Message;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            SetContentView(Resource.Layout.AdminSuggestion);

            PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);
            B_Send = FindViewById<Button>(Resource.Id.B_Send);
            L_From = FindViewById<TextView>(Resource.Id.L_From);
            L_Date = FindViewById<TextView>(Resource.Id.L_Date);
            L_Subject = FindViewById<TextView>(Resource.Id.L_Subject);
            L_Message = FindViewById<TextView>(Resource.Id.L_Message);

            C_Common.SetViewColors(this, Resource.Id.V_AdminSuggestion);

            B_Send.Click += (object sender, EventArgs e) => 
            {
                Intent intent = new Intent(Intent.ActionSend);
                intent.SetType("plain/text");
                intent.PutExtra(Intent.ExtraEmail, new String[] { LoggedInUser.Email });
                intent.PutExtra(Intent.ExtraSubject, "VITA Suggestion");
                intent.PutExtra(Intent.ExtraText, Global.SelectedSuggestion.Text);
                StartActivity(Intent.CreateChooser(intent, ""));
            };

            PB_Busy.Visibility = ViewStates.Visible;
            EnableUI(false);

            Task.Run(async () =>
            {
                C_VitaUser user = await Global.FetchUserWithId(Global.SelectedSuggestion.UserId);

                void p()
                {
                    PB_Busy.Visibility = ViewStates.Gone;
                    EnableUI(true);

                    L_From.Text = Global.SelectedSuggestion.FromPublic ? "Public" : user.Name;
                    L_Date.Text = Global.SelectedSuggestion.CreateDate.ToString("dow mmm dd, yyyy");
                    L_Subject.Text = Global.SelectedSuggestion.Subject;
                    L_Message.Text = Global.SelectedSuggestion.Text;
                }
                RunOnUiThread(p);
            });
        }

        void EnableUI(bool en) =>
            B_Send.Enabled = en;

        public override void OnBackPressed()
        {
            Global.SelectedSuggestion = null;
            StartActivity(new Intent(this, typeof(A_AdminSuggestions)));
        }
    }
}
