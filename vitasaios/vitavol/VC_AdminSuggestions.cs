using System;
using UIKit;
using System.Threading.Tasks;
using System.Collections.Generic;

using zsquared;
using static zsquared.C_MessageBox;

namespace vitavol
{
    public partial class VC_AdminSuggestions : UIViewController
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        C_TableSource<C_Suggestion> SuggestionsTableSource;

        public VC_AdminSuggestions (IntPtr handle) : base (handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            AppDelegate myAppDelegate = (AppDelegate)UIApplication.SharedApplication.Delegate;
            Global = myAppDelegate.Global;
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            B_Back.TouchUpInside += (sender, e) =>
            {
                Global.SelectedSuggestion = null;
                PerformSegue("Segue_AdminSuggestionsToAdminMenu", this);
            };
        }

        public override void ViewDidAppear(bool animated)
        {
            base.ViewDidAppear(animated);

            C_Common.SetUIColors(View);

            AI_Busy.StartAnimating();
            EnableUI(false);

            Task.Run(async () => 
            {
                List<C_VitaUser> users = await Global.FetchAllUsers(LoggedInUser.Token);

                List<C_Suggestion> suggestions = await Global.FetchAllSuggestions(LoggedInUser.Token);

                // removed after the release of 2.0
                //// make sure the users that have sent suggestions are in the user cache
                //foreach(C_Suggestion sug in suggestions)
                //{
                //    if (!sug.FromPublic && (sug.id >= 0))
                //    {
                //        C_VitaUser u = await Global.FetchUserWithId(sug.id);
                //    }
                //}
                suggestions.Sort(C_Suggestion.CompareByDateReverse);

                void p()
                {
                    AI_Busy.StopAnimating();
                    EnableUI(true);

                    SuggestionsTableSource = new C_TableSource<C_Suggestion>(this, TV_Suggestions, suggestions, "sugcell");
                    SuggestionsTableSource.GetTextLabel += (sender, args) =>
                    {
                        C_Suggestion sug = args.Item;
                        return sug.Subject;
                    };
                    SuggestionsTableSource.GetDetailTextLabel += (sender, args) =>
                    {
                        C_Suggestion sug = args.Item;
                        C_VitaUser u = null;
                        if (!sug.FromPublic)
                            u = Global.GetUserFromCacheNoFetch(sug.UserId);
                        string uname = u == null ? "" : u.Name;
                        string from = sug.FromPublic ? "public" : uname;

                        return sug.CreateDate.ToString("dow mmm dd, yyyy") + " [" + from + "]";
                    };
                    SuggestionsTableSource.Selected += (sender, args) =>
                    {
                        C_Suggestion sug = args.Item;
                        Global.SelectedSuggestion = sug;
                        PerformSegue("Segue_AdminSuggestionsToAdminSuggestion", this);
                    };
                    SuggestionsTableSource.DeleteAllowed += (object sender, C_TableSource<C_Suggestion>.TableSourceEventArgs<C_Suggestion> args) => 
                    {
                        return true;
                    };
                    SuggestionsTableSource.Delete += (object sender, C_TableSource<C_Suggestion>.TableSourceEventArgs<C_Suggestion> args) => 
                    {
                        C_Suggestion sugg = args.Item;

                        Task.Run(async () =>
                        {
                            C_IOResult ior = await Global.RemoveSuggestion(sugg, LoggedInUser.Token);

                            if (!ior.Success)
                            {
                                E_MessageBoxResults mbresx = await MessageBox(this,
                                    "Error",
                                    "Unable to delete the suggestion.",
                                    E_MessageBoxButtons.Ok);
                            }
                        });
                    };
                    TV_Suggestions.Source = SuggestionsTableSource;
                    TV_Suggestions.ReloadData();
                }
                UIApplication.SharedApplication.InvokeOnMainThread(p);
            });
        }

        private void EnableUI(bool en) =>
            C_Common.EnableUI(View, en);
    }
}