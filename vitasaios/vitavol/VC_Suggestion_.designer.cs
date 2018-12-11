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
    [Register ("VC_Suggestion")]
    partial class VC_Suggestion
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIActivityIndicatorView AI_Busy { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Cancel { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Save { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_Title { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_Subject { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextView TxV_Message { get; set; }

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

            if (B_Cancel != null) {
                B_Cancel.Dispose ();
                B_Cancel = null;
            }

            if (B_Save != null) {
                B_Save.Dispose ();
                B_Save = null;
            }

            if (L_Title != null) {
                L_Title.Dispose ();
                L_Title = null;
            }

            if (TB_Subject != null) {
                TB_Subject.Dispose ();
                TB_Subject = null;
            }

            if (TxV_Message != null) {
                TxV_Message.Dispose ();
                TxV_Message = null;
            }
        }
    }
}