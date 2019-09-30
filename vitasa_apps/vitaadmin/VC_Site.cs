using Foundation;
using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using UIKit;

using zsquared;
using static zsquared.C_MessageBox;

namespace vitaadmin
{
    public partial class VC_Site : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        C_VitaSite SelectedSite;

        bool killChanges;
        bool Dirty;

        C_UserPicker PrimarySiteCoordinatorPicker;
        C_UserPicker BackupSiteCoordinatorPicker;

        List<C_VitaUser> SiteCoordinators;


        public VC_Site (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
            SelectedSite = Global.GetSiteFromSlugNoFetch(Global.SelectedSiteSlug);

            B_Back.TouchUpInside += async (sender, e) =>
            {
                await SaveIfDirty();

                PerformSegue("Segue_SiteToSites", this);
            };

            SW_Accepting.ValueChanged += (sender, e) =>
            {
                if (!SW_Accepting.On) return;
                if (killChanges) return;

                SW_NearLimit.On = false;
                SW_AtLimit.On = false;
                SW_Closed.On = false;

                E_ClientSiteStatus newStatus = E_ClientSiteStatus.Accepting;

                UpdateSiteStatus(newStatus);
            };

            SW_NearLimit.ValueChanged += (sender, e) =>
            {
                if (!SW_NearLimit.On)
                    return;
                if (killChanges) return;

                SW_Accepting.On = false;
                SW_AtLimit.On = false;
                SW_Closed.On = false;

                E_ClientSiteStatus newStatus = E_ClientSiteStatus.NearLimit;

                UpdateSiteStatus(newStatus);
            };

            SW_AtLimit.ValueChanged += (sender, e) =>
            {
                if (!SW_AtLimit.On)
                    return;
                if (killChanges) return;

                SW_Accepting.On = false;
                SW_NearLimit.On = false;
                SW_Closed.On = false;

                E_ClientSiteStatus newStatus = E_ClientSiteStatus.NotAccepting;

                UpdateSiteStatus(newStatus);
            };

            SW_Closed.ValueChanged += (sender, e) =>
            {
                if (!SW_Closed.On)
                    return;
                if (killChanges) return;

                SW_Accepting.On = false;
                SW_NearLimit.On = false;
                SW_AtLimit.On = false;

                E_ClientSiteStatus newStatus = E_ClientSiteStatus.Closed;

                UpdateSiteStatus(newStatus);
            };

            B_SaveChanges.TouchUpInside += async (sender, e) =>
            {
                AI_Busy.StartAnimating();
                EnableUI(false);

                C_IOResult ior = await UpdateSite();

                AI_Busy.StopAnimating();
                EnableUI(true);
            };

            B_WorkItems.TouchUpInside += async (sender, e) =>
            {
                await SaveIfDirty();

                Global.ViewCameFrom = E_ViewCameFrom.SCSite;
                PerformSegue("Segue_SiteToWorkItems", this);
            };

            B_Calendar.TouchUpInside += async (sender, e) => 
            {
                await SaveIfDirty();

                PerformSegue("Segue_SiteToCalendar", this);
            };

            TB_SiteName.AddTarget(TextField_ValueChanged, UIControlEvent.EditingChanged);
            TB_Street.AddTarget(TextField_ValueChanged, UIControlEvent.EditingChanged);
            TB_City.AddTarget(TextField_ValueChanged, UIControlEvent.EditingChanged);
            TB_State.AddTarget(TextField_ValueChanged, UIControlEvent.EditingChanged);
            TB_Zip.AddTarget(TextField_ValueChanged, UIControlEvent.EditingChanged);
            TB_Latitude.AddTarget(TextField_ValueChanged, UIControlEvent.EditingChanged);
            TB_Longitude.AddTarget(TextField_ValueChanged, UIControlEvent.EditingChanged);
            TB_PlaceID.AddTarget(TextField_ValueChanged, UIControlEvent.EditingChanged);

            killChanges = false;
            SW_DropOff.ValueChanged += SiteCapabilityChanged;
            SW_Express.ValueChanged += SiteCapabilityChanged;
            SW_MFT.ValueChanged += SiteCapabilityChanged;

            TB_SiteName.Text = SelectedSite.Name;
            L_Slug.Text = SelectedSite.Slug;
            TB_Street.Text = SelectedSite.Street;
            TB_City.Text = SelectedSite.City;
            TB_State.Text = SelectedSite.State;
            TB_Zip.Text = SelectedSite.Zip;
            TB_Latitude.Text = SelectedSite.Latitude;
            TB_Longitude.Text = SelectedSite.Longitude;
            TB_PlaceID.Text = SelectedSite.PlaceID;
            TB_SeasonStart.Text = SelectedSite.SeasonFirstDate.ToString("mmm dd,yyyy");
            TB_SeasonEnd.Text = SelectedSite.SeasonLastDate.ToString("mmm dd,yyyy");

            List<string> daysInSeason = new List<string>();
            C_YMD date = SelectedSite.SeasonFirstDate;
            do
            {
                daysInSeason.Add(date.ToString("yyyy-mm-dd"));

                date = date.AddDays(1);

            } while (date != SelectedSite.SeasonLastDate);
            daysInSeason.Add(date.ToString("yyyy-mm-dd"));

            C_ItemPicker seasonStartPicker = new C_ItemPicker(TB_SeasonStart, daysInSeason);
            seasonStartPicker.PickerDone += (sender, e) =>
            {
                TB_SeasonStart.Text = e.Selection;

                Dirty = true;
                B_SaveChanges.Enabled = true;

            };

            C_ItemPicker seasonEndPicker = new C_ItemPicker(TB_SeasonEnd, daysInSeason);
            seasonEndPicker.PickerDone += (sender, e) =>
            {
                TB_SeasonEnd.Text = e.Selection;

                Dirty = true;
                B_SaveChanges.Enabled = true;

            };

            seasonStartPicker.SetValue(SelectedSite.SeasonFirstDate.ToString("yyyy-mm-dd"));
            seasonEndPicker.SetValue(SelectedSite.SeasonLastDate.ToString("yyyy-mm-dd"));

            SW_DropOff.On = SelectedSite.SiteCapabilities.Contains(E_SiteCapabilities.DropOff);
            SW_Express.On = SelectedSite.SiteCapabilities.Contains(E_SiteCapabilities.Express);
            SW_MFT.On = SelectedSite.SiteCapabilities.Contains(E_SiteCapabilities.MFT);

            SW_Accepting.On = SelectedSite.ClientStatus == E_ClientSiteStatus.Accepting;
            SW_NearLimit.On = SelectedSite.ClientStatus == E_ClientSiteStatus.NearLimit;
            SW_AtLimit.On = SelectedSite.ClientStatus == E_ClientSiteStatus.NotAccepting;
            SW_Closed.On = SelectedSite.ClientStatus == E_ClientSiteStatus.Closed;

            B_SaveChanges.Enabled = false;
            Dirty = false;

            B_SaveChanges.SetTitle("Save Changes", UIControlState.Normal);
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            AI_Busy.StartAnimating();
            EnableUI(false);

            Task.Run(async delegate {
                List<C_VitaUser> users = null;
                if (!Global.AllUsersFetched)
                    users = await Global.FetchAllUsers(LoggedInUser.Token);
                else
                    users = Global.GetAllUsersNoCache();

                SiteCoordinators = new List<C_VitaUser>();
                foreach (C_VitaUser u in users)
                {
                    if (u.HasSiteCoordinator)
                        SiteCoordinators.Add(u);
                }
                SiteCoordinators.Sort(C_VitaUser.CompareByName);

                UIApplication.SharedApplication.InvokeOnMainThread(
                new Action(() =>
                {
                    AI_Busy.StopAnimating();
                    EnableUI(true);

                    PrimarySiteCoordinatorPicker = new C_UserPicker(TB_Primary, SiteCoordinators);
                    PrimarySiteCoordinatorPicker.UserPickerDone += (sender, e) =>
                    {
                        C_VitaUser selUser = e.Selection;
                        TB_Primary.Text = selUser.Name;
                        TB_Primary.ResignFirstResponder();

                        SelectedSite.PrimaryCoordinatorId = selUser.id;
                        SelectedSite.PrimaryCoordinatorName = selUser.Name;

                        Dirty = true;
                        B_SaveChanges.Enabled = true;
                    };

                    BackupSiteCoordinatorPicker = new C_UserPicker(TB_Backup, SiteCoordinators);
                    BackupSiteCoordinatorPicker.UserPickerDone += (sender, e) =>
                    {
                        C_VitaUser selUser = e.Selection;
                        TB_Backup.Text = selUser.Name;
                        TB_Backup.ResignFirstResponder();

                        SelectedSite.PrimaryCoordinatorId = selUser.id;
                        SelectedSite.PrimaryCoordinatorName = selUser.Name;

                        Dirty = true;
                        B_SaveChanges.Enabled = true;
                    };

                    PrimarySiteCoordinatorPicker.SetValue(SelectedSite.PrimaryCoordinatorName);
                    BackupSiteCoordinatorPicker.SetValue(SelectedSite.BackupCoordinatorName);

                }));
            });
        }

