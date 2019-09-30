using System.Threading.Tasks;
using System.Collections.Generic;

using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using Android.Views;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_AdminSuggestions")]
    public class A_AdminSuggestions : Activity
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        ListView LV_Suggestions;
        ProgressBar PB_Busy;

        C_ListViewHelper<C_Suggestion> SuggestionsAdapter;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            SetContentView(Resource.Layout.AdminSuggestions);

            LV_Suggestions = FindViewById<ListView>(Resource.Id.LV_List);
            PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);

            C_Common.SetViewColors(this, Resource.Id.V_AdminSuggestions);

            LV_Suggestions.ItemClick += (object sender, AdapterView.ItemClickEventArgs e) => 
            {
                C_Suggestion sug = SuggestionsAdapter.Items[e.Position];
                Global.SelectedSuggestion = sug;
                StartActivity(new Intent(this, typeof(A_AdminSuggestion)));
            };

            PB_Busy.Visibility = ViewStates.Visible;
            EnableUI(false);

            Task.Run(async () =>
            {
                List<C_VitaUser> users = await Global.FetchAllUsers(LoggedInUser.Token);

                List<C_Suggestion> suggestions = await Global.FetchAllSuggestions(LoggedInUser.Token);

                //// make sure the users that have sent suggestions are in the user cache
                //foreach (C_Suggestion sug in suggestions)
                //{
                //    if (!sug.FromPublic && (sug.id >= 0))
                //    {
                //        C_VitaUser u = await Global.FetchUserWithId(sug.id);
                //    }
                //}
                suggestions.Sort(C_Suggestion.CompareByDateReverse);

                void p()
                {
                    PB_Busy.Visibility = ViewStates.Gone;
                    EnableUI(true);

                    suggestions.Sort(C_Suggestion.CompareByDate);

                    SuggestionsAdapter = new C_ListViewHelper<C_Suggestion>(this, LV_Suggestions, suggestions);
                    SuggestionsAdapter.GetTextLabel += (object sender, ListAdapterEventArgs<C_Suggestion> args) => 
                    {
                        C_Suggestion sug = args.Item;
                        return sug.Subject;
                    };
                    SuggestionsAdapter.GetDetailTextLabel += (object sender, ListAdapterEventArgs<C_Suggestion> args) => 
                    {
                        C_Suggestion sug = args.Item;
                        C_VitaUser u = null;
                        if (!sug.FromPublic)
                            u = Global.GetUserFromCacheNoFetch(sug.UserId);
                        string xn = u == null ? "" : u.Name;
                        string from = sug.FromPublic ? "public" : xn;

                        return sug.CreateDate.ToString("dow mmm dd, yyyy") + " [" + from + "]";
                    };
                }
                RunOnUiThread(p);
            });
        }

        bool UIIsEnabled;
        void EnableUI(bool en)
        {
            UIIsEnabled = en;
            LV_Suggestions.Enabled = en;
        }

        public override void OnBackPressed()
        {
            if (!UIIsEnabled)
                return;

            Global.SelectedSuggestion = null;
            StartActivity(new Intent(this, typeof(A_AdminMenu)));
        }
    }
}
