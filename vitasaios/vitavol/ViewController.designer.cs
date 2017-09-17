// WARNING
//
// This file has been generated automatically by Visual Studio from the outlets and
// actions declared in your storyboard file.
// Manual changes to this file will not be maintained.
//
using Foundation;
using System;
using System.CodeDom.Compiler;

namespace vitavol
{
    [Register ("ViewController")]
    partial class ViewController
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIActivityIndicatorView AI_Spinner { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_About { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Login { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Register { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIImageView I_BackgroundImage { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_Email { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_Password { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (AI_Spinner != null) {
                AI_Spinner.Dispose ();
                AI_Spinner = null;
            }

            if (B_About != null) {
                B_About.Dispose ();
                B_About = null;
            }

            if (B_Login != null) {
                B_Login.Dispose ();
                B_Login = null;
            }

            if (B_Register != null) {
                B_Register.Dispose ();
                B_Register = null;
            }

            if (I_BackgroundImage != null) {
                I_BackgroundImage.Dispose ();
                I_BackgroundImage = null;
            }

            if (TB_Email != null) {
                TB_Email.Dispose ();
                TB_Email = null;
            }

            if (TB_Password != null) {
                TB_Password.Dispose ();
                TB_Password = null;
            }
        }
    }
}