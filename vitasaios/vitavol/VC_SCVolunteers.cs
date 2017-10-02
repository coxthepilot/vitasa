using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;
using zsquared;
using UIKit;

namespace vitavol
{
    public partial class VC_SCVolunteers : UIViewController
    {
        // Globals to be set on start of ViewController
        // - SelectedSite

        C_WorkItemsTableSourceSCVolunteers TableSource;

        C_Global Global;

        C_VitaSite OurSite;

		public VC_SCVolunteers (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

            OurSite = Global.GetSiteFromCacheNoFetch(Global.SelectedSiteSlug);

			// set the standard background color
            View.BackgroundColor = C_Common.StandardBackground;

            // ----- init variables -----

            if (Global.SelectedDate == null)
                Global.SelectedDate = C_YMD.Now;

            // ----- button handlers -----

            B_Back.TouchUpInside += async (sender, e) =>
            {
                // see if any of the items were changed and not saved
                var ou = Global.WorkItemsOnSiteOnDate.Where(wi => wi.Dirty);

                if (!ou.Any())
                {
					PerformSegue("Segue_SCVolunteersToSCSiteVolCal", this);
                    return;
				}
                
                C_MessageBox.E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this,
                     "Items Changed",
                     "One or more items changed. Approved them?",
                     C_MessageBox.E_MessageBoxButtons.YesNoCancel);

                if (mbres == C_MessageBox.E_MessageBoxResults.Cancel)
                    return;
                else if (mbres == C_MessageBox.E_MessageBoxResults.No)
                {
					PerformSegue("Segue_SCVolunteersToSCSiteVolCal", this);
					return;
                }

                AI_Busy.StartAnimating();
                EnableUI(false);
                
                bool success = await SaveChangedItems();

                AI_Busy.StopAnimating();
                EnableUI(true);

                if (!success)
                {
                    C_MessageBox.E_MessageBoxResults mbres1 = await C_MessageBox.MessageBox(this,
                                                                            "Error",
                                                                            "Unble to save the work item",
                                                                             C_MessageBox.E_MessageBoxButtons.Ok);
                    return;
                }

                PerformSegue("Segue_SCVolunteersToSCSiteVolCal", this);
            };

            B_ApproveHours.TouchUpInside += async (sender, e) =>
            {
				C_MessageBox.E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this,
					 "Approve Items?",
					 "Approve signups on this date?",
					 C_MessageBox.E_MessageBoxButtons.YesNo);

                if (mbres != C_MessageBox.E_MessageBoxResults.Yes)
                    return;

				AI_Busy.StartAnimating();
				EnableUI(false);

				bool success = await SaveChangedItems();

				AI_Busy.StopAnimating();
				EnableUI(true);

				if (!success)
				{
					C_MessageBox.E_MessageBoxResults mbres1 = await C_MessageBox.MessageBox(this,
																			"Error",
																			"Unble to save the work item",
																			 C_MessageBox.E_MessageBoxButtons.Ok);
					return;
				}
			};

			L_Date.Text = Global.SelectedDate.ToString("mmm dd, yyyy");
			
            // ----- initialize the view -----

			//if (Global.WorkItemsOnSiteOnDate == null)
			// find out how many Volunteers signed up to work on this date
			Global.WorkItemsOnSiteOnDate = Global.GetWorkItemsForSiteOnDate(Global.SelectedDate, OurSite.Slug);

