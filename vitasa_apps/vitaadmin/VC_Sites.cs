using Foundation;
using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using UIKit;

using zsquared;
using static zsquared.C_MessageBox;

namespace vitaadmin
{
    public partial class VC_Sites : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        List<C_VitaSite> Sites;

        //C_VitaSite SelectedSite;
        C_SitesTableSource SitesTableSource;
        C_SitesTableDelegate SitesTableDelegate;

        //UIPickerView PV_PrimarySiteCoordinator;
        //UIPickerView PV_BackupSiteCoordinator;

  //      UIDatePicker DP_SeasonEnd;
		//UIDatePicker DP_SeasonStart;

        bool killChanges;

		public VC_Sites (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

			B_Back.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_SitesToMain", this);
            };

            B_Refresh.TouchUpInside += async (sender, e) => 
            {
                EnableUI(false);
                AI_Busy.StartAnimating();

                Sites = await Global.RefetchAllSites(LoggedInUser.Token);
                Sites.Sort(CompareSitesBySiteName);

                AI_Busy.StopAnimating();
                EnableUI(true);

                SitesTableSource = new C_SitesTableSource(Global, Sites);
                SitesTableDelegate = new C_SitesTableDelegate(Global, this, SitesTableSource);
                SitesTableDelegate.SitesTableRowSelect += (sender1, a) =>
                {
                    Global.SelectedSiteSlug = a.Site.Slug;
                    PerformSegue("Segue_SitesToSite", this);
                };

                TV_Sites.Source = SitesTableSource;
                TV_Sites.Delegate = SitesTableDelegate;
                TV_Sites.ReloadData();
            };

			AI_Busy.StartAnimating();
			EnableUI(false);

            Task.Run(async () => 
            {
                try
                {
                    if (!Global.AllSitesFetched)
                        Sites = await Global.FetchAllSites(LoggedInUser.Token);
                    else
                        Sites = Global.GetAllSitesNoFetch();
                    Sites.Sort(CompareSitesBySiteName);
                }
                catch 
                {
                    Sites = new List<C_VitaSite>();
                }

				UIApplication.SharedApplication.InvokeOnMainThread(
                new Action(() =>
                {
                	AI_Busy.StopAnimating();
                	EnableUI(true);

                    SitesTableSource = new C_SitesTableSource(Global, Sites);
                    SitesTableDelegate = new C_SitesTableDelegate(Global, this, SitesTableSource);
                    SitesTableDelegate.SitesTableRowSelect += (sender, a) => 
                    {
                        Global.SelectedSiteSlug = a.Site.Slug;
                        PerformSegue("Segue_SitesToSite", this);
                    };

					TV_Sites.Source = SitesTableSource;
					TV_Sites.Delegate = SitesTableDelegate;
                	TV_Sites.ReloadData();
                }));

			});
		}

        private int CompareSitesBySiteName(C_VitaSite site1, C_VitaSite site2)
        {
            return site1.Name.CompareTo(site2.Name);
        }


		private void EnableUI(bool en)
        {
            TV_Sites.UserInteractionEnabled = en;
            B_CreateNewSite.Enabled = en;
            B_Back.Enabled = en;
        }

		public class C_SiteCoordinatorPickerModel : UIPickerViewModel
		{
            readonly List<C_VitaUser> Users;

            public C_SiteCoordinatorPickerModel(List<C_VitaUser> users)
			{
                Users = users;
			}

			public override nint GetComponentCount(UIPickerView pickerView)
			{
				return 1;
			}

			public override nint GetRowsInComponent(UIPickerView pickerView, nint component)
			{
				return Users.Count;
			}

			public override string GetTitle(UIPickerView pickerView, nint row, nint component)
			{
                return Users[(int)row].Name;
			}
		}

		public class C_SitesTableDelegate : UITableViewDelegate
		{
			readonly C_Global Global;
            readonly VC_Sites OurVC;
			readonly C_SitesTableSource TableSource;

            public event SiteTableEventHandler SitesTableRowSelect;
			public event SiteTableEventHandler SitesTableRowDeselect;

			public C_SitesTableDelegate(C_Global global, VC_Sites vc, C_SitesTableSource tsource)
			{
				Global = global;
				OurVC = vc;
				TableSource = tsource;
			}

            public override void RowDeselected(UITableView tableView, NSIndexPath indexPath)
            {
                SitesTableRowDeselect?.Invoke(this, new C_SitesTableEvent(TableSource.Sites[indexPath.Row]));
            }

			public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
			{
                SitesTableRowSelect?.Invoke(this, new C_SitesTableEvent(TableSource.Sites[indexPath.Row]));
            }

			public class C_SitesTableEvent : EventArgs
			{
                public C_VitaSite Site;
                
                public C_SitesTableEvent(C_VitaSite site)
				{
                    Site = site;
				}
			}

            public delegate void SiteTableEventHandler(object sender, C_SitesTableEvent a);
		}

		public class C_SitesTableSource : UITableViewSource
		{
			const string CellIdentifier = "TableCell_SitesTableSource";
            public List<C_VitaSite> Sites;
			readonly C_Global Global;

			public C_SitesTableSource(C_Global global, List<C_VitaSite> sites)
			{
				Global = global;
				Sites = sites;
			}

			public override nint RowsInSection(UITableView tableview, nint section)
			{
				int count = 0;
				if (Sites != null)
					count = Sites.Count;
				return count;
			}

			public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
			{
				UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);

				//---- if there are no cells to reuse, create a new one
				if (cell == null)
					cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

                C_VitaSite site = Sites[indexPath.Row];

                cell.TextLabel.Text = site.Name;
                cell.DetailTextLabel.Text = site.Street + ", " + site.City + " " + site.State + " " + site.Zip;

				return cell;
			}
		}
    }
}