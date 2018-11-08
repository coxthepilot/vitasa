using Foundation;
using System;
using UIKit;
using System.Linq;
using System.Collections.Generic;
using System.Threading.Tasks;

using zsquared;
using static zsquared.C_MessageBox;

namespace vitavol
{
    public partial class VC_SiteDetails : UIViewController
    {
        C_Global Global;
        C_VitaSite SelectedSite;

        C_PersistentSettings Settings;

        public VC_SiteDetails (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

            SelectedSite = Global.GetSiteFromSlugNoFetch(Global.SelectedSiteSlug);

            Settings = new C_PersistentSettings();

            B_Back.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_SiteDetailsToSitesMap", this);

            B_ImDoneHere.TouchUpInside += (sender, e) => 
                PerformSegue("Segue_SiteDetailsToSitesMap", this);

            SW_PreferredSite.ValueChanged += (sender, e) => 
            {
                if (SW_PreferredSite.On)
                    Settings.AddPreferedSite(SelectedSite.Slug);
                else
                    Settings.RemovePreferedSite(SelectedSite.Slug);

                // if we have user settings
                if (!string.IsNullOrWhiteSpace(Settings.UserEmail) && !string.IsNullOrWhiteSpace(Settings.UserPassword))
                {
                    AI_Busy.StartAnimating();
                    EnableUI(false);
                    bool preferedSiteOn = SW_PreferredSite.On;

                    Task.Run(async () => 
                    {
                        bool settingsSaved = false;
                        // see if they are already logged in; if not, log them and the do the save
                        if (Global.LoggedInUserId == -1)
                        {
                            bool loginOk = await DoLogin();
                        }

                        // if the login was successful or they were already logged in, then do the save
                        if ((Global.LoggedInUserId != -1) && Global.SelectedUser.HasVolunteer)
                            settingsSaved = await AdjustAndSaveUserPreferedSites(preferedSiteOn);

                        async void p()
                        {
                            AI_Busy.StopAnimating();
                            EnableUI(true);

                            if (!settingsSaved)
                            {
                                E_MessageBoxResults mbres = await MessageBox(this,
                                 "Error",
                                 "Unable to save the save preferences.",
                                 E_MessageBoxButtons.Ok);
                            }
                        }
                        UIApplication.SharedApplication.InvokeOnMainThread(p);
                    });
                }
            };

            B_ViewSiteCalendar.TouchUpInside += (sender, e) => 
                PerformSegue("Segue_SiteDetailsToSiteCalendar", this);

            B_GetDirections.TouchUpInside += (sender, e) => 
            {
                // the destination is the site the user selected
                // the source address is unspecified which makes it the user's current location
                string destinationAddress = SelectedSite.Street + ", "
                                                  + SelectedSite.City + " "
                                                  + SelectedSite.State;
                string url = "http://maps.apple.com/?daddr=" + destinationAddress;  // + "&saddr=<destination>";
                url = url.Replace(" ", "%20");
                if (UIApplication.SharedApplication.CanOpenUrl(new NSUrl(url)))
                    UIApplication.SharedApplication.OpenUrl(new NSUrl(url));
                else
                {
                    async void p()
                    {
                        E_MessageBoxResults mbres = await MessageBox(this,
                                        "No maps app",
                                         "Maps app not supported on this device",
                                         C_MessageBox.E_MessageBoxButtons.Ok);
                    }
                    UIApplication.SharedApplication.InvokeOnMainThread(p);
                }
            };
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);

            L_SiteName.Text = SelectedSite.Name;
            L_Address.Text = SelectedSite.Street;
            L_CityStateZip.Text = SelectedSite.City + ", " + SelectedSite.State + " " + SelectedSite.Zip;

            C_YMD today = C_YMD.Now;
            var lo = SelectedSite.SiteCalendar.Where(ce => ce.Date == today);
            if (lo.Any())
            {
                C_CalendarEntry cef = lo.First();
                L_HoursToday.Text = cef.OpenTime.ToString("hh:mm p") + "-" + cef.CloseTime.ToString("hh:mm p");
            }
            else
                L_HoursToday.Text = "- closed -";

            L_MobileSite.Hidden = SelectedSite.SiteType != E_SiteType.Mobile;
            L_DropOff.Hidden = !SelectedSite.SiteCapabilities.Contains(E_SiteCapabilities.DropOff);
            L_InPerson.Hidden = !SelectedSite.SiteCapabilities.Contains(E_SiteCapabilities.InPerson);
            L_Express.Hidden = !SelectedSite.SiteCapabilities.Contains(E_SiteCapabilities.Express);
            L_MFT.Hidden = !SelectedSite.SiteCapabilities.Contains(E_SiteCapabilities.MFT);

            SW_PreferredSite.On = SelectedSite.PreferredSite;
        }

        private void EnableUI(bool en) =>
            C_Common.EnableUI(View, en);

        private async Task<bool> AdjustAndSaveUserPreferedSites(bool preferedSiteOn)
        {
            if (preferedSiteOn)
            {
                if (!Global.SelectedUser.PreferredSiteSlugs.Contains(SelectedSite.Slug))
                    Global.SelectedUser.PreferredSiteSlugs.Add(SelectedSite.Slug);
            }
            else
            {
                if (Global.SelectedUser.PreferredSiteSlugs.Contains(SelectedSite.Slug))
                    Global.SelectedUser.PreferredSiteSlugs.Remove(SelectedSite.Slug);
            }

            C_JsonBuilder jb = new C_JsonBuilder();
            jb.StartArray(C_VitaUser.N_PreferredSites);
            foreach (string ps in Global.SelectedUser.PreferredSiteSlugs)
                jb.AddArrayObject(ps);
            jb.EndArray();

            C_IOResult ior1 = await Global.UpdateUserFields(jb, Global.SelectedUser, Global.SelectedUser.Token);

            return ior1.Success;
        }

        private async Task<bool> DoLogin()
        {
            C_IOResult ior = await Global.PerformLogin(Settings.UserEmail, Settings.UserPassword);

            if (ior.Success && (ior.User != null) && ior.User.HasVolunteer)
            {
                Global.LoggedInUserId = ior.User.id;
                Global.SelectedUser = ior.User;
            }

            return ior.Success;
        }
    }
}