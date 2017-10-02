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
        C_VitaUser LoggedInUser;

        public VC_MySignUps (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

			B_Back.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_MySignUpsToVolunteerOptions", this);

            // get all workintents for this user
            List<C_WorkItem> OurWorkItems = Global.GetWorkItemsForUser(Global.LoggedInUserId);

            // make sure we only look at the current items (today and beyond)
            C_YMD today = C_YMD.Now;
            var ou = OurWorkItems.Where(wi => wi.Date >= today);
            List<C_WorkItem> OurWorkItems2 = ou.ToList();
            // sort to make the list nicer
            OurWorkItems2.Sort(C_WorkItem.CompareByDateAscending);

            AI_Busy.StartAnimating();
            EnableUI(false);

            // make sure the site cache has the details on the sites listed in our workitems
            Task.Run(async () => 
            {
                bool success = true;
                foreach(C_WorkItem wi in OurWorkItems2)
                    success &= await Global.EnsureSiteInCache(wi.SiteSlug);

				UIApplication.SharedApplication.InvokeOnMainThread(
                new Action(() =>
                {
                    AI_Busy.StopAnimating();
                    EnableUI(true);

                	Global.ViewCameFrom = E_ViewCameFrom.MySignUps;
                	C_MySignUpsTableSourceWorkIntents ts = new C_MySignUpsTableSourceWorkIntents(Global, OurWorkItems2);
                	TV_SignUps.Source = ts;
                	TV_SignUps.Delegate = new C_MySignUpsTableDelegateWorkIntents(Global, this, ts);
                	TV_SignUps.ReloadData();
                }));
			});
        }

        public override void ViewDidAppear(bool animated)
        {
			// set the standard background color
            View.BackgroundColor = C_Common.StandardBackground;
            TV_SignUps.BackgroundColor = C_Common.StandardBackground;
		}

        private void EnableUI(bool en)
        {
            TV_SignUps.UserInteractionEnabled = en;
            B_Back.Enabled = en;
        }

        /// <summary>
        /// Class is the table view delegate to handle slide, aka delete of signup
        /// </summary>
        public class C_MySignUpsTableDelegateWorkIntents : UITableViewDelegate
        {
			readonly C_Global Global;
			readonly VC_MySignUps OurVC;
            readonly C_MySignUpsTableSourceWorkIntents TableSource;

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
                    TableSource.OurWorkItems.Remove(intentToRemove);

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
                Global.ViewCameFrom = E_ViewCameFrom.MySignUps;
                Global.SelectedDate = SelectedSignUp.Date;
                Global.SelectedSiteSlug = SelectedSignUp.SiteSlug;

				OurVC.PerformSegue("Segue_MySignUpsToSignUp", OurVC);
			}
        }

		public class C_MySignUpsTableSourceWorkIntents : UITableViewSource
		{
			const string CellIdentifier = "TableCell_SignUpsTableSourceMySignUps";
            public List<C_WorkItem> OurWorkItems;
            readonly C_Global Global;

            public C_MySignUpsTableSourceWorkIntents(C_Global global, List<C_WorkItem> ourWorkItems)
			{
                Global = global;
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

                C_VitaSite oursite = Global.GetSiteFromCacheNoFetch(wi.SiteSlug);

                //C_VitaSite oursite = C_VitaSite.GetSiteBySlug(wi.SiteSlug, AllSites);
                C_HMS[] openclose = oursite.GetOpenCloseTimeOnDate(wi.Date);

                cell.TextLabel.Text = oursite.Name;
                cell.DetailTextLabel.Text = wi.Date.ToString() 
                    + " [" + openclose[0].ToString("hh:mm p").Trim() + " - " + openclose[1].ToString("hh:mm p") + "]";

				return cell;
			}
		}
    }
}