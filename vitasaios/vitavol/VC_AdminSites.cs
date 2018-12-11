using System;
using UIKit;
using System.Threading.Tasks;
using System.Collections.Generic;

using zsquared;

namespace vitavol
{
    public partial class VC_AdminSites : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        C_TableSource<C_VitaSite> SitesTableSource;
        C_ItemPicker<E_SiteType> SiteTypeItemPicker;

        public VC_AdminSites (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            B_Back.TouchUpInside += (sender, e) => 
                PerformSegue("Segue_AdminSitesToAdminMenu", this);

            B_CreateSite.TouchUpInside += (sender, e) => 
            {
                Global.SelectedSiteName = null;
                Global.SelectedSiteSlug = null;
                Global.SelectedSiteTemp = null;
                PerformSegue("Segue_AdminSitesToAdminSite", this);
            };

            TB_FilterBy.AddTarget((sender, e) => 
            {
                E_SiteType t = SiteTypeItemPicker.Selection;

                List<C_VitaSite> sites_ = Global.GetAllSitesNoFetch();
                List<C_VitaSite> sites = new List<C_VitaSite>();
                foreach(C_VitaSite site in sites_)
                {
                    if ((t == E_SiteType.All) || (site.SiteType == t))
                        sites.Add(site);
                }
                sites.Sort(C_VitaSite.CompareSitesByNameAscending);

                SetSitesTable(sites);

            }, UIControlEvent.AllEditingEvents);
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);

            List<E_SiteType> types = Tools.EnumToList<E_SiteType>();
            SiteTypeItemPicker = new C_ItemPicker<E_SiteType>(TB_FilterBy, types);
            SiteTypeItemPicker.SetSelection(E_SiteType.All);

            AI_Busy.StartAnimating();
            EnableUI(false);

            Task.Run(async () => 
            {
                List<C_VitaSite> sites = await Global.FetchAllSites(LoggedInUser.Token);
                sites.Sort(C_VitaSite.CompareSitesByNameAscendingLower);

                void p()
                {
                    AI_Busy.StopAnimating();
                    EnableUI(true);

                    SetSitesTable(sites);
                }
                UIApplication.SharedApplication.InvokeOnMainThread(p);
            });
        }

        private void SetSitesTable(List<C_VitaSite> sites)
        {
            SitesTableSource = new C_TableSource<C_VitaSite>(this, TV_Sites, sites, "sitescell");
            SitesTableSource.GetTextLabel += (sender, args) =>
            {
                C_VitaSite site = args.Item;
                return site.Name;
            };
            SitesTableSource.GetDetailTextLabel += (sender, args) =>
            {
                C_VitaSite site = args.Item;
                string ms = site.SiteType == E_SiteType.Mobile ? " [Mobile]" : "";
                return site.Street + ", " + site.City + " " + site.State + ms;
            };
            SitesTableSource.Selected += (sender, args) =>
            {
                C_VitaSite site = args.Item;
                Global.SelectedSiteName = site.Name;
                Global.SelectedSiteSlug = site.Slug;
                Global.SelectedSiteTemp = null;
                PerformSegue("Segue_AdminSitesToAdminSite", this);
            };
            TV_Sites.Source = SitesTableSource;
            TV_Sites.ReloadData();
        }

        private void EnableUI(bool en) =>
            C_Common.EnableUI(View, en);
    }
}