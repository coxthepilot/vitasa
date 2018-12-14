using Foundation;
using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using UIKit;

using zsquared;

namespace vitaadmin
{
    public partial class VC_Users : UIViewController
    {
		C_Global Global;
		C_VitaUser LoggedInUser;

        List<C_VitaUser> Users;

        C_UsersTableSource UsersTableSource;
        C_UsersTableDelegate UsersTableDelegate;

		public VC_Users (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

			LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

			B_Back.TouchUpInside += (sender, e) =>
				PerformSegue("Segue_UsersToMain", this);

            AI_Busy.StartAnimating();
			EnableUI(false);

            Task.Run(async () => 
            {
                Users = await Global.FetchAllUsers(LoggedInUser.Token);
                Users.Sort(C_VitaUser.CompareByName);

                UIApplication.SharedApplication.InvokeOnMainThread(
                new Action(() =>
                {
                    AI_Busy.StopAnimating();
                    EnableUI(true);

                    UsersTableSource = new C_UsersTableSource(Users);
                    TV_Users.Source = UsersTableSource;

                    UsersTableDelegate = new C_UsersTableDelegate(this, UsersTableSource);
                    TV_Users.Delegate = UsersTableDelegate;

                    UsersTableDelegate.UsersTableRowSelect += UsersTableDelegate_UsersTableRowSelect;
                    UsersTableDelegate.UsersTableRowRemove += UsersTableDelegate_UsersTableRowRemove;

                    TV_Users.ReloadData();

                    // build user data
                    int numNewUser = 0;
                    int numVolunteer = 0;
                    int numSiteCoordinator = 0;
                    int numAdmin = 0;
                    int numBasicVolunteer = 0;
                    int numAdvancedVolunteer = 0;
                    foreach(C_VitaUser user in Users)
                    {
                        if (user.HasNewUser)
                        {
                            numNewUser++;
                        }
                        if (user.HasVolunteer)
                        {
                            numVolunteer++;
                            if (user.Certification == E_Certification.Basic)
                                numBasicVolunteer++;
                            else
                                numAdvancedVolunteer++;
                        }
                        if (user.HasSiteCoordinator)
                        {
                            numSiteCoordinator++;
                        }
                        if (user.HasAdmin)
                        {
                            numAdmin++;
                        }
                    }
                    L_UsersData.Text = "New Users: " + numNewUser.ToString()
                        + "; Volunteers: " + numVolunteer.ToString() + " [Basic: " + numBasicVolunteer.ToString() + ", Advanced: " + numAdvancedVolunteer.ToString() + "]" 
                        + "; Site Coordinators: " + numSiteCoordinator.ToString()
                        + "; Admin: " + numAdmin.ToString();
                }));
			});
        }

        private void EnableUI(bool en)
        {
            TV_Users.UserInteractionEnabled = en;
            B_Back.Enabled = en;
        }

		void UsersTableDelegate_UsersTableRowSelect(object sender, C_UsersTableEvent a)
		{
            Global.SelectedUser = a.User;

            PerformSegue("Segue_UsersToUser", this);
		}

		void UsersTableDelegate_UsersTableRowRemove(object sender, C_UsersTableEvent a)
		{
            C_VitaUser user = a.User;
			UIApplication.SharedApplication.InvokeOnMainThread(
			new Action(async () =>
			{
				C_MessageBox.E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this, "Delete?", "Permanentaly delete the user?", C_MessageBox.E_MessageBoxButtons.YesNo);
				if (mbres == C_MessageBox.E_MessageBoxResults.No)
					return;

				AI_Busy.StartAnimating();
				EnableUI(false);

                C_IOResult ior = await Global.RemoveUser(user.id, LoggedInUser.Token);

				AI_Busy.StopAnimating();
				EnableUI(true);

                if (!ior.Success)
				{
                    C_MessageBox.E_MessageBoxResults mbresx = await C_MessageBox.MessageBox(this, "Error", ior.ErrorMessage, C_MessageBox.E_MessageBoxButtons.Ok);
				}
				else
				{
                    Users.Remove(user);
                    TV_Users.ReloadData();
				}
			}));
		}

