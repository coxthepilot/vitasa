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
        C_VitaUser LoggedInUser;

        C_PersistentSettings Settings;

        public VC_SiteDetails (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            LoggedInUser = null;
            if (Global.LoggedInUserId != -1)
                LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            SelectedSite = Global.GetSiteFromSlugNoFetch(Global.SelectedSiteSlug);

            Settings = new C_PersistentSettings();

            B_Back.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_SiteDetailsToSitesMap", this);

            B_ImDoneHere.TouchUpInside += (sender, e) => 
                PerformSegue("Segue_SiteDetailsToSitesMap", this);

            SW_PreferredSite.ValueChanged += (sender, e) => 
            {
                if ((LoggedInUser != null) && LoggedInUser.HasVolunteer)
                {
                    AI_Busy.StartAnimating();
                    EnableUI(false);

                    bool preferedSiteOn = SW_PreferredSite.On;

                    if (SW_PreferredSite.On)
                    {
                        if (!LoggedInUser.PreferredSiteSlugs.Contains(SelectedSite.Slug))
                            LoggedInUser.PreferredSiteSlugs.Add(SelectedSite.Slug);
                    }
                    else
                    {
                        if (LoggedInUser.PreferredSiteSlugs.Contains(SelectedSite.Slug))
                            LoggedInUser.PreferredSiteSlugs.Remove(SelectedSite.Slug);
                    }

                    Task.Run(async () => 
                    {
                        C_IOResult ior = await Global.UpdateUserFields(LoggedInUser.ToJsonAsJsonBuilder(), LoggedInUser, LoggedInUser.Token);

                        async void p()
                        {
                            AI_Busy.StopAnimating();
                            EnableUI(true);

                            if (!ior.Success)
                            {
                                E_MessageBoxResults mbres = await MessageBox(this,
                                 "Error",
                                 "Unable to save the save preferences.",
                                 E_MessageBoxButtons.Ok);
                            }
                            else
                            {
                                if (SW_PreferredSite.On)
                                    Settings.AddPreferedSite(SelectedSite.Slug);
                                else
                                    Settings.RemovePreferedSite(SelectedSite.Slug);
                            }
                        }
                        UIApplication.SharedApplication.InvokeOnMainThread(p);

                    });
                }
                else
                {
                    if (SW_PreferredSite.On)
                        Settings.AddPreferedSite(SelectedSite.Slug);
                    else
                        Settings.RemovePreferedSite(SelectedSite.Slug);
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
            {
                if (SelectedSite.SiteCalendar.Count == 0)
                    L_HoursToday.Text = "- closed -";
                else
                {
                    // find the next open date
                    SelectedSite.SiteCalendar.Sort(C_CalendarEntry.CompareByDate);
                    int ix = 0;
                    while ((ix != SelectedSite.SiteCalendar.Count) && (SelectedSite.SiteCalendar[ix].Date <= today))
                        ix++;

                    while ((ix != SelectedSite.SiteCalendar.Count) && SelectedSite.SiteCalendar[ix].SiteIsOpen)
                        ix++;

                    if (ix == SelectedSite.SiteCalendar.Count)
                        L_HoursToday.Text = "- closed -";
                    else
                    {
                        C_CalendarEntry ce = SelectedSite.SiteCalendar[ix];
                        L_HoursToday.Text = "Closed today. Next open on " + ce.Date.ToString("mmm dd, yyyy") + " from "
                        + ce.OpenTime.ToString("hh:mm p") + "-" + ce.CloseTime.ToString("hh:mm p");
                    }
                }
            }

            L_MobileSite.Hidden = SelectedSite.SiteType != E_SiteType.Mobile;
            L_DropOff.Hidden = !SelectedSite.SiteCapabilities.Contains(E_SiteCapabilities.DropOff);
            L_InPerson.Hidden = !SelectedSite.SiteCapabilities.Contains(E_SiteCapabilities.InPersonTaxPrep);
            L_Express.Hidden = !SelectedSite.SiteCapabilities.Contains(E_SiteCapabilities.Express);
            L_MFT.Hidden = !SelectedSite.SiteCapabilities.Contains(E_SiteCapabilities.MFT);

            SW_PreferredSite.On = Settings.IsPreferedSite(SelectedSite.Slug);
        }

        private void EnableUI(bool en) =>
            C_Common.EnableUI(View, en);

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