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
    [Register ("VC_SiteDetails")]
    partial class VC_SiteDetails
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIActivityIndicatorView AI_Busy { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_GetDirections { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_ImDoneHere { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_ViewSiteCalendar { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_Address { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_CityStateZip { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_DropOff { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_Express { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_HoursToday { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_InPerson { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_MFT { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_MobileSite { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_SiteName { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UISwitch SW_PreferredSite { get; set; }

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

            if (B_GetDirections != null) {
                B_GetDirections.Dispose ();
                B_GetDirections = null;
            }

            if (B_ImDoneHere != null) {
                B_ImDoneHere.Dispose ();
                B_ImDoneHere = null;
            }

            if (B_ViewSiteCalendar != null) {
                B_ViewSiteCalendar.Dispose ();
                B_ViewSiteCalendar = null;
            }

            if (L_Address != null) {
                L_Address.Dispose ();
                L_Address = null;
            }

            if (L_CityStateZip != null) {
                L_CityStateZip.Dispose ();
                L_CityStateZip = null;
            }

            if (L_DropOff != null) {
                L_DropOff.Dispose ();
                L_DropOff = null;
            }

            if (L_Express != null) {
                L_Express.Dispose ();
                L_Express = null;
            }

            if (L_HoursToday != null) {
                L_HoursToday.Dispose ();
                L_HoursToday = null;
            }

            if (L_InPerson != null) {
                L_InPerson.Dispose ();
                L_InPerson = null;
            }

            if (L_MFT != null) {
                L_MFT.Dispose ();
                L_MFT = null;
            }

            if (L_MobileSite != null) {
                L_MobileSite.Dispose ();
                L_MobileSite = null;
            }

            if (L_SiteName != null) {
                L_SiteName.Dispose ();
                L_SiteName = null;
            }

            if (SW_PreferredSite != null) {
                SW_PreferredSite.Dispose ();
                SW_PreferredSite = null;
            }
        }
    }
}