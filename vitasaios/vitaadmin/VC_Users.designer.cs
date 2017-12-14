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
        UIKit.UIButton B_SaveUserDetails { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_UpdatePassword { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_ViewSignUps { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UISegmentedControl SC_Certification { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UISwitch SW_Administrator { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UISwitch SW_NewUser { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UISwitch SW_SiteCoordinator { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UISwitch SW_Volunteer { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_Email { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_Name { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_Password1 { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_Password2 { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_Phone { get; set; }

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

            if (B_SaveUserDetails != null) {
                B_SaveUserDetails.Dispose ();
                B_SaveUserDetails = null;
            }

            if (B_UpdatePassword != null) {
                B_UpdatePassword.Dispose ();
                B_UpdatePassword = null;
            }

            if (B_ViewSignUps != null) {
                B_ViewSignUps.Dispose ();
                B_ViewSignUps = null;
            }

            if (SC_Certification != null) {
                SC_Certification.Dispose ();
                SC_Certification = null;
            }

            if (SW_Administrator != null) {
                SW_Administrator.Dispose ();
                SW_Administrator = null;
            }

            if (SW_NewUser != null) {
                SW_NewUser.Dispose ();
                SW_NewUser = null;
            }

            if (SW_SiteCoordinator != null) {
                SW_SiteCoordinator.Dispose ();
                SW_SiteCoordinator = null;
            }

            if (SW_Volunteer != null) {
                SW_Volunteer.Dispose ();
                SW_Volunteer = null;
            }

            if (TB_Email != null) {
                TB_Email.Dispose ();
                TB_Email = null;
            }

            if (TB_Name != null) {
                TB_Name.Dispose ();
                TB_Name = null;
            }

            if (TB_Password1 != null) {
                TB_Password1.Dispose ();
                TB_Password1 = null;
            }

            if (TB_Password2 != null) {
                TB_Password2.Dispose ();
                TB_Password2 = null;
            }

            if (TB_Phone != null) {
                TB_Phone.Dispose ();
                TB_Phone = null;
            }

            if (TV_Users != null) {
                TV_Users.Dispose ();
                TV_Users = null;
            }
        }
    }
}