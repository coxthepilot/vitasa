using Foundation;
using System;
using UIKit;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;
using EventKit;
using EventKitUI;

using zsquared;

namespace vitavol
{
    // --------- View signups for date and site with option to signup ----------
    //
    // Input: SelectedDate
    //        SelectedSite
    //        WorkItemsOnDate (optional)
    //        DetailsCameFrom
    //        LoggedInUser
    //
    public partial class VC_SignUp : UIViewController
    {
		C_Global Global;
        C_VitaUser LoggedInUser;
        C_VitaSite SelectedSite;
        bool SignUpListHasOurUser;
        bool HousrAreDirty;
        protected CreateEventEditViewDelegate eventControllerDelegate;
        List<string> UserNames;

		public VC_SignUp (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
            SelectedSite = Global.GetSiteFromCacheNoFetch(Global.SelectedSiteSlug);

			// set the standard background color
			View.BackgroundColor = C_Common.StandardBackground;

            Global.WorkItemsOnSiteOnDate = Global.GetWorkItemsForSiteOnDate(Global.SelectedDate, Global.SelectedSiteSlug);

			B_Back.TouchUpInside += (sender, e) => 
            {
                switch (Global.ViewCameFrom)
                {
                    case E_ViewCameFrom.List:
                        PerformSegue("Segue_SignUpToSitesOnDateList", this);
                        break;
                    case E_ViewCameFrom.Map:
                        PerformSegue("Segue_SignUpToSitesOnDateMap", this);
                        break;
                    case E_ViewCameFrom.MySignUps:
                        PerformSegue("Segue_SignUpToMySignUps", this);
                        break;
                }
            };

            B_SignMeUp.TouchUpInside += async (sender, e) => 
            {
                // signme up should only get enabled if the user is not already in the list
                if (SignUpListHasOurUser)
                    return;
                
				AI_Busy.StartAnimating();
                EnableUI(false);

				C_WorkItem wi = new C_WorkItem(Global.SelectedSiteSlug, Global.SelectedDate, LoggedInUser.id, 0);

                bool success = await wi.AddIntent(Global, LoggedInUser.id);

				AI_Busy.StopAnimating();
                EnableUI(true);

				if (!success)
                {
                    C_MessageBox.E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this,
                                     "Error",
                                     "Add SignUp failed",
                                     C_MessageBox.E_MessageBoxButtons.Ok);
                    return;
                }

				// ask the user if we should add this to the calendar with a reminder
				C_MessageBox.E_MessageBoxResults mbresx = await C_MessageBox.MessageBox(this,
                                   "Add to Calendar",
                                   "Add a calendar event and reminder to the calendar?",
                                   C_MessageBox.E_MessageBoxButtons.YesNo);
                if (mbresx == C_MessageBox.E_MessageBoxResults.Yes)
                {
					// add a calendar entry and reminder
					EKEventStore evstore = myAppDelegate.EventStore;

					// making these calls just aborts the app
					evstore.RequestAccess(EKEntityType.Event, EventCompletionHandler);
					//evstore.RequestAccess(EKEntityType.Reminder, EventCompletionHandler);

					EKEvent newEvent = EKEvent.FromStore(evstore);

                    // set the alarm for 60 minutes before the event
                    newEvent.AddAlarm(EKAlarm.FromTimeInterval(-60));

                    // get the site info so we can compute the time for the calendar event based on the site open/close for that date
                    C_VitaSite site = Global.GetSiteFromCacheNoFetch(wi.SiteSlug);
                    C_HMS[] openCloseTimes = site.GetOpenCloseTimeOnDate(wi.Date);
                    C_HMS openTime = openCloseTimes[0];
                    C_HMS closeTime = openCloseTimes[1];

                    DateTime startDT = new DateTime(wi.Date.Year, wi.Date.Month, wi.Date.Day, openTime.Hour, openTime.Minutes, 0);
					DateTime endDT = new DateTime(wi.Date.Year, wi.Date.Month, wi.Date.Day, closeTime.Hour, closeTime.Minutes, 0);
                    NSDate ns_startDT = C_NSDateConversions.DateTimeToNSDate(startDT);
                    NSDate ns_endDT = C_NSDateConversions.DateTimeToNSDate(endDT);

					newEvent.StartDate = ns_startDT;
                    newEvent.EndDate = ns_endDT;

                    newEvent.Title = "VITA Sign-Up";
                    newEvent.Location = site.Street + ", " + site.City + " " + site.Zip;
                    EKAlarm alarm = new EKAlarm()
                    {
                        RelativeOffset = -60 // set and alarm 60 minutes before the event
                    };
                    newEvent.Alarms.Append(alarm);

                    EKEventEditViewController eventControllerEdit = new EKEventEditViewController() //(this, "Segue_SignUpToMySignUps")
					{
						// set the controller's event store - it needs to know where/how to save the event
						EventStore = evstore
					};

					// wire up a delegate to handle events from the controller
					eventControllerDelegate = new CreateEventEditViewDelegate(eventControllerEdit);
					eventControllerEdit.EditViewDelegate = eventControllerDelegate;

                    eventControllerEdit.Event = newEvent;
                    // add this signup to the current list and disable the signup button
                    Global.WorkItemsOnSiteOnDate.Add(wi);
                    UserNames.Add(LoggedInUser.Name);
                    UserNames.Sort();
                    TV_Users.ReloadData();
                    B_SignMeUp.Enabled = false;

					// show the event controller
                    PresentViewController(eventControllerEdit, true, null);
				}

				PerformSegue("Segue_SignUpToMySignUps", this);
            };

