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
    [Register ("VC_Register")]
    partial class VC_Register
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Submit { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UISwitch SW_Advanced { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UISwitch SW_Basic { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_Email { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_Name { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_Password { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_Phone { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_VerifyPassword { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (B_Back != null) {
                B_Back.Dispose ();
                B_Back = null;
            }

            if (B_Submit != null) {
                B_Submit.Dispose ();
                B_Submit = null;
            }

            if (SW_Advanced != null) {
                SW_Advanced.Dispose ();
                SW_Advanced = null;
            }

            if (SW_Basic != null) {
                SW_Basic.Dispose ();
                SW_Basic = null;
            }

            if (TB_Email != null) {
                TB_Email.Dispose ();
                TB_Email = null;
            }

            if (TB_Name != null) {
                TB_Name.Dispose ();
                TB_Name = null;
            }

            if (TB_Password != null) {
                TB_Password.Dispose ();
                TB_Password = null;
            }

            if (TB_Phone != null) {
                TB_Phone.Dispose ();
                TB_Phone = null;
            }

            if (TB_VerifyPassword != null) {
                TB_VerifyPassword.Dispose ();
                TB_VerifyPassword = null;
            }
        }
    }
}