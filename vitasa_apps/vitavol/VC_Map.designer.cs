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
    [Register ("VC_Map")]
    partial class VC_Map
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Logout { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_MakeSuggestion { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_ViewAsList { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        MapKit.MKMapView Map_Sites { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (B_Logout != null) {
                B_Logout.Dispose ();
                B_Logout = null;
            }

            if (B_MakeSuggestion != null) {
                B_MakeSuggestion.Dispose ();
                B_MakeSuggestion = null;
            }

            if (B_ViewAsList != null) {
                B_ViewAsList.Dispose ();
                B_ViewAsList = null;
            }

            if (Map_Sites != null) {
                Map_Sites.Dispose ();
                Map_Sites = null;
            }
        }
    }
}