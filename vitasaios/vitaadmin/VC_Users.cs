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

        C_VitaUser SelectedUser;

        bool killChanges;

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

            B_SaveUserDetails.TouchUpInside += async (sender, e) => 
            {
                AI_Busy.StartAnimating();
                EnableUI(false);

                UpdateUserDetails();

                bool success = await SelectedUser.UpdateUserProfile(LoggedInUser.Token);

                AI_Busy.StopAnimating();
                EnableUI(true);

				if (!success)
				{
					C_MessageBox.E_MessageBoxResults mbresx = await C_MessageBox.MessageBox(this, "Error", "Unable to save the user details", C_MessageBox.E_MessageBoxButtons.Ok);
				}
				else
				{
					B_SaveUserDetails.Enabled = false;
                    TV_Users.ReloadData();
				}
			};

            B_UpdatePassword.TouchUpInside += async (sender, e) => 
            {
                if ((TB_Password1.Text.Length <= 7)
                    || (TB_Password2.Text.Length <= 7)
                    || (TB_Password1.Text != TB_Password2.Text))
                    return;

                SelectedUser.Password = TB_Password1.Text;

				AI_Busy.StartAnimating();
				EnableUI(false);

				bool success = await SelectedUser.UpdateUserPassword(LoggedInUser.Token);

				AI_Busy.StopAnimating();
				EnableUI(true);

				if (!success)
				{
					C_MessageBox.E_MessageBoxResults mbresx = await C_MessageBox.MessageBox(this, "Error", "Unable to save the password", C_MessageBox.E_MessageBoxButtons.Ok);
				}
				else
				{
                    B_UpdatePassword.Enabled = false;
                    TB_Password1.Text = "";
                    TB_Password2.Text = "";
				}
			};

            B_ViewSignUps.TouchUpInside += (sender, e) => 
            {
                Global.SelectedUser = SelectedUser;
                Global.ViewCameFrom = E_ViewCameFrom.Users;
                PerformSegue("Segue_UsersToSignUps", this);
            };

            TB_Name.AddTarget(TextField_ValueChanged, UIControlEvent.EditingChanged);
            TB_Email.AddTarget(TextField_ValueChanged, UIControlEvent.EditingChanged);
            TB_Phone.AddTarget(TextField_ValueChanged, UIControlEvent.EditingChanged);
            SC_Certification.ValueChanged += TextField_ValueChanged;
            SW_NewUser.ValueChanged += Switch_ValueChanged;
            SW_Administrator.ValueChanged += Switch_ValueChanged;
            SW_Volunteer.ValueChanged += Switch_ValueChanged;
            SW_SiteCoordinator.ValueChanged += Switch_ValueChanged;

            TB_Password1.AddTarget(PasswordField_ValueChanged, UIControlEvent.EditingChanged);
            TB_Password2.AddTarget(PasswordField_ValueChanged, UIControlEvent.EditingChanged);

            AI_Busy.StartAnimating();
			EnableUI(false);

            Task.Run(async () => 
            {
                Users = await Global.FetchAllUsers(LoggedInUser.Token);

                UIApplication.SharedApplication.InvokeOnMainThread(
                new Action(() =>
                {
                    AI_Busy.StopAnimating();

                    UsersTableSource = new C_UsersTableSource(Users);
                    TV_Users.Source = UsersTableSource;

                    UsersTableDelegate = new C_UsersTableDelegate(this, UsersTableSource);
                    TV_Users.Delegate = UsersTableDelegate;

                    UsersTableDelegate.UsersTableRowSelect += UsersTableDelegate_UsersTableRowSelect;
                    UsersTableDelegate.UsersTableRowDeselect += UsersTableDelegate_UsersTableRowDeselect;
                    UsersTableDelegate.UsersTableRowRemove += UsersTableDelegate_UsersTableRowRemove;

                    TV_Users.ReloadData();
                }));
			});
        }

        private void EnableUI(bool en)
        {
            TB_Name.Enabled = en;
            TB_Email.Enabled = en;
            TB_Phone.Enabled = en;
            SC_Certification.Enabled = en;
            SW_NewUser.Enabled = en;
            SW_Administrator.Enabled = en;
            SW_Volunteer.Enabled = en;
            SW_SiteCoordinator.Enabled = en;
            B_SaveUserDetails.Enabled = en && UserDetailsHaveChanged();
            TB_Password1.Enabled = en;
            TB_Password2.Enabled = en;
            B_UpdatePassword.Enabled = false; // let the dirty handler set it to enabled
            B_ViewSignUps.Enabled = en && (SelectedUser != null) && SelectedUser.HasVolunteer;
        }

        private bool UserDetailsHaveChanged()
        {
            bool res = false;

            if (SelectedUser == null)
                return res;

            res |= SelectedUser.Name != TB_Name.Text;
            res |= SelectedUser.Email != TB_Email.Text;
            res |= SelectedUser.Phone != TB_Phone.Text;
            int selCertSeg = SelectedUser.Certification == E_Certification.Basic ? 0 : 1;
            res |= selCertSeg != SC_Certification.SelectedSegment;
            res |= SW_NewUser.On != SelectedUser.HasNewUser;
            res |= SW_Administrator.On != SelectedUser.HasAdmin;
            res |= SW_Volunteer.On != SelectedUser.HasVolunteer;
            res |= SW_SiteCoordinator.On != SelectedUser.HasSiteCoordinator;

            return res;
        }

        private void UpdateUserDetails()
        {
            SelectedUser.Name = TB_Name.Text;
            SelectedUser.Email = TB_Email.Text;
            SelectedUser.Phone = TB_Phone.Text;
            SelectedUser.Certification = SC_Certification.SelectedSegment == 0 ? E_Certification.Basic : E_Certification.Advanced;
            SelectedUser.Roles = new List<E_VitaUserRoles>();
            if (SW_NewUser.On)
                SelectedUser.Roles.Add(E_VitaUserRoles.NewUser);
            if (SW_Administrator.On)
                SelectedUser.Roles.Add(E_VitaUserRoles.Admin);
            if (SW_Volunteer.On)
                SelectedUser.Roles.Add(E_VitaUserRoles.Volunteer);
            if (SW_SiteCoordinator.On)
                SelectedUser.Roles.Add(E_VitaUserRoles.SiteCoordinator);
        }

        private void DePopulateUser()
        {
            killChanges = true;
            TB_Name.Text = "";
            TB_Email.Text = "";
            TB_Phone.Text = "";
            TB_Password1.Text = "";
            TB_Password2.Text = "";
            SW_NewUser.On = false;
            SW_Administrator.On = false;
            SW_Volunteer.On = false;
            SW_SiteCoordinator.On = false;                             
            killChanges = false;

            EnableUI(false);
        }

		void TextField_ValueChanged(object sender, EventArgs e)
		{
            if (killChanges)
                return;
            
            B_SaveUserDetails.Enabled = UserDetailsHaveChanged();
		}

		void Switch_ValueChanged(object sender, EventArgs e)
		{
			if (killChanges)
				return;

            if (SW_Administrator.On || SW_Volunteer.On || SW_SiteCoordinator.On)
                SW_NewUser.On = false;

			B_SaveUserDetails.Enabled = UserDetailsHaveChanged();
		}

		void PasswordField_ValueChanged(object sender, EventArgs e)
		{
            bool ok = TB_Password1.Text.Length > 7;
            ok &= TB_Password2.Text.Length > 7;
            ok &= TB_Password1.Text == TB_Password2.Text;

            B_UpdatePassword.Enabled = ok;
		}

		void UsersTableDelegate_UsersTableRowSelect(object sender, C_UsersTableEvent a)
		{
            SelectedUser = a.User;

            killChanges = true;

            TB_Name.Text = SelectedUser.Name;
            TB_Email.Text = SelectedUser.Email;
            TB_Phone.Text = SelectedUser.Phone;

            SC_Certification.SelectedSegment = SelectedUser.Certification == E_Certification.Basic ? 0 : 1;

            SW_NewUser.On = SelectedUser.HasNewUser;
            SW_Administrator.On = SelectedUser.HasAdmin;
            SW_Volunteer.On = SelectedUser.HasVolunteer;
            SW_SiteCoordinator.On = SelectedUser.HasSiteCoordinator;

			killChanges = false;

			EnableUI(true);
		}

		void UsersTableDelegate_UsersTableRowDeselect(object sender, C_UsersTableEvent a)
		{
			if (UserDetailsHaveChanged())
			{
                C_VitaUser user = SelectedUser;
				UIApplication.SharedApplication.InvokeOnMainThread(
				new Action(async () =>
				{
					C_MessageBox.E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this, "Not Saved", "The user details has been changed. Save?", C_MessageBox.E_MessageBoxButtons.YesNo);
					if (mbres == C_MessageBox.E_MessageBoxResults.No)
						return;

					AI_Busy.StartAnimating();
					EnableUI(false);

                    UpdateUserDetails();

                    TV_Users.ReloadData();


                    bool success = await user.UpdateUserProfile(LoggedInUser.Token);

					AI_Busy.StopAnimating();
					EnableUI(true);

					if (!success)
					{
						C_MessageBox.E_MessageBoxResults mbresx = await C_MessageBox.MessageBox(this, "Error", "Unable to save the user details", C_MessageBox.E_MessageBoxButtons.Ok);
					}
					else
					{
                        B_SaveUserDetails.Enabled = false;
						DePopulateUser();
					}
				}));
			}

			DePopulateUser();
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

                bool success = await Global.RemoveUser(user.id, LoggedInUser.Token);

				AI_Busy.StopAnimating();
				EnableUI(true);

				if (!success)
				{
					C_MessageBox.E_MessageBoxResults mbresx = await C_MessageBox.MessageBox(this, "Error", "Unable to delete the notification", C_MessageBox.E_MessageBoxButtons.Ok);
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

                cell.TextLabel.Text = user.Name;
                cell.DetailTextLabel.Text = user.Phone + " (" + user.Certification.ToString() + ")";

				return cell;
			}
		}


	}
}