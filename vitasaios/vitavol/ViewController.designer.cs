// WARNING
//
// This file has been generated automatically by Visual Studio from the outlets and
// actions declared in your storyboard file.
// Manual changes to this file will not be maintained.
//
using Foundation;
using System;
using System.CodeDom.Compiler;

namespace vitavol
{
    [Register ("ViewController")]
    partial class ViewController
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIActivityIndicatorView AI_Busy { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_About { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_BeforeYouGo { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_FindASiteNearYou { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_StaffLogin { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIImageView I_BackgroundImage { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (AI_Busy != null) {
                AI_Busy.Dispose ();
                AI_Busy = null;
            }

            if (B_About != null) {
                B_About.Dispose ();
                B_About = null;
            }

            if (B_BeforeYouGo != null) {
                B_BeforeYouGo.Dispose ();
                B_BeforeYouGo = null;
            }

            if (B_FindASiteNearYou != null) {
                B_FindASiteNearYou.Dispose ();
                B_FindASiteNearYou = null;
            }

            if (B_StaffLogin != null) {
                B_StaffLogin.Dispose ();
                B_StaffLogin = null;
            }

            if (I_BackgroundImage != null) {
                I_BackgroundImage.Dispose ();
                I_BackgroundImage = null;
            }
        }
    }
}