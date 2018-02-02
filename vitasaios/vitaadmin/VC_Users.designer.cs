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
    [Register ("VC_Users")]
    partial class VC_Users
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIActivityIndicatorView AI_Busy { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_UsersData { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITableView TV_Users { get; set; }

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

            if (L_UsersData != null) {
                L_UsersData.Dispose ();
                L_UsersData = null;
            }

            if (TV_Users != null) {
                TV_Users.Dispose ();
                TV_Users = null;
            }
        }
    }
}