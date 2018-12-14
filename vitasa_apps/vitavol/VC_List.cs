using Foundation;
using System;
using UIKit;
using zsquared;

namespace vitavol
{
    public partial class VC_List : UIViewController
    {
        C_SitesTableSource SitesTableDataSource;

        public VC_List (IntPtr handle) : base (handle)
        {
            
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			C_Global passAroundContainer = myAppDelegate.Global;

            // ----------- setup button responders -----

			B_Back.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_ListToMap", this);
            };

            B_MakeSuggestion.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_ListToSuggestions", this);
            };

			SitesTableDataSource = new C_SitesTableSource(passAroundContainer, this, "Segue_ListToDetails");
            TV_List.Source = SitesTableDataSource;
		}
    }
}