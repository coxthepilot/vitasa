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
    [Register ("VC_SCSiteOnDate")]
    partial class VC_SCSiteOnDate
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIActivityIndicatorView AI_Busy { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_RestoreDefaults { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_SaveCalendarException { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_Date { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_DefaultCloseTime { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_DefaultEFilers { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_DefaultOpenTime { get; set; }

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
        UIKit.UITextField TB_NumEFilers { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_OpenTime { get; set; }

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

            if (B_RestoreDefaults != null) {
                B_RestoreDefaults.Dispose ();
                B_RestoreDefaults = null;
            }

            if (B_SaveCalendarException != null) {
                B_SaveCalendarException.Dispose ();
                B_SaveCalendarException = null;
            }

            if (L_Date != null) {
                L_Date.Dispose ();
                L_Date = null;
            }

            if (L_DefaultCloseTime != null) {
                L_DefaultCloseTime.Dispose ();
                L_DefaultCloseTime = null;
            }

            if (L_DefaultEFilers != null) {
                L_DefaultEFilers.Dispose ();
                L_DefaultEFilers = null;
            }

            if (L_DefaultOpenTime != null) {
                L_DefaultOpenTime.Dispose ();
                L_DefaultOpenTime = null;
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

            if (TB_NumEFilers != null) {
                TB_NumEFilers.Dispose ();
                TB_NumEFilers = null;
            }

            if (TB_OpenTime != null) {
                TB_OpenTime.Dispose ();
                TB_OpenTime = null;
            }
        }
    }
}