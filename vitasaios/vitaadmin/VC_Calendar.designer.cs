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
    [Register ("VC_Calendar")]
    partial class VC_Calendar
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIActivityIndicatorView AI_Busy { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_ApplyPattern { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_ExcNewShift { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_ExcSave { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_NewException { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_ExcSite { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UISwitch SW_ExcIsOpen { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_DateForCalendarEntry { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_DayOfWeek { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_ExcAdvShift { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_ExcBasicShift { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_ExcCloseShift { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_ExcDate { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField TB_ExcOpenShift { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITableView TV_Exceptions { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITableView TV_ExcShifts { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (AI_Busy != null) {
                AI_Busy.Dispose ();
                AI_Busy = null;
            }

            if (B_ApplyPattern != null) {
                B_ApplyPattern.Dispose ();
                B_ApplyPattern = null;
            }

            if (B_Back != null) {
                B_Back.Dispose ();
                B_Back = null;
            }

            if (B_ExcNewShift != null) {
                B_ExcNewShift.Dispose ();
                B_ExcNewShift = null;
            }

            if (B_ExcSave != null) {
                B_ExcSave.Dispose ();
                B_ExcSave = null;
            }

            if (B_NewException != null) {
                B_NewException.Dispose ();
                B_NewException = null;
            }

            if (L_ExcSite != null) {
                L_ExcSite.Dispose ();
                L_ExcSite = null;
            }

            if (SW_ExcIsOpen != null) {
                SW_ExcIsOpen.Dispose ();
                SW_ExcIsOpen = null;
            }

            if (TB_DateForCalendarEntry != null) {
                TB_DateForCalendarEntry.Dispose ();
                TB_DateForCalendarEntry = null;
            }

            if (TB_DayOfWeek != null) {
                TB_DayOfWeek.Dispose ();
                TB_DayOfWeek = null;
            }

            if (TB_ExcAdvShift != null) {
                TB_ExcAdvShift.Dispose ();
                TB_ExcAdvShift = null;
            }

            if (TB_ExcBasicShift != null) {
                TB_ExcBasicShift.Dispose ();
                TB_ExcBasicShift = null;
            }

            if (TB_ExcCloseShift != null) {
                TB_ExcCloseShift.Dispose ();
                TB_ExcCloseShift = null;
            }

            if (TB_ExcDate != null) {
                TB_ExcDate.Dispose ();
                TB_ExcDate = null;
            }

            if (TB_ExcOpenShift != null) {
                TB_ExcOpenShift.Dispose ();
                TB_ExcOpenShift = null;
            }

            if (TV_Exceptions != null) {
                TV_Exceptions.Dispose ();
                TV_Exceptions = null;
            }

            if (TV_ExcShifts != null) {
                TV_ExcShifts.Dispose ();
                TV_ExcShifts = null;
            }
        }
    }
}