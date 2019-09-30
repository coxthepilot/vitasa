using Foundation;
using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using UIKit;

using zsquared;
using static zsquared.C_MessageBox;


namespace vitaadmin
{
    public partial class VC_Calendar : UIViewController
    {
        C_Global Global;
		C_VitaUser LoggedInUser;
        C_VitaSite SelectedSite;

        bool DirtyExc;

        C_CalendarEntry SelectedCalendarEntry;

        C_TimePicker OpenShift;
        C_TimePicker CloseShift;
        C_ItemPicker DateInSeasonPicker;

        C_WorkShift SelectedShift;

        C_CalendarEntryTableManager CalendarEntriesTableManager;

        C_ShiftTableManager ShiftTableManager;

		List<C_SignUp> AllSignUps;

		public VC_Calendar (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            AllSignUps = new List<C_SignUp>();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
            SelectedSite = Global.GetSiteFromSlugNoFetch(Global.SelectedSiteSlug);

            L_ExcSite.Text = SelectedSite.Name;

            OpenShift = new C_TimePicker(TB_ExcOpenShift);
            OpenShift.TimePickerDone += (sender, e) => 
            {
                B_ExcSave.Enabled = true;
            };
			CloseShift = new C_TimePicker(TB_ExcCloseShift);
            CloseShift.TimePickerDone += (sender, e) => 
            {
                B_ExcSave.Enabled = true;
            };

            CalendarEntriesTableManager = new C_CalendarEntryTableManager(this, TV_Exceptions, Global, SelectedSite.SiteCalendar);
			CalendarEntriesTableManager.RowSelect += async (sender, e) =>
			{
				SelectedCalendarEntry = e.CalendarEntry;
                if (!SelectedCalendarEntry.HaveShifts)
                {
                    List<C_WorkShift> shifts = await Global.FetchAllShiftsForCalendarEntry(LoggedInUser.Token, SelectedSite.Slug, SelectedCalendarEntry);
                }
				PopulateCalendarEntry(e.CalendarEntry);
			};
            CalendarEntriesTableManager.RowDeselect += (sender, e) => 
            {
                DePopulateCalendarEntry(e.CalendarEntry);
                SelectedCalendarEntry = null;
            };
            CalendarEntriesTableManager.RowDelete += async (sender, e) => 
            {
                C_CalendarEntry ceToDel = e.CalendarEntry;

                if (ceToDel.WorkShifts.Count != 0)
                {
                    var ok = await C_MessageBox.MessageBox(this, "Work Shifts Remain", "Cannot delete a Calendar Entry that still has shifts.", E_MessageBoxButtons.Ok);
                }
                else
                {
                    C_IOResult ior = await Global.RemoveCalendarEntry(SelectedSite, LoggedInUser.Token, ceToDel);
                    if (!ior.Success)
                    {
                        var ok = await C_MessageBox.MessageBox(this, "Error", ior.ErrorMessage, E_MessageBoxButtons.Ok);
                    }
                    TV_Exceptions.ReloadData();
                }
            };

            List<string> daysInSeason = new List<string>();
            C_YMD date = SelectedSite.SeasonFirstDate;
            do
            {
                daysInSeason.Add(date.ToString("yyyy-mm-dd"));

                date = date.AddDays(1);

            } while (date != SelectedSite.SeasonLastDate);
            daysInSeason.Add(date.ToString("yyyy-mm-dd"));
            DateInSeasonPicker = new C_ItemPicker(TB_DateForCalendarEntry, daysInSeason);
            if ((C_YMD.Now >= SelectedSite.SeasonFirstDate) && (C_YMD.Now <= SelectedSite.SeasonLastDate))
                DateInSeasonPicker.SetSelection(C_YMD.Now.ToString("yyyy-mm-dd"));

            B_NewException.TouchUpInside += async (sender, e) => 
            {
                C_YMD newDate = null;
                try
                {
                    newDate = new C_YMD(TB_DateForCalendarEntry.Text);
                }
                catch (Exception e2)
                {
#if DEBUG
                    Console.WriteLine(e2.Message);
#endif
                }
                if (newDate != null)
                {
                    C_CalendarEntry newCE = new C_CalendarEntry
                    {
                        Date = newDate,
                        Dirty = false,
                        SiteID = SelectedSite.id,
                        SiteIsOpen = false
                    };

                    C_IOResult ior = await Global.CreateCalendarEntry(SelectedSite, LoggedInUser.Token, newCE);

                    if (!ior.Success)
                    {
                        var ok = await C_MessageBox.MessageBox(this, "Error", ior.ErrorMessage, E_MessageBoxButtons.Ok);
                    }

                    TV_Exceptions.ReloadData();
                }
            };

            B_Back.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_CalendarToSite", this);
            };