        void TextField_ValueChanged(object sender, EventArgs e)
        {
            Dirty = true;
            B_SaveChanges.Enabled = true;
        }

        private void SiteCapabilityChanged(object sender, EventArgs e)
        {
            AI_Busy.StartAnimating();
            EnableUI(false);

            SelectedSite.SiteCapabilities = new List<E_SiteCapabilities>();
            if (SW_DropOff.On)
                SelectedSite.SiteCapabilities.Add(E_SiteCapabilities.DropOff);
            if (SW_Express.On)
                SelectedSite.SiteCapabilities.Add(E_SiteCapabilities.Express);
            if (SW_MFT.On)
                SelectedSite.SiteCapabilities.Add(E_SiteCapabilities.MFT);

            Task.Run(async delegate
            {
                if (killChanges) return;

                C_IOResult ior = await Global.UpdateSiteCapabilities(SelectedSite, LoggedInUser.Token);

                UIApplication.SharedApplication.InvokeOnMainThread(
                new Action(async delegate
                {
                    AI_Busy.StopAnimating();
                    EnableUI(true);

                    if (!ior.Success)
                    {
                            var ok = await C_MessageBox.MessageBox(this, "Error", ior.ErrorMessage, E_MessageBoxButtons.Ok);
                    }
                }));
            });
        }

