using System;
using UIKit;
using System.Threading.Tasks;
using System.Collections.Generic;
using static zsquared.C_MessageBox;
using Xamarin.Forms.Maps;

using zsquared;

namespace vitavol
{
    public partial class VC_AdminSiteLocation : UIViewController
    {
        C_Global Global;
        C_VitaSite SelectedSite;

        C_ItemPicker<string> StatePicker;
        bool Dirty;

        string[] States = { 
            "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", 
            "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", 
            "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", 
            "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", 
            "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY" };

        public VC_AdminSiteLocation (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

            SelectedSite = Global.SelectedSiteTemp;

            B_Back.TouchUpInside += async (sender, e) => 
            {
                SaveLocation();
                PerformSegue("Segue_AdminSiteLocationToAdminSite", this);
            };

            B_Save.TouchUpInside += (sender, e) => 
            {
                SaveLocation();
                PerformSegue("Segue_AdminSiteLocationToAdminSite", this);
            };

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

                            Dirty = true;
                            SelectedSite.Dirty = true;

                            break;
                        }
                    }
                    UIApplication.SharedApplication.InvokeOnMainThread(p);
                });
            };

            TB_Name.AddTarget((sender, e) => { Dirty = true; SelectedSite.Dirty = true; }, UIControlEvent.AllEditingEvents);
            TB_Street.AddTarget((sender, e) => { Dirty = true; SelectedSite.Dirty = true; }, UIControlEvent.AllEditingEvents);
            TB_City.AddTarget((sender, e) => { Dirty = true; SelectedSite.Dirty = true; }, UIControlEvent.AllEditingEvents);
            TB_State.AddTarget((sender, e) => { Dirty = true; SelectedSite.Dirty = true; }, UIControlEvent.AllEditingEvents);
            TB_Zip.AddTarget((sender, e) => { Dirty = true; SelectedSite.Dirty = true; }, UIControlEvent.AllEditingEvents);
            TB_Latitude.AddTarget((sender, e) => { Dirty = true; SelectedSite.Dirty = true; }, UIControlEvent.AllEditingEvents);
            TB_Longitude.AddTarget((sender, e) => { Dirty = true; SelectedSite.Dirty = true; }, UIControlEvent.AllEditingEvents);
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);

            TB_Name.Text = SelectedSite.Name;
            TB_Street.Text = SelectedSite.Street;
            TB_City.Text = SelectedSite.City;
            TB_Zip.Text = SelectedSite.Zip;

            List<string> statesList = new List<string>(States);
            StatePicker = new C_ItemPicker<string>(TB_State, statesList);
            StatePicker.SetSelection(SelectedSite.State);

            TB_Latitude.Text = SelectedSite.Latitude;
            TB_Longitude.Text = SelectedSite.Longitude;

            L_SiteName.Text = SelectedSite.Name;
        }

        private void SaveLocation()
        {
            SelectedSite.Name = TB_Name.Text;
            SelectedSite.Street = TB_Street.Text;
            SelectedSite.City = TB_City.Text;
            SelectedSite.State = StatePicker.Selection;
            SelectedSite.Zip = TB_Zip.Text;

            SelectedSite.Latitude = TB_Latitude.Text;
            SelectedSite.Longitude = TB_Longitude.Text;
        }

        private void EnableUI(bool en) =>
            C_Common.EnableUI(View, en);
    }
}