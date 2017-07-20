using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Json;
using UIKit;

namespace vitasa
{
    public partial class VC_SitesList : UIViewController
    {
		List<C_VitaSite> SitesList = null;
		C_SitesTableSource sts = null;

		public VC_SitesList (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			SitesList = new List<C_VitaSite>();

			sts = new C_SitesTableSource(SitesList);
			TV_SitesList.Source = sts;

			Task.Run(async () =>
			{
				JsonValue jv = await C_VitaSite.FetchSitesList();

				SitesList = C_VitaSite.ImportSites(jv);

				// now populate the table
				sts.Sites = SitesList;

				UIApplication.SharedApplication.InvokeOnMainThread(
					new Action(() =>
					{
						TV_SitesList.ReloadData();
					}));
			});

		}

		public class C_SitesTableSource : UITableViewSource
		{
			public List<C_VitaSite> Sites = null;
			string CellIdentifier = "TableCell";

			public C_SitesTableSource(List<C_VitaSite> sitesList)
			{
				Sites = sitesList;
			}

			public override nint RowsInSection(UITableView tableview, nint section)
			{
				return Sites.Count;
			}

			public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
			{
				UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);
				C_VitaSite site = Sites[indexPath.Row];

				//---- if there are no cells to reuse, create a new one
				if (cell == null)
				{ cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier); }

				cell.TextLabel.Text = site.SiteName;
				cell.DetailTextLabel.Text = site.SiteStreet + ", " + site.SiteCity + ", " + site.SiteState + " " + site.SiteZip;

				return cell;
			}
		}

	}
}