            B_GetDirections.TouchUpInside += async (sender, e) => 
            {
                // the destination is the site the user selected
                // the source address is unspecified which makes it the user's current location
                string destinationAddress = SelectedSite.Street + ", "
                                                  + SelectedSite.City + " "
                                                  + SelectedSite.State;
                string url = "http://maps.apple.com/?daddr=" + destinationAddress;  // + "&saddr=<destination>";
                url = url.Replace(" ", "%20");
				if (UIApplication.SharedApplication.CanOpenUrl(new NSUrl(url)))
					UIApplication.SharedApplication.OpenUrl(new NSUrl(url));
                
				else
				{
                    C_MessageBox.E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this,
                                    "No maps app",
                                     "Maps app not supported on this device",
                                     C_MessageBox.E_MessageBoxButtons.Ok);
				}           
            };

            B_SaveHours.TouchUpInside += async (sender, e) => 
            {
				var ourUserSignup = Global.WorkItemsOnSiteOnDate.Where(wix => wix.UserId == LoggedInUser.id);

                // if we didn't find the signup to save, then just return
                if (!ourUserSignup.Any())
                {
					C_MessageBox.E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this,
									 "Error",
									 "Updating hours failed.",
									 C_MessageBox.E_MessageBoxButtons.Ok);
					return;
                }

				C_WorkItem wi = ourUserSignup.First();

                try { wi.Hours = Convert.ToSingle(TB_Hours.Text); }
                catch {}

				AI_Busy.StartAnimating();
                EnableUI(false);

				bool success = await wi.UpdateIntent(Global);

				AI_Busy.StopAnimating();
                EnableUI(true);
                TB_Hours.ResignFirstResponder();

