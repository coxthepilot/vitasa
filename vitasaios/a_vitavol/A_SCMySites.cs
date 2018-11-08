
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

using zsquared;

namespace a_vitavol
{
    [Activity(Label = "VITA: My Sites")]
    public class A_SCMySites : ListActivity
    {
		C_Global Global;

        C_VitaUser LoggedInUser;
		
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

			MyAppDelegate g = (MyAppDelegate)Application;
			if (g.Global == null)
				g.Global = new C_Global();
			Global = g.Global;

            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

			ProgressDialog AI_Submitting = new ProgressDialog(this);
			AI_Submitting.SetMessage("Please wait...");
			AI_Submitting.SetCancelable(false);
			AI_Submitting.SetProgressStyle(ProgressDialogStyle.Spinner);

            AI_Submitting.Show();

			Task.Run(async () => 
            {
				List<C_VitaSite> OurSites = new List<C_VitaSite>();
				foreach (C_SiteCoordinated sc in LoggedInUser.SitesCoordinated)
				{
                    C_VitaSite site = await Global.FetchSiteWithSlug(sc.Slug);
                    OurSites.Add(site);
				}

                RunOnUiThread(() => 
                {
                    AI_Submitting.Cancel();

                    ListAdapter = new SitesAdapter(this, OurSites);
					ListView.ItemClick += (sender, e) =>
					{
                        Global.SelectedSiteSlug = OurSites[e.Position].Slug;

                        Intent i = new Intent(this, typeof(A_SCMySite));
						StartActivity(i);
					};
				});
			});
		}

		public override void OnBackPressed()
		{
            Intent i = new Intent(this, typeof(MainActivity));
			StartActivity(i);
		}

        public class SitesAdapter : BaseAdapter<C_VitaSite>
		{
			readonly List<C_VitaSite> items;
			readonly Activity context;

			public SitesAdapter(Activity context, List<C_VitaSite> items) : base()
			{
				this.context = context;
				this.items = items;
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
				C_VitaSite item = items[position];

				View view = convertView;
				if (view == null) // no view to re-use, create new
                    view = context.LayoutInflater.Inflate(Resource.Layout.ListViewCell, null);


                string a = item.Street + ", " + item.City + " " + item.Zip;

                view.FindViewById<TextView>(Resource.Id.Text1).Text = item.Name;
				view.FindViewById<TextView>(Resource.Id.Text2).Text = a;

				return view;
			}
		}
	}
}
