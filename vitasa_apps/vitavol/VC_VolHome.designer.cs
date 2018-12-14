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
    [Register ("VC_VolHome")]
    partial class VC_VolHome
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIActivityIndicatorView AI_Busy { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_EditSettings { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Logout { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Mobile { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_PostSuggestion { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_ViewOrAddWorkItems { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_Mobile { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UISwitch SW_Mobile { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_Hours { get; set; }

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

            if (B_EditSettings != null) {
                B_EditSettings.Dispose ();
                B_EditSettings = null;
            }

            if (B_Logout != null) {
                B_Logout.Dispose ();
                B_Logout = null;
            }

            if (B_Mobile != null) {
                B_Mobile.Dispose ();
                B_Mobile = null;
            }

            if (B_PostSuggestion != null) {
                B_PostSuggestion.Dispose ();
                B_PostSuggestion = null;
            }

            if (B_ViewOrAddWorkItems != null) {
                B_ViewOrAddWorkItems.Dispose ();
                B_ViewOrAddWorkItems = null;
            }

            if (L_Mobile != null) {
                L_Mobile.Dispose ();
                L_Mobile = null;
            }

            if (SW_Mobile != null) {
                SW_Mobile.Dispose ();
                SW_Mobile = null;
            }

            if (TB_Hours != null) {
                TB_Hours.Dispose ();
                TB_Hours = null;
            }
        }
    }
}