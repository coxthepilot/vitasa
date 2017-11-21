
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using Android.Gms.Maps;
using Android.Gms.Maps.Model;

using zsquared;


using Android.Gms.Location;
using Android.Gms.Common;
using Android.Gms.Common.Apis;
using Android.Util;
using Android.Locations;

namespace a_vitavol
{
    [Activity(Label = "VITA: Select a Site")]
    public class A_VolPickSite : Activity
    {
		C_Global Global;

		TextView L_Date;
        ListView LV_Sites;
        Button B_ViewOnMap;

		ProgressDialog AI_Busy;

        List<C_VitaSite> OpenSitesThatNeedHelp;

		protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

			MyAppDelegate g = (MyAppDelegate)Application;
			if (g.Global == null)
				g.Global = new C_Global();
			Global = g.Global;

            SetContentView(Resource.Layout.VolPickSite);

            L_Date = FindViewById<TextView>(Resource.Id.L_VolPickSite_Date);
            LV_Sites = FindViewById<ListView>(Resource.Id.LV_VolPickSite_Sites);

            L_Date.Text = Global.SelectedDate.ToString("mmm dd,yyyy");

			AI_Busy = new ProgressDialog(this);
			AI_Busy.SetMessage("Please wait...");
			AI_Busy.SetCancelable(false);
			AI_Busy.SetProgressStyle(ProgressDialogStyle.Spinner);

            B_ViewOnMap = FindViewById<Button>(Resource.Id.B_ViewSitesOnMap);
            B_ViewOnMap.Enabled = IsGooglePlayServicesInstalled();

            B_ViewOnMap.Click += (sender, e) => 
            {
                StartActivity(new Intent(this, typeof(A_VolPickSiteMap)));

			};

			LV_Sites.ItemClick += (sender, e) =>
			{
				//// figure out if the user is already signed up for this date
				//List<C_WorkItem> LoggedInUserWorkItems = Global.GetWorkItemsForUser(Global.LoggedInUserId);
				//var ou = LoggedInUserWorkItems.Where(wi => wi.Date == Global.SelectedDate);

				//if (!ou.Any())
				//{
				Global.SelectedSiteSlug = OpenSitesThatNeedHelp[e.Position].Slug;
				Global.SignUpsOnSiteOnDate = Global.GetSignUpsForSiteOnDate(Global.SelectedDate, Global.SelectedSiteSlug);
				Global.ViewCameFrom = E_ViewCameFrom.List;

				StartActivity(new Intent(this, typeof(A_ViewSignUpNew)));
				//}
			};

			EnableUI(false);
			AI_Busy.Show();

			Task.Run(async () =>
			{
				// build a list of all open sites on this date
				List<C_VitaSite> openSitesOnDate = await Global.GetOpenSitesOnDate(Global.SelectedDate);

				// then filter to those sites that need help on this date
				OpenSitesThatNeedHelp = new List<C_VitaSite>();
				foreach (C_VitaSite site in openSitesOnDate)
				{
					int numRequired = site.GetNumEFilersRequiredOnDateAllShifts(Global.SelectedDate);


					List<C_SignUp> workItemsForSiteOnDate = Global.GetSignUpsForSiteOnDate(Global.SelectedDate, site.Slug);

					if (numRequired > workItemsForSiteOnDate.Count)
						OpenSitesThatNeedHelp.Add(site);
				}

				List<string> openSitesThatNeedHelpSlugs = new List<string>();
				foreach (C_VitaSite site in OpenSitesThatNeedHelp)
					openSitesThatNeedHelpSlugs.Add(site.Slug);

				Global.OpenSitesThatNeedHelp = openSitesThatNeedHelpSlugs;

				RunOnUiThread(() =>
                {
					EnableUI(true);
					AI_Busy.Cancel();

                    LV_Sites.Adapter = new SitesAdapter(this, OpenSitesThatNeedHelp, Global);
				});
			});
		}

		public override void OnBackPressed()
		{
			StartActivity(new Intent(this, typeof(A_VolCalendar)));
		}

		private void EnableUI(bool en)
        {
            LV_Sites.Enabled = en;
        }

		bool IsGooglePlayServicesInstalled()
		{
			int queryResult = GoogleApiAvailability.Instance.IsGooglePlayServicesAvailable(this);
			if (queryResult == ConnectionResult.Success)
			{
				//Log.Info("MainActivity", "Google Play Services is installed on this device.");
				return true;
			}

			if (GoogleApiAvailability.Instance.IsUserResolvableError(queryResult))
			{
				//string errorString = GoogleApiAvailability.Instance.GetErrorString(queryResult);
				//Log.Error("ManActivity", "There is a problem with Google Play Services on this device: {0} - {1}", queryResult, errorString);

				// Show error dialog to let user debug google play services
			}
			return false;
		}

		public class SitesAdapter : BaseAdapter<C_VitaSite>
		{
            readonly List<C_VitaSite> items;
			readonly Activity context;
            readonly C_Global Global;

            public SitesAdapter(Activity context, List<C_VitaSite> items, C_Global global) : base()
			{
				this.context = context;
				this.items = items;
                this.Global = global;
			}

			public override long GetItemId(int position)
			{
				return position;
			}

			public override C_VitaSite this[int position]
			{
				get { return items[position]; }
			}

			public override int Count
			{
				get { return items.Count; }
			}

			public override View GetView(int position, View convertView, ViewGroup parent)
			{
                C_VitaSite site = items[position];


				// figure out if the user is already signed up for this date at this site
				// get all of this users work items
				List<C_SignUp> LoggedInUserWorkItems = Global.GetSignUpsForUser(Global.LoggedInUserId);
				// filter for this date
				var ou = LoggedInUserWorkItems.Where(wi => wi.Date == Global.SelectedDate);
				List<C_SignUp> LoggedInUserWorksItemsOnSelectedDate = ou.ToList();
				// filter for this site
				var ou1 = LoggedInUserWorksItemsOnSelectedDate.Where(wi => wi.SiteSlug == site.Slug);
				// if any remain, then the user is signed up for this site on this date
				bool LoggedInUserWorkingThisDateThisSite = ou1.Any();

				int numEF = site.GetNumEFilersRequiredOnDateAllShifts(Global.SelectedDate);

                string t2;
				if (LoggedInUserWorkingThisDateThisSite)
					t2 = "Already signed up at this site.";
				else
					t2 = numEF.ToString() + " needed.";

				View view = convertView;
				if (view == null) // no view to re-use, create new
					view = context.LayoutInflater.Inflate(Resource.Layout.SuggestionCell, null);

                view.FindViewById<TextView>(Resource.Id.Text1).Text = site.Name;
                view.FindViewById<TextView>(Resource.Id.Text2).Text = t2;

				return view;
			}
		}

	}
}
