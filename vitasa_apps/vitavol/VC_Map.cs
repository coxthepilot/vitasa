using Foundation;
using System;
using UIKit;
using MapKit;
using CoreLocation;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Json;
using System.Drawing;

using zsquared;

namespace vitavol
{
    public partial class VC_Map : UIViewController
    {
		C_MapDelegate mapDelegate;

		public VC_Map (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
			if (myAppDelegate.PassAroundContainer == null)
				throw new ApplicationException("The pass around container may not be null");

            // ------------- button handlers -------------

            B_Logout.TouchUpInside += (sender, e) => 
            {
                myAppDelegate.PassAroundContainer.LoginToken = null;
                PerformSegue("Segue_MapToLogin", this);
            };

            B_ViewAsList.TouchUpInside += (sender, e) => 
            {
                PerformSegue("Segue_MapToList", this);
            };

            B_MakeSuggestion.TouchUpInside += (sender, e) => 
            {
                myAppDelegate.PassAroundContainer.DetailsCameFrom = E_CameFrom.Map;
                PerformSegue("Segue_MapToSuggestions", this);
            };

   //         // -------- setup the date picker as a toolbar -------
   //         // we use a regular Picker so that we can limit dates to ones for which we have data
   //         List<C_YMD> datesList = C_CalendarEntry.GetListOfDates(myAppDelegate.PassAroundContainer.Calendar);
   //         datesList.Sort(C_YMD.CompareYMD);
   //         List<string> datesListS = new List<string>();
   //         foreach (C_YMD ymd in datesList)
   //             datesListS.Add(ymd.ToString());
   //         C_PickerModel datePickerModel = new C_PickerModel(datesListS);
   //         UIPickerView datePicker = new UIPickerView();
			//datePickerModel.PickerChanged += (sender, e) =>
			//{
			//	int srow = (int)datePicker.SelectedRowInComponent(0);
			//	TB_Date.Text = datesListS[srow];
			//};
			//datePicker.Model = datePickerModel;
   //         datePicker.ShowSelectionIndicator = true;

   //         UIToolbar toolbar = new UIToolbar();
			//toolbar.BarStyle = UIBarStyle.Black;
			//toolbar.Translucent = true;
			//toolbar.SizeToFit();

			//UIBarButtonItem doneButton = new UIBarButtonItem("Done", UIBarButtonItemStyle.Done, (s, e) =>
			//{
   //             int srow = (int)datePicker.SelectedRowInComponent(0);
   //             TB_Date.Text = datesListS[srow];
   //             TB_Date.ResignFirstResponder();
			//});
			//toolbar.SetItems(new UIBarButtonItem[] { doneButton }, true);

            //TB_Date.InputView = datePicker;
            //TB_Date.InputAccessoryView = toolbar;
            //TB_Date.Text = datesListS[0];

			// --------- set up the map and load our pins ----------------
			Map_Sites.MapType = MapKit.MKMapType.Standard;
			Map_Sites.AutoresizingMask = UIViewAutoresizing.FlexibleDimensions;
			Map_Sites.ShowsUserLocation = true;
			Map_Sites.Bounds = View.Bounds;

			CLLocationManager locationManager = new CLLocationManager();
			locationManager.RequestWhenInUseAuthorization();
			CLLocation loc = locationManager.Location;

			// assume a starting point of center of san antonio
			const double lat = 29.4208763;
			const double lon = -98.4730651;
			var mapCenter = new CLLocationCoordinate2D(lat, lon);
			// use a scaling to see about 30km
			var mapRegion = MKCoordinateRegion.FromDistance(mapCenter, 30000, 30000);
			Map_Sites.CenterCoordinate = mapCenter;
			Map_Sites.Region = mapRegion;

			// todo: get the user's current location and zoom to there on the map

			// check to see if we already have data (possibly passed back to us from another view controller)
			if (myAppDelegate.PassAroundContainer.Sites != null)
			{
				// we have already loaded the sites from the back end service; just use it
				// check the time since loaded; if too long (more than 60 minutes), then reload
				TimeSpan ts = DateTime.Now - myAppDelegate.PassAroundContainer.TimeStampWhenSitesLoaded;
				if (ts.TotalMinutes > 60)
					LoadSitesFromWebService(myAppDelegate.PassAroundContainer);
				else
					// tell the control to repaint now that we have data
					PutPinsOnMap(myAppDelegate.PassAroundContainer);
			}
			else
				LoadSitesFromWebService(myAppDelegate.PassAroundContainer);

		}


		private void LoadSitesFromWebService(C_Global passAroundContainer)
		{
			// the list of sites has NOT been loaded or has expired, therefore we need to load it
			// this is done using a thread since it can take a while (seconds)
			Task.Run(async () =>
			{
				// get the json file of sites and details from the web service
				passAroundContainer.Sites = await C_VitaSite.FetchSitesList();

				passAroundContainer.Sites.Sort(C_VitaSite.CompareSitesByNameAscending);

				passAroundContainer.TimeStampWhenSitesLoaded = DateTime.Now;

				// tell the control to repaint; we have to invoke on main thread
				//   or the control ignores the call
				UIApplication.SharedApplication.InvokeOnMainThread(
				new Action(() =>
				{
					PutPinsOnMap(passAroundContainer);
				}));
			});
		}

		private void PutPinsOnMap(C_Global passAroundContainer)
		{
			mapDelegate = new C_MapDelegate(passAroundContainer, this, "Segue_MapToDetails");
			Map_Sites.Delegate = mapDelegate;

			foreach (C_VitaSite vs in passAroundContainer.Sites)
			{
				double latitude = double.NaN;
				double longitude = double.NaN;
				bool conversionOK = true;
				try
				{
					latitude = Convert.ToDouble(vs.Latitude);
					longitude = Convert.ToDouble(vs.Longitude);
				}
				catch
				{
					conversionOK = false;
				}

				if (conversionOK)
				{
                    MKPointAnnotation pa = new MKPointAnnotation()
                    {
                        Title = vs.Name,
                        Coordinate = new CLLocationCoordinate2D(latitude, longitude)
                    };
                    Map_Sites.AddAnnotations(pa);
				}
			}
		}

	}
}