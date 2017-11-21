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
    [Register ("VC_ShiftDetails")]
    partial class VC_ShiftDetails
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_ShiftSettingsFor { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_SiteName { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_CloseTime { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_NumAdvanced { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_NumBasic { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_OpenTime { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (B_Back != null) {
                B_Back.Dispose ();
                B_Back = null;
            }

            if (L_ShiftSettingsFor != null) {
                L_ShiftSettingsFor.Dispose ();
                L_ShiftSettingsFor = null;
            }

            if (L_SiteName != null) {
                L_SiteName.Dispose ();
                L_SiteName = null;
            }

            if (TB_CloseTime != null) {
                TB_CloseTime.Dispose ();
                TB_CloseTime = null;
            }

            if (TB_NumAdvanced != null) {
                TB_NumAdvanced.Dispose ();
                TB_NumAdvanced = null;
            }

            if (TB_NumBasic != null) {
                TB_NumBasic.Dispose ();
                TB_NumBasic = null;
            }

            if (TB_OpenTime != null) {
                TB_OpenTime.Dispose ();
                TB_OpenTime = null;
            }
        }
    }
}