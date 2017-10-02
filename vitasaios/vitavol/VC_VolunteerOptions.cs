using Foundation;
using System;
using System.Collections.Generic;
using System.Linq;
using UIKit;

using zsquared;

namespace vitavol
{
    public partial class VC_VolunteerOptions : UIViewController
    {
		C_Global Global;
        C_VitaUser LoggedInUser;

		public VC_VolunteerOptions (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
			base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			Global = myAppDelegate.Global;

            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

			B_Back.TouchUpInside += (sender, e) =>
	            PerformSegue("Segue_VolunteerOptionsToLogin", this);

            B_ViewSignUps.TouchUpInside += (sender, e) =>
            {
                Global.ViewCameFrom = E_ViewCameFrom.VolOptions;
                PerformSegue("Segue_VolunteerOptionsToMySignUps", this);
            };

            B_NewSignUp.TouchUpInside += (sender, e) =>
                PerformSegue("Segue_VolunteerOptionsToCalendar", this);

			B_Suggestions.TouchUpInside += (sender, e) =>
				PerformSegue("Segue_VolunteerOptionsToSuggestions", this);

            B_NewSuggestion.TouchUpInside += (sender, e) =>
            {
				// create the new suggestion
				C_Suggestion sug = new C_Suggestion(LoggedInUser.id, C_YMD.Now, false)
				{
					Status = E_SuggestionStatus.Open,
					Subject = "",
					Text = "",
					dirty = true
				};
				Global.SelectedSuggestion = sug;

				Global.ViewCameFrom = E_ViewCameFrom.VolOptions;
				PerformSegue("Segue_VolunteerOptionsToSuggestion", this);
            };

            B_UpdateProfile.TouchUpInside += (sender, e) =>
            {
				Global.ViewCameFrom = E_ViewCameFrom.VolOptions;
				PerformSegue("Segue_VolunteerOptionToUpdateProfile", this);
            };

			// get all workintents for this user
			List<C_WorkItem> OurWorkItems = Global.GetWorkItemsForUser(Global.LoggedInUserId);

			// make sure we only look at the current items (today and beyond)
			C_YMD today = C_YMD.Now;
			var ou = OurWorkItems.Where(wi => wi.Date >= today);
			List<C_WorkItem> OurComingWorkItems = ou.ToList();

            L_SignUps.Text = "You have " + OurComingWorkItems.Count.ToString() + " signups.";

		}

		public override void ViewDidAppear(bool animated)
		{
			// set the standard background color
			View.BackgroundColor = C_Common.StandardBackground;
		}


	}
}