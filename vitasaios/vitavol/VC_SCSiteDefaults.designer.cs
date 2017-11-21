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
    [Register ("VC_SCSiteDefaults")]
    partial class VC_SCSiteDefaults
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIActivityIndicatorView AI_Busy { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_NewShift { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_SaveDefaults { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_DayOfWeek { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_SiteName { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UISwitch SW_IsOpen { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITableView TV_Shifts { get; set; }

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

            if (B_NewShift != null) {
                B_NewShift.Dispose ();
                B_NewShift = null;
            }

            if (B_SaveDefaults != null) {
                B_SaveDefaults.Dispose ();
                B_SaveDefaults = null;
            }

            if (L_DayOfWeek != null) {
                L_DayOfWeek.Dispose ();
                L_DayOfWeek = null;
            }

            if (L_SiteName != null) {
                L_SiteName.Dispose ();
                L_SiteName = null;
            }

            if (SW_IsOpen != null) {
                SW_IsOpen.Dispose ();
                SW_IsOpen = null;
            }

            if (TV_Shifts != null) {
                TV_Shifts.Dispose ();
                TV_Shifts = null;
            }
        }
    }
}