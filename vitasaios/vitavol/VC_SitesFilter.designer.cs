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
    [Register ("VC_SitesFilter")]
    partial class VC_SitesFilter
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIActivityIndicatorView AI_Busy { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_UseFilter { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_Mobile { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UISwitch SW_DropOff { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UISwitch SW_Express { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UISwitch SW_InPersonPrep { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UISwitch SW_MFT { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UISwitch SW_Mobile { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_Dates { get; set; }

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

            if (B_UseFilter != null) {
                B_UseFilter.Dispose ();
                B_UseFilter = null;
            }

            if (L_Mobile != null) {
                L_Mobile.Dispose ();
                L_Mobile = null;
            }

            if (SW_DropOff != null) {
                SW_DropOff.Dispose ();
                SW_DropOff = null;
            }

            if (SW_Express != null) {
                SW_Express.Dispose ();
                SW_Express = null;
            }

            if (SW_InPersonPrep != null) {
                SW_InPersonPrep.Dispose ();
                SW_InPersonPrep = null;
            }

            if (SW_MFT != null) {
                SW_MFT.Dispose ();
                SW_MFT = null;
            }

            if (SW_Mobile != null) {
                SW_Mobile.Dispose ();
                SW_Mobile = null;
            }

            if (TB_Dates != null) {
                TB_Dates.Dispose ();
                TB_Dates = null;
            }
        }
    }
}