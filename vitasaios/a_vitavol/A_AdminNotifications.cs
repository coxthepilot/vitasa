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
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_AdminNotifications")]
    public class A_AdminNotifications : Activity
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        C_ListViewHelper<C_Notification> NotificationsAdapter;

        ListView LV_Notifications;
        Button B_New;
        ProgressBar PB_Busy;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            SetContentView(Resource.Layout.AdminNotifications);

            LV_Notifications = FindViewById<ListView>(Resource.Id.LV_List);
            B_New = FindViewById<Button>(Resource.Id.B_New);
            PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);

            C_Common.SetViewColors(this, Resource.Id.V_AdminNotifications);

            B_New.Click += (object sender, EventArgs e) => 
            {
                Global.SelectedNotification = null;
                StartActivity(new Intent(this, typeof(A_AdminNotification)));
            };

            LV_Notifications.ItemClick += (object sender, AdapterView.ItemClickEventArgs e) => 
            {
                C_Notification noti = NotificationsAdapter.Items[e.Position];
                Global.SelectedNotification = noti;
                StartActivity(new Intent(this, typeof(A_AdminNotification)));
            };

            PB_Busy.Visibility = ViewStates.Visible;
            EnableUI(false);

            Task.Run(async () =>
            {
                List<C_Notification> notifications = await Global.FetchAllNotifications(LoggedInUser.Token);

                void p()
                {
                    PB_Busy.Visibility = ViewStates.Gone;
                    EnableUI(true);

                    NotificationsAdapter = new C_ListViewHelper<C_Notification>(this, LV_Notifications, notifications);
                    NotificationsAdapter.GetTextLabel += (object sender, ListAdapterEventArgs<C_Notification> args) => 
                    {
                        C_Notification notif = args.Item;

                        string notifm = notif.Message.Replace('\n', ' ');
                        if (notifm.Length > 40)
                            notifm = notifm.Substring(0, 40);

                        return notifm;
                    };
                    NotificationsAdapter.GetDetailTextLabel += (object sender, ListAdapterEventArgs<C_Notification> args) => 
                    {
                        C_Notification notif = args.Item;
                        DateTime ls = notif.SentDT;
                        string ls_s = ls == DateTime.MinValue ? "never" : ls.ToShortDateString();
                        return "Last sent " + ls_s + " to " + notif.Audience.ToString();
                    };
                }
                RunOnUiThread(p);
            });
        }

        bool UIIsEnabled;
        private void EnableUI(bool en)
        {
            UIIsEnabled = en;
            B_New.Enabled = en;
            LV_Notifications.Enabled = en;
        }

        public override void OnBackPressed()
        {
            if (!UIIsEnabled)
                return;

            Global.SelectedNotification = null;
            StartActivity(new Intent(this, typeof(A_AdminMenu)));
        }
    }
}
