using Foundation;
using System;
using System.Collections.Generic;
using UIKit;

using zsquared;

namespace vitasaadmin
{
    public partial class VC_ShowSiteDetails : UIViewController
    {
		C_Global passAroundContainer;
        List<string> SiteStateChoices;
        List<string> SiteTypeChoices;
        List<string> SiteCoordinatorChoices;

		public VC_ShowSiteDetails (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			passAroundContainer = myAppDelegate.PassAroundContiner;

			B_Back.TouchUpInside += (sender, e) => 
            {
                // todo: make sure any changes are saved
                PerformSegue("Segue_ShowSiteDetailsToLists", this);
            };

            // setup the choices for the SiteType picker
            SiteTypeChoices = new List<string>();
            SiteTypeChoices.Add("Permanent");
            SiteTypeChoices.Add("Mobile");
            SiteTypeChoices.Add("Seasonal");
            C_PickerModel SiteTypeModel = new C_PickerModel(SiteTypeChoices);
            Picker_SiteType.Model = SiteTypeModel;
            Picker_SiteType.Select(0, 0, true);

            SiteStateChoices = new List<string>() { 
                "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", 
                "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", 
                "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", 
                "NY", "NM", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", 
                "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"};
			int stateix = SiteStateChoices.IndexOf(passAroundContainer.SelectedSite.State);
            C_PickerModel SiteStateModel = new C_PickerModel(SiteStateChoices);
            Picker_State.Model = SiteStateModel;
            Picker_State.ShowSelectionIndicator = true;
            Picker_State.Select(stateix, 0, true);

            SiteCoordinatorChoices = new List<string>();
            foreach(C_VitaUser u in passAroundContainer.Users)
            {
                if (u.HasSiteCoordinator)
                    SiteCoordinatorChoices.Add(u.email);  
            }
            C_PickerModel SiteCoordinatorModel = new C_PickerModel(SiteCoordinatorChoices);
            Picker_SiteCoordinator.Model = SiteCoordinatorModel;
            Picker_SiteCoordinator.Select(0, 0, true);

            TB_SiteName.Text = passAroundContainer.SelectedSite.Name;
            L_SiteSlug.Text = passAroundContainer.SelectedSite.Slug;
            L_CurrentSiteStatus.Text = "Site is currently " + passAroundContainer.SelectedSite.Status.ToString();
            TB_Street.Text = passAroundContainer.SelectedSite.Street;
            TB_City.Text = passAroundContainer.SelectedSite.City;
            TB_Zip.Text = passAroundContainer.SelectedSite.Zip;
            TB_Latitude.Text = passAroundContainer.SelectedSite.Latitude;
            TB_Longitude.Text = passAroundContainer.SelectedSite.Longitude;
            TB_PlaceID.Text = passAroundContainer.SelectedSite.PlaceID;
            TB_Hours.Text = passAroundContainer.SelectedSite.Hours;

            I_Accepting.Image = UIImage.FromBundle("greenstatus.jpg");
            I_NearLimit.Image = UIImage.FromBundle("yellowstatus.jpg");
            I_NotAccepting.Image = UIImage.FromBundle("redstatus.jpg");
            I_Closed.Image = UIImage.FromBundle("blackstatus.jpg");
		}

    }
}