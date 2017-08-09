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
    [Register ("VC_Suggestions")]
    partial class VC_Suggestions
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_Back { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton B_NewSuggestion { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITableView TV_ListOfSuggestions { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (B_Back != null) {
                B_Back.Dispose ();
                B_Back = null;
            }

            if (B_NewSuggestion != null) {
                B_NewSuggestion.Dispose ();
                B_NewSuggestion = null;
            }

            if (TV_ListOfSuggestions != null) {
                TV_ListOfSuggestions.Dispose ();
                TV_ListOfSuggestions = null;
            }
        }
    }
}