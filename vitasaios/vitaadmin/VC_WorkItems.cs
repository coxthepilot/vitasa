using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

using UIKit;
using zsquared;

namespace vitaadmin
{
    public partial class VC_WorkItems : UIViewController
    {
		C_Global Global;
		C_VitaUser LoggedInUser;
        bool Dirty;
		
        public VC_WorkItems (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            Dirty = false;

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

			LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

			B_Back.TouchUpInside += (sender, e) =>
				PerformSegue("Segue_WorkItemsToMain", this);

			AI_Busy.StartAnimating();
			EnableUI(false);

			Task.Run(async () =>
			{
                // we make sure all sites have been read in, which gives us a complete list of all work items
                List<C_VitaSite> sitesList = await Global.FetchSitesList();

                Global.WorkItems.Sort(C_WorkItem.CompareByDateAscending);

				UIApplication.SharedApplication.InvokeOnMainThread(
				new Action(() =>
				{
					AI_Busy.StopAnimating();
					EnableUI(true);

                    C_WorkItemsTableSource ts = new C_WorkItemsTableSource(Global, Global.WorkItems);
                    TV_WorkItems.Source = ts;
					TV_WorkItems.Delegate = new C_WorkItemsTableDelegate(Global, this, ts);
					TV_WorkItems.ReloadData();
				}));
			});
		}

        private void PopulateWorkItem()
        {
            C_WorkItem wi = Global.VolunteerWorkItem;
            if (wi == null)
                return;

            L_Site.Text = wi.SiteName;
            L_Date.Text = wi.Date.ToString("mmm dd, yyyy");
            TB_Hours.Text = wi.Hours.ToString();
            SC_Approval.SelectedSegment = wi.Approved ? 0 : 1;
            B_Update.Enabled = false;
            Dirty = false;

            C_VitaUser user = Global.GetUserFromCacheNoFetch(wi.UserId);
            if (user == null)
                L_User.Text = wi.UserId.ToString();
            else
                L_User.Text = user.Name;

            if (user == null)
            {
				Task.Run(async () =>
				{
					C_VitaUser u = await Global.GetUserFromCache(wi.UserId);

					UIApplication.SharedApplication.InvokeOnMainThread(
					new Action(() =>
					{
						if (u != null)
							L_User.Text = u.Name;
					}));
				});
			}
        }

        private void EnableUI(bool en)
        {
            B_Back.Enabled = en;
            TV_WorkItems.UserInteractionEnabled = en;
            B_Update.Enabled = en && Dirty;
            SC_Approval.Enabled = en;
            TB_Hours.Enabled = en;
        }

		public class C_WorkItemsTableDelegate : UITableViewDelegate
		{
			readonly C_Global Global;
			readonly VC_WorkItems OurVC;
			readonly C_WorkItemsTableSource TableSource;
			readonly string Token;

			public C_WorkItemsTableDelegate(C_Global global, VC_WorkItems vc, C_WorkItemsTableSource tsource)
			{
				Global = global;
				OurVC = vc;
				TableSource = tsource;

				C_VitaUser user = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
				Token = user.Token;
			}

			public override UITableViewRowAction[] EditActionsForRow(UITableView tableView, NSIndexPath indexPath)
			{
				UITableViewRowAction hiButton = UITableViewRowAction.Create(UITableViewRowActionStyle.Default, "Remove",
				async delegate
				{
                    C_WorkItem workitemToRemove = TableSource.OurWorkItems[indexPath.Row];

					OurVC.AI_Busy.StartAnimating();
					OurVC.EnableUI(false);

                    bool succ = await workitemToRemove.RemoveIntent(Global);
					TableSource.OurWorkItems.Remove(workitemToRemove);

					OurVC.EnableUI(true);
					OurVC.AI_Busy.StopAnimating();

                    OurVC.TV_WorkItems.ReloadData();
				});

				return new UITableViewRowAction[] { hiButton };
			}

			public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
			{
				// identify the specific signup
                Global.VolunteerWorkItem = TableSource.OurWorkItems[indexPath.Row];

				OurVC.PopulateWorkItem();
			}
		}

		public class C_WorkItemsTableSource : UITableViewSource
		{
			const string CellIdentifier = "TableCell_WorkItemsTableSource";
            public List<C_WorkItem> OurWorkItems;
			readonly C_Global Global;

			public C_WorkItemsTableSource(C_Global global, List<C_WorkItem> ourWorkitems)
			{
				Global = global;
                OurWorkItems = ourWorkitems;
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

                C_WorkItem workitem = OurWorkItems[indexPath.Row];

                cell.DetailTextLabel.Text = workitem.Date.ToString("mmm dd, yyy") + " at " + workitem.SiteName;

                C_VitaUser user = Global.GetUserFromCacheNoFetch(workitem.UserId);
                if (user == null)
                    cell.TextLabel.Text = workitem.UserId.ToString();
                else
                    cell.TextLabel.Text = user.Name;

                if (user == null)
                {
                    Task.Run(async () =>
                    {
                        C_VitaUser u = await Global.GetUserFromCache(workitem.UserId);

						UIApplication.SharedApplication.InvokeOnMainThread(
                        new Action(() =>
                        {
                        	if (u != null)
                        		cell.TextLabel.Text = u.Name;
                        }));
                    });
                }

				return cell;
			}
		}
    }
}