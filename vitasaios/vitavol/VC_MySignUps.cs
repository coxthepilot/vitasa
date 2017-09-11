using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;
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

			// set the standard background color
			View.BackgroundColor = UIColor.FromRGB(240, 240, 240);

			B_Back.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_SignUpsToLogin", this);

            B_Suggestion.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_SignUpsToSuggestions", this);

            B_SignUp.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_SignUpsToCalendar", this);

            // since the login process includes the user work history and intents, we don't need to fetch again
            // todo: after some amount of time, these values are stale? Since this user is the only one that can change
            //   them then perhaps they are ok; can backoffice change their intents? when approved and moves to history?

            // get all workintents for this user
			List<C_WorkItem> OurWorkItems = Global.GetWorkItemsForSiteOnDateForUser(
				null,
				null,
				Global.LoggedInUser.id,
				C_Global.E_SiteCondition.Any);

            // make sure we only look at the current items (today and beyond)
            C_YMD today = C_YMD.Now;
            var ou = OurWorkItems.Where(wi => wi.Date >= today);
            List<C_WorkItem> OurWorkItems2 = ou.ToList();
            // sort to make the list nicer
            OurWorkItems2.Sort(C_WorkItem.CompareByDateAscending);

			Global.DetailsCameFrom = E_CameFrom.MySignUps;
            C_MySignUpsTableSourceWorkIntents ts = new C_MySignUpsTableSourceWorkIntents(Global.AllSites, OurWorkItems2);
			TV_SignUps.Source = ts;
			TV_SignUps.Delegate = new C_MySignUpsTableDelegateWorkIntents(Global, this, ts);
			TV_SignUps.ReloadData();
        }

        private void EnableUI(bool en)
        {
            
        }

        /// <summary>
        /// Class is the table view delegate to handle slide, aka delete of signup
        /// </summary>
        public class C_MySignUpsTableDelegateWorkIntents : UITableViewDelegate
        {
			readonly C_Global Global;
			readonly VC_MySignUps OurVC;
            C_MySignUpsTableSourceWorkIntents TableSource;

            public C_MySignUpsTableDelegateWorkIntents(C_Global global, VC_MySignUps vc, C_MySignUpsTableSourceWorkIntents tsource)
            {
				Global = global;
				OurVC = vc;
                TableSource = tsource;
            }

            public override UITableViewRowAction[] EditActionsForRow(UITableView tableView, NSIndexPath indexPath)
            {
                UITableViewRowAction hiButton = UITableViewRowAction.Create(UITableViewRowActionStyle.Default, "Remove",
                async delegate
                {
                    C_WorkItem intentToRemove = TableSource.OurWorkItems[indexPath.Row];

                    OurVC.AI_Busy.StartAnimating();
                    OurVC.EnableUI(false);

                    bool success = await intentToRemove.RemoveIntent(Global);

                    OurVC.EnableUI(true);
                    OurVC.AI_Busy.StopAnimating();

                    OurVC.TV_SignUps.ReloadData();
                });

                return new UITableViewRowAction[] { hiButton };
            }

            public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
            {
                // identify the specific signup
                C_WorkItem SelectedSignUp = TableSource.OurWorkItems[indexPath.Row];

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
			const string CellIdentifier = "TableCell_SignUpsTableSourceMySignUps";
            public List<C_WorkItem> OurWorkItems;
            List<C_VitaSite> AllSites;

            public C_MySignUpsTableSourceWorkIntents(List<C_VitaSite> allSites, List<C_WorkItem> ourWorkItems)
			{
                AllSites = allSites;
                OurWorkItems = ourWorkItems;
			}

			public override nint RowsInSection(UITableView tableview, nint section)
			{
				int count = 0;
				if (OurWorkItems != null)
					count = OurWorkItems.Count;
				return count;
			}

			public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
			{
				UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);
				//---- if there are no cells to reuse, create a new one
				if (cell == null)
					cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

				C_WorkItem wi = OurWorkItems[indexPath.Row];
                C_VitaSite oursite = C_VitaSite.GetSiteBySlug(wi.SiteSlug, AllSites);
                C_HMS[] openclose = oursite.GetOpenCloseTimeOnDate(wi.Date);

                cell.TextLabel.Text = oursite.Name;
                cell.DetailTextLabel.Text = wi.Date.ToString() 
                    + " [" + openclose[0].ToString("hh:mm p").Trim() + " - " + openclose[1].ToString("hh:mm p") + "]";

				return cell;
			}
		}
    }
}