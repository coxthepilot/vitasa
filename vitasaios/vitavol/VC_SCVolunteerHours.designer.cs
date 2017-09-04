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
    [Register ("VC_SCVolunteerHours")]
    partial class VC_SCVolunteerHours
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Save { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_Date { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_Site { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_Volunteer { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_Hours { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (B_Back != null) {
                B_Back.Dispose ();
                B_Back = null;
            }

            if (B_Save != null) {
                B_Save.Dispose ();
                B_Save = null;
            }

            if (L_Date != null) {
                L_Date.Dispose ();
                L_Date = null;
            }

            if (L_Site != null) {
                L_Site.Dispose ();
                L_Site = null;
            }

            if (L_Volunteer != null) {
                L_Volunteer.Dispose ();
                L_Volunteer = null;
            }

            if (TB_Hours != null) {
                TB_Hours.Dispose ();
                TB_Hours = null;
            }
        }
    }
}