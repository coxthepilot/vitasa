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

namespace vitavol
{
    [Register ("VC_AdminSite")]
    partial class VC_AdminSite
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIActivityIndicatorView AI_Busy { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_ContactAndNotes { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Coordinators { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_DeleteSite { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Save { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_SiteCalendar { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_SiteDetails { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_SiteLocation { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_Capabilities { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_CityStateZip { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_SiteName { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_Street { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_Type { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (AI_Busy != null) {
                AI_Busy.Dispose ();
                AI_Busy = null;
            }

            if (B_Back != null) {
                B_Back.Dispose ();
                B_Back = null;
            }

            if (B_ContactAndNotes != null) {
                B_ContactAndNotes.Dispose ();
                B_ContactAndNotes = null;
            }

            if (B_Coordinators != null) {
                B_Coordinators.Dispose ();
                B_Coordinators = null;
            }

            if (B_DeleteSite != null) {
                B_DeleteSite.Dispose ();
                B_DeleteSite = null;
            }

            if (B_Save != null) {
                B_Save.Dispose ();
                B_Save = null;
            }

            if (B_SiteCalendar != null) {
                B_SiteCalendar.Dispose ();
                B_SiteCalendar = null;
            }

            if (B_SiteDetails != null) {
                B_SiteDetails.Dispose ();
                B_SiteDetails = null;
            }

            if (B_SiteLocation != null) {
                B_SiteLocation.Dispose ();
                B_SiteLocation = null;
            }

            if (L_Capabilities != null) {
                L_Capabilities.Dispose ();
                L_Capabilities = null;
            }

            if (L_CityStateZip != null) {
                L_CityStateZip.Dispose ();
                L_CityStateZip = null;
            }

            if (L_SiteName != null) {
                L_SiteName.Dispose ();
                L_SiteName = null;
            }

            if (L_Street != null) {
                L_Street.Dispose ();
                L_Street = null;
            }

            if (L_Type != null) {
                L_Type.Dispose ();
                L_Type = null;
            }
        }
    }
}