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
    [Register ("VC_ExportImport")]
    partial class VC_ExportImport
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIActivityIndicatorView AI_Busy { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_ExportSites { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_ExportUsers { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_ImportSites { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_ImportUsers { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextView TxV_Json { get; set; }

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

            if (B_ExportSites != null) {
                B_ExportSites.Dispose ();
                B_ExportSites = null;
            }

            if (B_ExportUsers != null) {
                B_ExportUsers.Dispose ();
                B_ExportUsers = null;
            }

            if (B_ImportSites != null) {
                B_ImportSites.Dispose ();
                B_ImportSites = null;
            }

            if (B_ImportUsers != null) {
                B_ImportUsers.Dispose ();
                B_ImportUsers = null;
            }

            if (TxV_Json != null) {
                TxV_Json.Dispose ();
                TxV_Json = null;
            }
        }
    }
}