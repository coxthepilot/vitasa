using System;
using System.Json;
using UIKit;
using System.Threading.Tasks;
using System.Collections.Generic;
using static zsquared.C_MessageBox;

using zsquared;

namespace vitavol
{
    public partial class VC_ExportImport : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        public VC_ExportImport (IntPtr handle) : base (handle)
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
                Global.SelectedSuggestion = null;
                PerformSegue("Segue_AdminExportImportToAdminMenu", this);
            };

            B_ExportSites.TouchUpInside += async (object sender, EventArgs e) => 
            {
                List<C_VitaSite> sites = await Global.FetchAllSites(LoggedInUser.Token);

                C_JsonBuilder jb = new C_JsonBuilder();

                jb.StartArray("sites");
                foreach(C_VitaSite site in sites)
                    jb.AddArrayObject(site.ToJson(true));
                jb.EndArray();

                TxV_Json.Text = jb.ToString();
            };

            B_ExportUsers.TouchUpInside += async (object sender, EventArgs e) => 
            {
                List<C_VitaUser> users = await Global.FetchAllUsers(LoggedInUser.Token);

                C_JsonBuilder jb = new C_JsonBuilder();

                jb.StartArray("users");
                foreach (C_VitaUser user in users)
                    jb.AddArrayObject(user.ToJson());
                jb.EndArray();

                TxV_Json.Text = jb.ToString();
            };

            B_ImportSites.TouchUpInside += async (object sender, EventArgs e) => 
            {
                if (TxV_Json.Text.Length == 0) 
                {
                    E_MessageBoxResults mbres3 = await MessageBox(this,
                     "Error",
                     "Name required.",
                     E_MessageBoxButtons.Ok);

                    return;
                }

                E_MessageBoxResults mbres = await MessageBox(this,
                     "Caution",
                     "Continuing with the import will erase ALL Site information and replace it. There is NO UNDO. Continue?",
                      E_MessageBoxButtons.YesNo);

                if (mbres == E_MessageBoxResults.No)
                    return;

                JsonValue jv = null;
                try
                {
                    jv = JsonValue.Parse(TxV_Json.Text);
                }
                catch (Exception ex)
                {
                    jv = null;
                }

                if (jv == null)
                {
                    E_MessageBoxResults mbres3 = await MessageBox(this,
                     "Error",
                     "Unable to parse the json.",
                     E_MessageBoxButtons.Ok);

                    return;
                }

                if (!jv.ContainsKey("sites"))
                {
                    E_MessageBoxResults mbres3 = await MessageBox(this,
                     "Error",
                     "Invalid json. Expecting to find a field 'sites'.",
                     E_MessageBoxButtons.Ok);

                    return;
                }

                bool error = false;
                // delete all existing sites
                foreach(C_VitaSite site in Global.SiteCache)
                {
                    C_IOResult iord = await Global.RemoveSite(site, LoggedInUser.Token);
                    error |= !iord.Success;
                    if (error) 
                        break;
                }
                if (error)
                {
                    E_MessageBoxResults mbres3 = await MessageBox(this,
                     "Error",
                     "Error removing previous sites. New Sites not added.",
                     E_MessageBoxButtons.Ok);

                    return;
                }

                error = false;
                try
                {
                    JsonValue jvs = jv["sites"];
                    foreach (JsonValue j in jvs)
                    {
                        C_VitaSite site = new C_VitaSite(j);
                        C_IOResult ior = await Global.CreateSite(site, site.ToJson(false), LoggedInUser.Token);
                        error |= !ior.Success;
                        if (error)
                            break;
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
                if (error)
                {
                    E_MessageBoxResults mbres3 = await MessageBox(this,
                     "Error",
                     "Error creating a site. One or more sites may have been created.",
                     E_MessageBoxButtons.Ok);

                    return;
                }
            };

            B_ImportUsers.TouchUpInside += (object sender, EventArgs e) => 
            {

            };
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);
        }
    }
}