		public class C_UsersTableDelegate : UITableViewDelegate
		{
			readonly UIViewController OurVC;
			readonly C_UsersTableSource TableSource;

            public event UserTableEventHandler UsersTableRowSelect;
            public event UserTableEventHandler UsersTableRowDeselect;
            public event UserTableEventHandler UsersTableRowRemove;

			public C_UsersTableDelegate(UIViewController vc, C_UsersTableSource tsource)
			{
				OurVC = vc;
				TableSource = tsource;
			}

			public override UITableViewRowAction[] EditActionsForRow(UITableView tableView, NSIndexPath indexPath)
			{
				UITableViewRowAction hiButton = UITableViewRowAction.Create(UITableViewRowActionStyle.Default, "Remove",
				delegate
				{
                    UsersTableRowRemove?.Invoke(this, new C_UsersTableEvent(TableSource.Users[indexPath.Row]));
				});

				return new UITableViewRowAction[] { hiButton };
			}

			public override void RowDeselected(UITableView tableView, NSIndexPath indexPath)
			{
				UsersTableRowDeselect?.Invoke(this, new C_UsersTableEvent(TableSource.Users[indexPath.Row]));
			}

			public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
			{
				UsersTableRowSelect?.Invoke(this, new C_UsersTableEvent(TableSource.Users[indexPath.Row]));
			}
		}

		public class C_UsersTableEvent : EventArgs
		{
            public C_VitaUser User;

			public C_UsersTableEvent(C_VitaUser notification)
			{
				User = notification;
			}
		}

		public delegate void UserTableEventHandler(object sender, C_UsersTableEvent a);

		public class C_UsersTableSource : UITableViewSource
		{
			const string CellIdentifier = "TableCell_UsersTableSource";
            public List<C_VitaUser> Users;

			public C_UsersTableSource(List<C_VitaUser> notifications)
			{
				Users = notifications;
			}

			public override nint RowsInSection(UITableView tableview, nint section)
			{
				return Users.Count;
			}

			public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
			{
				UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);

				//---- if there are no cells to reuse, create a new one
				if (cell == null)
					cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

                C_VitaUser user = Users[indexPath.Row];

                cell.TextLabel.Text = user.Name + " [";
                int y = 0;
                if (user.HasNewUser)
                {
                    cell.TextLabel.Text += "New User";
                    y++;
                }
                if (user.HasVolunteer)
                {
                    if (y != 0)
                        cell.TextLabel.Text += ", ";
                    cell.TextLabel.Text += "Volunteer";
                    y++;
                }
                if (user.HasSiteCoordinator)
                {
                    if (y != 0)
                        cell.TextLabel.Text += ", ";
                    cell.TextLabel.Text += "Site Coordinator";
                    y++;
                }
                if (user.HasAdmin)
                {
                    if (y != 0)
                        cell.TextLabel.Text += ", ";
                    cell.TextLabel.Text += "Admin";
                }
                cell.TextLabel.Text += "]";

                if (user.HasVolunteer)
                    cell.DetailTextLabel.Text = user.Phone + " (" + user.Certification.ToString() + ")";
                else if (user.HasSiteCoordinator)
                {
                    cell.DetailTextLabel.Text = user.Phone + " (";
                    int x = 0;
                    foreach(C_SiteCoordinated sc in user.SitesCoordinated)
                    {
                        if (x != 0)
                            cell.DetailTextLabel.Text += ", ";
                        cell.DetailTextLabel.Text += sc.Name;
                        x++;
                    }
                    cell.DetailTextLabel.Text += ")";
                }
                else if (user.HasNewUser || user.HasAdmin)
                {
                    cell.DetailTextLabel.Text = user.Phone;
                }

				return cell;
			}
		}
	}
}