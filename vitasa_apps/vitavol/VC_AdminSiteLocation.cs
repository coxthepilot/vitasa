using System;
using UIKit;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;
using static zsquared.C_MessageBox;
using Xamarin.Forms.Maps;

using zsquared;

namespace vitavol
{
    public partial class VC_AdminSiteLocation : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        C_ItemPicker<string> StatePicker;

        public VC_AdminSiteLocation (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            B_Back.TouchUpInside += HandleBack;
            B_Save.TouchUpInside += HandleSave;

            UITapGestureRecognizer labelTap = new UITapGestureRecognizer(() => 
            {
                C_Common.DropFirstResponder(View);
                //TB_Name.ResignFirstResponder();
            });

            L_SiteName.UserInteractionEnabled = true;
            L_SiteName.AddGestureRecognizer(labelTap);
            L_SiteLocation.UserInteractionEnabled = true;
            L_SiteLocation.AddGestureRecognizer(labelTap);

            B_GetLatLong.TouchUpInside += (sender, e) => 
            {
                AI_Busy.StartAnimating();
                EnableUI(false);
                string address = TB_Street.Text + "," + TB_City.Text + "," + TB_State.Text + "," + TB_Zip.Text;

                Task.Run(async () => 
                {
                    Xamarin.FormsMaps.Init();
                    Geocoder gc = new Geocoder();
                    IEnumerable<Position> result = await gc.GetPositionsForAddressAsync(address);

                    void p()
                    {
                        AI_Busy.StopAnimating();
                        EnableUI(true);

                        foreach (Position pos in result)
                        {
                            TB_Latitude.Text = pos.Latitude.ToString();
                            TB_Longitude.Text = pos.Longitude.ToString();

                            Global.SelectedSiteTemp.Dirty = true;

                            break;
                        }
                    }
                    UIApplication.SharedApplication.InvokeOnMainThread(p);
                });
            };

            TB_Name.AddTarget((sender, e) => { Global.SelectedSiteTemp.Dirty = true; }, UIControlEvent.AllEditingEvents);
            TB_Street.AddTarget((sender, e) => { Global.SelectedSiteTemp.Dirty = true; }, UIControlEvent.AllEditingEvents);
            TB_City.AddTarget((sender, e) => { Global.SelectedSiteTemp.Dirty = true; }, UIControlEvent.AllEditingEvents);
            TB_State.AddTarget((sender, e) => { Global.SelectedSiteTemp.Dirty = true; }, UIControlEvent.AllEditingEvents);
            TB_Zip.AddTarget((sender, e) => { Global.SelectedSiteTemp.Dirty = true; }, UIControlEvent.AllEditingEvents);
            TB_Latitude.AddTarget((sender, e) => { Global.SelectedSiteTemp.Dirty = true; }, UIControlEvent.AllEditingEvents);
            TB_Longitude.AddTarget((sender, e) => { Global.SelectedSiteTemp.Dirty = true; }, UIControlEvent.AllEditingEvents);
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);

            TB_Name.Text = Global.SelectedSiteTemp.Name;
            TB_Street.Text = Global.SelectedSiteTemp.Street;
            TB_City.Text = Global.SelectedSiteTemp.City;
            TB_Zip.Text = Global.SelectedSiteTemp.Zip;

            List<string> statesList = new List<string>(C_Global.StateNames);
            StatePicker = new C_ItemPicker<string>(TB_State, statesList);
            StatePicker.SetSelection(Global.SelectedSiteTemp.State);

            TB_Latitude.Text = Global.SelectedSiteTemp.Latitude;
            TB_Longitude.Text = Global.SelectedSiteTemp.Longitude;

            L_SiteName.Text = Global.SelectedSiteTemp.Name;
        }

        async void HandleBack(object sender, EventArgs e) 
        {
            if (TB_Name.Text.Length == 0)
            {
                PerformSegue("Segue_AdminSiteLocationToAdminSite", this);
                return;
            }

            if (!ChangesMade())
            {
                PerformSegue("Segue_AdminSiteLocationToAdminSite", this);
                return;
            }

            E_MessageBoxResults mbres1 = await MessageBox(this,
            "Changes",
            "Changes were made. Save?",
            E_MessageBoxButtons.YesNoCancel);

            if (mbres1 == E_MessageBoxResults.Cancel)
                return;

            if (mbres1 != E_MessageBoxResults.Yes)
            {
                PerformSegue("Segue_AdminSiteLocationToAdminSite", this);
                return;
            }

            HandleSave(sender, e);
        }

        async void HandleSave(object sender, EventArgs e)
        {
            if (TB_Name.Text.Length < 4) 
            {
                E_MessageBoxResults mbres1 = await MessageBox(this,
                    "Error",
                    "A site name is required (3 or more characters).",
                    E_MessageBoxButtons.Ok);
                return;
            }

            if (Global.SelectedSiteTemp.id == -1)
            {
                var ou = Global.SiteCache.Where(s => s.Name.ToLower() == TB_Name.Text.ToLower());
                if (ou.Any())
                {
                    E_MessageBoxResults mbres1 = await MessageBox(this,
                        "Error",
                        "A site name with that name already exists. Choose another name.",
                        E_MessageBoxButtons.Ok);
                    return;
                }
            }

            SaveLocation();

            // if this a new site, go ahead and do the create so that the other functions can work (like calendar)
            if (Global.SelectedSiteTemp.id == -1)
            {
                C_IOResult ior = await Global.CreateSite(Global.SelectedSiteTemp, Global.SelectedSiteTemp.ToJson(false), LoggedInUser.Token);

                if (!ior.Success)
                {
                    E_MessageBoxResults mbres1 = await MessageBox(this,
                        "Error",
                        "Unable to save the changes.",
                         E_MessageBoxButtons.Ok);
                    return;
                }
                else
                {
                    Global.SelectedSiteTemp = ior.Site;
                    Global.SelectedSiteSlug = ior.Site.Slug;
                    Global.SelectedSiteName = ior.Site.Name;
                }
            }

            PerformSegue("Segue_AdminSiteLocationToAdminSite", this);
        }

        private void SaveLocation()
        {
            Global.SelectedSiteTemp.Name = TB_Name.Text;
            Global.SelectedSiteTemp.Street = TB_Street.Text;
            Global.SelectedSiteTemp.City = TB_City.Text;
            Global.SelectedSiteTemp.State = StatePicker.Selection;
            Global.SelectedSiteTemp.Zip = TB_Zip.Text;

            Global.SelectedSiteTemp.Latitude = TB_Latitude.Text;
            Global.SelectedSiteTemp.Longitude = TB_Longitude.Text;
        }

        private bool ChangesMade()
        {
            bool c_name = Global.SelectedSiteTemp.Name != TB_Name.Text;
            bool c_street = Global.SelectedSiteTemp.Street != TB_Street.Text;
            bool c_city = Global.SelectedSiteTemp.City != TB_City.Text;
            bool c_state = Global.SelectedSiteTemp.State != TB_State.Text;
            bool c_zip = Global.SelectedSiteTemp.Zip != TB_Zip.Text;
            bool c_lat = Global.SelectedSiteTemp.Latitude != TB_Latitude.Text;
            bool c_long = Global.SelectedSiteTemp.Longitude != TB_Longitude.Text;

            return c_name || c_street || c_city || c_state || c_zip || c_lat || c_long;
        }

        private void EnableUI(bool en) =>
            C_Common.EnableUI(View, en);
    }
}