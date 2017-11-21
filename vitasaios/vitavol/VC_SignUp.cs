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
    // We can get here in one of two ways:
    // 1. From the view SignUps; in that case we are started with site, date, and workitem; this is a readonly view of the workitem
    // 2. From shift select for a new signup; in that case we are started with site, date, 
    //    and a workitem created in the VolSiteShifts (not yet saved); unless the user signs up, the workitem is discarded

    // --------- View signups for date and site with option to signup ----------

    public partial class VC_SignUp : UIViewController
    {
        C_Global Global;

        C_VitaUser LoggedInUser;

        C_YMD SelectedDate;
        C_VitaSite SelectedSite;
        C_WorkShift SelectedShift;
        C_SignUp SelectedSignUp;

        bool SignUpListHasOurUser;
        bool HousrAreDirty;

        protected CreateEventEditViewDelegate eventControllerDelegate;
        List<string> UserNames;

        public VC_SignUp(IntPtr handle) : base(handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
            SelectedSite = Global.GetSiteNoFetch(Global.SelectedSiteSlug);
            SelectedDate = Global.SelectedDate;
            SelectedSignUp = Global.SelectedSignUp;
            SelectedShift = Global.SelectedShift;
#if DEBUG
            if ((LoggedInUser == null)
                || (SelectedDate == null)
                || (SelectedSite == null)
                || (SelectedSignUp == null)
                || (SelectedShift == null)
               )
                throw new ApplicationException("missing a value");
#endif
            B_Back.TouchUpInside += (sender, e) =>
            {
                switch (Global.ViewCameFrom)
                {
                    case E_ViewCameFrom.List:
                        PerformSegue("Segue_SignUpToVolSiteShifts", this);
                        break;
                    case E_ViewCameFrom.MySignUps:
                        PerformSegue("Segue_SignUpToMySignUps", this);
                        break;
                }
            };

            B_SignMeUp.TouchUpInside += async (sender, e) =>
            {
                // sign me up should only get enabled if the user is not already in the list
                if (SignUpListHasOurUser)
                    return;

                AI_Busy.StartAnimating();
                EnableUI(false);

                bool success = await SelectedSignUp.AddSignUp(LoggedInUser.Token, LoggedInUser.id);

                if (success)
                {
                    Global.AddToSignUps(SelectedSignUp);
                    Global.AdjustSiteCacheForNewSignUp(SelectedSignUp, LoggedInUser, SelectedSite);
                    C_WorkShiftSignUpUser wsuser = new C_WorkShiftSignUpUser(LoggedInUser.id, LoggedInUser.Name, LoggedInUser.Certification, LoggedInUser.Phone);
                    C_WorkShiftSignUp wssu = new C_WorkShiftSignUp(wsuser);
                    SelectedShift.SignUps.Add(wssu);
                }

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

                    evstore.RequestAccess(EKEntityType.Event, EventCompletionHandler);

                    EKEvent newEvent = EKEvent.FromStore(evstore);

                    // set the alarm for 60 minutes before the event
                    newEvent.AddAlarm(EKAlarm.FromTimeInterval(-60));

                    C_HMS openTime = SelectedShift.OpenTime;
                    C_HMS closeTime = SelectedShift.CloseTime;

                    DateTime startDT = new DateTime(SelectedSignUp.Date.Year, SelectedSignUp.Date.Month, SelectedSignUp.Date.Day, openTime.Hour, openTime.Minutes, 0);
                    DateTime endDT = new DateTime(SelectedSignUp.Date.Year, SelectedSignUp.Date.Month, SelectedSignUp.Date.Day, closeTime.Hour, closeTime.Minutes, 0);
                    NSDate ns_startDT = C_NSDateConversions.DateTimeToNSDate(startDT);
                    NSDate ns_endDT = C_NSDateConversions.DateTimeToNSDate(endDT);

                    newEvent.StartDate = ns_startDT;
                    newEvent.EndDate = ns_endDT;

                    newEvent.Title = "VITA Sign-Up";
                    newEvent.Location = SelectedSite.Street + ", " + SelectedSite.City + " " + SelectedSite.Zip;

                    EKEventEditViewController eventControllerEdit = new EKEventEditViewController() //(this, "Segue_SignUpToMySignUps")
                    {
                        // set the controller's event store - it needs to know where/how to save the event
                        EventStore = evstore
                    };

                    // wire up a delegate to handle events from the controller
                    eventControllerDelegate = new CreateEventEditViewDelegate(eventControllerEdit);
                    eventControllerEdit.EditViewDelegate = eventControllerDelegate;

                    eventControllerEdit.Event = newEvent;

                    UserNames.Add(LoggedInUser.Name);
                    UserNames.Sort();

                    TV_Users.ReloadData();

                    B_SignMeUp.Enabled = false;

                    Global.ViewCameFrom = E_ViewCameFrom.MySignUps;

                    // show the event controller
                    PresentViewController(eventControllerEdit, true, null);

                    PerformSegue("Segue_SignUpToMySignUps", this);
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
                if (SelectedSignUp.Approved)
                    return;
                
                try { SelectedSignUp.Hours = Convert.ToSingle(TB_Hours.Text); }
                catch { }

                AI_Busy.StartAnimating();
                EnableUI(false);

                bool success = await SelectedSignUp.UpdateSignUp(LoggedInUser.Token);

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
                B_SaveHours.Enabled =  !SelectedSignUp.Approved;
            }, UIControlEvent.EditingChanged);

            AI_Busy.StartAnimating();
            EnableUI(false);

            Task.Run(() =>
            {
                // Build a list of user names to display. Keep watch for our user in the list
                UserNames = new List<string>();
                SignUpListHasOurUser = false;

                // get a list of all work items at this site on this date, regardless of shift
                List<C_WorkShiftSignUp> signUpsAtSiteOnDateOnShift = SelectedShift.SignUps;

                foreach (C_WorkShiftSignUp wi in signUpsAtSiteOnDateOnShift)
                {
                    if (wi.User.UserId == LoggedInUser.id)
                        SignUpListHasOurUser = true;
                    else
                        UserNames.Add(wi.User.UserName);
                }

                // now we can do all the UI updating (and on the UI thread)
                UIApplication.SharedApplication.InvokeOnMainThread(
                new Action(() =>
                {
                    AI_Busy.StopAnimating();
                    EnableUI(true);

                    TB_Hours.Enabled = (SelectedSignUp != null) && (!SelectedSignUp.Approved);
                    if (SelectedSignUp != null)
                        TB_Hours.Text = SelectedSignUp.Hours.ToString();
                    HousrAreDirty = false;

                    // setup the table view with the list of names
                    C_SignUpTableSourceSignUp signUpTableSource = new C_SignUpTableSourceSignUp(UserNames);
                    TV_Users.Source = signUpTableSource;
                    TV_Users.ReloadData();

                    B_SignMeUp.Enabled = !SignUpListHasOurUser;
                    TB_Hours.Enabled = SignUpListHasOurUser && !SelectedSignUp.Approved;
                    B_SaveHours.Enabled = false;

                    L_Site.Text = SelectedSite.Name;
                    L_DateAndTime.Text = Global.SelectedDate.ToString("mmm dd, yyyy")
                        + "[" + SelectedShift.OpenTime.ToString("hh:mm p") + " - " + SelectedShift.CloseTime.ToString("hh:mm p") + "]";

                    L_Address.Text = SelectedSite.Street;
                    L_CityStateZip.Text = SelectedSite.City + ", " + SelectedSite.State + " " + SelectedSite.Zip;

                    B_GetDirections.Enabled = true;
                }));
            });
        }

        public override void ViewDidAppear(bool animated)
        {
            // set the standard background color
            View.BackgroundColor = C_Common.StandardBackground;
        }

        private void EventCompletionHandler(bool granted, NSError e)
        {
#if DEBUG
            if (!granted)
            {
                Console.WriteLine("failed to gain access");
            }
#endif
        }

		private void EnableUI(bool en)
        {
            B_Back.Enabled = en;
            B_SignMeUp.Enabled = en && !SignUpListHasOurUser;
            B_GetDirections.Enabled = en;
            TV_Users.UserInteractionEnabled = en;
            B_SaveHours.Enabled = en && HousrAreDirty && !SelectedSignUp.Approved;
			TB_Hours.Enabled = en && SignUpListHasOurUser && !SelectedSignUp.Approved;
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