            B_ExcSave.TouchUpInside += async (sender, e) => 
            {
                SelectedShift.OpenTime = OpenShift.Value;
                SelectedShift.CloseTime = CloseShift.Value;
                try { SelectedShift.NumBasicEFilers = Convert.ToInt32(TB_ExcBasicShift.Text); }
                catch {}
                try { SelectedShift.NumAdvEFilers = Convert.ToInt32(TB_ExcAdvShift.Text); }
				catch { }

                C_IOResult ior = await Global.UpdateShift(LoggedInUser.Token, SelectedSite.Slug, SelectedShift, SelectedCalendarEntry);

                if (!ior.Success)
				{
                    var ok = await C_MessageBox.MessageBox(this, "Error", ior.ErrorMessage, E_MessageBoxButtons.Ok);
				}

                B_ExcSave.Enabled = false;
                CalendarEntriesTableManager.ReloadData();
                TV_ExcShifts.ReloadData();
			};

            B_ExcNewShift.TouchUpInside += async (sender, e) => 
            {
                C_WorkShift nws = new C_WorkShift()
                {
                    CalendarId = SelectedCalendarEntry.id,
                    CloseTime = new C_HMS(17, 00, 00),
                    OpenTime = new C_HMS(8, 0, 0),
                    NumBasicEFilers = 5,
                    NumAdvEFilers = 5,
                    SiteSlug = SelectedSite.Slug
                };

                AI_Busy.StartAnimating();

                C_IOResult ior = await Global.CreateShift(LoggedInUser.Token, SelectedSite.Slug, nws, SelectedCalendarEntry);

                AI_Busy.StopAnimating();

                if (!ior.Success)
				{
                    var ok = await C_MessageBox.MessageBox(this, "Error", ior.ErrorMessage, E_MessageBoxButtons.Ok);
				}
                ShiftTableManager.ReloadData();
			};

            SW_ExcIsOpen.ValueChanged += async (sender, e) => 
            {
                SelectedCalendarEntry.SiteIsOpen = SW_ExcIsOpen.On;

                AI_Busy.StartAnimating();

                C_IOResult ior = await Global.UpdateCalendarEntry(SelectedSite, LoggedInUser.Token, SelectedCalendarEntry);

				AI_Busy.StopAnimating();

                if (!ior.Success)
				{
					var ok = await C_MessageBox.MessageBox(this, "Error", "Unable to create new shift.", E_MessageBoxButtons.Ok);
				}

                CalendarEntriesTableManager.ReloadData();
			};

            TB_ExcBasicShift.AddTarget(TextField_ValueChanged, UIControlEvent.EditingChanged);
            TB_ExcAdvShift.AddTarget(TextField_ValueChanged, UIControlEvent.EditingChanged);

			DirtyExc = false;

            EnableCalendarEntry(false);
            EnableShift(false);
		}

        void TextField_ValueChanged(object sender, EventArgs e) => B_ExcSave.Enabled = true;

        private void EnableCalendarEntry(bool en)
		{
            L_CalendarEntryFor.Hidden = !en;
            TB_ExcDate.Hidden = !en;
            TB_ExcDate.Enabled = en;
            SW_ExcIsOpen.Hidden = !en;
            SW_ExcIsOpen.Enabled = en;
            L_SiteIsOpen.Hidden = !en;
            L_Shifts.Hidden = !en;
            TV_ExcShifts.Hidden = !en;
            TV_ExcShifts.UserInteractionEnabled = en;
            L_DeleteShift.Hidden = !en;
            B_ExcNewShift.Hidden = !en;
            B_ExcNewShift.Enabled = en;
		}

