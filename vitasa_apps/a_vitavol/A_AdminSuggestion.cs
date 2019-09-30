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

        //ProgressBar PB_Busy;
        Button B_Send;
        Button B_Delete;
        TextView L_From;
        TextView L_Date;
        TextView L_Subject;
        TextView L_Message;
        C_BusyBox BusyBox;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            SetContentView(Resource.Layout.AdminSuggestionX);

            //PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);
            B_Send = FindViewById<Button>(Resource.Id.B_Send);
            B_Delete = FindViewById<Button>(Resource.Id.B_Delete);
            L_From = FindViewById<TextView>(Resource.Id.L_From);
            L_Date = FindViewById<TextView>(Resource.Id.L_Date);
            L_Subject = FindViewById<TextView>(Resource.Id.L_Subject);
            L_Message = FindViewById<TextView>(Resource.Id.L_Message);

            C_Common.SetViewColors(this, Resource.Id.V_AdminSuggestion);

            B_Send.Click += (object sender, EventArgs e) => 
            {
                //PB_Busy.Visibility = ViewStates.Visible;
                BusyBox = new C_BusyBox(this, "Sending the suggestion");
                BusyBox.Show();
                EnableUI(false);

                Task.Run(async () =>
                {
                    string from = "public";
                    if (!Global.SelectedSuggestion.FromPublic && (Global.SelectedSuggestion.UserId != -1))
                    {
                        C_VitaUser u = await Global.FetchUserWithId(Global.SelectedSuggestion.UserId);
                        if (u != null)
                            from = u.Name;
                    }

                    void p()
                    {
                        BusyBox.Hide();
                        //PB_Busy.Visibility = ViewStates.Gone;
                        EnableUI(true);

                        string body = "From: " + from +
                            "\nSubject: " + Global.SelectedSuggestion.Subject +
                            "\nMessage: " + Global.SelectedSuggestion.Text;

                        //string shareurl = "mailto:" + email + "?subject=" + subject + "&body=" + body;
                        //Xamarin.Forms.Device.OpenUri(new Uri("mailto:" + shareurl));
                        Intent intent = new Intent(Intent.ActionSend);
                        intent.SetType("plain/text");
                        intent.PutExtra(Intent.ExtraEmail, new String[] { LoggedInUser.Email });
                        intent.PutExtra(Intent.ExtraSubject, "VITA Suggestion");
                        intent.PutExtra(Intent.ExtraText, body);
                        StartActivity(Intent.CreateChooser(intent, ""));
                    }
                    RunOnUiThread(p);
                });
            };

            B_Delete.Click += (object sender, EventArgs e) =>
            {
                if (Global.SelectedSuggestion.id == -1)
                {
                    Global.SelectedSuggestion = null;
                    StartActivity(new Intent(this, typeof(A_AdminNotifications)));

                    return;
                }

                Activity ourContext = this;
                C_MessageBox mbox = new C_MessageBox(this,
                    "Are you sure?",
                    "This action will delete this Suggestion. There is NO UNDO.",
                    E_MessageBoxButtons.YesNo);
                mbox.Show();
                mbox.Dismissed += (object sender1, C_MessageBoxEventArgs args) =>
                {
                    if (args.Result == E_MessageBoxResults.No)
                        return;

                    C_BusyBox bbox = new C_BusyBox(ourContext, "Deleting the Suggestion.");
                    bbox.Show();

                    BusyBox = new C_BusyBox(this, "Deleting Suggestion");
                    BusyBox.Show();
                    //PB_Busy.Visibility = ViewStates.Visible;
                    EnableUI(false);

                    Task.Run(async () =>
                    {
                        C_IOResult ior = await Global.RemoveSuggestion(Global.SelectedSuggestion, LoggedInUser.Token);

                        void p()
                        {
                            BusyBox.Hide();
                            //PB_Busy.Visibility = ViewStates.Gone;
                            EnableUI(true);

                            bbox.Hide();

                            if (!ior.Success)
                            {
                                C_MessageBox mbox1 = new C_MessageBox(this,
                                    "Error",
                                    "One or more errors occurred. Suggestion not deleted.",
                                    E_MessageBoxButtons.Ok);
                                mbox1.Show();
                            }
                            else
                            {
                                Global.SelectedSuggestion = null;
                                StartActivity(new Intent(this, typeof(A_AdminSuggestions)));
                            }
                        }
                        RunOnUiThread(p);
                    });
                };
            };

            //PB_Busy.Visibility = ViewStates.Visible;
            BusyBox = new C_BusyBox(this, "Loading Suggestion");
            BusyBox.Show();
            EnableUI(false);

            Task.Run(async () =>
            {
                C_VitaUser user = null;
                if (!Global.SelectedSuggestion.FromPublic)
                    user = await Global.FetchUserWithId(Global.SelectedSuggestion.UserId);

                void p()
                {
                    //PB_Busy.Visibility = ViewStates.Gone;
                    BusyBox.Hide();
                    EnableUI(true);

                    string uname = user == null ? "" : user.Name;
                    L_From.Text = Global.SelectedSuggestion.FromPublic ? "Public" : uname;
                    L_Date.Text = Global.SelectedSuggestion.CreateDate.ToString("dow mmm dd, yyyy");
                    L_Subject.Text = Global.SelectedSuggestion.Subject;
                    L_Message.Text = Global.SelectedSuggestion.Text;
                }
                RunOnUiThread(p);
            });
        }

        bool UIIsEnabled;
        void EnableUI(bool en)
        {
            UIIsEnabled = en;
            B_Send.Enabled = en;
        }

        public override void OnBackPressed()
        {
            if (!UIIsEnabled)
                return;

            Global.SelectedSuggestion = null;
            StartActivity(new Intent(this, typeof(A_AdminSuggestions)));
        }
    }
}
