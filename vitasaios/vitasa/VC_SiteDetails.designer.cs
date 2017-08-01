// WARNING
//
// This file has been generated automatically by Visual Studio from the outlets and
// actions declared in your storyboard file.
// Manual changes to this file will not be maintained.
//
using Foundation;
using System;
using System.CodeDom.Compiler;
using UIKit;

namespace vitasa
{
    [Register ("VC_SiteDetails")]
    partial class VC_SiteDetails
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Change { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIImageView I_SiteStatus { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_Address { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_CityStateZip { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_SiteCoordinator { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_SiteName { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_SiteStatus { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        MapKit.MKMapView Map_SiteMap { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (B_Back != null) {
                B_Back.Dispose ();
                B_Back = null;
            }

            if (B_Change != null) {
                B_Change.Dispose ();
                B_Change = null;
            }

            if (I_SiteStatus != null) {
                I_SiteStatus.Dispose ();
                I_SiteStatus = null;
            }

            if (L_Address != null) {
                L_Address.Dispose ();
                L_Address = null;
            }

            if (L_CityStateZip != null) {
                L_CityStateZip.Dispose ();
                L_CityStateZip = null;
            }

            if (L_SiteCoordinator != null) {
                L_SiteCoordinator.Dispose ();
                L_SiteCoordinator = null;
            }

            if (L_SiteName != null) {
                L_SiteName.Dispose ();
                L_SiteName = null;
            }

            if (L_SiteStatus != null) {
                L_SiteStatus.Dispose ();
                L_SiteStatus = null;
            }

            if (Map_SiteMap != null) {
                Map_SiteMap.Dispose ();
                Map_SiteMap = null;
            }
        }
    }
}