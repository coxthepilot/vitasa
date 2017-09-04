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
        UIKit.UIButton B_Back { get; set; }

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
        UIKit.UITextField TB_CloseTime { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_EFilers { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_OpenTime { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (B_Back != null) {
                B_Back.Dispose ();
                B_Back = null;
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

            if (TB_CloseTime != null) {
                TB_CloseTime.Dispose ();
                TB_CloseTime = null;
            }

            if (TB_EFilers != null) {
                TB_EFilers.Dispose ();
                TB_EFilers = null;
            }

            if (TB_OpenTime != null) {
                TB_OpenTime.Dispose ();
                TB_OpenTime = null;
            }
        }
    }
}