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
    [Register ("VC_SCSite")]
    partial class VC_SCSite
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIActivityIndicatorView AI_Busy { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Accepting { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_AtLimit { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Closed { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_NearLimit { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_SiteCalendar { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Volunteers { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_ClientStatus { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_SiteName { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (AI_Busy != null) {
                AI_Busy.Dispose ();
                AI_Busy = null;
            }

            if (B_Accepting != null) {
                B_Accepting.Dispose ();
                B_Accepting = null;
            }

            if (B_AtLimit != null) {
                B_AtLimit.Dispose ();
                B_AtLimit = null;
            }

            if (B_Back != null) {
                B_Back.Dispose ();
                B_Back = null;
            }

            if (B_Closed != null) {
                B_Closed.Dispose ();
                B_Closed = null;
            }

            if (B_NearLimit != null) {
                B_NearLimit.Dispose ();
                B_NearLimit = null;
            }

            if (B_SiteCalendar != null) {
                B_SiteCalendar.Dispose ();
                B_SiteCalendar = null;
            }

            if (B_Volunteers != null) {
                B_Volunteers.Dispose ();
                B_Volunteers = null;
            }

            if (L_ClientStatus != null) {
                L_ClientStatus.Dispose ();
                L_ClientStatus = null;
            }

            if (L_SiteName != null) {
                L_SiteName.Dispose ();
                L_SiteName = null;
            }
        }
    }
}