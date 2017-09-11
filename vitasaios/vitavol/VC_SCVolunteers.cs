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

		public VC_SCVolunteers (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

			// set the standard background color
			View.BackgroundColor = UIColor.FromRGB(240, 240, 240);

            // ----- init variables -----

            if (Global.WorkItemsDate == null)
                Global.WorkItemsDate = C_YMD.Now;

            // ----- button handlers -----

            B_Back.TouchUpInside += async (sender, e) =>
            {
                // see if any of the items were changed and not saved
                var ou = Global.WorkItemsOnSiteOnDate.Where(wi => wi.Dirty);

                if (!ou.Any())
                {
					PerformSegue("Segue_SCVolunteersToSCSite", this);
                    return;
				}
                
                Tools.E_MessageBoxResults mbres = await Tools.MessageBox(this,
                     "Items Changed",
                     "One or more items changed. Approved them?",
                     Tools.E_MessageBoxButtons.YesNoCancel);

                if (mbres == Tools.E_MessageBoxResults.Cancel)
                    return;
                else if (mbres == Tools.E_MessageBoxResults.No)
                {
					PerformSegue("Segue_SCVolunteersToSCSite", this);
					return;
                }

                AI_Busy.StartAnimating();
                EnableUI(false);
                
                bool success = await SaveChangedItems();

                AI_Busy.StopAnimating();
                EnableUI(true);

                if (!success)
                {
                    Tools.E_MessageBoxResults mbres1 = await Tools.MessageBox(this,
                                                                            "Error",
                                                                            "Unble to save the work item",
                                                                             Tools.E_MessageBoxButtons.Ok);
                    return;
                }

                PerformSegue("Segue_SCVolunteersToSCSite", this);
            };

            B_ApproveHours.TouchUpInside += async (sender, e) =>
            {
				Tools.E_MessageBoxResults mbres = await Tools.MessageBox(this,
					 "Approve Items?",
					 "Approve signups on this date?",
					 Tools.E_MessageBoxButtons.YesNo);

                if (mbres != Tools.E_MessageBoxResults.No)
                    return;

				AI_Busy.StartAnimating();
				EnableUI(false);

				bool success = await SaveChangedItems();

				AI_Busy.StopAnimating();
				EnableUI(true);

				if (!success)
				{
					Tools.E_MessageBoxResults mbres1 = await Tools.MessageBox(this,
																			"Error",
																			"Unble to save the work item",
																			 Tools.E_MessageBoxButtons.Ok);
					return;
				}
			};

            // Setup the textfield for the date to use a date picker in an action sheet/toolbar
            UIDatePicker DP_Date = new UIDatePicker()
            {
                Mode = UIDatePickerMode.Date,
                Date = Tools.YMDToNSDate(Global.WorkItemsDate)
            };

            UIToolbar ToolBar_Date = new UIToolbar()
            {
                BarStyle = UIBarStyle.Black,
                Translucent = true
            };
            ToolBar_Date.SizeToFit();

			UIBarButtonItem doneButton = new UIBarButtonItem("Done", UIBarButtonItemStyle.Done, async (s, e) =>
			{
                TB_Date.Text = FriendlyDate(DP_Date.Date);
	            TB_Date.ResignFirstResponder();
                Global.WorkItemsDate = new C_YMD(Tools.NSDateToDateTime(DP_Date.Date));
                EnableUI(false);
                TableSource.DoNotDisplayValues = true;
                TV_Volunteers.ReloadData();

                AI_Busy.StartAnimating();

				bool success = await RebuildWorkItemsOnDateChange();

                AI_Busy.StopAnimating();

                TableSource.DoNotDisplayValues = false;
                TV_Volunteers.ReloadData();
            	EnableUI(true);
                B_ApproveHours.Enabled = Global.WorkItemsOnSiteOnDate.Count != 0;
			});

			ToolBar_Date.SetItems(new UIBarButtonItem[] { doneButton }, true);
            UITextAttributes uita = new UITextAttributes()
            {
                TextColor = UIColor.White
            };
            doneButton.SetTitleTextAttributes(uita, UIControlState.Normal);

			TB_Date.InputView = DP_Date;
			TB_Date.InputAccessoryView = ToolBar_Date;
            TB_Date.Text = Global.WorkItemsDate.ToString("mmm dd, yyyy");

            // ----- initialize the view -----

            if (Global.WorkItemsOnSiteOnDate == null)
    			// find out how many Volunteers signed up to work on this date
                Global.WorkItemsOnSiteOnDate = Global.GetWorkItemsForSiteOnDateForUser(
                    Global.SelectedSite.Slug, 
                    Global.WorkItemsDate, 
                    -1, 
                    C_Global.E_SiteCondition.Any);

            Task.Run(async () => 
            {
                // make sure each workitem has the user name
				foreach (C_WorkItem wi in Global.WorkItemsOnSiteOnDate)
				{
                    if (wi.User == null)
                    {
                        if (wi.UserId == Global.LoggedInUser.id)
                            wi.User = Global.LoggedInUser;
                        else
                        {
                            C_VitaUser user = await Global.GetUserDetails(wi.UserId);
                            if (user != null)
                                wi.User = user;
						}
                    }
				}

				// find out how many are required
				int dayOfWeek = (int)Global.WorkItemsDate.DayOfWeek;
				int requiredVolunteers = Global.SelectedSite.SiteCalendar[dayOfWeek].NumEFilers;
				C_CalendarEntry SiteCalendarEntry = Global.SelectedSite.GetCalendarExceptionForDateForSite(Global.WorkItemsDate);
				if (SiteCalendarEntry != null)
					requiredVolunteers = SiteCalendarEntry.NumEFilers;

				UIApplication.SharedApplication.InvokeOnMainThread(
                new Action(() =>
                {
					// set up the view elements
					L_SiteName.Text = Global.SelectedSite.Name;
                    L_Volunteers.Text = Global.WorkItemsOnSiteOnDate.Count.ToString() + " of " + requiredVolunteers.ToString();

                    TableSource = new C_WorkItemsTableSourceSCVolunteers(Global, Global.WorkItemsOnSiteOnDate, this);
                    TV_Volunteers.Source = TableSource;
					TV_Volunteers.ReloadData();
					B_ApproveHours.Enabled = Global.WorkItemsOnSiteOnDate.Count != 0;
				}));
            });
        }

        private async Task<bool> SaveChangedItems()
        {
            try
            {
                foreach (C_WorkItem wi in Global.WorkItemsOnSiteOnDate)
                {
                    if (!wi.Approved)
                    {
                        wi.Approved = true;
                        await wi.UpdateIntent(Global);
                        wi.Dirty = false;
                    }
                }
            }
            catch {}

            return true;
        }

        private async Task<bool> RebuildWorkItemsOnDateChange()
        {
			// find out how many Volunteers signed up to work on this date
            Global.WorkItemsOnSiteOnDate = Global.GetWorkItemsForSiteOnDateForUser(
                Global.SelectedSite.Slug,
                Global.WorkItemsDate,
                -1,
                C_Global.E_SiteCondition.Any);

			// build a dictionary of user id to user name
			Dictionary<int, string> UserIdToUser = new Dictionary<int, string>();
			foreach (C_WorkItem wi in Global.WorkItemsOnSiteOnDate)
			{
				if (wi.User == null)
				{
					if (wi.UserId == Global.LoggedInUser.id)
						wi.User = Global.LoggedInUser;
					else
					{
                        C_VitaUser user = await Global.GetUserDetails(wi.UserId);
						wi.User = user;
					}
				}
			}

            TableSource.WorkItems = Global.WorkItemsOnSiteOnDate;

            return true;
		}

        private string FriendlyDate(NSDate nsd)
        {
			DateTime dt = Tools.NSDateToDateTime(nsd);
			C_YMD ymd = new C_YMD(dt);
            return ymd.ToString("dow mmm dd, yyyy");
		}

        private void EnableUI(bool enable)
        {
            TB_Date.Enabled = enable;
            TV_Volunteers.UserInteractionEnabled = enable;
            B_Back.Enabled = enable;
            B_ApproveHours.Enabled = enable;
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

                cell.TextLabel.Text = signup.User.Name;
                cell.DetailTextLabel.Text = signup.Hours.ToString() + " hours";

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