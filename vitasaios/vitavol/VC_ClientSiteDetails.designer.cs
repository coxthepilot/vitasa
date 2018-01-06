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
    [Register ("VC_ClientSiteDetails")]
    partial class VC_ClientSiteDetails
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_GetDirections { get; set; }

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
        UIKit.UILabel L_MyFreeTaxes { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_SiteName { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        MapKit.MKMapView Map_SiteMap { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (B_Back != null) {
                B_Back.Dispose ();
                B_Back = null;
            }

            if (B_GetDirections != null) {
                B_GetDirections.Dispose ();
                B_GetDirections = null;
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

            if (L_MyFreeTaxes != null) {
                L_MyFreeTaxes.Dispose ();
                L_MyFreeTaxes = null;
            }

            if (L_SiteName != null) {
                L_SiteName.Dispose ();
                L_SiteName = null;
            }

            if (Map_SiteMap != null) {
                Map_SiteMap.Dispose ();
                Map_SiteMap = null;
            }
        }
    }
}