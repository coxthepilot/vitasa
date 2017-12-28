using Foundation;
using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using UIKit;

using zsquared;

namespace vitaadmin
{
    public partial class VC_ShowNotifications : UIViewController
    {
		C_Global Global;
		C_VitaUser LoggedInUser;

		List<C_Notification> _Notifications;

        C_Notification SelectedNotification;

		C_NotificationsTableSource NotificationsTableSource;
		C_NotificationsTableDelegate NotificationsTableDelegate;

        bool killChanges;

		public VC_ShowNotifications (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

			LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            B_Back.TouchUpInside += (sender, e) => 
                PerformSegue("Segue_NotificationsToMain", this);

            TV_Message.Changed += (sender, e) => 
            {
                if (killChanges) return;
                SelectedNotification.Dirty = true;
				B_Send.Enabled = ValidMessage();
                B_Save.Enabled = SelectedNotification.Dirty;
			};

            SC_Audience.ValueChanged += (sender, e) => 
            {
                if (killChanges) return;
				SelectedNotification.Dirty = true;
				B_Send.Enabled = ValidMessage();
				B_Save.Enabled = SelectedNotification.Dirty;
			};

            B_Save.TouchUpInside += async (sender, e) => 
            {
                AI_Busy.StartAnimating();
                EnableUI(false);
                EnableNotificationUI(false);

                SelectedNotification.Message = TV_Message.Text;
                SelectedNotification.Audience = SC_Audience.SelectedSegment == 0 ? E_NotificationAudience.Volunteers : E_NotificationAudience.SiteCoordinators;

                //bool success = await SelectedNotification.UpdateNotifications(LoggedInUser.Token);
                C_IOResult ior = await Global.UpdateNotification(SelectedNotification, LoggedInUser.Token);

				AI_Busy.StopAnimating();
				EnableUI(true);
				EnableNotificationUI(true);

                if (!ior.Success)
                {
                    C_MessageBox.E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this, "Error", ior.ErrorMessage, C_MessageBox.E_MessageBoxButtons.Ok);
                }
                else
                {
                    B_Save.Enabled = false;
                    TV_Notifications.ReloadData();
                }
            };

            B_Send.TouchUpInside += async (sender, e) => 
            {
                if (SelectedNotification.id == -1)
                {
					C_MessageBox.E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this, "Error", "The notification must be saved first.", C_MessageBox.E_MessageBoxButtons.Ok);
                    return;
				}

				AI_Busy.StartAnimating();
				EnableUI(false);
				EnableNotificationUI(false);

				SelectedNotification.Message = TV_Message.Text;
				SelectedNotification.Audience = SC_Audience.SelectedSegment == 0 ? E_NotificationAudience.Volunteers : E_NotificationAudience.SiteCoordinators;
                TV_Notifications.ReloadData();

                C_IOResult ior = await Global.SendNotification(SelectedNotification, LoggedInUser.Token);

                AI_Busy.StopAnimating();
                EnableUI(true);
                EnableNotificationUI(true);

