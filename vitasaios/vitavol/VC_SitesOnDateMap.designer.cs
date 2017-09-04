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
    [Register ("VC_SitesOnDateMap")]
    partial class VC_SitesOnDateMap
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_ShowAsList { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_Date { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        MapKit.MKMapView Map_Sites { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (B_Back != null) {
                B_Back.Dispose ();
                B_Back = null;
            }

            if (B_ShowAsList != null) {
                B_ShowAsList.Dispose ();
                B_ShowAsList = null;
            }

            if (L_Date != null) {
                L_Date.Dispose ();
                L_Date = null;
            }

            if (Map_Sites != null) {
                Map_Sites.Dispose ();
                Map_Sites = null;
            }
        }
    }
}