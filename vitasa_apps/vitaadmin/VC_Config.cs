using Foundation;
using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using UIKit;

using zsquared;

namespace vitaadmin
{
    public partial class VC_Config : UIViewController
    {
        C_VersionsTableSource VersionsTableSource;

        public VC_Config (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            C_Global Global = myAppDelegate.Global;

            B_Back.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_ConfigToMain", this);
            };

            L_BackendURL.Text = Global.Config.BackendUrl;
            L_SitesJsonURL.Text = Global.Config.SitesJsonUrl;
            L_Offline.Text = Global.Config.Offline ? "Offline" : "Online";
            L_ConfigURL.Text = C_Global.N_ConfigURL + C_Global.N_ConfigName;
            L_AdminVersion.Text = NSBundle.MainBundle.InfoDictionary["CFBundleShortVersionString"].ToString();

            List<string> versions = new List<string>();
            foreach(KeyValuePair<string, string> kvp in Global.Config.MinimumVersions)
                versions.Add(kvp.Key + " = " + kvp.Value);
            VersionsTableSource = new C_VersionsTableSource(Global, versions);
            TV_Versions.Source = VersionsTableSource;
            TV_Versions.ReloadData();
        }

        public class C_VersionsTableSource : UITableViewSource
        {
            const string CellIdentifier = "TableCell_VersionsTableSource";
            public List<string> Versions;
            readonly C_Global Global;

            public C_VersionsTableSource(C_Global global, List<string> versions)
            {
                Global = global;
                Versions = versions;
            }

            public override nint RowsInSection(UITableView tableview, nint section)
            {
                return Versions.Count;
            }

            public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
            {
                UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);

                //---- if there are no cells to reuse, create a new one
                if (cell == null)
                    cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

                cell.TextLabel.Text = Versions[indexPath.Row];
                cell.DetailTextLabel.Text = "";

                return cell;
            }
        }

    }
}