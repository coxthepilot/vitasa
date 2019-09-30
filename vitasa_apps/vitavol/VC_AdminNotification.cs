using Foundation;
using System;
using UIKit;
using System.Threading.Tasks;
using System.Collections.Generic;
using static zsquared.C_MessageBox;

using zsquared;

namespace vitavol
{
    public partial class VC_AdminNotification : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        C_Notification SelectedNotification;

        C_ItemPicker<E_NotificationAudience> AudiencePicker;

        public VC_AdminNotification (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            SelectedNotification = Global.SelectedNotification ?? new C_Notification();

            UITapGestureRecognizer labelTap = new UITapGestureRecognizer(() =>
            {
                C_Common.DropFirstResponder(View);
            });

            L_Title.UserInteractionEnabled = true;
            L_Title.AddGestureRecognizer(labelTap);

            B_Back.TouchUpInside += (sender, e) =>
            {
                Global.SelectedNotification = null;
                PerformSegue("Segue_AdminNotificationToAdminNotifications", this);
            };

            B_Send.TouchUpInside += (sender, e) => 
            {
                // update the structure
                SelectedNotification.Message = TxV_Message.Text;
                SelectedNotification.Audience = AudiencePicker.Selection;

                AI_Busy.StartAnimating();
                EnableUI(false);

                Task.Run(async () => 
                {
                    // The api call looks at the id to determine if create or update; id == -1 means new notification
                    // save the notification
                    C_IOResult ior = await Global.UpdateNotification(SelectedNotification, LoggedInUser.Token);

                    // on successful save, send the notification
                    if (ior.Success)
                        ior = await Global.SendNotification(SelectedNotification, LoggedInUser.Token);

                    async void p()
                    {
                        AI_Busy.StopAnimating();
                        EnableUI(true);

                        if (ior.Success)
                            PerformSegue("Segue_AdminNotificationToAdminNotifications", this);
                        else
                        {
                            E_MessageBoxResults mbres = await MessageBox(this,
                                             "Error",
                                             "Unable to save or send the notification.",
                                             E_MessageBoxButtons.Ok);
                        }
                    }
                    UIApplication.SharedApplication.InvokeOnMainThread(p);
                });
            };

            TxV_Message.Changed += (sender, e) => 
                B_Send.Enabled = TxV_Message.Text.Length > 0;
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);
            TxV_Message.BackgroundColor = C_Common.StandardButton;

            List<E_NotificationAudience> audience = Tools.EnumToList<E_NotificationAudience>();

            AudiencePicker = new C_ItemPicker<E_NotificationAudience>(TB_To, audience);
            AudiencePicker.SetSelection(SelectedNotification.Audience);
            TB_LastSent.Text = SelectedNotification.SentDT == DateTime.MinValue ? "never" : SelectedNotification.SentDT.ToShortDateString();
            TxV_Message.Text = SelectedNotification.Message;

            B_Send.Enabled = TxV_Message.Text.Length > 0;
        }

        private void EnableUI(bool en) =>
            C_Common.EnableUI(View, en);
    }
}