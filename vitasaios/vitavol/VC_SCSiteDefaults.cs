using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using UIKit;

using zsquared;

namespace vitavol
{
    public partial class VC_SCSiteDefaults : UIViewController
    {
        // Input
        //   SelectedSite
        //   SelectedDayOfWeek

        C_Global Global;

        C_VitaSite SelectedSite;
        C_VitaUser LoggedInUser;
        int SelectedDayOfWeek;

        // a flag to tell if the user made changes
        bool Dirty;

        public VC_SCSiteDefaults(IntPtr handle) : base(handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
            SelectedSite = Global.GetSiteNoFetch(Global.SelectedSiteSlug);

#if DEBUG
            if ((LoggedInUser == null)
                || (SelectedSite == null)
               )
                throw new ApplicationException("Missing value(s)");
#endif
            B_Back.TouchUpInside += async (sender, e) => 
            {
                if (Dirty)
                {
                    C_MessageBox.E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this, 
                             "Save Changes?", 
                             "Changes were made. Save before leaving?", 
                             C_MessageBox.E_MessageBoxButtons.YesNo);

                    if (mbres != C_MessageBox.E_MessageBoxResults.Yes)
                    {
						PerformSegue("Segue_SCSiteDefaultsToSCSiteCalendar", this);
                        return;
					}
                        
                    bool success = await SaveChanges();

                }

                PerformSegue("Segue_SCSiteDefaultsToSCSiteCalendar", this);
            };

            L_SiteName.Text = SelectedSite.Name;
            L_DayOfWeek.Text = "Site Defaults for " + C_YMD.DayOfWeekNames[SelectedDayOfWeek];

            C_CalendarEntry calDefaults = SelectedSite.SiteCalendar[SelectedDayOfWeek];

            SW_IsOpen.On = calDefaults.SiteIsOpen;

            SetEnableOnControls(SW_IsOpen.On);

			SW_IsOpen.ValueChanged += (sender, e) => 
            {
				SetEnableOnControls(SW_IsOpen.On);
                Dirty = true;
                B_SaveDefaults.Enabled = true;
			};

            B_SaveDefaults.TouchUpInside += async (sender, e) => 
            {
				bool success = await SaveChanges();

				PerformSegue("Segue_SCSiteDefaultsToSCSiteCalendar", this);
			};

            B_NewShift.TouchUpInside += (sender, e) => 
            {
                Dirty = true;
                B_SaveDefaults.Enabled = true;

                C_WorkShift newShift = new C_WorkShift();
                newShift.CalendarId = calDefaults.id;
                newShift.SiteSlug = SelectedSite.Slug;

                calDefaults.WorkShifts.Add(newShift);

                Global.SelectedShift = newShift;
                Global.ViewCameFrom = E_ViewCameFrom.CalDefaults;

                PerformSegue("Segue_SCSiteDefaultsToShiftDetails", this);
            };

			// pre-populate the table view with the 3 shifts
            C_ShiftsTableSource signUpTableSource = new C_ShiftsTableSource(calDefaults.WorkShifts, Global, this);
            TV_Shifts.Source = signUpTableSource;
			TV_Shifts.ReloadData();
		}

        private void EnableUI(bool en)
        {
            B_Back.Enabled = en;
            B_SaveDefaults.Enabled = en && Dirty;
            SW_IsOpen.Enabled = en;
            TV_Shifts.UserInteractionEnabled = en;
        }

        public override void ViewDidAppear(bool animated)
        {
			// set the standard background color
			View.BackgroundColor = C_Common.StandardBackground;
		}

        async Task<bool> SaveChanges()
        {
   //         bool success = false;
			//try
			//{
   //             EnableUI(false);
   //             AI_Busy.StartAnimating();

			//	success = await SelectedSite.UpdateDefaultCalendar(null, LoggedInUser.Token);

   //             EnableUI(true);
   //             AI_Busy.StopAnimating();

   //             if (success)
   //             {
			//		Dirty = false;
			//		B_SaveDefaults.Enabled = false;
			//	}
   //             else
   //             {
   //                 C_MessageBox.E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this, 
   //                                                                          "Error", 
   //                                                                          "Failed to update the Site calendar", 
   //                                                                          C_MessageBox.E_MessageBoxButtons.Ok);
   //             }
			//}
            //catch { }

            //// we only have a return value since an async MUST return a value...sigh
            return true;
		}

        private void SetEnableOnControls(bool enable)
        {
            TV_Shifts.UserInteractionEnabled = enable;
		}

		public class C_ShiftsTableSource : UITableViewSource
		{
            readonly List<C_WorkShift> Shifts;
            readonly C_Global Global;
            readonly UIViewController ourVC;

            const string CellIdentifier = "TableCell_ShiftsTableSource";

            public C_ShiftsTableSource(List<C_WorkShift> shifts, C_Global global, UIViewController ovc)
			{
                Shifts = shifts;
                Global = global;
                ourVC = ovc;
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

                C_WorkShift shift = Shifts[indexPath.Row];
                cell.TextLabel.Text = "Shift " + indexPath.Row.ToString();

                cell.DetailTextLabel.Text = "Hours: " + shift.OpenTime.ToString("hh:mm p") + " - " + shift.CloseTime.ToString("hh:mm p")
                    + " Basic: " + shift.NumBasicEFilers.ToString() + " Advanced: " + shift.NumAdvEFilers.ToString();

				return cell;
			}

            public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
            {
                Global.SelectedShift = Shifts[indexPath.Row];

                Global.ViewCameFrom = E_ViewCameFrom.CalDefaults;

                ourVC.PerformSegue("Segue_SCSiteDefaultsToShiftDetails", ourVC);
            }

		}

	}
}