// WARNING
//
// This file has been generated automatically by Visual Studio from the outlets and
// actions declared in your storyboard file.
// Manual changes to this file will not be maintained.
//
using Foundation;
using System;
using System.CodeDom.Compiler;

namespace vitasa
{
    [Register ("ViewController")]
    partial class ViewController
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_GettingReady { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_ViewAsList { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_ViewOnMap { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIImageView I_Background { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (B_GettingReady != null) {
                B_GettingReady.Dispose ();
                B_GettingReady = null;
            }

            if (B_ViewAsList != null) {
                B_ViewAsList.Dispose ();
                B_ViewAsList = null;
            }

            if (B_ViewOnMap != null) {
                B_ViewOnMap.Dispose ();
                B_ViewOnMap = null;
            }

            if (I_Background != null) {
                I_Background.Dispose ();
                I_Background = null;
            }
        }
    }
}