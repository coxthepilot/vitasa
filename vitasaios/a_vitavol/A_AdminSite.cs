using System;
using System.Threading.Tasks;
using System.Collections.Generic;

using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using Android.Util;
using Android.Views;

using Android.Gms.Common.Apis;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_AdminSite")]
    public class A_AdminSite : Activity
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        TextView L_SiteName;
        TextView L_Street;
        TextView L_CSZ;
        TextView L_SiteType;
        TextView L_SiteCapabilities;
        Button B_Location;
        Button B_Details;
        Button B_Calendar;
        Button B_Coordinators;
        Button B_Save;
        Button B_Delete;
        ProgressBar PB_Busy;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            if (Global.SelectedSiteTemp == null)
            {
                Global.SelectedSiteTemp = Global.SelectedSiteSlug == null ? new C_VitaSite() : Global.GetSiteFromSlugNoFetch(Global.SelectedSiteSlug);
                Global.SelectedSiteTemp.Dirty = false;
            }

            SetContentView(Resource.Layout.AdminSite);

            L_SiteName = FindViewById<TextView>(Resource.Id.L_SiteName);
            L_Street = FindViewById<TextView>(Resource.Id.L_Street);
            L_CSZ = FindViewById<TextView>(Resource.Id.L_CSZ);
            L_SiteType = FindViewById<TextView>(Resource.Id.L_SiteType);
            L_SiteCapabilities = FindViewById<TextView>(Resource.Id.L_Capabilities);
            B_Location = FindViewById<Button>(Resource.Id.B_Location);
            B_Details = FindViewById<Button>(Resource.Id.B_Details);
            B_Calendar = FindViewById<Button>(Resource.Id.B_Calendar);
            B_Coordinators = FindViewById<Button>(Resource.Id.B_Coordinators);
            B_Save = FindViewById<Button>(Resource.Id.B_Save);
            B_Delete = FindViewById<Button>(Resource.Id.B_DeleteSite);
            PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);

            C_Common.SetViewColors(this, Resource.Id.V_AdminSite);

            B_Save.Click += (sender, e) => 
            {
                PB_Busy.Visibility = ViewStates.Visible;
                EnableUI(false);

                Task.Run(async () => 
                {
                    bool errors = await SaveSite();

                    void p()
                    {
                        PB_Busy.Visibility = ViewStates.Gone;
                        EnableUI(true);

                        if (!errors)
                        {
                            StartActivity(new Intent(this, typeof(A_AdminSites)));
                            return;
                        }

                        C_MessageBox mbox = new C_MessageBox(this,
                         "Error",
                         "One or more errors occured in the update.",
                         E_MessageBoxButtons.Ok);
                        mbox.Show();
                    }
                    RunOnUiThread(p);
                });
            };

            B_Location.Click += (sender, e) => 
                StartActivity(new Intent(this, typeof(A_AdminSiteLocation)));

            B_Details.Click += (sender, e) => 
                StartActivity(new Intent(this, typeof(A_AdminSiteDetails)));

            B_Calendar.Click += (sender, e) => 
                StartActivity(new Intent(this, typeof(A_AdminSiteCalendar)));

            B_Coordinators.Click += (sender, e) => 
                StartActivity(new Intent(this, typeof(A_AdminSiteCoord)));

            B_Delete.Click += (sender, e) => 
            {
                if (string.IsNullOrWhiteSpace(Global.SelectedSiteTemp.Slug))
                {
                    C_MessageBox mbox2 = new C_MessageBox(this,
                          "Error",
                          "Unable to delete the site (missing slug).",
                          E_MessageBoxButtons.Ok);
                    mbox2.Show();
                    mbox2.Dismissed += (object sender1, C_MessageBoxEventArgs args) => 
                    {
                        Global.SelectedSiteTemp = null;
                        StartActivity(new Intent(this, typeof(A_AdminSites)));

                        return;
                    };
                    return;
                }

                string sitename = Global.SelectedSiteTemp.Name ?? "(none)";
                C_MessageBox mbox = new C_MessageBox(this,
                         "Are you sure?",
                         "Are you sure you want to delete this site [" + sitename + "]? There is no undo.",
                          E_MessageBoxButtons.YesNo);
                mbox.Show();
                mbox.Dismissed += (object sender1, C_MessageBoxEventArgs args) => 
                {
                    if (args.Result == E_MessageBoxResults.No)
                        return;

                    PB_Busy.Visibility = ViewStates.Visible;
                    EnableUI(false);

                    Task.Run(async () => 
                    {
                        C_IOResult ior = await Global.RemoveSite(Global.SelectedSiteTemp, LoggedInUser.Token);

                        void p()
                        {
                            PB_Busy.Visibility = ViewStates.Gone;
                            EnableUI(true);

                            if (ior.Success)
                            {
                                Global.SelectedSiteTemp = null;
                                StartActivity(new Intent(this, typeof(A_AdminSites)));

                                return;
                            }

                            C_MessageBox mbox1 = new C_MessageBox(this,
                                 "Error",
                                 "Unable to remove the site.",
                                 E_MessageBoxButtons.Ok);
                            mbox1.Show();
                        }
                        RunOnUiThread(p);
                    });
                };
            };

            // AdminSites only sets the SelectedSiteSlug and Name. If the Slug (and Name) are null then we are creating a new site.
            //   If an existing site, we create a (shallow) clone so we can abandon the changes in this form.
            if (Global.SelectedSiteTemp == null)
            {
                C_VitaSite siteTemp = Global.SelectedSiteSlug == null ? new C_VitaSite() : Global.GetSiteFromSlugNoFetch(Global.SelectedSiteSlug);
                Global.SelectedSiteTemp = new C_VitaSite(siteTemp)
                {
                    Dirty = false
                };
            }

            L_SiteName.Text = Global.SelectedSiteTemp.Name;

            L_Street.Text = Global.SelectedSiteTemp.Street ?? "";
            L_CSZ.Text = (Global.SelectedSiteTemp.City ?? "") + ", " + (Global.SelectedSiteTemp.State ?? "") + " " + (Global.SelectedSiteTemp.Zip ?? "");
            L_SiteType.Text = Global.SelectedSiteTemp.SiteType.ToString();
            string c = "";
            foreach (E_SiteCapabilities cap in Global.SelectedSiteTemp.SiteCapabilities)
            {
                if (c.Length > 0)
                    c += ", ";
                c += cap.ToString();
            }
            L_SiteCapabilities.Text = c;
        }

        private void EnableUI(bool en)
        {
            B_Location.Enabled = en;
            B_Details.Enabled = en;
            B_Calendar.Enabled = en;
            B_Coordinators.Enabled = en;
            B_Save.Enabled = en;
            B_Delete.Enabled = en;
        }

        public override void OnBackPressed()
        {
            if (!Global.SelectedSiteTemp.Dirty)
            {
                Global.SelectedSiteTemp = null;
                StartActivity(new Intent(this, typeof(A_AdminSites)));
                return;
            }

            C_MessageBox mbox = new C_MessageBox(this,
                "Changes",
                "Changes have been made. Save the changes?",
                 E_MessageBoxButtons.YesNoCancel);
            mbox.Show();
            mbox.Dismissed += (object sender, C_MessageBoxEventArgs args) => 
            {
                if (args.Result == E_MessageBoxResults.Cancel)
                    return;

                if (args.Result == E_MessageBoxResults.No)
                {
                    Global.SelectedSiteTemp = null;
                    StartActivity(new Intent(this, typeof(A_AdminSites)));
                    return;
                }

                Task.Run(async () => 
                {
                    bool errors = await SaveSite();

                    if (!errors)
                    {
                        Global.SelectedSiteTemp = null;
                        StartActivity(new Intent(this, typeof(A_AdminSites)));
                        return;
                    }

                    C_MessageBox mbox1 = new C_MessageBox(this,
                     "Error",
                     "One or more errors occured in the update.",
                     E_MessageBoxButtons.Ok);
                    mbox1.Show();
                });
            };
        }

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

            try
            {
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
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return errors;
        }

        private async Task<bool> AdjustSiteCoordniators()
        {
            bool errors = false;

            try
            {
                // The site coordinator assignments are done at the user level, not at the site. So, we get to go through
                //    each user and remove/add the assignment.

                // build a list of changes to the site coord ids
                // Get the original site
                C_VitaSite siteOriginal = Global.GetSiteFromSlugNoFetch(Global.SelectedSiteSlug);

                List<int> addedSiteCoordIds = new List<int>();
                List<int> removedSiteCoordIds = new List<int>();

                // find any that were added by going through the new site to ensure they are in the old site
                foreach (int scidns in Global.SelectedSiteTemp.SiteCoordinatorsIds)
                {
                    if (!siteOriginal.SiteCoordinatorsIds.Contains(scidns))
                        addedSiteCoordIds.Add(scidns);
                }

                // find any ids that were removed
                foreach (int scidos in siteOriginal.SiteCoordinatorsIds)
                {
                    if (!Global.SelectedSiteTemp.SiteCoordinatorsIds.Contains(scidos))
                        removedSiteCoordIds.Add(scidos);
                }

                foreach (int nsc in addedSiteCoordIds)
                {
                    // get the user, fetch if needed
                    C_VitaUser scu = await Global.FetchUserWithId(nsc);
                    // create the new site coordinated record
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
                    if (!ior2.Success)
                    {
                        errors = true;
                        Log.Debug("vita", "site coord add failed.");
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
                        if (!ior2.Success)
                            errors = true;
                    }
                    else
                    {
                        errors = true;
                        Log.Debug("vita", "didn't find the sc to remove!");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return errors;
        }

        private async Task<bool> AdjustSiteCalendar()
        {
            bool errors = false;

            try
            {
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
                        errors = true;
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
                        errors = false;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return errors;
        }
    }
}
