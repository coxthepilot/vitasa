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
    [Register ("VC_GridTest")]
    partial class VC_GridTest
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UICollectionView CV_Grid { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel L_CellTouched { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (CV_Grid != null) {
                CV_Grid.Dispose ();
                CV_Grid = null;
            }

            if (L_CellTouched != null) {
                L_CellTouched.Dispose ();
                L_CellTouched = null;
            }
        }
    }
}