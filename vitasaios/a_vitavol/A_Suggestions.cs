using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;

using zsquared;

namespace a_vitavol
{
    [Activity(Label = "VITA: Suggestions")]
    public class A_Suggestions : ListActivity
    {
        C_Global Global;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

			MyAppDelegate g = (MyAppDelegate)Application;
			if (g.Global == null)
				g.Global = new C_Global();
			Global = g.Global;

            C_VitaUser user = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

   //         ListAdapter = new SuggestionsAdapter(this, user.Suggestions);
   //         ListView.ItemClick += (sender, e) => 
   //         {
   //             Global.SelectedSuggestion = user.Suggestions[e.Position];

   //             Intent i = new Intent(this, typeof(A_Suggestion));
			//	StartActivity(i);
			//};
		}

		public override void OnBackPressed()
		{
            Intent i = new Intent(this, typeof(A_VolunteerActivity));
			StartActivity(i);
		}

		public class SuggestionsAdapter : BaseAdapter<C_Suggestion>
		{
            readonly List<C_Suggestion> items;
            readonly Activity context;

            public SuggestionsAdapter(Activity context, List<C_Suggestion> items)
			{
				this.context = context;
				this.items = items;
			}

			public override long GetItemId(int position)
			{
				return position;
			}

			public override C_Suggestion this[int position]
			{
				get { return items[position]; }
			}

			public override int Count
			{
				get { return items.Count; }
			}

			public override View GetView(int position, View convertView, ViewGroup parent)
			{
				var item = items[position];

				View view = convertView;
				if (view == null) // no view to re-use, create new
                    view = context.LayoutInflater.Inflate(Resource.Layout.ListViewCell, null);

                // fix the text so that it doesn't have \n's
                string stext = item.Text.Replace('\n', ' ');
                
                view.FindViewById<TextView>(Resource.Id.Text1).Text = item.Subject;
                view.FindViewById<TextView>(Resource.Id.Text2).Text = stext;

				return view;
			}
		}
    }
}