        private void PopulateCalendarEntry(C_CalendarEntry ce)
		{
			EnableCalendarEntry(true);

			SW_ExcIsOpen.On = ce.SiteIsOpen;

            TB_ExcDate.Text = ce.Date.ToString("yyyy-mm-dd");

			ShiftTableManager = new C_ShiftTableManager(this, TV_ExcShifts, Global, ce.WorkShifts, ce);
			ShiftTableManager.RowSelect += (sender, e) =>
			{
				SelectedShift = e.Shift;
				PopulateShift(e.Shift);
			};
			ShiftTableManager.RowDeselect += (sender, e) =>
			{
				DePopulateShift(e.Shift);
                SelectedShift = null;
			};
			ShiftTableManager.RowDelete += async (sender, e) =>
			{
                C_WorkShift shiftToDelete = e.Shift;

                List<C_SignUp> sus = Global.GetSignUpsByShiftId(shiftToDelete.id);
                if (sus.Count == 0)
                {
                    C_IOResult ior = await Global.RemoveShift(LoggedInUser.Token, SelectedSite.Slug, shiftToDelete, SelectedCalendarEntry);
                    if (ior.Success)
                        SelectedCalendarEntry.WorkShifts.Remove(shiftToDelete);
                    ShiftTableManager.ReloadData();
                }
                else
                {
                    C_MessageBox.E_MessageBoxResults mbresx = await C_MessageBox.MessageBox(this, "Users Signed Up", "We can't delete a shift with users signed up.", C_MessageBox.E_MessageBoxButtons.Ok);
                }
			};

            DePopulateShift(SelectedShift);
		}

        private void DePopulateCalendarEntry(C_CalendarEntry ce)
        {
            ce.SiteIsOpen = SW_ExcIsOpen.On;
            DePopulateShift(SelectedShift);
            EnableCalendarEntry(false);
        }

        private void EnableShift(bool en)
        {
            L_ShiftDetails.Hidden = !en;
            L_Open.Hidden = !en;
            L_Close.Hidden = !en;
            L_Basic.Hidden = !en;
            L_Advanced.Hidden = !en;
            TB_ExcOpenShift.Hidden = !en;
            TB_ExcOpenShift.Enabled = en;
            TB_ExcCloseShift.Hidden = !en;
            TB_ExcCloseShift.Enabled = en;
            TB_ExcBasicShift.Hidden = !en;
            TB_ExcBasicShift.Enabled = en;
            TB_ExcAdvShift.Hidden = !en;
            TB_ExcAdvShift.Enabled = en;
            B_ExcSave.Hidden = !en;
            B_ExcSave.Enabled = en && DirtyExc;
        }

        private void PopulateShift(C_WorkShift s)
		{
			EnableShift(true);

			OpenShift.SetValue(s.OpenTime);
			CloseShift.SetValue(s.CloseTime);

            List<C_SignUp> sus = Global.GetSignUpsByShiftId(s.id);
            L_UsersOnShift.Text = sus.Count.ToString() + " users signed up.";

			TB_ExcBasicShift.Text = s.NumBasicEFilers.ToString();
			TB_ExcAdvShift.Text = s.NumAdvEFilers.ToString();
		}

        private void DePopulateShift(C_WorkShift s)
		{
            EnableShift(false);

            if (s == null) 
                return;
            
			s.OpenTime = OpenShift.Value;
			s.CloseTime = CloseShift.Value;

			try { s.NumBasicEFilers = Convert.ToInt32(TB_ExcBasicShift.Text); }
			catch { }
			try { s.NumAdvEFilers = Convert.ToInt32(TB_ExcAdvShift.Text); }
			catch { }
		}

		public class C_CalendarEntryTableManager
        {
            C_Global Global;
            UIViewController OurVC;
            UITableView TableView;

            C_CalendarEntryTableSource TableSource;
            C_CalendarEntryTableDelegate TableDelegate;

            List<C_CalendarEntry> CalendarEntries;

			public event CalendarEntryEventHandler RowSelect;
			public event CalendarEntryEventHandler RowDeselect;
			public event CalendarEntryEventHandler RowDelete;

