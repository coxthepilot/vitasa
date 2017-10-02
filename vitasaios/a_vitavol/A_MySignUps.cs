
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Json;
using System.Threading.Tasks;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;

//using Xamarin.Forms;

using zsquared;

namespace a_vitavol
{
    [Activity(Label = "VITA: My Signups")]
    public class A_MySignUps : ListActivity
    {
		C_Global Global;

        List<C_WorkItem> OurWorkItemsForToday;
        List<string> Signups;

		ProgressDialog AI_Busy;

		protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

			MyAppDelegate g = (MyAppDelegate)Application;
			if (g.Global == null)
				g.Global = new C_Global();
			Global = g.Global;

			// Set our view from the "main" layout resource
			//SetContentView(Resource.Layout.MySignUps);

			// since the login process includes the user work history and intents, we don't need to fetch again
			// todo: after some amount of time, these values are stale? Since this user is the only one that can change
			//   them then perhaps they are ok; can backoffice change their intents? when approved and moves to history?

			// get all workintents for this user
			List<C_WorkItem> OurWorkItems = Global.GetWorkItemsForUser(Global.LoggedInUserId);

			// make sure we only look at the current items (today and beyond)
			C_YMD today = C_YMD.Now;
			var ou = OurWorkItems.Where(wi => wi.Date >= today);
            OurWorkItemsForToday = ou.ToList();
			// sort to make the list nicer
			OurWorkItemsForToday.Sort(C_WorkItem.CompareByDateAscending);

            Signups = new List<string>();
            foreach(C_WorkItem wi in OurWorkItemsForToday)
                Signups.Add(wi.SiteName);

			AI_Busy = new ProgressDialog(this);
			AI_Busy.SetMessage("Please wait...");
			AI_Busy.SetCancelable(false);
			AI_Busy.SetProgressStyle(ProgressDialogStyle.Spinner);

            AI_Busy.Show();

			// make sure the site cache has the details on the sites listed in our workitems
			Task.Run(async () =>
			{
				bool success = true;
				foreach (C_WorkItem wi in OurWorkItemsForToday)
					success &= await Global.EnsureSiteInCache(wi.SiteSlug);

                RunOnUiThread(() =>
                {
                    AI_Busy.Cancel();

                    ListAdapter = new SignUpAdapter(this, OurWorkItemsForToday, Global);
				});
			});
		}

		protected override void OnListItemClick(ListView l, View v, int position, long id)
		{
			string t = Signups[position];
            C_WorkItem wi = OurWorkItemsForToday[position];
            Global.SelectedSiteSlug = wi.SiteSlug;
            Global.SelectedSiteName = wi.SiteName;
            Global.SelectedDate = wi.Date;
            Global.VolunteerWorkItem = wi;

            StartActivity(new Intent(this, typeof(A_ViewSignUpExisting)));
		}

		public class SignUpAdapter : BaseAdapter<C_WorkItem>
		{
			readonly List<C_WorkItem> items;
			readonly Activity context;
			readonly C_Global Global;

			public SignUpAdapter(Activity context, List<C_WorkItem> items, C_Global global) : base()
			{
				this.context = context;
				this.items = items;
				this.Global = global;
			}

			public override long GetItemId(int position)
			{
				return position;
			}

			public override C_WorkItem this[int position]
			{
				get { return items[position]; }
			}

			public override int Count
			{
				get { return items.Count; }
			}

			public override View GetView(int position, View convertView, ViewGroup parent)
			{
				C_WorkItem wi = items[position];

				C_VitaSite oursite = Global.GetSiteFromCacheNoFetch(wi.SiteSlug);

				C_HMS[] openclose = oursite.GetOpenCloseTimeOnDate(wi.Date);

				View view = convertView;
				if (view == null) // no view to re-use, create new
					view = context.LayoutInflater.Inflate(Resource.Layout.SuggestionCell, null);

				view.FindViewById<TextView>(Resource.Id.Text1).Text = oursite.Name;
				view.FindViewById<TextView>(Resource.Id.Text2).Text = wi.Date.ToString()
					+ " [" + openclose[0].ToString("hh:mm p").Trim() + " - " + openclose[1].ToString("hh:mm p") + "]";

				return view;
			}
		}

		public override void OnBackPressed()
        {
            Intent i = new Intent(this, typeof(A_VolunteerActivity));
            StartActivity(i);
		}
	}
}
