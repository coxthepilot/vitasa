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
    [Register ("VC_ShowSiteDetails")]
    partial class VC_ShowSiteDetails
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Save { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIImageView I_Accepting { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIImageView I_Closed { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIImageView I_NearLimit { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIImageView I_NotAccepting { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_CurrentSiteStatus { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_SiteSlug { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIPickerView Picker_SiteCoordinator { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIPickerView Picker_SiteType { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIPickerView Picker_State { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_City { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_Hours { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_Latitude { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_Longitude { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_PlaceID { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_SiteName { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_Street { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_Zip { get; set; }

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

            if (I_Accepting != null) {
                I_Accepting.Dispose ();
                I_Accepting = null;
            }

            if (I_Closed != null) {
                I_Closed.Dispose ();
                I_Closed = null;
            }

            if (I_NearLimit != null) {
                I_NearLimit.Dispose ();
                I_NearLimit = null;
            }

            if (I_NotAccepting != null) {
                I_NotAccepting.Dispose ();
                I_NotAccepting = null;
            }

            if (L_CurrentSiteStatus != null) {
                L_CurrentSiteStatus.Dispose ();
                L_CurrentSiteStatus = null;
            }

            if (L_SiteSlug != null) {
                L_SiteSlug.Dispose ();
                L_SiteSlug = null;
            }

            if (Picker_SiteCoordinator != null) {
                Picker_SiteCoordinator.Dispose ();
                Picker_SiteCoordinator = null;
            }

            if (Picker_SiteType != null) {
                Picker_SiteType.Dispose ();
                Picker_SiteType = null;
            }

            if (Picker_State != null) {
                Picker_State.Dispose ();
                Picker_State = null;
            }

            if (TB_City != null) {
                TB_City.Dispose ();
                TB_City = null;
            }

            if (TB_Hours != null) {
                TB_Hours.Dispose ();
                TB_Hours = null;
            }

            if (TB_Latitude != null) {
                TB_Latitude.Dispose ();
                TB_Latitude = null;
            }

            if (TB_Longitude != null) {
                TB_Longitude.Dispose ();
                TB_Longitude = null;
            }

            if (TB_PlaceID != null) {
                TB_PlaceID.Dispose ();
                TB_PlaceID = null;
            }

            if (TB_SiteName != null) {
                TB_SiteName.Dispose ();
                TB_SiteName = null;
            }

            if (TB_Street != null) {
                TB_Street.Dispose ();
                TB_Street = null;
            }

            if (TB_Zip != null) {
                TB_Zip.Dispose ();
                TB_Zip = null;
            }
        }
    }
}