			public C_CalendarEntryTableManager(UIViewController vc, UITableView tableView, C_Global global, List<C_CalendarEntry> entries)
            {
				TableView = tableView;
				Global = global;
				CalendarEntries = entries;
				OurVC = vc;

				TableSource = new C_CalendarEntryTableSource(Global, CalendarEntries);
				TableDelegate = new C_CalendarEntryTableDelegate(Global, OurVC, TableSource);
				TableDelegate.RowSelect += (sender, e) =>
				{
					RowSelect?.Invoke(sender, e);
				};
				TableDelegate.RowDeselect += (sender, e) =>
				{
					RowDeselect?.Invoke(sender, e);
				};
				TableDelegate.RowDelete += (sender, e) =>
				{
					RowDelete?.Invoke(sender, e);
				};
				TableView.Source = TableSource;
				TableView.Delegate = TableDelegate;
				TableView.ReloadData();
			}

            public void ReloadData()
            {
                TableView.ReloadData();
            }

			public class C_CalendarEntryTableDelegate : UITableViewDelegate
			{
				readonly C_Global Global;
                readonly UIViewController OurVC;
				readonly C_CalendarEntryTableSource TableSource;

				public event CalendarEntryEventHandler RowSelect;
				public event CalendarEntryEventHandler RowDeselect;
				public event CalendarEntryEventHandler RowDelete;

				public C_CalendarEntryTableDelegate(C_Global global, UIViewController vc, C_CalendarEntryTableSource tsource)
				{
					Global = global;
					OurVC = vc;
					TableSource = tsource;
				}

				public override UITableViewRowAction[] EditActionsForRow(UITableView tableView, NSIndexPath indexPath)
				{
					UITableViewRowAction hiButton = UITableViewRowAction.Create(UITableViewRowActionStyle.Default, "Remove",
					delegate
					{
						C_CalendarEntry ce = TableSource.CalendarEntries[indexPath.Row];
						RowDelete?.Invoke(this, new C_CalendarEntryEventArgs(ce));
					});

					return new UITableViewRowAction[] { hiButton };
				}

				public override void RowDeselected(UITableView tableView, NSIndexPath indexPath)
				{
					C_CalendarEntry ce = TableSource.CalendarEntries[indexPath.Row];
					RowDeselect?.Invoke(this, new C_CalendarEntryEventArgs(ce));
				}

				public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
				{
					C_CalendarEntry ce = TableSource.CalendarEntries[indexPath.Row];
					RowSelect?.Invoke(this, new C_CalendarEntryEventArgs(ce));
				}
			}

			public class C_CalendarEntryTableSource : UITableViewSource
			{
				const string CellIdentifier = "TableCell_CalendarEntryTableSource";
				readonly C_Global Global;
                public readonly List<C_CalendarEntry> CalendarEntries;

				public C_CalendarEntryTableSource(C_Global global, List<C_CalendarEntry> ce)
				{
					Global = global;
					CalendarEntries = ce;

                    CalendarEntries.Sort(C_CalendarEntry.CompareByDate);
				}

				public override nint RowsInSection(UITableView tableview, nint section)
				{
                    return CalendarEntries.Count;
				}

				public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
				{
					UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);

					//---- if there are no cells to reuse, create a new one
					if (cell == null)
						cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

					C_CalendarEntry ce = CalendarEntries[indexPath.Row];

					string dow = C_YMD.DayOfWeekNames[(int)ce.Date.DayOfWeek];

					cell.TextLabel.Text = dow + ", " + ce.Date.ToString("mmm dd, yyyy");

					cell.DetailTextLabel.Text = ce.SiteIsOpen ? "Open" : "Closed";