            Task.Run(async () => 
            {
                C_VitaUser LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

                // make sure each workitem has the user name
				foreach (C_WorkItem wi in Global.WorkItemsOnSiteOnDate)
				{
                    bool success = await Global.EnsureUserInCache(wi.UserId, LoggedInUser.Token);
				}

				// find out how many are required
				int dayOfWeek = (int)Global.SelectedDate.DayOfWeek;
				int requiredVolunteers = OurSite.SiteCalendar[dayOfWeek].NumEFilers;
				C_CalendarEntry SiteCalendarEntry = OurSite.GetCalendarExceptionForDateForSite(Global.SelectedDate);
				if (SiteCalendarEntry != null)
					requiredVolunteers = SiteCalendarEntry.NumEFilers;

				UIApplication.SharedApplication.InvokeOnMainThread(
                new Action(() =>
                {
					// set up the view elements
					L_SiteName.Text = OurSite.Name;
                    L_Volunteers.Text = Global.WorkItemsOnSiteOnDate.Count.ToString() + " of " + requiredVolunteers.ToString();

                    TableSource = new C_WorkItemsTableSourceSCVolunteers(Global, Global.WorkItemsOnSiteOnDate, this);
                    TV_Volunteers.Source = TableSource;
					TV_Volunteers.ReloadData();
					B_ApproveHours.Enabled = (Global.WorkItemsOnSiteOnDate.Count != 0) && (Global.SelectedDate <= C_YMD.Now);
				}));
            });
        }

        private async Task<bool> SaveChangedItems()
        {
            bool res = true;
            try
            {
                foreach (C_WorkItem wi in Global.WorkItemsOnSiteOnDate)
                {
                    wi.Approved = true;
                    bool success = await wi.UpdateIntent(Global);
                    res &= success;
                    wi.Dirty = false;
                }
            }
            catch {}

            return res;
        }

        private async Task<bool> RebuildWorkItemsOnDateChange()
        {
            C_VitaUser LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            // find out how many Volunteers signed up to work on this date
            Global.WorkItemsOnSiteOnDate = Global.GetWorkItemsForSiteOnDate(Global.SelectedDate, OurSite.Slug);

			// build a dictionary of user id to user name
			Dictionary<int, string> UserIdToUser = new Dictionary<int, string>();
			foreach (C_WorkItem wi in Global.WorkItemsOnSiteOnDate)
			{
                bool success = await Global.EnsureUserInCache(wi.UserId, LoggedInUser.Token);
			}

            TableSource.WorkItems = Global.WorkItemsOnSiteOnDate;

            return true;
		}

        private string FriendlyDate(NSDate nsd)
        {
            DateTime dt = C_NSDateConversions.NSDateToDateTime(nsd);
			C_YMD ymd = new C_YMD(dt);
            return ymd.ToString("dow mmm dd, yyyy");
		}

        private void EnableUI(bool enable)
        {
            TV_Volunteers.UserInteractionEnabled = enable;
            B_Back.Enabled = enable;

            B_ApproveHours.Enabled = enable && (Global.WorkItemsOnSiteOnDate.Count != 0) && (Global.SelectedDate <= C_YMD.Now);
        }

		public class C_WorkItemsTableSourceSCVolunteers : UITableViewSource
		{
			readonly C_Global Global;
            public List<C_WorkItem> WorkItems;
			const string CellIdentifier = "TableCell_SignUpsTableSourceSCVolunteers";
            readonly VC_SCVolunteers OurVC;
            public bool DoNotDisplayValues;

            public C_WorkItemsTableSourceSCVolunteers(C_Global pac, List<C_WorkItem> workitems, VC_SCVolunteers ourvc)
			{
				Global = pac;
                WorkItems = workitems;
                OurVC = ourvc;
			}

			public override nint RowsInSection(UITableView tableview, nint section)
			{
                int count = DoNotDisplayValues ? 0 : WorkItems.Count;

				return count;
			}

			public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
			{
				UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);
				//---- if there are no cells to reuse, create a new one
				if (cell == null)
					cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

                C_WorkItem signup = WorkItems[indexPath.Row];
                C_VitaUser user = Global.GetUserFromCacheNoFetch(signup.UserId);

                string s_cert = user.Certification.ToString();

                cell.TextLabel.Text = user.Name;
                cell.DetailTextLabel.Text = "[" + user.Phone + "] " + s_cert + " - " + signup.Hours.ToString() + " hours";

				return cell;
			}

            public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
            {
				Global.VolunteerWorkItem = WorkItems[indexPath.Row];

				OurVC.PerformSegue("Segue_SCVolunteersToSCVolunteerHours", OurVC);
			}
		}
    }
}