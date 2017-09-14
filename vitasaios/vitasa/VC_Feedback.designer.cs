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

namespace vitasa
{
    [Register ("VC_Feedback")]
    partial class VC_Feedback
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIActivityIndicatorView AI_Busy { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Submit { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_Subject { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_Suggestion { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_Text { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_Subject { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextView TxV_Text { get; set; }

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

            if (B_Submit != null) {
                B_Submit.Dispose ();
                B_Submit = null;
            }

            if (L_Subject != null) {
                L_Subject.Dispose ();
                L_Subject = null;
            }

            if (L_Suggestion != null) {
                L_Suggestion.Dispose ();
                L_Suggestion = null;
            }

            if (L_Text != null) {
                L_Text.Dispose ();
                L_Text = null;
            }

            if (TB_Subject != null) {
                TB_Subject.Dispose ();
                TB_Subject = null;
            }

            if (TxV_Text != null) {
                TxV_Text.Dispose ();
                TxV_Text = null;
            }
        }
    }
}