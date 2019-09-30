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
    [Register ("VC_Messages")]
    partial class VC_Messages
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Load { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Save { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_Message { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_Slug { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextView TxV_English { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextView TxV_Spanish { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIWebView WV_English { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIWebView WV_Spanish { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (B_Back != null) {
                B_Back.Dispose ();
                B_Back = null;
            }

            if (B_Load != null) {
                B_Load.Dispose ();
                B_Load = null;
            }

            if (B_Save != null) {
                B_Save.Dispose ();
                B_Save = null;
            }

            if (TB_Message != null) {
                TB_Message.Dispose ();
                TB_Message = null;
            }

            if (TB_Slug != null) {
                TB_Slug.Dispose ();
                TB_Slug = null;
            }

            if (TxV_English != null) {
                TxV_English.Dispose ();
                TxV_English = null;
            }

            if (TxV_Spanish != null) {
                TxV_Spanish.Dispose ();
                TxV_Spanish = null;
            }

            if (WV_English != null) {
                WV_English.Dispose ();
                WV_English = null;
            }

            if (WV_Spanish != null) {
                WV_Spanish.Dispose ();
                WV_Spanish = null;
            }
        }
    }
}