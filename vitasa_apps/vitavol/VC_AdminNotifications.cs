using System;
using UIKit;
using System.Threading.Tasks;
using System.Collections.Generic;

using zsquared;
using static zsquared.C_MessageBox;

namespace vitavol
{
    public partial class VC_AdminNotifications : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        C_TableSource<C_Notification> NotificationsTableSource;

        public VC_AdminNotifications (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            B_Back.TouchUpInside += (sender, e) =>
            {
                Global.SelectedNotification = null;
                PerformSegue("Segue_AdminNotificationsToAdminMenu", this);
            };

            B_NewNotification.TouchUpInside += (sender, e) => 
            {
                Global.SelectedNotification = null;
                PerformSegue("Segue_AdminNotificationsToAdminNotification", this);
            };
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);

            AI_Busy.StartAnimating();
            EnableUI(false);

            Task.Run(async () =>
            {
                List<C_Notification> notifications = await Global.FetchAllNotifications(LoggedInUser.Token);

                void p()
                {
                    AI_Busy.StopAnimating();
                    EnableUI(true);

                    NotificationsTableSource = new C_TableSource<C_Notification>(this, TV_Notifications, notifications, "noticell");
                    NotificationsTableSource.GetTextLabel += (sender, args) =>
                    {
                        C_Notification notif = args.Item;
                        return notif.Message;
                    };
                    NotificationsTableSource.GetDetailTextLabel += (sender, args) =>
                    {
                        C_Notification notif = args.Item;
                        DateTime ls = notif.SentDT;
                        string ls_s = ls == DateTime.MinValue ? "never" : ls.ToShortDateString();
                        return "Last sent " + ls_s + " to " + notif.Audience.ToString();
                    };
                    NotificationsTableSource.Selected += (sender, args) =>
                    {
                        C_Notification noti = args.Item;
                        Global.SelectedNotification = noti;
                        PerformSegue("Segue_AdminNotificationsToAdminNotification", this);
                    };
                    NotificationsTableSource.DeleteAllowed += (object sender, C_TableSource<C_Notification>.TableSourceEventArgs<C_Notification> args) => 
                    {
                        return true;
                    };
                    NotificationsTableSource.Delete += (object sender, C_TableSource<C_Notification>.TableSourceEventArgs<C_Notification> args) => 
                    {
                        C_Notification noti = args.Item;

                        Task.Run(async () => 
                        {
                            C_IOResult ior = await Global.RemoveNotification(noti, LoggedInUser.Token);

                            if (!ior.Success)
                            {
                                E_MessageBoxResults mbresx = await MessageBox(this,
                                    "Error",
                                    "Unable to delete the notification.",
                                    E_MessageBoxButtons.Ok);
                            }
                        });
                    };
                    TV_Notifications.Source = NotificationsTableSource;
                    TV_Notifications.ReloadData();
                }
                UIApplication.SharedApplication.InvokeOnMainThread(p);
            });
        }

        private void EnableUI(bool en) =>
            C_Common.EnableUI(View, en);
    }
}