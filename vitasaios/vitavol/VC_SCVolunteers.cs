using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using zsquared;
using UIKit;

namespace vitavol
{
    public partial class VC_SCVolunteers : UIViewController
    {
        // Globals to be set on start of ViewController
        // - SelectedSite

        List<C_WorkItem> WorkItemsOnSiteOnDate;

        public VC_SCVolunteers (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            C_Global Global = myAppDelegate.Global;

            // ----- init variables -----

            Global.SelectedDate = C_YMD.Now;

            // ----- button handlers -----

            B_Back.TouchUpInside += (sender, e) =>
            {
                PerformSegue("Segue_SCVolunteersToSCSite", this);
            };

            B_ApproveHours.TouchUpInside += (sender, e) =>
            {
                // todo: approve the hours on each signup
            };

            // Setup the textfield for the date to use a date picker in an action sheet/toolbar
            UIDatePicker DP_Date = new UIDatePicker()
            {
                Mode = UIDatePickerMode.Date,
                Date = Tools.YMDToNSDate(Global.SelectedDate)
            };

            UIToolbar ToolBar_Date = new UIToolbar()
            {
                BarStyle = UIBarStyle.Black,
                Translucent = true
            };
            ToolBar_Date.SizeToFit();

			UIBarButtonItem doneButton = new UIBarButtonItem("Done", UIBarButtonItemStyle.Done, (s, e) =>
			{
                TB_Date.Text = FriendlyDate(DP_Date.Date);
	            TB_Date.ResignFirstResponder();
                Global.SelectedDate = new C_YMD(Tools.NSDateToDateTime(DP_Date.Date));
			});
			ToolBar_Date.SetItems(new UIBarButtonItem[] { doneButton }, true);
            UITextAttributes uita = new UITextAttributes()
            {
                TextColor = UIColor.White
            };
            doneButton.SetTitleTextAttributes(uita, UIControlState.Normal);

			TB_Date.InputView = DP_Date;
			TB_Date.InputAccessoryView = ToolBar_Date;
			TB_Date.Text = FriendlyDate(DP_Date.Date);

            // ----- initialize the view -----

            //Task.Run(async () => 
            //{
				// find out how many Volunteers signed up to work on this date
				WorkItemsOnSiteOnDate = Global.SelectedSite.GetWorkItemsOnDate(Global.SelectedDate);

				// todo: need a way to get user names with only SiteCoordinator role
				// for now, just pass an empty Dictionary...
				Dictionary<int, string> UserIdToUser = new Dictionary<int, string>();

				// find out how many are required
				int dayOfWeek = (int)Global.SelectedDate.DayOfWeek;
				int requiredVolunteers = Global.SelectedSite.SiteCalendar[dayOfWeek].NumEFilers;
				C_CalendarEntry SiteCalendarEntry = Global.SelectedSite.GetCalendarExceptionForDateForSite(Global.SelectedDate);
				if (SiteCalendarEntry != null)
					requiredVolunteers = SiteCalendarEntry.NumEFilers;

				//UIApplication.SharedApplication.InvokeOnMainThread(
				//new Action(() =>
				//{
					// set up the view elements
					L_SiteName.Text = Global.SelectedSite.Name;
					L_Volunteers.Text = WorkItemsOnSiteOnDate.Count.ToString() + " of " + requiredVolunteers.ToString();

					TV_Volunteers.Source = new C_WorkItemsTableSourceSCVolunteers(Global, WorkItemsOnSiteOnDate, this, UserIdToUser);
					TV_Volunteers.ReloadData();
				//}));
			//});
        }

        private string FriendlyDate(NSDate nsd)
        {
			DateTime dt = Tools.NSDateToDateTime(nsd);
			C_YMD ymd = new C_YMD(dt);
            int dayOfWeek = (int)ymd.DayOfWeek;
            string dayOfWeekName = C_YMD.DayOfWeekNames[dayOfWeek];
            string res = dayOfWeekName + " " + ymd.ToString("mmm dd, yyyy");
            return res;
		}

		public class C_WorkItemsTableSourceSCVolunteers : UITableViewSource
		{
			readonly C_Global Global;
            public List<C_WorkItem> WorkItems;
			const string CellIdentifier = "TableCell_SignUpsTableSourceSCVolunteers";
            readonly VC_SCVolunteers OurVC;
            Dictionary<int, string> UserIdToUser;

            public C_WorkItemsTableSourceSCVolunteers(C_Global pac, List<C_WorkItem> workitems, VC_SCVolunteers ourvc, Dictionary<int, string> userIdToUser)
			{
				Global = pac;
                WorkItems = workitems;
                OurVC = ourvc;
                UserIdToUser = userIdToUser;
			}

			public override nint RowsInSection(UITableView tableview, nint section)
			{
                int count = WorkItems.Count;
				return count;
			}

			public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
			{
				UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);
				//---- if there are no cells to reuse, create a new one
				if (cell == null)
					cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

                C_WorkItem signup = WorkItems[indexPath.Row];

                string userName = "unknown";
                // todo: can't do user name yet
                //if (UserIdToUser.ContainsKey(signup.UserID))
                    //userName = UserIdToUser[signup.UserID];

                cell.TextLabel.Text = userName;
                cell.DetailTextLabel.Text = signup.Hours.ToString() + " hours";

				return cell;
			}

            public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
            {
				// identify the specific Volunteer Hours
				// SelectedDate
				// SelectedSite
				string userName = "unknown";
				// todo: can't do user name yet
				//if (UserIdToUser.ContainsKey(signup.UserID))
				//userName = UserIdToUser[signup.UserID];
				Global.VolunteerName = userName;
                Global.VolunteerWorkItem = WorkItems[indexPath.Row];

				OurVC.PerformSegue("Segue_SCVolunteersToSCVolunteerHours", OurVC);
			}
		}
    }
}