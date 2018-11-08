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

        public VC_AdminSite (IntPtr handle) : base (handle)
        {
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
                c += cap.ToString();
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
                // create new site
                Global.SelectedSiteTemp.Slug = BuildSlug(Global.SelectedSiteTemp);
                errors = string.IsNullOrWhiteSpace(Global.SelectedSiteTemp.Slug);

                if (!errors)
                {
                    C_JsonBuilder jb = new C_JsonBuilder();
                    jb.Add(Global.SelectedSiteTemp.id, C_VitaSite.N_ID);
                    jb.Add(Global.SelectedSiteTemp.Name, C_VitaSite.N_Name);
                    jb.Add(Global.SelectedSiteTemp.Slug, C_VitaSite.N_Slug);
                    jb.Add(Global.SelectedSiteTemp.Street, C_VitaSite.N_Street);
                    jb.Add(Global.SelectedSiteTemp.City, C_VitaSite.N_City);
                    jb.Add(Global.SelectedSiteTemp.State, C_VitaSite.N_State);
                    jb.Add(Global.SelectedSiteTemp.Zip, C_VitaSite.N_Zip);
                    jb.Add(Global.SelectedSiteTemp.Latitude, C_VitaSite.N_Latitude);
                    jb.Add(Global.SelectedSiteTemp.Longitude, C_VitaSite.N_Longitude);
                    jb.Add(Global.SelectedSiteTemp.PlaceID, C_VitaSite.N_PlaceID);
                    jb.Add(Global.SelectedSiteTemp.SiteType.ToString(), C_VitaSite.N_SiteType);

                    jb.StartArray(C_VitaSite.N_SiteCapabilities);
                    foreach (E_SiteCapabilities sc in Global.SelectedSiteTemp.SiteCapabilities)
                        jb.AddArrayElement(sc.ToString());
                    jb.EndArray();

                    jb.StartArray(C_VitaSite.N_SiteCalendar);
                    foreach (C_CalendarEntry ce in Global.SelectedSiteTemp.SiteCalendar)
                        jb.AddArrayObject(ce.ToJson());
                    jb.EndArray();

                    C_IOResult ior = await Global.CreateSite(Global.SelectedSiteTemp, jb.ToString(), LoggedInUser.Token);
                    Global.SelectedSiteTemp.id = ior.Site.id;

                    // make the site coordinator assignments
                    // create a sitescoordinated for the user for each sc added
                    foreach (int nsc in Global.SelectedSiteTemp.SiteCoordinatorsIds)
                    {
                        // get the user, fetch if needed
                        C_VitaUser scu = await Global.FetchUserWithId(nsc);
                        // create the record
                        C_SiteCoordinated nsic = new C_SiteCoordinated(Global.SelectedSiteTemp);
                        // add to his list
                        scu.SitesCoordinated.Add(nsic);
                        // update the user on the db
                        C_JsonBuilder jb2 = new C_JsonBuilder();
                        jb2.StartArray(C_VitaUser.N_SitesCoordinated);
                        foreach (C_SiteCoordinated sc in scu.SitesCoordinated)
                            jb2.AddArrayObject(sc.ToJson());
                        jb2.EndArray();

                        C_IOResult ior2 = await Global.UpdateUserFields(jb2, scu, LoggedInUser.Token);
                        if (!ior.Success)
                        {
                            errors = true;
                            Console.WriteLine("site coord add failed.");
                        }
                    }
                }
            }
            else
            {
                // update existing site
                C_JsonBuilder jb = new C_JsonBuilder();
                jb.Add(Global.SelectedSiteTemp.id, C_VitaSite.N_ID);
                jb.Add(Global.SelectedSiteTemp.Name, C_VitaSite.N_Name);
                jb.Add(Global.SelectedSiteTemp.Slug, C_VitaSite.N_Slug);
                jb.Add(Global.SelectedSiteTemp.Street, C_VitaSite.N_Street);
                jb.Add(Global.SelectedSiteTemp.City, C_VitaSite.N_City);
                jb.Add(Global.SelectedSiteTemp.State, C_VitaSite.N_State);
                jb.Add(Global.SelectedSiteTemp.Zip, C_VitaSite.N_Zip);
                jb.Add(Global.SelectedSiteTemp.Latitude, C_VitaSite.N_Latitude);
                jb.Add(Global.SelectedSiteTemp.Longitude, C_VitaSite.N_Longitude);
                jb.Add(Global.SelectedSiteTemp.PlaceID, C_VitaSite.N_PlaceID);
                jb.Add(Global.SelectedSiteTemp.SiteType.ToString(), C_VitaSite.N_SiteType);

                jb.StartArray(C_VitaSite.N_SiteCapabilities);
                foreach (E_SiteCapabilities sc in Global.SelectedSiteTemp.SiteCapabilities)
                    jb.AddArrayElement(sc.ToString());
                jb.EndArray();

                C_IOResult ior = await Global.UpdateSiteFields(Global.SelectedSiteTemp, jb.ToString(), LoggedInUser.Token);

                // build a list of changes to the site coord ids
                List<int> addedSiteCoordIds = new List<int>();
                List<int> removedSiteCoordIds = new List<int>();

                // find any that were added by going through the new site to ensure they are in the old site
                foreach (int scidns in Global.SelectedSiteTemp.SiteCoordinatorsIds)
                {
                    if (!Global.SelectedSiteTemp.SiteCoordinatorsIds.Contains(scidns))
                        addedSiteCoordIds.Add(scidns);
                }

                // find any ids that were removed
                foreach (int scidos in Global.SelectedSiteTemp.SiteCoordinatorsIds)
                {
                    if (!Global.SelectedSiteTemp.SiteCoordinatorsIds.Contains(scidos))
                        removedSiteCoordIds.Add(scidos);
                }

                // create a sitescoordinated for the user for each sc added
                foreach (int nsc in addedSiteCoordIds)
                {
                    // get the user, fetch if needed
                    C_VitaUser scu = await Global.FetchUserWithId(nsc);
                    // create the record
                    C_SiteCoordinated nsic = new C_SiteCoordinated(Global.SelectedSiteTemp);
                    // add to his list
                    scu.SitesCoordinated.Add(nsic);
                    // update the user on the db
                    C_JsonBuilder jb2 = new C_JsonBuilder();
                    jb2.StartArray(C_VitaUser.N_SitesCoordinated);
                    foreach (C_SiteCoordinated sc in scu.SitesCoordinated)
                        jb2.AddArrayObject(sc.ToJson());
                    jb2.EndArray();

                    C_IOResult ior2 = await Global.UpdateUserFields(jb2, scu, LoggedInUser.Token);
                    if (!ior.Success)
                    {
                        errors = true;
                        Console.WriteLine("site coord add failed.");
                    }
                }

                // remove a sitescoordinated from the users with remove
                foreach (int rsc in removedSiteCoordIds)
                {
                    // get the user, fetch if needed
                    C_VitaUser scu = await Global.FetchUserWithId(rsc);
                    // remove from the list
                    int ix = Global.SelectedSiteTemp.SiteCoordinatorsIds.IndexOf(rsc);
                    if (ix != -1)
                    {
                        Global.SelectedSiteTemp.SiteCoordinatorsIds.RemoveAt(ix);
                        Global.SelectedSiteTemp.SiteCoordinatorNames.RemoveAt(ix);
                        // update the user on the db
                        C_JsonBuilder jb2 = new C_JsonBuilder();
                        jb2.StartArray(C_VitaUser.N_SitesCoordinated);
                        foreach (C_SiteCoordinated sc in scu.SitesCoordinated)
                            jb2.AddArrayObject(sc.ToJson());
                        jb2.EndArray();

                        C_IOResult ior2 = await Global.UpdateUserFields(jb2, scu, LoggedInUser.Token);
                        if (!ior.Success)
                        {
                            errors = true;
                            Console.WriteLine("site coord add failed.");
                        }
                    }
                    else
                    {
                        errors = true;
                        Console.WriteLine("didn't find the sc to remove!");
                    }
                }

                // build a list of changed calendar entries so we do the updates
                List<C_CalendarEntry> changedCalendarEntries = new List<C_CalendarEntry>();
                foreach (C_CalendarEntry ce in Global.SelectedSiteTemp.SiteCalendar)
                {
                    C_CalendarEntry nce = Global.SelectedSiteTemp.GetCalendarEntryForDate(ce.Date);
                    if (nce != null)
                    {
                        if ((ce.SiteIsOpen != nce.SiteIsOpen)
                            && (ce.OpenTime != nce.OpenTime)
                            && (ce.CloseTime != nce.CloseTime))
                            changedCalendarEntries.Add(nce);
                    }
                    else
                    {
                        errors = true;
                        Console.WriteLine("The calendar has been modified!");
                    }
                }
                // actually do the updates to the site calendar
                foreach (C_CalendarEntry nce in changedCalendarEntries)
                {
                    C_IOResult ior1 = await Global.UpdateCalendarEntry(Global.SelectedSiteTemp, LoggedInUser.Token, nce);
                    if (ior1.Success)
                    {
                        C_CalendarEntry oce = Global.SelectedSiteTemp.GetCalendarEntryForDate(nce.Date);
                        oce.SiteIsOpen = nce.SiteIsOpen;
                        oce.OpenTime = nce.OpenTime;
                        oce.CloseTime = nce.CloseTime;
                        oce.Dirty = false;
                    }
                    else
                    {
                        errors = false;
                        Console.WriteLine("update failed");
                    }
                }
            }

            return errors;
        }
    }
}