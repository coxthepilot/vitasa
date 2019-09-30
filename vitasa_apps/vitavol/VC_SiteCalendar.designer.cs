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
    [Register ("VC_SiteCalendar")]
    partial class VC_SiteCalendar
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_ImDoneHere { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_MonthNext { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_MonthPrev { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UICollectionView CV_Grid { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_MonthYear { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_SiteName { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (B_Back != null) {
                B_Back.Dispose ();
                B_Back = null;
            }

            if (B_ImDoneHere != null) {
                B_ImDoneHere.Dispose ();
                B_ImDoneHere = null;
            }

            if (B_MonthNext != null) {
                B_MonthNext.Dispose ();
                B_MonthNext = null;
            }

            if (B_MonthPrev != null) {
                B_MonthPrev.Dispose ();
                B_MonthPrev = null;
            }

            if (CV_Grid != null) {
                CV_Grid.Dispose ();
                CV_Grid = null;
            }

            if (L_MonthYear != null) {
                L_MonthYear.Dispose ();
                L_MonthYear = null;
            }

            if (L_SiteName != null) {
                L_SiteName.Dispose ();
                L_SiteName = null;
            }
        }
    }
}