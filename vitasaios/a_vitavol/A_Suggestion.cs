using System.Threading.Tasks;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Views;
using Android.Widget;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "VITA: Volunteer Suggestion")]
    public class A_Suggestion : Activity
    {
		C_Global Global;
        C_VitaUser LoggedInUser;

		Button B_Submit;
		
        EditText TB_Subject;
		EditText TB_Message;

        ProgressBar PB_Busy;

		protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
			if (g.Global == null)
				g.Global = new C_Global();
			Global = g.Global;

            SetContentView(Resource.Layout.Suggestion);

            B_Submit = FindViewById<Button>(Resource.Id.B_Save);
            TB_Subject = FindViewById<EditText>(Resource.Id.TB_Subject);
            TB_Message = FindViewById<EditText>(Resource.Id.TB_Message);
            PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);

            C_Common.SetViewColors(this, Resource.Id.V_Suggestion);

            TB_Message.TextChanged += (sender, e) => 
            {
                B_Submit.Enabled = (TB_Subject.Text.Length > 0) && (TB_Message.Text.Length > 0);
            };

            TB_Subject.TextChanged += (sender, e) =>
            {
                B_Submit.Enabled = (TB_Subject.Text.Length > 0) && (TB_Message.Text.Length > 0);
            };

            B_Submit.Click += (sender, e) => 
            {
                PB_Busy.Visibility = ViewStates.Visible;
                EnableUI(false);

                Task.Run(async () =>
                {
                    LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
                    C_Suggestion sug = new C_Suggestion(Global.LoggedInUserId, C_YMD.Now, false);
                    C_IOResult ior = await Global.CreateSuggestion(sug, LoggedInUser.Token);

                    void p()
                    {
                        PB_Busy.Visibility = ViewStates.Gone;
                        EnableUI(true);

                        if (!ior.Success)
                        {
                            C_MessageBox mbox = new C_MessageBox(this, "Error", "Unable to save the Suggestion.", E_MessageBoxButtons.Ok);
                            mbox.Show();
                        }
                        StartActivity(new Intent(this, typeof(A_VolHome)));
                    }
                    RunOnUiThread(p);
                });
            };

            B_Submit.Enabled = (TB_Subject.Text.Length > 0) && (TB_Message.Text.Length > 0);
        }

        public override void OnBackPressed() =>
            StartActivity(new Intent(this, typeof(A_VolHome)));

		private void EnableUI(bool en)
        {
            B_Submit.Enabled = en && (TB_Subject.Text.Length > 0) && (TB_Message.Text.Length > 0);
            TB_Message.Enabled = en;
            TB_Subject.Enabled = en;
        }
	}
}
