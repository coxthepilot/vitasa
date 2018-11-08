using System;
using System.Threading.Tasks;
using System.Collections.Generic;

using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using Android.Views;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_AdminNotification")]
    public class A_AdminNotification : Activity
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        ProgressBar PB_Busy;
        Button B_SaveAndSend;
        Spinner SP_To;
        TextView L_LastSent;
        EditText TB_Message;

        C_Notification SelectedNotification;

        C_SPinnerHelper<E_NotificationAudience> NotificationSpinner;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            SetContentView(Resource.Layout.AdminNotification);

            PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);
            B_SaveAndSend = FindViewById<Button>(Resource.Id.B_SaveAndSend);
            SP_To = FindViewById<Spinner>(Resource.Id.SP_To);
            L_LastSent = FindViewById<TextView>(Resource.Id.L_LastSent);
            TB_Message = FindViewById<EditText>(Resource.Id.TB_Message);

            C_Common.SetViewColors(this, Resource.Id.V_AdminNotification);

            SelectedNotification = Global.SelectedNotification ?? new C_Notification();

            B_SaveAndSend.Click += (object sender, EventArgs e) => 
            {
                // update the structure
                SelectedNotification.Message = TB_Message.Text;
                SelectedNotification.Audience = NotificationSpinner.GetValue();

                PB_Busy.Visibility = ViewStates.Visible;
                EnableUI(false);

                Task.Run(async () =>
                {
                    // The api call looks at the id to determine if create or update; id == -1 means new notification
                    // save the notification
                    C_IOResult ior = await Global.UpdateNotification(SelectedNotification, LoggedInUser.Token);

                    // on successful save, send the notification
                    if (ior.Success)
                        ior = await Global.SendNotification(SelectedNotification, LoggedInUser.Token);

                    void p()
                    {
                        PB_Busy.Visibility = ViewStates.Gone;
                        EnableUI(true);

                        if (ior.Success)
                        {
                            Global.SelectedNotification = null;
                            StartActivity(new Intent(this, typeof(A_AdminNotifications)));
                        }
                        else
                        {
                            C_MessageBox mbox = new C_MessageBox(this,
                                             "Error",
                                             "Unable to save or send the notification.",
                                             E_MessageBoxButtons.Ok);
                            mbox.Show();
                        }
                    }
                    RunOnUiThread(p);
                });
            };

            TB_Message.TextChanged += (object sender, Android.Text.TextChangedEventArgs e) => 
            {
                B_SaveAndSend.Enabled = TB_Message.Text.Length > 0;
            };

            List<E_NotificationAudience> audience = Tools.EnumToList<E_NotificationAudience>();

            NotificationSpinner = new C_SPinnerHelper<E_NotificationAudience>(this, SP_To, audience);
            NotificationSpinner.SetValue(SelectedNotification.Audience);

            L_LastSent.Text = "Last Sent: " + (SelectedNotification.SentDT == DateTime.MinValue ? "never" : SelectedNotification.SentDT.ToShortDateString());
            TB_Message.Text = SelectedNotification.Message;

            B_SaveAndSend.Enabled = TB_Message.Text.Length > 0;
        }

        private void EnableUI(bool en)
        {
            B_SaveAndSend.Enabled = en;
            SP_To.Enabled = en;
            TB_Message.Enabled = en;
        }

        public override void OnBackPressed()
        {
            Global.SelectedNotification = null;
            StartActivity(new Intent(this, typeof(A_AdminNotifications)));
        }

    }
}
