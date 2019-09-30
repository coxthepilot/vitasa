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
    [Register ("VC_Calendar")]
    partial class VC_Calendar
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIActivityIndicatorView AI_Loading { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_NextMonth { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_PreviousMonth { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UICollectionView CV_Grid { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIImageView IMG_AllSitesClosed { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIImageView IMG_FullyStaffed { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIImageView IMG_StaffingNeeded { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIImageView IMG_UserSignedUpBase { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIImageView IMG_UserSignedUpTop { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_MonthYear { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (AI_Loading != null) {
                AI_Loading.Dispose ();
                AI_Loading = null;
            }

            if (B_Back != null) {
                B_Back.Dispose ();
                B_Back = null;
            }

            if (B_NextMonth != null) {
                B_NextMonth.Dispose ();
                B_NextMonth = null;
            }

            if (B_PreviousMonth != null) {
                B_PreviousMonth.Dispose ();
                B_PreviousMonth = null;
            }

            if (CV_Grid != null) {
                CV_Grid.Dispose ();
                CV_Grid = null;
            }

            if (IMG_AllSitesClosed != null) {
                IMG_AllSitesClosed.Dispose ();
                IMG_AllSitesClosed = null;
            }

            if (IMG_FullyStaffed != null) {
                IMG_FullyStaffed.Dispose ();
                IMG_FullyStaffed = null;
            }

            if (IMG_StaffingNeeded != null) {
                IMG_StaffingNeeded.Dispose ();
                IMG_StaffingNeeded = null;
            }

            if (IMG_UserSignedUpBase != null) {
                IMG_UserSignedUpBase.Dispose ();
                IMG_UserSignedUpBase = null;
            }

            if (IMG_UserSignedUpTop != null) {
                IMG_UserSignedUpTop.Dispose ();
                IMG_UserSignedUpTop = null;
            }

            if (L_MonthYear != null) {
                L_MonthYear.Dispose ();
                L_MonthYear = null;
            }
        }
    }
}