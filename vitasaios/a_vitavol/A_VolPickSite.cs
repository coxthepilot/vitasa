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
		C_VitaUser LoggedInUser;
		C_YMD SelectedDate;

		TextView L_Date;
        ListView LV_Sites;
        Button B_ViewOnMap;

		ProgressDialog AI_Busy;

        List<C_VitaSite> SitesThatNeedHelp;

		protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
			if (g.Global == null)
				g.Global = new C_Global();
			Global = g.Global;

			SelectedDate = Global.SelectedDate;
			LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
#if DEBUG
			if ((SelectedDate == null)
				|| (LoggedInUser == null)
			   )
				throw new ApplicationException("missing values");
#endif
			SetContentView(Resource.Layout.VolPickSite);

            L_Date = FindViewById<TextView>(Resource.Id.L_VolPickSite_Date);
            LV_Sites = FindViewById<ListView>(Resource.Id.LV_VolPickSite_Sites);

            L_Date.Text = SelectedDate.ToString("mmm dd,yyyy");

			AI_Busy = new ProgressDialog(this);
			AI_Busy.SetMessage("Please wait...");
			AI_Busy.SetCancelable(false);
			AI_Busy.SetProgressStyle(ProgressDialogStyle.Spinner);

            B_ViewOnMap = FindViewById<Button>(Resource.Id.B_ViewSitesOnMap);
            B_ViewOnMap.Enabled = IsGooglePlayServicesInstalled();

            B_ViewOnMap.Click += (sender, e) => 
                StartActivity(new Intent(this, typeof(A_VolPickSiteMap)));

			LV_Sites.ItemClick += (sender, e) =>
			{
                C_VitaSite site = SitesThatNeedHelp[e.Position];
				Global.SelectedSiteSlug = site.Slug;

				int numNeeded = 0;
				int numHave = 0;
				C_SiteSchedule ss = Global.GetSiteScheduleForDay(Global.SelectedDate, site.Slug);
				foreach (C_SiteScheduleShift sss in ss.Shifts)
				{
                    bool userIsAdvanced = LoggedInUser.Certification == E_Certification.Advanced;

                    numNeeded += sss.eFilersNeededBasic;
                    if (userIsAdvanced)
                        numNeeded += sss.eFilersNeededAdvanced;

                    numHave += sss.eFilersSignedUpBasic;
                    if (userIsAdvanced)
                        numHave += sss.eFilersSignedUpAdvanced;

                    //numNeeded += userIsBasic ? sss.eFilersNeededBasic : sss.eFilersNeededAdvanced;
                    //numHave += userIsBasic ? sss.eFilersSignedUpBasic : sss.eFilersSignedUpAdvanced;
				}
				int numEF = numNeeded - numHave;

				if (numEF == 0)
					return;

				Global.SelectedSignUp = new C_SignUp(site.Slug, Global.SelectedDate, Global.LoggedInUserId, 0)
				{
					id = -1,
					SiteName = site.Name,
					ShiftId = site.id
				};

   				Global.ViewCameFrom = E_ViewCameFrom.List;

                StartActivity(new Intent(this, typeof(A_VolPickShift)));
			};

			EnableUI(false);
			AI_Busy.Show();

			Task.Run(async () =>
			{
				// Since we got here after coming through the calendar which loaded the siteschedules into
				//  the siteschedulecache, we can use that to see which sites are open on this date.
				List<C_SiteSchedule> sitesOpen2 = await Global.GetSitesScheduleCached(SelectedDate.Year, SelectedDate.Month);
				var ou = sitesOpen2.Where(ss => (ss.Date == SelectedDate) && (ss.SiteIsOpen));
				List<C_SiteSchedule> sitesOpen1 = ou.ToList();

				List<C_SiteSchedule> sitesOpenAndNeedOurUserHelp = new List<C_SiteSchedule>();
				foreach (C_SiteSchedule ss in sitesOpen1)
				{
					bool needsHelp = false;

					foreach (C_SiteScheduleShift sss in ss.Shifts)
					{
                        bool userIsAdvanced = LoggedInUser.Certification == E_Certification.Advanced;

                        // 12-jan-2018: changed to allow advanced to signup for basic
                        int numNeeded = 0;
                        int numHave = 0;
                        numNeeded += sss.eFilersNeededBasic;
                        if (userIsAdvanced)
                            numNeeded += sss.eFilersNeededAdvanced;

                        numHave += sss.eFilersSignedUpBasic;
                        if (userIsAdvanced)
                            numHave += sss.eFilersSignedUpAdvanced;
                        
                        needsHelp |= numHave < numNeeded;
					}

					if (needsHelp)
						sitesOpenAndNeedOurUserHelp.Add(ss);
				}

				List<string> openSitesThatNeedHelpSlugs = new List<string>();
				foreach (C_SiteSchedule ws in sitesOpenAndNeedOurUserHelp)
				{
					if (!openSitesThatNeedHelpSlugs.Contains(ws.SiteSlug))
						openSitesThatNeedHelpSlugs.Add(ws.SiteSlug);
				}

				Global.OpenSitesThatNeedHelp = openSitesThatNeedHelpSlugs; // we save this so Maps doesn't have to recompute

                SitesThatNeedHelp = new List<C_VitaSite>();
				foreach (C_SiteSchedule ss in sitesOpenAndNeedOurUserHelp)
				{
					C_VitaSite site = await Global.GetSiteFromCache(ss.SiteSlug);
					SitesThatNeedHelp.Add(site);
				}

				RunOnUiThread(() =>
                {
					EnableUI(true);
					AI_Busy.Cancel();

                    LV_Sites.Adapter = new SitesAdapter(this, SitesThatNeedHelp, Global, LoggedInUser);
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
            readonly List<C_VitaSite> Sites;
			readonly Activity context;
            readonly C_Global Global;
            readonly C_VitaUser User;

            public SitesAdapter(Activity context, List<C_VitaSite> sites, C_Global global, C_VitaUser user)
			{
				this.context = context;
				this.Sites = sites;
                this.Global = global;
                this.User = user;
			}

			public override long GetItemId(int position)
			{
				return position;
			}

			public override C_VitaSite this[int position]
			{
				get { return Sites[position]; }
			}

			public override int Count
			{
				get { return Sites.Count; }
			}

			public override View GetView(int position, View convertView, ViewGroup parent)
			{
				View view = convertView;
				if (view == null) // no view to re-use, create new
					view = context.LayoutInflater.Inflate(Resource.Layout.SuggestionCell, null);

				C_VitaSite site = Sites[position];

				// compute the gap from need to signedup
				int numNeeded = 0;
				int numHave = 0;
				C_SiteSchedule ss = Global.GetSiteScheduleForDay(Global.SelectedDate, site.Slug);
				foreach (C_SiteScheduleShift sss in ss.Shifts)
				{
                    bool userIsAdvanced = User.Certification == E_Certification.Advanced;

                    // 12-jan-2018: changed to allow advanced to signup for basic
                    numNeeded += sss.eFilersNeededBasic;
                    if (userIsAdvanced)
                        numNeeded += sss.eFilersNeededAdvanced;

                    numHave += sss.eFilersSignedUpBasic;
                    if (userIsAdvanced)
                        numHave += sss.eFilersSignedUpAdvanced;

					//numNeeded += User.Certification == E_Certification.Basic ? sss.eFilersNeededBasic : sss.eFilersNeededAdvanced;
					//numHave += User.Certification == E_Certification.Basic ? sss.eFilersSignedUpBasic : sss.eFilersSignedUpAdvanced;
				}
				int numEF = numNeeded - numHave;


				// figure out if our user is already signed up for a shift on this date
				bool ourUserIsSignedUp = ss.LoggedInUserSignedUp; // todo: is this working?

                string t2 = ourUserIsSignedUp ? "Already signed up for this site." : numEF.ToString() + " needed across all shifts.";

				view.FindViewById<TextView>(Resource.Id.Text1).Text = site.Name;
                view.FindViewById<TextView>(Resource.Id.Text2).Text = t2;

				return view;
			}
		}

	}
}
