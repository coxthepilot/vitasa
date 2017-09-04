using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using UIKit;

using zsquared;

namespace vitavol
{
    public partial class VC_MySignUps : UIViewController
    {
        // Input:
        //   LoggedInUser
        //   SelectedDate
        //   SelectedSite
        //   CalendarDate ???
        //   AllSites
        
        C_Global Global;

        public VC_MySignUps (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

            B_Back.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_SignUpsToLogin", this);

            B_Suggestion.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_SignUpsToSuggestions", this);

            B_SignUp.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_SignUpsToCalendar", this);

			// since the login process includes the user work history and intents, we don't need to fetch again
			// todo: after some amount of time, these values are stale? Since this user is the only one that can change
            //   them then perhaps they are ok; can backoffice change their intents? when approved and moves to history?

			Global.DetailsCameFrom = E_CameFrom.MySignUps;
            C_MySignUpsTableSourceWorkIntents ts = new C_MySignUpsTableSourceWorkIntents(Global, Global.LoggedInUser.WorkIntents);
			TV_SignUps.Source = ts;
			TV_SignUps.Delegate = new C_MySignUpsTableDelegateWorkIntents(Global, this, Global.LoggedInUser.WorkIntents, ts);
			TV_SignUps.ReloadData();
        }

        /// <summary>
        /// Class is the table view delegate to handle slide, aka delete of signup
        /// </summary>
        public class C_MySignUpsTableDelegateWorkIntents : UITableViewDelegate
        {
			readonly C_Global Global;
			readonly VC_MySignUps OurVC;
            readonly List<C_WorkItem> Intents;
            C_MySignUpsTableSourceWorkIntents TableSource;

            public C_MySignUpsTableDelegateWorkIntents(C_Global global, VC_MySignUps vc, List<C_WorkItem> intents, C_MySignUpsTableSourceWorkIntents tsource)
            {
				Global = global;
				OurVC = vc;
                Intents = intents;
                TableSource = tsource;
            }

            public override UITableViewRowAction[] EditActionsForRow(UITableView tableView, NSIndexPath indexPath)
            {
                UITableViewRowAction hiButton = UITableViewRowAction.Create(UITableViewRowActionStyle.Default, "Remove",
                async delegate
                {
                    C_WorkItem intentToRemove = Intents[indexPath.Row];

                    await Global.LoggedInUser.RemoveIntent(intentToRemove);

                    UIApplication.SharedApplication.InvokeOnMainThread(new Action(OurVC.TV_SignUps.ReloadData));
                });

                return new UITableViewRowAction[] { hiButton };
            }

            public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
            {
                // identify the specific signup
                C_WorkItem SelectedSignUp = Intents[indexPath.Row];

				// make sure the calendar starts on today if we get there
				Global.CalendarDate = null;

                // these are required by VC_SignUp
                Global.DetailsCameFrom = E_CameFrom.MySignUps;
                Global.SelectedDate = SelectedSignUp.Date;
                Global.SelectedSite = C_VitaSite.GetSiteBySlug(SelectedSignUp.SiteSlug, Global.AllSites);

				OurVC.PerformSegue("Segue_MySignUpsToSignUp", OurVC);
			}
        }

		public class C_MySignUpsTableSourceWorkIntents : UITableViewSource
		{
            readonly C_Global Global;
            public List<C_WorkItem> Intents; // this is public so a remove operations doesn't require a re-fetch of the list
			const string CellIdentifier = "TableCell_SignUpsTableSourceMySignUps";

            public C_MySignUpsTableSourceWorkIntents(C_Global pac, List<C_WorkItem> intents)
			{
				Global = pac;
                Intents = intents;
			}

			public override nint RowsInSection(UITableView tableview, nint section)
			{
				int count = 0;
				if (Intents != null)
					count = Intents.Count;
				return count;
			}

			public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
			{
				UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);
				//---- if there are no cells to reuse, create a new one
				if (cell == null)
					cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

				C_WorkItem wi = Intents[indexPath.Row];
                C_VitaSite oursite = C_VitaSite.GetSiteBySlug(wi.SiteSlug, Global.AllSites);

                cell.TextLabel.Text = oursite.Name;
				cell.DetailTextLabel.Text = wi.Date.ToString();

				return cell;
			}
		}
    }
}