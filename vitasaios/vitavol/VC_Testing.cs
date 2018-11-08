using System;
using System.Threading.Tasks;
using UIKit;
using Foundation;
using static zsquared.C_MessageBox;
using EventKit;
using System.Collections.Generic;

using System.Reflection;
using System.IO;

using zsquared;

namespace vitavol
{
    public partial class VC_Testing : UIViewController
    {
        C_Global Global;

        public VC_Testing (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            if (Global == null)
            {
                myAppDelegate.Global = new C_Global();
                Global = myAppDelegate.Global;
            }

            B_Back.TouchUpInside += (sender, e) => 
            {
                // testing...
                UIStoryboard newStoryBoard = UIStoryboard.FromName("Main", null);
                UIViewController viewControllerYouWantToLoad = newStoryBoard.InstantiateViewController("AdminMenu");
                PresentViewController(viewControllerYouWantToLoad, false, null);

                // ...testing

            };
        }
    }
}