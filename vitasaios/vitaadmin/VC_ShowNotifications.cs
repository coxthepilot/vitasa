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

		C_NotificationsTableSource NotificationsTableSource;
		C_NotificationsTableDelegate NotificationsTableDelegate;

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
            
			Task.Run(async () =>
			{
				_Notifications = await C_Notification.FetchAllNotifications(LoggedInUser.Token);

				UIApplication.SharedApplication.InvokeOnMainThread(
				new Action(() =>
				{
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


		void NotificationsTableDelegate_NotificationsTableRowSelect(object sender, C_NotificationsTableDelegate.C_NotificationsTableEvent a)
		{

		}

		void NotificationsTableDelegate_NotificationsTableRowDeselect(object sender, C_NotificationsTableDelegate.C_NotificationsTableEvent a)
		{

		}

		void NotificationsTableDelegate_NotificationsTableRowRemove(object sender, C_NotificationsTableDelegate.C_NotificationsTableEvent a)
		{

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

			public class C_NotificationsTableEvent : EventArgs
			{
				public C_Notification Notification;

				public C_NotificationsTableEvent(C_Notification notification)
				{
					Notification = notification;
				}
			}

			public delegate void NotificationTableEventHandler(object sender, C_NotificationsTableEvent a);
		}

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