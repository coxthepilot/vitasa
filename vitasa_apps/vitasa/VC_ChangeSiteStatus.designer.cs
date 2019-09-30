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

namespace vitasa
{
    [Register ("VC_ChangeSiteStatus")]
    partial class VC_ChangeSiteStatus
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_MakeSiteClosed { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_MakeSiteNearingLimit { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_MakeSiteNotAccepting { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_MakeSiteOpen { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_CurrentSite { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_SiteCurrentStatus { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_VerifyingAuthorization { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (B_Back != null) {
                B_Back.Dispose ();
                B_Back = null;
            }

            if (B_MakeSiteClosed != null) {
                B_MakeSiteClosed.Dispose ();
                B_MakeSiteClosed = null;
            }

            if (B_MakeSiteNearingLimit != null) {
                B_MakeSiteNearingLimit.Dispose ();
                B_MakeSiteNearingLimit = null;
            }

            if (B_MakeSiteNotAccepting != null) {
                B_MakeSiteNotAccepting.Dispose ();
                B_MakeSiteNotAccepting = null;
            }

            if (B_MakeSiteOpen != null) {
                B_MakeSiteOpen.Dispose ();
                B_MakeSiteOpen = null;
            }

            if (L_CurrentSite != null) {
                L_CurrentSite.Dispose ();
                L_CurrentSite = null;
            }

            if (L_SiteCurrentStatus != null) {
                L_SiteCurrentStatus.Dispose ();
                L_SiteCurrentStatus = null;
            }

            if (L_VerifyingAuthorization != null) {
                L_VerifyingAuthorization.Dispose ();
                L_VerifyingAuthorization = null;
            }
        }
    }
}