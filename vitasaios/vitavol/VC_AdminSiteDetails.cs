using Foundation;
using System;
using UIKit;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using static zsquared.C_MessageBox;

using zsquared;

namespace vitavol
{
    public partial class VC_AdminSiteDetails : UIViewController
    {
        C_Global Global;

        public VC_AdminSiteDetails (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

            B_Back.TouchUpInside += async (sender, e) => 
            {
                SaveDetails();
                PerformSegue("Segue_AdminSiteDetailsToAdminSite", this);
            };

            B_Save.TouchUpInside += (sender, e) => 
            {
                SaveDetails();

                PerformSegue("Segue_AdminSiteDetailsToAdminSite", this);
            };
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);

            L_SiteName.Text = Global.SelectedSiteTemp.Name;

            List<E_SiteType> types = new List<E_SiteType>();
            foreach (E_SiteType ss in Enum.GetValues(typeof(E_SiteType)))
                types.Add(ss);

            SW_Mobile.On = Global.SelectedSiteTemp.SiteType == E_SiteType.Mobile;
            SW_MFT.On = Global.SelectedSiteTemp.SiteCapabilities.Contains(E_SiteCapabilities.MFT);
            SW_DropOff.On = Global.SelectedSiteTemp.SiteCapabilities.Contains(E_SiteCapabilities.DropOff);
            SW_Express.On = Global.SelectedSiteTemp.SiteCapabilities.Contains(E_SiteCapabilities.Express);
            SW_InPerson.On = Global.SelectedSiteTemp.SiteCapabilities.Contains(E_SiteCapabilities.InPerson);
        }

        private void SaveDetails()
        {
            Global.SelectedSiteTemp.SiteType = SW_Mobile.On ? E_SiteType.Mobile : E_SiteType.Fixed;

            Global.SelectedSiteTemp.SiteCapabilities = new List<E_SiteCapabilities>();
            if (SW_Mobile.On) Global.SelectedSiteTemp.SiteType = E_SiteType.Mobile;
            if (SW_MFT.On) Global.SelectedSiteTemp.SiteCapabilities.Add(E_SiteCapabilities.MFT);
            if (SW_DropOff.On) Global.SelectedSiteTemp.SiteCapabilities.Add(E_SiteCapabilities.DropOff);
            if (SW_Express.On) Global.SelectedSiteTemp.SiteCapabilities.Add(E_SiteCapabilities.Express);
            if (SW_InPerson.On) Global.SelectedSiteTemp.SiteCapabilities.Add(E_SiteCapabilities.InPerson);
        }
    }
}