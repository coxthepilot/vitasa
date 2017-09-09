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
        UIKit.UIButton B_DeleteThisSuggestion { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Save { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_Date { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_Status { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_Submitter { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_Title { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextView TxV_Body { get; set; }

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

            if (B_DeleteThisSuggestion != null) {
                B_DeleteThisSuggestion.Dispose ();
                B_DeleteThisSuggestion = null;
            }

            if (B_Save != null) {
                B_Save.Dispose ();
                B_Save = null;
            }

            if (L_Date != null) {
                L_Date.Dispose ();
                L_Date = null;
            }

            if (L_Status != null) {
                L_Status.Dispose ();
                L_Status = null;
            }

            if (L_Submitter != null) {
                L_Submitter.Dispose ();
                L_Submitter = null;
            }

            if (TB_Title != null) {
                TB_Title.Dispose ();
                TB_Title = null;
            }

            if (TxV_Body != null) {
                TxV_Body.Dispose ();
                TxV_Body = null;
            }
        }
    }
}