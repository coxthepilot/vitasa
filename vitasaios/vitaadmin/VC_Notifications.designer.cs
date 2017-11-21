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
    [Register ("VC_Notifications")]
    partial class VC_Notifications
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITableView TV_Notifications { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (TV_Notifications != null) {
                TV_Notifications.Dispose ();
                TV_Notifications = null;
            }
        }
    }
}