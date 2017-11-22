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

namespace vitaadmin
{
    [Register ("VC_ShowNotifications")]
    partial class VC_ShowNotifications
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIActivityIndicatorView AI_Busy { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Save { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Send { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UISegmentedControl SC_Audience { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_Created { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_Sent { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_Updated { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextView TV_Message { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITableView TV_Notifications { get; set; }

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

            if (B_Save != null) {
                B_Save.Dispose ();
                B_Save = null;
            }

            if (B_Send != null) {
                B_Send.Dispose ();
                B_Send = null;
            }

            if (SC_Audience != null) {
                SC_Audience.Dispose ();
                SC_Audience = null;
            }

            if (TB_Created != null) {
                TB_Created.Dispose ();
                TB_Created = null;
            }

            if (TB_Sent != null) {
                TB_Sent.Dispose ();
                TB_Sent = null;
            }

            if (TB_Updated != null) {
                TB_Updated.Dispose ();
                TB_Updated = null;
            }

            if (TV_Message != null) {
                TV_Message.Dispose ();
                TV_Message = null;
            }

            if (TV_Notifications != null) {
                TV_Notifications.Dispose ();
                TV_Notifications = null;
            }
        }
    }
}