					return cell;
				}
			}
		}

        public class C_CalendarEntryEventArgs : EventArgs
		{
			public C_CalendarEntry CalendarEntry;

			public C_CalendarEntryEventArgs(C_CalendarEntry ce)
			{
				CalendarEntry = ce;
			}
		}

		public delegate void CalendarEntryEventHandler(object sender, C_CalendarEntryEventArgs e);

        public class C_ShiftTableManager
		{
			C_Global Global;
			UIViewController OurVC;
			UITableView TableView;
            C_CalendarEntry SelectedCalendarEntry;

			C_ShiftTableSource TableSource;
            C_ShiftTableDelegate TableDelegate;

            List<C_WorkShift> Shifts;

			public event ShiftEventHandler RowSelect;
			public event ShiftEventHandler RowDeselect;
			public event ShiftEventHandler RowDelete;

            public C_ShiftTableManager(UIViewController vc, UITableView tableView, C_Global global, List<C_WorkShift> entries, C_CalendarEntry calEntry)
			{
				TableView = tableView;
				Global = global;
				Shifts = entries;
				OurVC = vc;
                SelectedCalendarEntry = calEntry;

				TableSource = new C_ShiftTableSource(Global, Shifts, SelectedCalendarEntry);
				TableDelegate = new C_ShiftTableDelegate(Global, OurVC, TableSource);
				TableDelegate.RowSelect += (sender, e) =>
				{
					RowSelect?.Invoke(sender, e);
				};
				TableDelegate.RowDeselect += (sender, e) =>
				{
					RowDeselect?.Invoke(sender, e);
				};
				TableDelegate.RowDelete += (sender, e) =>
				{
					RowDelete?.Invoke(sender, e);
				};
				TableView.Source = TableSource;
				TableView.Delegate = TableDelegate;
				TableView.ReloadData();
			}

            public void ReloadData()
            {
				TableView.ReloadData();
			}

            public class C_ShiftTableDelegate : UITableViewDelegate
			{
				readonly C_Global Global;
				readonly UIViewController OurVC;
				readonly C_ShiftTableSource TableSource;

				public event ShiftEventHandler RowSelect;
				public event ShiftEventHandler RowDeselect;
				public event ShiftEventHandler RowDelete;

				public C_ShiftTableDelegate(C_Global global, UIViewController vc, C_ShiftTableSource tsource)
				{
					Global = global;
					OurVC = vc;
					TableSource = tsource;
				}

				public override UITableViewRowAction[] EditActionsForRow(UITableView tableView, NSIndexPath indexPath)
				{
					UITableViewRowAction hiButton = UITableViewRowAction.Create(UITableViewRowActionStyle.Default, "Remove",
					delegate
					{
						C_WorkShift ce = TableSource.Shifts[indexPath.Row];
						RowDelete?.Invoke(this, new C_ShiftEventArgs(ce));
					});

					return new UITableViewRowAction[] { hiButton };
				}

				public override void RowDeselected(UITableView tableView, NSIndexPath indexPath)
				{
					C_WorkShift ce = TableSource.Shifts[indexPath.Row];
					RowDeselect?.Invoke(this, new C_ShiftEventArgs(ce));
				}

				public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
				{
					C_WorkShift ce = TableSource.Shifts[indexPath.Row];
					RowSelect?.Invoke(this, new C_ShiftEventArgs(ce));
				}
			}

			public class C_ShiftTableSource : UITableViewSource
			{
				const string CellIdentifier = "TableCell_CalendarEntryTableSource";
				readonly C_Global Global;
                public readonly List<C_WorkShift> Shifts;
                readonly C_CalendarEntry SelectedCalendarEntry;

                public C_ShiftTableSource(C_Global global, List<C_WorkShift> ce, C_CalendarEntry calEntry)
				{
					Global = global;
					Shifts = ce;
                    SelectedCalendarEntry = calEntry;
				}

				public override nint RowsInSection(UITableView tableview, nint section)
				{
					return Shifts.Count;
				}

				public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
				{
					UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);

					//---- if there are no cells to reuse, create a new one
					if (cell == null)
						cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

					C_WorkShift ce = Shifts[indexPath.Row];

					cell.TextLabel.Text = SelectedCalendarEntry.Date.ToString("mmm dd, yyyy");

                    cell.DetailTextLabel.Text = ce.OpenTime.ToString("hh:mm p") + " - " + ce.CloseTime.ToString("hh:mm p");

					return cell;
				}
			}
		}

        public class C_ShiftEventArgs : EventArgs
		{
            public C_WorkShift Shift;

            public C_ShiftEventArgs(C_WorkShift ws)
			{
				Shift = ws;
			}
		}

        public delegate void ShiftEventHandler(object sender, C_ShiftEventArgs e);
	}
}