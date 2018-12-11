using System;
using UIKit;
using System.Threading.Tasks;
using System.Collections.Generic;
using static zsquared.C_MessageBox;

using zsquared;

namespace vitavol
{
    public partial class VC_AdminSite : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;
        bool SkipToLocation;

        public VC_AdminSite (IntPtr handle) : base (handle)
        {
            SkipToLocation = false;
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            if (Global.SelectedSiteTemp == null)
            {
                Global.SelectedSiteTemp = Global.SelectedSiteSlug == null ? new C_VitaSite() : Global.GetSiteFromSlugNoFetch(Global.SelectedSiteSlug);
                Global.SelectedSiteTemp.Dirty = false;
                SkipToLocation = Global.SelectedSiteSlug == null;
            }

            B_Back.TouchUpInside += async (sender, e) => 
            {
                if (!Global.SelectedSiteTemp.Dirty)
                {
                    Global.SelectedSiteTemp = null;
                    PerformSegue("Segue_AdminSiteToAdminSites", this);

                    return;
                }

                E_MessageBoxResults mbres = await MessageBox(this,
                    "Changes",
                    "Changes have been made. Save the changes?",
                     E_MessageBoxButtons.YesNoCancel);

                if (mbres == E_MessageBoxResults.Cancel)
                    return;

                if (mbres == E_MessageBoxResults.No)
                {
                    Global.SelectedSiteTemp = null;
                    PerformSegue("Segue_AdminSiteToAdminSites", this);
                    return;
                }

                AI_Busy.StartAnimating();
                EnableUI(false);

                await Task.Run(async () => 
                {
                    bool errors = await SaveSite();

                    async void p()
                    {
                        AI_Busy.StopAnimating();
                        EnableUI(false);

                        if (!errors)
                        {
                            Global.SelectedSiteTemp = null;
                            PerformSegue("Segue_AdminSiteToAdminSites", this);
                            return;
                        }

                        E_MessageBoxResults mbres2 = await MessageBox(this,
                             "Error",
                             "One or more errors occured in the update.",
                             E_MessageBoxButtons.Ok);
                    }
                    UIApplication.SharedApplication.InvokeOnMainThread(p);
                });
            };

            B_SiteLocation.TouchUpInside += (sender, e) => 
                PerformSegue("Segue_AdminSiteToAdminSiteLocation", this);

            B_SiteDetails.TouchUpInside += (sender, e) => 
                PerformSegue("Segue_AdminSiteToAdminSiteDetails", this);

            B_SiteCalendar.TouchUpInside += (sender, e) => 
                PerformSegue("Segue_AdminSiteToAdminSiteCalendar", this);

            B_Coordinators.TouchUpInside += (sender, e) => 
                PerformSegue("Segue_AdminSiteToAdminSiteCoord", this);

            B_ContactAndNotes.TouchUpInside += (sender, e) => 
                PerformSegue("Segue_AdminSiteToAdminSiteContactAndNotes", this);

            B_Save.TouchUpInside += (sender, e) => 
            {
                AI_Busy.StartAnimating();
                EnableUI(false);

                Task.Run(async () => 
                {
                    bool errors = await SaveSite();

                    async void p()
                    {
                        AI_Busy.StopAnimating();
                        EnableUI(true);

                        if (!errors)
                        {
                            PerformSegue("Segue_AdminSiteToAdminSites", this);
                            return;
                        }

                        E_MessageBoxResults mbres = await MessageBox(this,
                         "Error",
                         "One or more errors occured in the update.",
                         E_MessageBoxButtons.Ok);
                    }
                    UIApplication.SharedApplication.InvokeOnMainThread(p);
                });
            };

            B_DeleteSite.TouchUpInside += async (sender, e) => 
            {
                if (string.IsNullOrWhiteSpace(Global.SelectedSiteTemp.Slug))
                {
                    E_MessageBoxResults mbres2 = await MessageBox(this,
                         "Error",
                         "Unable to remove the site (missing slug).",
                         E_MessageBoxButtons.Ok);

                    Global.SelectedSiteTemp = null;
                    PerformSegue("Segue_AdminSiteToAdminSites", this);

                    return;
                }

                E_MessageBoxResults mbres = await MessageBox(this,
                 "Are you sure?",
                 "Are you sure you want to delete this site [" + Global.SelectedSiteTemp.Name + "]? There is no undo.",
                 E_MessageBoxButtons.YesNo);

                if (mbres == E_MessageBoxResults.No)
                    return;

                AI_Busy.StartAnimating();
                EnableUI(false);

                await Task.Run(async () => 
                {
                    C_IOResult ior = await Global.RemoveSite(Global.SelectedSiteTemp, LoggedInUser.Token);

                    async void p()
                    {
                        AI_Busy.StopAnimating();
                        EnableUI(true);

                        if (ior.Success)
                        {
                            Global.SelectedSiteTemp = null;
                            PerformSegue("Segue_AdminSiteToAdminSites", this);

                            return;
                        }

                        E_MessageBoxResults mbres3 = await MessageBox(this,
                             "Error",
                             "Unable to remove the site.",
                             E_MessageBoxButtons.Ok);
                    }
                    UIApplication.SharedApplication.InvokeOnMainThread(p);
                });
            };
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            if (SkipToLocation)
                PerformSegue("Segue_AdminSiteToAdminSiteLocation", this);

            C_Common.SetUIColors(View);

            L_SiteName.Text = Global.SelectedSiteTemp.Name;

            L_Street.Text = Global.SelectedSiteTemp.Street ?? "";
            L_CityStateZip.Text = (Global.SelectedSiteTemp.City ?? "") + ", " + (Global.SelectedSiteTemp.State ?? "") + " " + (Global.SelectedSiteTemp.Zip ?? "");
            L_Type.Text = Global.SelectedSiteTemp.SiteType.ToString();
            string c = "";
            foreach(E_SiteCapabilities cap in Global.SelectedSiteTemp.SiteCapabilities)
            {
                if (c.Length > 0)
                    c += ", ";
                c += Tools.FixCamelCaseDisplay(cap.ToString());
            }
            L_Capabilities.Text = c;
        }

        private void EnableUI(bool en) => 
            C_Common.EnableUI(View, en);

        private string BuildSlug(C_VitaSite site)
        {
            // if it already has a slug, use that one
            if (!string.IsNullOrWhiteSpace(site.Slug))
                return site.Slug;

            // it has no slug, so create one
            // if they failed to provide a name, then we just punt
            if (string.IsNullOrWhiteSpace(site.Name))
                return null;

            string res = site.Name.Trim();
            res = res.ToLower();
            res = res.Replace(' ', '-');
            res = System.Net.WebUtility.UrlEncode(res);

            return res;
        }

        private async Task<bool> SaveSite()
        {
            bool errors = false;
            if (Global.SelectedSiteSlug == null)
            {
                throw new ApplicationException("create happens in AdminSiteLocation");
            }
            else
            {
                C_IOResult ior = await Global.UpdateSiteFields(Global.SelectedSiteTemp, Global.SelectedSiteTemp.ToJson(false), LoggedInUser.Token);
                errors = !ior.Success;
            }

            return errors;
        }
    }
}