				if (!success)
				{
					C_MessageBox.E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this,
									 "Error",
									 "Updating hours failed.",
									 C_MessageBox.E_MessageBoxButtons.Ok);
				}
			};

            TB_Hours.AddTarget((sender, e) =>
			{
                HousrAreDirty = true;
                B_SaveHours.Enabled = true;
			}, UIControlEvent.EditingChanged);

			AI_Busy.StartAnimating();
            EnableUI(false);

			Task.Run(async () =>
            {
                // Build a list of user names to display. Keep watch for our user in the list
                UserNames = new List<string>();
				SignUpListHasOurUser = false;
                C_WorkItem ourUserWorkItem = null;

                foreach(C_WorkItem wi in Global.WorkItemsOnSiteOnDate)
                {
                    C_VitaUser user = await Global.GetUserFromCache(wi.UserId);
                    if (!UserNames.Contains(user.Name))
                        UserNames.Add(user.Name);

                    if (wi.UserId == LoggedInUser.id)
                    {
                        SignUpListHasOurUser = true;
                        ourUserWorkItem = wi;
                    }
                }

                // now we can do all the UI updating (and on the UI thread)
				UIApplication.SharedApplication.InvokeOnMainThread(
				new Action(() =>
				{
                    AI_Busy.StopAnimating();
                    EnableUI(true);

                    bool en = (ourUserWorkItem != null) && (!ourUserWorkItem.Approved);
                    TB_Hours.Enabled = en;
                    B_SaveHours.Enabled = false; // waits for a change before getting enabled
                    if (ourUserWorkItem != null)
                        TB_Hours.Text = ourUserWorkItem.Hours.ToString();
					HousrAreDirty = false;

					// setup the table view with the list of names
					C_SignUpTableSourceSignUp signUpTableSource = new C_SignUpTableSourceSignUp(UserNames);
					TV_Users.Source = signUpTableSource;
					TV_Users.ReloadData();

                    B_SignMeUp.Enabled = !SignUpListHasOurUser;
                    TB_Hours.Enabled = SignUpListHasOurUser;
                    B_SaveHours.Enabled = SignUpListHasOurUser;

					int dayOfWeek = (int)Global.SelectedDate.DayOfWeek;
					C_HMS openTime = new C_HMS(SelectedSite.SiteCalendar[dayOfWeek].OpenTime);
					C_HMS closeTime = new C_HMS(SelectedSite.SiteCalendar[dayOfWeek].CloseTime);
					// see if there is an exception for today
					C_CalendarEntry ce = SelectedSite.GetCalendarExceptionForDateForSite(Global.SelectedDate);
					if (ce != null)
					{
						openTime = ce.OpenTime;
						closeTime = ce.CloseTime;
					}

					L_Site.Text = SelectedSite.Name;
					L_DateAndTime.Text = Global.SelectedDate.ToString("mmm dd, yyyy") 
                        + " [" + openTime.ToString("hh:mm p") + " - " + closeTime.ToString("hh:mm p") + "]";

                    L_Address.Text = SelectedSite.Street;
                    L_CityStateZip.Text = SelectedSite.City + ", " + SelectedSite.State + " " + SelectedSite.Zip;

                    B_GetDirections.Enabled = true;
				}));
			});
		}

        //public class C_EventEditController : EKEventEditViewController
        //{
        //    UIViewController OurVC;
        //    string Segue;

        //    public C_EventEditController(UIViewController ourvc, string segue)
        //    {
        //        OurVC = ourvc;
        //        Segue = segue;
        //    }

        //}

		private void EventCompletionHandler(bool granted, NSError e)
		{
			if (!granted)
			{
				Console.WriteLine("x");
			}
		}

		private void EnableUI(bool en)
        {
            B_Back.Enabled = en;
            B_SignMeUp.Enabled = en && !SignUpListHasOurUser;
            B_GetDirections.Enabled = en;
            TV_Users.UserInteractionEnabled = en;
            B_SaveHours.Enabled = en && HousrAreDirty;
        }

		protected class CreateEventEditViewDelegate : EKEventEditViewDelegate
		{
			// we need to keep a reference to the controller so we can dismiss it
			protected EventKitUI.EKEventEditViewController eventController;

			public CreateEventEditViewDelegate(EventKitUI.EKEventEditViewController eventController)
			{
				// save our controller reference
				this.eventController = eventController;
			}

			// completed is called when a user eith
			public override void Completed(EventKitUI.EKEventEditViewController controller, EKEventEditViewAction action)
			{
				eventController.DismissViewController(true, null);
			}
		}

		public class C_SignUpTableSourceSignUp : UITableViewSource
		{
            readonly List<string> UserNames;
            const string CellIdentifier = "TableCell_SignUpTableSource";

			public C_SignUpTableSourceSignUp(List<string> userNames)
			{
                UserNames = userNames;
			}

			public override nint RowsInSection(UITableView tableview, nint section)
			{
				int count = UserNames.Count;
				return count;
			}

			public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
			{
				UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);
				//---- if there are no cells to reuse, create a new one
				if (cell == null)
					cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

                string name = UserNames[indexPath.Row];

                cell.TextLabel.Text = name;

				return cell;
			}
		}
    }
}