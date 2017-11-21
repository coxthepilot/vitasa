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
    [Register ("VC_SCSiteVolCalendar")]
    partial class VC_SCSiteVolCalendar
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIActivityIndicatorView AI_Busy { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_MonthNext { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_MonthPrevious { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UICollectionView CV_Grid { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIImageView IMG_Closed { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIImageView IMG_FutureNeeds { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIImageView IMG_FutureNoNeeds { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIImageView IMG_PastApprovals { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIImageView IMG_PastNoApprovals { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_MonthYear { get; set; }

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

            if (B_MonthNext != null) {
                B_MonthNext.Dispose ();
                B_MonthNext = null;
            }

            if (B_MonthPrevious != null) {
                B_MonthPrevious.Dispose ();
                B_MonthPrevious = null;
            }

            if (CV_Grid != null) {
                CV_Grid.Dispose ();
                CV_Grid = null;
            }

            if (IMG_Closed != null) {
                IMG_Closed.Dispose ();
                IMG_Closed = null;
            }

            if (IMG_FutureNeeds != null) {
                IMG_FutureNeeds.Dispose ();
                IMG_FutureNeeds = null;
            }

            if (IMG_FutureNoNeeds != null) {
                IMG_FutureNoNeeds.Dispose ();
                IMG_FutureNoNeeds = null;
            }

            if (IMG_PastApprovals != null) {
                IMG_PastApprovals.Dispose ();
                IMG_PastApprovals = null;
            }

            if (IMG_PastNoApprovals != null) {
                IMG_PastNoApprovals.Dispose ();
                IMG_PastNoApprovals = null;
            }

            if (L_MonthYear != null) {
                L_MonthYear.Dispose ();
                L_MonthYear = null;
            }
        }
    }
}