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
        C_ItemPicker DOWPicker;

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
            SelectedSite = Global.GetSiteNoFetch(Global.SelectedSiteSlug);

            EnableCalendarEntry(false);

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
            CalendarEntriesTableManager.RowDelete += (sender, e) => 
            {
                // todo: delete the indicated object
                // remove from the TableView
            };

            List<string> dowList = new List<string>(C_YMD.DayOfWeekNames);
            DOWPicker = new C_ItemPicker(TB_DayOfWeek, dowList);

            B_Back.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_CalendarToSites", this);
            };

            B_ExcSave.TouchUpInside += async (sender, e) => 
            {
                SelectedShift.OpenTime = OpenShift.Value;
                SelectedShift.CloseTime = CloseShift.Value;
                try { SelectedShift.NumBasicEFilers = Convert.ToInt32(TB_ExcBasicShift.Text); }
                catch {}
                try { SelectedShift.NumAdvEFilers = Convert.ToInt32(TB_ExcAdvShift.Text); }
				catch { }

                bool success = await Global.UpdateShift(LoggedInUser.Token, SelectedSite.Slug, SelectedShift, SelectedCalendarEntry);

                if (!success)
				{
					var ok = await C_MessageBox.MessageBox(this, "Error", "Unable to update shift.", E_MessageBoxButtons.Ok);
				}

                B_ExcSave.Enabled = false;
                CalendarEntriesTableManager.ReloadData();
			};

            B_ExcNewShift.TouchUpInside += async (sender, e) => 
            {
                C_WorkShift nws = new C_WorkShift()
                {
                    CalendarId = SelectedCalendarEntry.id,
                    CloseTime = new C_HMS(17, 00, 00),
                    OpenTime = new C_HMS(8, 0, 0),
                    NumBasicEFilers = 0,
                    NumAdvEFilers = 0,
                    SiteSlug = SelectedSite.Slug
                };

                AI_Busy.StartAnimating();

                bool success = await Global.CreateShift(LoggedInUser.Token, SelectedSite.Slug, nws, SelectedCalendarEntry);

                AI_Busy.StopAnimating();

                if (!success)
				{
					var ok = await C_MessageBox.MessageBox(this, "Error", "Unable to create new shift.", E_MessageBoxButtons.Ok);
				}
                ShiftTableManager.ReloadData();
			};

            SW_ExcIsOpen.ValueChanged += async (sender, e) => 
            {
                SelectedCalendarEntry.SiteIsOpen = SW_ExcIsOpen.On;

                AI_Busy.StartAnimating();

                bool success = await SelectedSite.UpdateCalendarEntry(LoggedInUser.Token, SelectedCalendarEntry);

				AI_Busy.StopAnimating();

				if (!success)
				{
					var ok = await C_MessageBox.MessageBox(this, "Error", "Unable to create new shift.", E_MessageBoxButtons.Ok);
				}

                CalendarEntriesTableManager.ReloadData();
			};


            B_ApplyPattern.TouchUpInside += async (sender, e) => 
            {
				bool successx = true;

				E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this, "Warning", "This function overwrites any existing shifts on selected dates.", E_MessageBoxButtons.OkCancel);
                if (mbres != E_MessageBoxResults.Ok)
                    return;

                AI_Busy.StartAnimating();

                // get the day of the week for our pattern
                int selDow = -1;
                for (int ix = 0; ix != C_YMD.DayOfWeekNames.Length; ix++)
                {
                    if (TB_DayOfWeek.Text.ToLower() == C_YMD.DayOfWeekNames[ix].ToLower())
                    {
                        selDow = ix;
                        break;
                    }
                }

                // capture the pattern to apply
                bool pattern_IsOpen = SelectedCalendarEntry.SiteIsOpen;
                List<C_WorkShift> pattern_shifts = new List<C_WorkShift>();
                foreach(C_WorkShift ws in SelectedCalendarEntry.WorkShifts)
                {
                    C_WorkShift nws = new C_WorkShift(ws);
                    pattern_shifts.Add(nws);
                }

                List<C_CalendarEntry> calList = SelectedSite.SiteCalendar;
                foreach(C_CalendarEntry calEntry in calList)
                {
                    if (!successx) break;

                    // see if the day of the week matches our pattern; skip if no match
                    int dow_i = (int)calEntry.Date.DayOfWeek;
                    if (dow_i != selDow)
                        continue;

                    // remove any existing shifts
                    if (!calEntry.HaveShifts)
                    {
                        List<C_WorkShift> shifts = await Global.FetchAllShiftsForCalendarEntry(LoggedInUser.Token, SelectedSite.Slug, calEntry);
                    }

                    Queue<C_WorkShift> ShiftsQ = new Queue<C_WorkShift>();
                    foreach (C_WorkShift ws in calEntry.WorkShifts)
                        ShiftsQ.Enqueue(ws);

                    while (ShiftsQ.Count != 0)
                    {
                        C_WorkShift ws = ShiftsQ.Dequeue();

                        // remove any signups for this shift; since we've already loaded all users, these are in the cache
                        List<C_SignUp> usignups = Global.GetSignUpsByShiftId(ws.id);
                        foreach(C_SignUp su in usignups)
                        {
                            successx &= await su.RemoveIntent(LoggedInUser.Token);
                            if (!successx) 
                                break;
                        }
						if (!successx) 
                            break;

                        // now that we know there is nothing linked to this shift, delete the shift
                        successx &= await Global.RemoveShift(LoggedInUser.Token, SelectedSite.Slug, ws, calEntry);
                        if (!successx) 
                            break;
                    }
					if (!successx) 
                        break;

					// set the pattern for this calendar entry
					calEntry.SiteIsOpen = pattern_IsOpen;
                    bool success = await SelectedSite.UpdateCalendarEntry(LoggedInUser.Token, calEntry);
                    calEntry.WorkShifts = new List<C_WorkShift>();
                    foreach(C_WorkShift ws in pattern_shifts)
                    {
                        C_WorkShift nws = new C_WorkShift(ws)
                        {
                            CalendarId = calEntry.id
                        };
                        //calEntry.WorkShifts.Add(nws);
                        successx &= await Global.CreateShift(LoggedInUser.Token, SelectedSite.Slug, nws, calEntry);
						if (!successx) break;
					}
					if (!successx) break;
				}

                AI_Busy.StopAnimating();

                if (!successx)
                {
                    E_MessageBoxResults mbresx = await C_MessageBox.MessageBox(this, "Error", "One or more errors occured.", E_MessageBoxButtons.Ok);
                }
                else
                {
					E_MessageBoxResults mbresx = await C_MessageBox.MessageBox(this, "Success", "All updates completed normally.", E_MessageBoxButtons.Ok);
				}

                CalendarEntriesTableManager.ReloadData();
                ShiftTableManager.ReloadData();
            };

            TB_ExcBasicShift.AddTarget(TextField_ValueChanged, UIControlEvent.EditingChanged);
            TB_ExcAdvShift.AddTarget(TextField_ValueChanged, UIControlEvent.EditingChanged);

			DirtyExc = false;
		}

		void TextField_ValueChanged(object sender, EventArgs e)
		{
            B_ExcSave.Enabled = true;
		}

		private void EnableCalendarEntry(bool en)
		{
			if (!en)
			{
				L_ExcSite.Text = "";
			}

			B_ExcSave.Enabled = en && DirtyExc;

			SW_ExcIsOpen.Enabled = en;

            EnableShift(false);

            B_ExcNewShift.Enabled = en;
		}

        private void EnableShift(bool en)
		{
			TB_ExcOpenShift.Enabled = en;
			TB_ExcCloseShift.Enabled = en;

			TB_ExcBasicShift.Enabled = en;
			TB_ExcAdvShift.Enabled = en;

			TV_ExcShifts.UserInteractionEnabled = en;
		}

        private void PopulateCalendarEntry(C_CalendarEntry ce)
		{
			EnableCalendarEntry(true);

			L_ExcSite.Text = SelectedSite.Name;

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
                bool success = await Global.RemoveShift(LoggedInUser.Token, SelectedSite.Slug, shiftToDelete, SelectedCalendarEntry);
                if (success)
                    SelectedCalendarEntry.WorkShifts.Remove(shiftToDelete);
                ShiftTableManager.ReloadData();
			};

            EnableShift(true);
		}

        private void PopulateShift(C_WorkShift s)
		{
			EnableShift(true);

			OpenShift.SetValue(s.OpenTime);
			CloseShift.SetValue(s.CloseTime);

			TB_ExcBasicShift.Text = s.NumBasicEFilers.ToString();
			TB_ExcAdvShift.Text = s.NumAdvEFilers.ToString();
		}

        private void DePopulateCalendarEntry(C_CalendarEntry ce)
		{
			ce.SiteIsOpen = SW_ExcIsOpen.On;
			DePopulateShift(SelectedShift);
			EnableCalendarEntry(false);
		}

        private void DePopulateShift(C_WorkShift s)
		{
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

                public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
                {
                    base.RowSelected(tableView, indexPath);
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