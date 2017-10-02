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
    [Register ("VC_VolunteerOptions")]
    partial class VC_VolunteerOptions
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_NewSignUp { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_NewSuggestion { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Suggestions { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_UpdateProfile { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_ViewSignUps { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_SignUps { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (B_Back != null) {
                B_Back.Dispose ();
                B_Back = null;
            }

            if (B_NewSignUp != null) {
                B_NewSignUp.Dispose ();
                B_NewSignUp = null;
            }

            if (B_NewSuggestion != null) {
                B_NewSuggestion.Dispose ();
                B_NewSuggestion = null;
            }

            if (B_Suggestions != null) {
                B_Suggestions.Dispose ();
                B_Suggestions = null;
            }

            if (B_UpdateProfile != null) {
                B_UpdateProfile.Dispose ();
                B_UpdateProfile = null;
            }

            if (B_ViewSignUps != null) {
                B_ViewSignUps.Dispose ();
                B_ViewSignUps = null;
            }

            if (L_SignUps != null) {
                L_SignUps.Dispose ();
                L_SignUps = null;
            }
        }
    }
}