                if (!ior.Success)
				{
                    C_MessageBox.E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this, "Error", ior.ErrorMessage, C_MessageBox.E_MessageBoxButtons.Ok);
				}
			};

            B_CreateNew.TouchUpInside += (sender, e) => 
            {
                C_Notification note = new C_Notification();

                SelectedNotification = note;

				EnableNotificationUI(true);

				TB_Created.Text = SelectedNotification.CreatedDT.ToString("G");
				TB_Updated.Text = SelectedNotification.UpdatedDT.ToString("G");
				TB_Sent.Text = SelectedNotification.SentDT.ToString("G");

				TV_Message.Text = SelectedNotification.Message;

				SC_Audience.SelectedSegment = SelectedNotification.Audience == E_NotificationAudience.Volunteers ? 0 : 1;

				B_Save.Enabled = ValidMessage();
				B_Send.Enabled = ValidMessage();

                _Notifications.Add(note);
                TV_Notifications.ReloadData();
			};

			EnableNotificationUI(false);
            B_Save.Enabled = false;
            B_Send.Enabled = false;

			TB_Created.UserInteractionEnabled = false;
            TB_Updated.UserInteractionEnabled = false;
            TB_Sent.UserInteractionEnabled = false;

			AI_Busy.StartAnimating();
            EnableUI(false);
            
			Task.Run(async () =>
			{
                _Notifications = await Global.FetchAllNotifications(LoggedInUser.Token);

				UIApplication.SharedApplication.InvokeOnMainThread(
				new Action(() =>
				{
                    AI_Busy.StopAnimating();
                    EnableUI(true);
                    
					NotificationsTableSource = new C_NotificationsTableSource(_Notifications);
					TV_Notifications.Source = NotificationsTableSource;

					NotificationsTableDelegate = new C_NotificationsTableDelegate(this, NotificationsTableSource);
					TV_Notifications.Delegate = NotificationsTableDelegate;

					NotificationsTableDelegate.NotificationsTableRowSelect += NotificationsTableDelegate_NotificationsTableRowSelect;
					NotificationsTableDelegate.NotificationsTableRowDeselect += NotificationsTableDelegate_NotificationsTableRowDeselect;
					NotificationsTableDelegate.NotificationsTableRowRemove += NotificationsTableDelegate_NotificationsTableRowRemove;

					TV_Notifications.ReloadData();
				}));
			});
		}

        private void EnableUI(bool en)
        {
            TV_Notifications.UserInteractionEnabled = en;
        }

        private void EnableNotificationUI(bool en)
        {
            SC_Audience.Enabled = en;
            TB_Created.Enabled = en;
            TB_Updated.Enabled = en;
            TB_Sent.Enabled = en;
            TV_Message.UserInteractionEnabled = en;
        }

		void NotificationsTableDelegate_NotificationsTableRowSelect(object sender, C_NotificationsTableEvent a)
		{
            SelectedNotification = a.Notification;

            EnableNotificationUI(true);

            TB_Created.Text = SelectedNotification.CreatedDT.ToString("G");
            TB_Updated.Text = SelectedNotification.UpdatedDT.ToString("G");
            TB_Sent.Text = SelectedNotification.SentDT.ToString("G");

            killChanges = true;
            TV_Message.Text = SelectedNotification.Message;
            SC_Audience.SelectedSegment = SelectedNotification.Audience == E_NotificationAudience.Volunteers ? 0 : 1;
            killChanges = false;

            B_Save.Enabled = SelectedNotification.Dirty;
            B_Send.Enabled = ValidMessage();
		}

		void NotificationsTableDelegate_NotificationsTableRowDeselect(object sender, C_NotificationsTableEvent a)
		{
            if (SelectedNotification.Dirty)
            {
				C_Notification selNote = SelectedNotification; // save a pointer to the item being deselected in case foreground wants to change it
                UIApplication.SharedApplication.InvokeOnMainThread(
                    new Action(async () => 
                {
					C_MessageBox.E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this, "Not Saved", "The notification has been changed. Save?", C_MessageBox.E_MessageBoxButtons.YesNo);
                    if (mbres == C_MessageBox.E_MessageBoxResults.No)
                    {
                        selNote.Dirty = false;
                        return;
                    }

                    AI_Busy.StartAnimating();
					EnableUI(false);
					EnableNotificationUI(false);

					selNote.Message = TV_Message.Text;
					selNote.Audience = SC_Audience.SelectedSegment == 0 ? E_NotificationAudience.Volunteers : E_NotificationAudience.SiteCoordinators;
                    TV_Notifications.ReloadData();

                    C_IOResult ior = await Global.UpdateNotification(selNote, LoggedInUser.Token);

					AI_Busy.StopAnimating();
					EnableUI(true);
					EnableNotificationUI(true);

                    if (!ior.Success)
					{
                        C_MessageBox.E_MessageBoxResults mbresx = await C_MessageBox.MessageBox(this, "Error", ior.ErrorMessage, C_MessageBox.E_MessageBoxButtons.Ok);
					}
					else
					{
						B_Save.Enabled = false;
                        DePopulateNotification();
					}
				}));
            }

            DePopulateNotification();
		}

		void NotificationsTableDelegate_NotificationsTableRowRemove(object sender, C_NotificationsTableEvent a)
		{
            C_Notification selNote = a.Notification;
            UIApplication.SharedApplication.InvokeOnMainThread(
                new Action(async () => 
            { 
                C_MessageBox.E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this, "Delete?", "Permanentaly delete the notification?", C_MessageBox.E_MessageBoxButtons.YesNo);
                if (mbres == C_MessageBox.E_MessageBoxResults.No)
                    return;

                AI_Busy.StartAnimating();
                EnableUI(false);
                EnableNotificationUI(false);
                B_Save.Enabled = false;
                B_Send.Enabled = false;

                C_IOResult ior = await Global.DeleteNotification(selNote, LoggedInUser.Token);

                AI_Busy.StopAnimating();;
                EnableUI(true);
                EnableNotificationUI(true);
                B_Save.Enabled = SelectedNotification.Dirty;
                B_Send.Enabled = true;

                if (!ior.Success)
				{
                    C_MessageBox.E_MessageBoxResults mbresx = await C_MessageBox.MessageBox(this, "Error", ior.ErrorMessage, C_MessageBox.E_MessageBoxButtons.Ok);
				}
				else
				{
                    _Notifications.Remove(selNote);
                    TV_Notifications.ReloadData();
				}
			}));
		}

        private bool ValidMessage()
        {
            return TV_Message.Text.Length != 0;
        }

        private void DePopulateNotification()
        {
            TB_Created.Text = "";
            TB_Updated.Text = "";
            TB_Sent.Text = "";
            killChanges = true;
            SC_Audience.SelectedSegment = 0;
            TV_Message.Text = "";
            killChanges = false;
        }

		public class C_NotificationsTableDelegate : UITableViewDelegate
		{
			readonly UIViewController OurVC;
			readonly C_NotificationsTableSource TableSource;

			public event NotificationTableEventHandler NotificationsTableRowSelect;
			public event NotificationTableEventHandler NotificationsTableRowDeselect;
			public event NotificationTableEventHandler NotificationsTableRowRemove;

			public C_NotificationsTableDelegate(UIViewController vc, C_NotificationsTableSource tsource)
			{
				OurVC = vc;
				TableSource = tsource;
			}

			public override UITableViewRowAction[] EditActionsForRow(UITableView tableView, NSIndexPath indexPath)
			{
				UITableViewRowAction hiButton = UITableViewRowAction.Create(UITableViewRowActionStyle.Default, "Remove",
				delegate
				{
					NotificationsTableRowRemove?.Invoke(this, new C_NotificationsTableEvent(TableSource.Notifications[indexPath.Row]));
				});

				return new UITableViewRowAction[] { hiButton };
			}

			public override void RowDeselected(UITableView tableView, NSIndexPath indexPath)
			{
				NotificationsTableRowDeselect?.Invoke(this, new C_NotificationsTableEvent(TableSource.Notifications[indexPath.Row]));
			}

			public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
			{
				NotificationsTableRowSelect?.Invoke(this, new C_NotificationsTableEvent(TableSource.Notifications[indexPath.Row]));
			}
		}

		public class C_NotificationsTableEvent : EventArgs
		{
			public C_Notification Notification;

			public C_NotificationsTableEvent(C_Notification notification)
			{
				Notification = notification;
			}
		}

		public delegate void NotificationTableEventHandler(object sender, C_NotificationsTableEvent a);

		public class C_NotificationsTableSource : UITableViewSource
		{
			const string CellIdentifier = "TableCell_NotificationsTableSource";
			public List<C_Notification> Notifications;

			public C_NotificationsTableSource(List<C_Notification> notifications)
			{
				Notifications = notifications;
			}

			public override nint RowsInSection(UITableView tableview, nint section)
			{
				return Notifications.Count;
			}

			public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
			{
				UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);

				//---- if there are no cells to reuse, create a new one
				if (cell == null)
					cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

				C_Notification not = Notifications[indexPath.Row];

                cell.TextLabel.Text = not.Message;
                cell.DetailTextLabel.Text = not.SentDT.ToString();

				return cell;
			}
		}

	}
}