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
    [Register ("VC_SignUp")]
    partial class VC_SignUp
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIActivityIndicatorView AI_Busy { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_GetDirections { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_SignMeUp { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_Address { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_CityStateZip { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_DateAndTime { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_Site { get; set; }

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

            if (B_GetDirections != null) {
                B_GetDirections.Dispose ();
                B_GetDirections = null;
            }

            if (B_SignMeUp != null) {
                B_SignMeUp.Dispose ();
                B_SignMeUp = null;
            }

            if (L_Address != null) {
                L_Address.Dispose ();
                L_Address = null;
            }

            if (L_CityStateZip != null) {
                L_CityStateZip.Dispose ();
                L_CityStateZip = null;
            }

            if (L_DateAndTime != null) {
                L_DateAndTime.Dispose ();
                L_DateAndTime = null;
            }

            if (L_Site != null) {
                L_Site.Dispose ();
                L_Site = null;
            }

            if (TV_Users != null) {
                TV_Users.Dispose ();
                TV_Users = null;
            }
        }
    }
}