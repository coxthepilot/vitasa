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
    [Register ("VC_About")]
    partial class VC_About
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextView TB_About { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIWebView WV_About { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (B_Back != null) {
                B_Back.Dispose ();
                B_Back = null;
            }

            if (TB_About != null) {
                TB_About.Dispose ();
                TB_About = null;
            }

            if (WV_About != null) {
                WV_About.Dispose ();
                WV_About = null;
            }
        }
    }
}