        private async Task<C_IOResult> UpdateSiteCapabilities()
        {
            SelectedSite.SiteCapabilities = new List<E_SiteCapabilities>();
            if (SW_DropOff.On)
                SelectedSite.SiteCapabilities.Add(E_SiteCapabilities.DropOff);
            if (SW_Express.On)
                SelectedSite.SiteCapabilities.Add(E_SiteCapabilities.Express);
            if (SW_MFT.On)
                SelectedSite.SiteCapabilities.Add(E_SiteCapabilities.MFT);

            C_IOResult ior = await Global.UpdateSiteCapabilities(SelectedSite, LoggedInUser.Token);

            return ior;
        }

        private void EnableUI(bool en)
        {
            TB_SiteName.Enabled = en;
            TB_Street.Enabled = en;
            TB_City.Enabled = en;
            TB_State.Enabled = en;
            TB_Zip.Enabled = en;
            TB_PlaceID.Enabled = en;
            TB_Latitude.Enabled = en;
            TB_Longitude.Enabled = en;
            TB_Primary.Enabled = en;
            TB_Backup.Enabled = en;
            TB_SeasonStart.Enabled = en;
            TB_SeasonEnd.Enabled = en;
            SW_DropOff.Enabled = en;
            SW_Express.Enabled = en;
            SW_MFT.Enabled = en;
            SW_Accepting.Enabled = en;
            SW_NearLimit.Enabled = en;
            SW_AtLimit.Enabled = en;
            SW_Closed.Enabled = en;

            B_SaveChanges.Enabled = en && Dirty;
            B_Calendar.Enabled = en;
            B_WorkItems.Enabled = en;
            B_Back.Enabled = en;
        }

        private void UpdateSiteStatus(E_ClientSiteStatus newStatus)
        {
            EnableUI(false);
            AI_Busy.StartAnimating();

            Task.Run(async delegate {
                C_VitaSite site = await Global.FetchSiteWithSlug(SelectedSite.Slug);

                UIApplication.SharedApplication.InvokeOnMainThread(
                new Action(async delegate
                {
                    if (site != null)
                    {
                        C_IOResult ior = await Global.UpdateSiteStatus(site, newStatus, LoggedInUser.Token);
                    }

                    AI_Busy.StopAnimating();
                    EnableUI(true);
                }));
            });
        }

        private async Task<C_IOResult> UpdateSite()
        {
            SelectedSite.Name = TB_SiteName.Text;
            SelectedSite.Street = TB_Street.Text;
            SelectedSite.City = TB_City.Text;
            SelectedSite.State = TB_State.Text;
            SelectedSite.Zip = TB_Zip.Text;
            SelectedSite.Latitude = TB_Latitude.Text;
            SelectedSite.Longitude = TB_Longitude.Text;
            SelectedSite.PlaceID = TB_PlaceID.Text;
            try { SelectedSite.SeasonFirstDate = new C_YMD(TB_SeasonStart.Text); }
            catch { }
            try { SelectedSite.SeasonLastDate = new C_YMD(TB_SeasonEnd.Text); }
            catch { }

            C_IOResult ior = await Global.UpdateSite(SelectedSite, LoggedInUser.Token);
            if (ior.Success)
                Dirty = false;

            return ior;
        }

        private async Task<bool> SaveIfDirty()
        {
            if (Dirty)
            {
                E_MessageBoxResults mbres = await C_MessageBox.MessageBox(this, "Save Changes?", "Changes were made. Save?", E_MessageBoxButtons.YesNo);
                if (mbres == E_MessageBoxResults.Yes)
                {
                    EnableUI(false);
                    AI_Busy.StartAnimating();

                    C_IOResult ior = await UpdateSite();

                    EnableUI(true);
                    AI_Busy.StopAnimating();

                    if (!ior.Success)
                    {
                        var ok = await C_MessageBox.MessageBox(this, "Error", ior.ErrorMessage, E_MessageBoxButtons.Ok);
                    }
                }
            }

            return false;
        }
    }
}