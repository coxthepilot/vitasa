using Foundation;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Json;
using UIKit;
using CoreLocation;
using Xamarin.Forms;
//using System.Device;

using zsquared;

namespace vitasa
{
    public partial class VC_SitesList : UIViewController
    {
        C_Global Global;

        public C_SitesTableSourceX SitesTableDataSource;

        C_GetMyLocation GetLocation;

        List<C_VitaSite> OpenSites;

		public VC_SitesList (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

			AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;

			AI_Busy.StartAnimating();

			OpenSites = new List<C_VitaSite>();

			Task.Run(async () =>
			{
				C_YMD date = C_YMD.Now;

                OpenSites = await Global.GetOpenSitesInDateRange(date, date.AddDays(7));
                OpenSites.Sort(C_VitaSite.CompareSitesByNameAscending);

                UIApplication.SharedApplication.InvokeOnMainThread(
				new Action(() =>
				{
					// now that we have the container, create the data source and connect it to our data
					SitesTableDataSource = new C_SitesTableSourceX(this, Global, OpenSites);

					// and let the control know where to get data from
					TV_SitesList.Source = SitesTableDataSource;

					TV_SitesList.ReloadData();

                    AI_Busy.StopAnimating();
				}));
			});

            L_ServicesKey.Text = AppResources.SitesList_L_ServicesKey;

            GetLocation = new C_GetMyLocation();
            GetLocation.LocationObtained += (sender, e) => 
            {
                GetLocation.StopLocationUpdates();

                C_LocationEventArgs lea = (C_LocationEventArgs)e;
                // re-sort the table view based on this location

                foreach(C_VitaSite s in OpenSites)
                {
                    try
                    {
                        double siteLat = Convert.ToDouble(s.Latitude);
                        double siteLong = Convert.ToDouble(s.Longitude);

                        double distance = DistanceTo(lea.Lat, lea.Lng, siteLat, siteLong); // in miles, doesn't matter, could be in furlongs
                        s.DistanceFromUserLocation = distance;
                    }
                    catch
                    {
                        s.DistanceFromUserLocation = double.NaN;
                    }
                }
                OpenSites.Sort(C_VitaSite.CompareSitesByDistance);
                TV_SitesList.ReloadData();
            };
            GetLocation.ObtainMyLocation();
		}

        public override void ViewDidAppear(bool animated)
        {
            View.BackgroundColor = C_Common.StandardBackground;
            TV_SitesList.BackgroundColor = C_Common.StandardBackground;
		}

        /// <summary>
        /// Calculate the distance between to points on the earth surface
        /// </summary>
        /// <returns>distance in miles</returns>
        /// <param name="lat1">Lat1.</param>
        /// <param name="lon1">Lon1.</param>
        /// <param name="lat2">Lat2.</param>
        /// <param name="lon2">Lon2.</param>
		public static double DistanceTo(double lat1, double lon1, double lat2, double lon2)
		{
			double rlat1 = Math.PI * lat1 / 180;
			double rlat2 = Math.PI * lat2 / 180;
			double theta = lon1 - lon2;
			double rtheta = Math.PI * theta / 180;
			double dist = Math.Sin(rlat1) * Math.Sin(rlat2) + Math.Cos(rlat1) * Math.Cos(rlat2) * Math.Cos(rtheta);
			dist = Math.Acos(dist);
			dist = dist * 180 / Math.PI;
			dist = dist * 60 * 1.1515;

			return dist;
		}

		public class C_SitesTableSourceX : UITableViewSource
		{
            readonly C_Global Global;
            readonly List<C_VitaSite> Sites;
            readonly UIViewController ourVC;

            const string CellIdentifier = "VITAClientSitesList";

            public C_SitesTableSourceX(UIViewController vc, C_Global global, List<C_VitaSite> sites)
			{
				ourVC = vc;
                Global = global;
                Sites = sites;
			}

			public override nint RowsInSection(UITableView tableview, nint section)
			{
                return Sites.Count;
			}

			public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
			{
				UITableViewCell cell = tableView.DequeueReusableCell(CellIdentifier);
				//---- if there are no cells to reuse, create a new one ---
				if (cell == null)
					cell = new UITableViewCell(UITableViewCellStyle.Subtitle, CellIdentifier);

                cell.BackgroundColor = C_Common.StandardBackground;

                C_VitaSite site = Sites[indexPath.Row];

                cell.TextLabel.Text = site.Name;
				cell.DetailTextLabel.Text = "(DO, Ex, MFT) " + site.Street + ", " + site.City + ", " + site.State + " " + site.Zip;

                switch (site.Status)
                {
                    case E_SiteStatus.Accepting:
                        cell.ImageView.Image = UIImage.FromBundle("greenstatus.jpg");
                        break;
                    case E_SiteStatus.NearLimit:
                        cell.ImageView.Image = UIImage.FromBundle("yellowstatus.jpg");
                        break;
                    case E_SiteStatus.NotAccepting:
                        cell.ImageView.Image = UIImage.FromBundle("redstatus.jpg");
                        break;
                    case E_SiteStatus.Closed:
                        cell.ImageView.Image = UIImage.FromBundle("blackstatus.jpg");
                        break;
                }

                return cell;
			}

			public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
			{
				Global.ViewCameFrom = E_ViewCameFrom.List;
                Global.SelectedSiteSlug = Sites[indexPath.Row].Slug;

				ourVC.PerformSegue("Segue_ListToDetails", ourVC);
			}
		}

		public class C_LocationEventArgs : EventArgs, I_LocationEventArgs
		{
			public double Lat { get; set; }
			public double Lng { get; set; }
		}

		public class C_GetMyLocation : I_Location
		{
			public event EventHandler<I_LocationEventArgs> LocationObtained;
            bool LocationFound;

            CLLocationManager locationManager;

            public C_GetMyLocation()
            {
                LocationFound = false;
            }

			public void ObtainMyLocation()
			{
                locationManager = new CLLocationManager()
                {
                    DesiredAccuracy = CLLocation.AccuracyBest,
                    DistanceFilter = CLLocationDistance.FilterNone
                };

                locationManager.LocationsUpdated += (object sender, CLLocationsUpdatedEventArgs e) =>
				{
					CLLocation[] locations = e.Locations;

                    C_LocationEventArgs args = new C_LocationEventArgs()
                    {
                        Lat = locations[locations.Length - 1].Coordinate.Latitude,
                        Lng = locations[locations.Length - 1].Coordinate.Longitude
                    };
                    if (!LocationFound)
                    {
                        LocationObtained?.Invoke(this, args);
                        LocationFound = true;
                    }
				};

				locationManager.AuthorizationChanged += (object sender, CLAuthorizationChangedEventArgs e) =>
				{
					if (e.Status == CLAuthorizationStatus.AuthorizedWhenInUse)
					{
						locationManager.StartUpdatingLocation();
					}
				};


				locationManager.RequestWhenInUseAuthorization();
			}

            public void StopLocationUpdates()
            {
                locationManager.StopUpdatingLocation();
            }
		}

		public interface I_Location
		{
			void ObtainMyLocation();
			event EventHandler<I_LocationEventArgs> LocationObtained;
		}

		public interface I_LocationEventArgs
		{
			double Lat { get; set; }
			double Lng { get; set; }
		}

	}
}