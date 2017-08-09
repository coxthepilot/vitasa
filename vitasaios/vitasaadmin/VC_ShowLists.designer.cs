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

namespace vitasaadmin
{
    [Register ("VC_ShowLists")]
    partial class VC_ShowLists
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_NewSite { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITableView TV_Sites { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITableView TV_Users { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (B_Back != null) {
                B_Back.Dispose ();
                B_Back = null;
            }

            if (B_NewSite != null) {
                B_NewSite.Dispose ();
                B_NewSite = null;
            }

            if (TV_Sites != null) {
                TV_Sites.Dispose ();
                TV_Sites = null;
            }

            if (TV_Users != null) {
                TV_Users.Dispose ();
                TV_Users = null;
            }
        }
    }
}