using Foundation;
using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using UIKit;

using zsquared;
using static zsquared.C_MessageBox;

namespace vitaadmin
{
    public partial class VC_Sites : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

		bool Dirty;
        List<C_VitaSite> Sites;
        List<C_VitaUser> Users;

        C_VitaSite SelectedSite;
        C_SitesTableSource SitesTableSource;
        C_SitesTableDelegate SitesTableDelegate;

        UIPickerView PV_PrimarySiteCoordinator;
		UIPickerView PV_BackupSiteCoordinator;

        UIDatePicker DP_SeasonEnd;
		UIDatePicker DP_SeasonStart;

		public VC_Sites (IntPtr handle) : base (handle)
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
                PerformSegue("Segue_SitesToMain", this);
            };

            B_Calendar.TouchUpInside += async (sender, e) => 
            {
				if (Dirty)
				{
					E_MessageBoxResults mbres = await MessageBox(this, "Save Changes?", "Changes were made. Save?", E_MessageBoxButtons.YesNo);
					if (mbres == E_MessageBoxResults.Yes)
					{
                        C_IOResult ior = await UpdateSite();
                        if (!ior.Success)
						{
                            var ok = await MessageBox(this, "Error", ior.ErrorMessage, E_MessageBoxButtons.Ok);
						}
					}
				}

                Global.SelectedSiteSlug = SelectedSite.Slug;
                PerformSegue("Segue_SitesToCalendar", this);
			};

            TB_SiteName.AddTarget(TextField_ValueChanged, UIControlEvent.EditingChanged);
            TB_Street.AddTarget(TextField_ValueChanged, UIControlEvent.EditingChanged);
            TB_City.AddTarget(TextField_ValueChanged, UIControlEvent.EditingChanged);
            TB_State.AddTarget(TextField_ValueChanged, UIControlEvent.EditingChanged);
            TB_Zip.AddTarget(TextField_ValueChanged, UIControlEvent.EditingChanged);
            TB_Latitude.AddTarget(TextField_ValueChanged, UIControlEvent.EditingChanged);
            TB_Longitude.AddTarget(TextField_ValueChanged, UIControlEvent.EditingChanged);
            TB_PlaceID.AddTarget(TextField_ValueChanged, UIControlEvent.EditingChanged);

			bool killChanges = false;
			SW_DropOff.ValueChanged += async (sender, e) =>
			{
				if (killChanges) return;

                C_IOResult ior = await UpdateSiteCapabilities();

                if (!ior.Success)
				{
                    var ok = await C_MessageBox.MessageBox(this, "Error", ior.ErrorMessage, E_MessageBoxButtons.Ok);
				}
			};

			SW_Express.ValueChanged += async (sender, e) =>
			{
				if (killChanges) return;

				C_IOResult ior = await UpdateSiteCapabilities();

				if (!ior.Success)
				{
					var ok = await C_MessageBox.MessageBox(this, "Error", ior.ErrorMessage, E_MessageBoxButtons.Ok);
				}
			};

			SW_MFT.ValueChanged += async (sender, e) =>
			{
				if (killChanges) return;

				C_IOResult ior = await UpdateSiteCapabilities();

				if (!ior.Success)
				{
					var ok = await C_MessageBox.MessageBox(this, "Error", ior.ErrorMessage, E_MessageBoxButtons.Ok);
				}
			};

            SW_Accepting.ValueChanged += async (sender, e) => 
            {
                if (!SW_Accepting.On) return;
				if (killChanges) return;

                SW_NearLimit.On = false;
                SW_AtLimit.On = false;
                SW_Closed.On = false;

				E_ClientSiteStatus newStatus = E_ClientSiteStatus.Accepting;

				EnableUI(false);
				AI_Busy.StartAnimating();

                C_VitaSite site = await Global.GetSiteFromCache(SelectedSite.Slug);

				if (site != null)
				{
                    C_IOResult ior = await Global.UpdateSiteStatus(site, newStatus, LoggedInUser.Token);
				}

				AI_Busy.StopAnimating();
				EnableUI(true);
			};

            SW_NearLimit.ValueChanged += async (sender, e) => 
            {
				if (!SW_NearLimit.On)
					return;
				if (killChanges) return;

                SW_Accepting.On = false;
				SW_AtLimit.On = false;
				SW_Closed.On = false;

				E_ClientSiteStatus newStatus = E_ClientSiteStatus.NearLimit;

				EnableUI(false);
				AI_Busy.StartAnimating();

				C_VitaSite site = await Global.GetSiteFromCache(SelectedSite.Slug);

				if (site != null)
				{
                    C_IOResult ior = await Global.UpdateSiteStatus(site, newStatus, LoggedInUser.Token);
				}

				AI_Busy.StopAnimating();
				EnableUI(true);
			};

            SW_AtLimit.ValueChanged += async (sender, e) => 
            {
				if (!SW_AtLimit.On)
					return;
				if (killChanges) return;

				SW_Accepting.On = false;
                SW_NearLimit.On = false;
				SW_Closed.On = false;

				E_ClientSiteStatus newStatus = E_ClientSiteStatus.NotAccepting;

				EnableUI(false);
				AI_Busy.StartAnimating();

				C_VitaSite site = await Global.GetSiteFromCache(SelectedSite.Slug);

				if (site != null)
				{
					C_IOResult ior = await Global.UpdateSiteStatus(site, newStatus, LoggedInUser.Token);
				}

				AI_Busy.StopAnimating();
				EnableUI(true);
			};

            SW_Closed.ValueChanged += async (sender, e) =>
			{
				if (!SW_Closed.On)
					return;
				if (killChanges) return;

				SW_Accepting.On = false;
				SW_NearLimit.On = false;
                SW_AtLimit.On = false;

				E_ClientSiteStatus newStatus = E_ClientSiteStatus.Closed;

				EnableUI(false);
				AI_Busy.StartAnimating();

				C_VitaSite site = await Global.GetSiteFromCache(SelectedSite.Slug);

				if (site != null)
				{
					C_IOResult ior = await Global.UpdateSiteStatus(site, newStatus, LoggedInUser.Token);
				}

				AI_Busy.StopAnimating();
				EnableUI(true);
			};

            B_SaveChanges.TouchUpInside += async (sender, e) => 
            {
                if (!Dirty) return;

                C_IOResult ior = await UpdateSite();
                if (!ior.Success)
				{
                    var ok = await C_MessageBox.MessageBox(this, "Error", ior.ErrorMessage, E_MessageBoxButtons.Ok);
				}
			};

            B_InitCalendar.TouchUpInside += async (sender, e) => 
            {
				AI_Busy.StartAnimating();
				EnableUI(false);

				E_MessageBoxResults mbres = await MessageBox(this, "Warning", "This erases all calendar entries for the site and repopulates with new data. Make sure the season start and end are set as desired.", E_MessageBoxButtons.OkCancel);
                if (mbres != E_MessageBoxResults.Ok)
                    return;

                bool error = false;
                // erase any existing calendars; build a list of items to remove
                // then remove them to avoid changing a list while an iterator is active
                List<C_CalendarEntry> CalendarItemsToRemove = new List<C_CalendarEntry>();
                foreach (C_CalendarEntry ce in SelectedSite.SiteCalendar)
                    CalendarItemsToRemove.Add(ce);

                foreach(C_CalendarEntry ce in CalendarItemsToRemove)
                {
                    C_IOResult ior = await Global.RemoveCalendarEntry(SelectedSite, LoggedInUser.Token, ce);
                    error |= !ior.Success;
                    if (!ior.Success)
                        break;
                }

				if (error)
				{
					var ok = await C_MessageBox.MessageBox(this, "Error", "Unable to remove existing calendar entries.", E_MessageBoxButtons.Ok);
				}

                // create new calendars starting at season start, with last at season end
                C_YMD onDate = new C_YMD(SelectedSite.SeasonFirstDate); // make a clone so we can mess with our copy
                error = false;
                while ((onDate <= SelectedSite.SeasonLastDate) && !error)
                {
                    C_CalendarEntry ce = new C_CalendarEntry()
                    {
                        Date = new C_YMD(onDate),
                        SiteID = SelectedSite.id,
                        SiteIsOpen = false
                    };

                    C_IOResult ior = await Global.CreateCalendarEntry(SelectedSite, LoggedInUser.Token, ce);
                    error |= !ior.Success;
					if (error)
						break;

					onDate = onDate.AddDays(1);
                }

				if (error)
				{
					var ok = await C_MessageBox.MessageBox(this, "Error", "Unable to create new calendar entries.", E_MessageBoxButtons.Ok);
				}
                else
                {
					var ok = await C_MessageBox.MessageBox(this, "Success", "All calendar entries were created.", E_MessageBoxButtons.Ok);
				}

				AI_Busy.StopAnimating();
				EnableUI(true);
            };

            B_WorkItems.TouchUpInside += (sender, e) => 
            {
                Global.SelectedSiteSlug = null;
                if (SelectedSite != null)
                    Global.SelectedSiteSlug = SelectedSite.Slug;
                Global.SelectedUser = null;
                Global.ViewCameFrom = E_ViewCameFrom.SCSites;
                PerformSegue("Segue_SitesToSignUps", this);
            };

            B_Refresh.TouchUpInside += async (sender, e) => 
            {
                SiteEnable(false);
                AI_Busy.StartAnimating();

                Sites = await Global.FetchAllSites();

                AI_Busy.StopAnimating();
                SiteEnable(true);
                TV_Sites.ReloadData();

            };

            SiteEnable(false);

			AI_Busy.StartAnimating();
			EnableUI(false);

            Task.Run(async () => 
            {
                if (!Global.AllSitesFetched)
                    Sites = await Global.FetchAllSites();
                else
                    Sites = Global.GetAllSitesNoFetch();
				Sites.Sort(CompareSitesBySiteName);

                if (!Global.AllUsersFetched)
                    Users = await Global.FetchAllUsers(LoggedInUser.Token);
                else
                    Users = Global.GetAllUsersNoCache();

				UIApplication.SharedApplication.InvokeOnMainThread(
                new Action(() =>
                {
                	AI_Busy.StopAnimating();
                	EnableUI(true);

                    // --------------- primary site coordinator selector ---------------------

                    PV_PrimarySiteCoordinator = new UIPickerView()
                    {
                        Model = new SiteCoordinatorPickerModel(Users),
                    };
                    UIToolbar ToolBar_PrimarySiteCoordinator = new UIToolbar()
                    {
                        BarStyle = UIBarStyle.Black,
                        Translucent = true
                    };
                    ToolBar_PrimarySiteCoordinator.SizeToFit();
                    UIBarButtonItem doneButtonPrimarySiteCoordinator = new UIBarButtonItem("Done", UIBarButtonItemStyle.Done, (s, e) =>
                    {
                        int num = (int)PV_PrimarySiteCoordinator.SelectedRowInComponent(0);
                        TB_Primary.Text = Users[num].Name;
                        TB_Primary.ResignFirstResponder();

                        Dirty = true;
                        B_SaveChanges.Enabled = true;
                    });
                    ToolBar_PrimarySiteCoordinator.SetItems(new UIBarButtonItem[] { doneButtonPrimarySiteCoordinator }, true);
                    UITextAttributes uitaef = new UITextAttributes()
                    {
                        TextColor = UIColor.White
                    };
                    doneButtonPrimarySiteCoordinator.SetTitleTextAttributes(uitaef, UIControlState.Normal);

                    PV_PrimarySiteCoordinator.ShowSelectionIndicator = true;
                    TB_Primary.InputView = PV_PrimarySiteCoordinator;
                    TB_Primary.InputAccessoryView = ToolBar_PrimarySiteCoordinator;

					//int ipc = GetIndexOfUser(SelectedSite.PrimaryCoordinator, Users);
					//PV_PrimarySiteCoordinator.Select(ipc, 0, true);
					//TB_Primary.Text = SelectedSite.PrimaryCoordinatorName;

					// --------------- backup site coordinator selector ---------------------

					PV_BackupSiteCoordinator = new UIPickerView()
					{
						Model = new SiteCoordinatorPickerModel(Users),
					};
					UIToolbar ToolBar_BackupSiteCoordinator = new UIToolbar()
					{
						BarStyle = UIBarStyle.Black,
						Translucent = true
					};
					ToolBar_BackupSiteCoordinator.SizeToFit();
					UIBarButtonItem doneButtonBackupSiteCoordinator = new UIBarButtonItem("Done", UIBarButtonItemStyle.Done, (s, e) =>
					{
						int num = (int)PV_BackupSiteCoordinator.SelectedRowInComponent(0);
						TB_Backup.Text = Users[num].Name;
						TB_Backup.ResignFirstResponder();

						Dirty = true;
						B_SaveChanges.Enabled = true;
					});
					ToolBar_BackupSiteCoordinator.SetItems(new UIBarButtonItem[] { doneButtonBackupSiteCoordinator }, true);
					UITextAttributes uitaefb = new UITextAttributes()
					{
						TextColor = UIColor.White
					};
					doneButtonBackupSiteCoordinator.SetTitleTextAttributes(uitaefb, UIControlState.Normal);

					PV_BackupSiteCoordinator.ShowSelectionIndicator = true;
					TB_Backup.InputView = PV_BackupSiteCoordinator;
					TB_Backup.InputAccessoryView = ToolBar_BackupSiteCoordinator;

					//int ipb = GetIndexOfUser(SelectedSite.BackupCoordinator, Users);
					//PV_BackupSiteCoordinator.Select(ipb, 0, true);
					//TB_Backup.Text = SelectedSite.BackupCoordinatorName;

                    // ----------------- season start ---------------

					DP_SeasonStart = new UIDatePicker()
                    {
                        Mode = UIDatePickerMode.Date
                    };

                    UIToolbar ToolBar_SeasonStart = new UIToolbar()
                    {
                        BarStyle = UIBarStyle.Black,
                        Translucent = true
                    };
                    ToolBar_SeasonStart.SizeToFit();

                    UIBarButtonItem doneButtonSeasonStart = new UIBarButtonItem("Done", UIBarButtonItemStyle.Done, (s, e) =>
                    {
                        DateTime dt = C_NSDateConversions.NSDateToDateTime(DP_SeasonStart.Date);
                        C_YMD ymd = new C_YMD(dt);
                        TB_SeasonStart.Text = ymd.ToString("yyyy-mm-dd");
                        TB_SeasonStart.ResignFirstResponder();
                        Dirty = true;
                        B_SaveChanges.Enabled = true;
                    });
                    ToolBar_SeasonStart.SetItems(new UIBarButtonItem[] { doneButtonSeasonStart }, true);
                    UITextAttributes uitaot = new UITextAttributes()
                    {
                        TextColor = UIColor.White
                    };
                    doneButtonSeasonStart.SetTitleTextAttributes(uitaot, UIControlState.Normal);

                    TB_SeasonStart.InputView = DP_SeasonStart;
                    TB_SeasonStart.InputAccessoryView = ToolBar_SeasonStart;
           //         DP_SeasonStart.Date = C_NSDateConversions.BuildNSDateFromDate(SelectedSite.SeasonFirstDate);
                    //TB_SeasonStart.Text = SelectedSite.SeasonFirstDate.ToString("yyyy-mm-dd");

                    // -------------- season end -----------

                    DP_SeasonEnd = new UIDatePicker()
                    {
                        Mode = UIDatePickerMode.Date
                    };

                    UIToolbar ToolBar_SeasonEnd = new UIToolbar()
                    {
                        BarStyle = UIBarStyle.Black,
                        Translucent = true
                    };
                    ToolBar_SeasonEnd.SizeToFit();

                    UIBarButtonItem doneButtonSeasonEnd = new UIBarButtonItem("Done", UIBarButtonItemStyle.Done, (s, e) =>
                    {
                        DateTime dt = C_NSDateConversions.NSDateToDateTime(DP_SeasonEnd.Date);
                        C_YMD ymd = new C_YMD(dt);
                        TB_SeasonEnd.Text = ymd.ToString("yyyy-mm-dd");
                        TB_SeasonEnd.ResignFirstResponder();
                        Dirty = true;
                        B_SaveChanges.Enabled = true;
                    });
                    ToolBar_SeasonEnd.SetItems(new UIBarButtonItem[] { doneButtonSeasonEnd }, true);
                    UITextAttributes uitaot2 = new UITextAttributes()
                    {
                        TextColor = UIColor.White
                    };
                    doneButtonSeasonEnd.SetTitleTextAttributes(uitaot2, UIControlState.Normal);

                    TB_SeasonEnd.InputView = DP_SeasonEnd;
                    TB_SeasonEnd.InputAccessoryView = ToolBar_SeasonEnd;

           //         DP_SeasonEnd.Date = C_NSDateConversions.BuildNSDateFromDate(SelectedSite.SeasonLastDate);
                    //TB_SeasonEnd.Text = SelectedSite.SeasonLastDate.ToString("yyyy-mm-dd");

                    SitesTableSource = new C_SitesTableSource(Global, Sites);
                    SitesTableDelegate = new C_SitesTableDelegate(Global, this, SitesTableSource);
                    SitesTableDelegate.SitesTableRowSelect += (sender, a) => 
                    {
                        PopulateSite(a.Site); // this has to be first or we could update the wrong site
                        SelectedSite = a.Site;
                    };

					TV_Sites.Source = SitesTableSource;
					TV_Sites.Delegate = SitesTableDelegate;
                	TV_Sites.ReloadData();
                }));

			});
		}

        private int CompareSitesBySiteName(C_VitaSite site1, C_VitaSite site2)
        {
            return site1.Name.CompareTo(site2.Name);
        }

        void TextField_ValueChanged(object sender, EventArgs e)
		{
            Dirty = true;
            B_SaveChanges.Enabled = true;
		}

        private async Task<C_IOResult> UpdateSiteCapabilities()
		{
			EnableUI(false);
			AI_Busy.StartAnimating();

            SelectedSite.SiteCapabilities = new List<E_SiteCapabilities>();
			if (SW_DropOff.On)
				SelectedSite.SiteCapabilities.Add(E_SiteCapabilities.DropOff);
			if (SW_Express.On)
				SelectedSite.SiteCapabilities.Add(E_SiteCapabilities.Express);
			if (SW_MFT.On)
				SelectedSite.SiteCapabilities.Add(E_SiteCapabilities.MFT);

            C_IOResult ior = await Global.UpdateSiteCapabilities(SelectedSite, LoggedInUser.Token);

			EnableUI(true);
			AI_Busy.StopAnimating();

			return ior;
		}

        private async Task<C_IOResult> UpdateSite()
		{
			EnableUI(false);
			AI_Busy.StartAnimating();

            SelectedSite.Name = TB_SiteName.Text;
            SelectedSite.Street = TB_Street.Text;
            SelectedSite.City = TB_City.Text;
            SelectedSite.State = TB_State.Text;
            SelectedSite.Zip = TB_Zip.Text;
            SelectedSite.Latitude = TB_Latitude.Text;
            SelectedSite.Longitude = TB_Longitude.Text;
            SelectedSite.PlaceID = TB_PlaceID.Text;
            try { SelectedSite.SeasonFirstDate = new C_YMD(TB_SeasonStart.Text); }
            catch {}
            try { SelectedSite.SeasonLastDate = new C_YMD(TB_SeasonEnd.Text); }
			catch { }
            int psc = (int)PV_PrimarySiteCoordinator.SelectedRowInComponent(0);
            int pscid = Users[psc].id;
            SelectedSite.PrimaryCoordinatorId = pscid;
            int bsc = (int)PV_BackupSiteCoordinator.SelectedRowInComponent(0);
			int bscid = Users[bsc].id;
            SelectedSite.BackupCoordinatorId = bscid;

            C_IOResult ior = await Global.UpdateSimpleFields(SelectedSite, LoggedInUser.Token);
            if (ior.Success)
                Dirty = false;

			EnableUI(true);
			AI_Busy.StopAnimating();

			return ior;
		}

		private void EnableUI(bool en)
        {
            TV_Sites.UserInteractionEnabled = en;
            B_CreateNewSite.Enabled = en;
            B_Back.Enabled = en;
        }

        private void PopulateSite(C_VitaSite site)
        {
            Task.Run(async () => 
            {
                if (Dirty)
                {
                    E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this, "Save Changes?", "Changes were made. Save?", E_MessageBoxButtons.YesNo);
                    if (mbres == E_MessageBoxResults.Yes)
                    {
                        C_IOResult ior = await UpdateSite();
                        if (!ior.Success)
						{
                            var ok = await C_MessageBox.MessageBox(this, "Error", ior.ErrorMessage, E_MessageBoxButtons.Ok);
						}
					}
    			}

                UIApplication.SharedApplication.InvokeOnMainThread(
                new Action(() =>
                {
                    SiteEnable(true);

                    TB_SiteName.Text = site.Name;
                    L_Slug.Text = site.Slug;
                    TB_Street.Text = site.Street;
                    TB_City.Text = site.City;
                    TB_State.Text = site.State;
                    TB_Zip.Text = site.Zip;
                    TB_Latitude.Text = site.Latitude;
                    TB_Longitude.Text = site.Longitude;
                    TB_PlaceID.Text = site.PlaceID;
                    TB_SeasonStart.Text = site.SeasonFirstDate.ToString("mmm dd,yyyy");
                    TB_SeasonEnd.Text = site.SeasonLastDate.ToString("mmm dd,yyyy");

					int ipc = GetIndexOfUser(SelectedSite.PrimaryCoordinatorId, Users);
					PV_PrimarySiteCoordinator.Select(ipc, 0, true);
					TB_Primary.Text = SelectedSite.PrimaryCoordinatorName;

                    int ipb = GetIndexOfUser(site.BackupCoordinatorId, Users);
					PV_BackupSiteCoordinator.Select(ipb, 0, true);
					TB_Backup.Text = site.BackupCoordinatorName;

					DP_SeasonEnd.Date = C_NSDateConversions.BuildNSDateFromDate(SelectedSite.SeasonLastDate);
					TB_SeasonEnd.Text = SelectedSite.SeasonLastDate.ToString("yyyy-mm-dd");
					
                    DP_SeasonStart.Date = C_NSDateConversions.BuildNSDateFromDate(SelectedSite.SeasonFirstDate);
					TB_SeasonStart.Text = SelectedSite.SeasonFirstDate.ToString("yyyy-mm-dd");

					SW_DropOff.On = site.SiteCapabilities.Contains(E_SiteCapabilities.DropOff);
                    SW_Express.On = site.SiteCapabilities.Contains(E_SiteCapabilities.Express);
                    SW_MFT.On = site.SiteCapabilities.Contains(E_SiteCapabilities.MFT);

                    SW_Accepting.On = site.ClientStatus == E_ClientSiteStatus.Accepting;
                    SW_NearLimit.On = site.ClientStatus == E_ClientSiteStatus.NearLimit;
                    SW_AtLimit.On = site.ClientStatus == E_ClientSiteStatus.NotAccepting;
                    SW_Closed.On = site.ClientStatus == E_ClientSiteStatus.Closed;

                    B_SaveChanges.Enabled = false;
                    Dirty = false;

        			B_SaveChanges.SetTitle("Save Changes", UIControlState.Normal);
                }));
            });
		}

        private int GetIndexOfUser(int id, List<C_VitaUser> users)
        {
            int res = -1;
            for (int ix = 0; ix != users.Count; ix++)
            {
                if (users[ix].id == id)
                {
                    res = ix;
                    break;
                }
            }
            return res;
        }

        private void SiteEnable(bool en)
        {
            TB_SiteName.Enabled = en;
            TB_Street.Enabled = en;
            TB_City.Enabled = en;
            TB_State.Enabled = en;
            TB_Zip.Enabled = en;
            TB_PlaceID.Enabled = en;
            TB_Latitude.Enabled = en;
            TB_Longitude.Enabled = en;
            TB_Primary.Enabled = en;
            TB_Backup.Enabled = en;
            TB_SeasonStart.Enabled = en;
            TB_SeasonEnd.Enabled = en;
            SW_DropOff.Enabled = en;
            SW_Express.Enabled = en;
            SW_MFT.Enabled = en;
            B_SaveChanges.Enabled = en && Dirty;
            B_Calendar.Enabled = en;
            B_WorkItems.Enabled = en;
            SW_Accepting.Enabled = en;
            SW_NearLimit.Enabled = en;
            SW_AtLimit.Enabled = en;
            SW_Closed.Enabled = en;
        }

		public class SiteCoordinatorPickerModel : UIPickerViewModel
		{
            readonly List<C_VitaUser> Users;

            public SiteCoordinatorPickerModel(List<C_VitaUser> users)
			{
                Users = users;
			}

			public override nint GetComponentCount(UIPickerView pickerView)
			{
				return 1;
			}

			public override nint GetRowsInComponent(UIPickerView pickerView, nint component)
			{
				return Users.Count;
			}

			public override string GetTitle(UIPickerView pickerView, nint row, nint component)
			{
                return Users[(int)row].Name;
			}
		}

		public class C_SitesTableDelegate : UITableViewDelegate
		{
			readonly C_Global Global;
            readonly VC_Sites OurVC;
			readonly C_SitesTableSource TableSource;
			//readonly string Token;

            public event SiteTableEventHandler SitesTableRowSelect;
			public event SiteTableEventHandler SitesTableRowDeselect;

			public C_SitesTableDelegate(C_Global global, VC_Sites vc, C_SitesTableSource tsource)
			{
				Global = global;
				OurVC = vc;
				TableSource = tsource;

				//C_VitaUser user = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
				//Token = user.Token;
			}

			//public override UITableViewRowAction[] EditActionsForRow(UITableView tableView, NSIndexPath indexPath)
			//{
			//	UITableViewRowAction hiButton = UITableViewRowAction.Create(UITableViewRowActionStyle.Default, "Remove",
			//	async delegate
			//	{
   //                 C_VitaSite siteToRemove = TableSource.Sites[indexPath.Row];

			//		OurVC.AI_Busy.StartAnimating();
			//		OurVC.EnableUI(false);

			//		bool succ = await siteToRemove.de
			//		TableSource.Sites.Remove(siteToRemove);

			//		OurVC.EnableUI(true);
			//		OurVC.AI_Busy.StopAnimating();

			//		OurVC.TV_Suggestions.ReloadData();
			//	});

			//	return new UITableViewRowAction[] { hiButton };
			//}

            public override void RowDeselected(UITableView tableView, NSIndexPath indexPath)
            {
                SitesTableRowDeselect?.Invoke(this, new C_SitesTableEvent(TableSource.Sites[indexPath.Row]));
            }

			public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
			{
                SitesTableRowSelect?.Invoke(this, new C_SitesTableEvent(TableSource.Sites[indexPath.Row]));
            }

			public class C_SitesTableEvent : EventArgs
			{
                public C_VitaSite Site;
                
                public C_SitesTableEvent(C_VitaSite site)
				{
                    Site = site;
				}
			}

            public delegate void SiteTableEventHandler(object sender, C_SitesTableEvent a);
		}

		public class C_SitesTableSource : UITableViewSource
		{
			const string CellIdentifier = "TableCell_SitesTableSource";
            public List<C_VitaSite> Sites;
			readonly C_Global Global;

			public C_SitesTableSource(C_Global global, List<C_VitaSite> sites)
			{
				Global = global;
				Sites = sites;
			}

			public override nint RowsInSection(UITableView tableview, nint section)
			{
				int count = 0;
				if (Sites != null)
					count = Sites.Count;
				return count;
			}

			public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
			{
				UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);

				//---- if there are no cells to reuse, create a new one
				if (cell == null)
					cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

                C_VitaSite site = Sites[indexPath.Row];

                cell.TextLabel.Text = site.Name;
                cell.DetailTextLabel.Text = site.Street + ", " + site.City + " " + site.State + " " + site.Zip;

				return cell;
			}
		}
    }
}