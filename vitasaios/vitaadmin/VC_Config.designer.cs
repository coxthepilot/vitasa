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

namespace vitaadmin
{
    [Register ("VC_Config")]
    partial class VC_Config
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIActivityIndicatorView AI_Busy { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_AdminVersion { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_BackendURL { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_ConfigURL { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_Offline { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_SitesJsonURL { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITableView TV_Versions { get; set; }

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

            if (L_AdminVersion != null) {
                L_AdminVersion.Dispose ();
                L_AdminVersion = null;
            }

            if (L_BackendURL != null) {
                L_BackendURL.Dispose ();
                L_BackendURL = null;
            }

            if (L_ConfigURL != null) {
                L_ConfigURL.Dispose ();
                L_ConfigURL = null;
            }

            if (L_Offline != null) {
                L_Offline.Dispose ();
                L_Offline = null;
            }

            if (L_SitesJsonURL != null) {
                L_SitesJsonURL.Dispose ();
                L_SitesJsonURL = null;
            }

            if (TV_Versions != null) {
                TV_Versions.Dispose ();
                TV_Versions = null;
            }
        }
    }
}