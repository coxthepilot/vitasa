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
    [Register ("VC_Stats")]
    partial class VC_Stats
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIActivityIndicatorView AI_Busy { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Copy { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextView TV_Stats { get; set; }

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

            if (B_Copy != null) {
                B_Copy.Dispose ();
                B_Copy = null;
            }

            if (TV_Stats != null) {
                TV_Stats.Dispose ();
                TV_Stats = null;
            }
        }
    }
}