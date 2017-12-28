
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
    [Activity(Label = "VITA: Volunteer Suggestion")]
    public class A_Suggestion : Activity
    {
		C_Global Global;

        C_Suggestion OurSuggestion;
        C_VitaUser OurUser;

		TextView L_From;
		TextView L_Date;
		TextView L_State;

		Button B_Save;
		Button B_Delete;
		
        EditText TB_Subject;
		EditText TB_Message;

		ProgressDialog AI_Busy;

		protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

			MyAppDelegate g = (MyAppDelegate)Application;
			if (g.Global == null)
				g.Global = new C_Global();
			Global = g.Global;

            OurSuggestion = Global.SelectedSuggestion;
            OurUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

			// Set our view from the "main" layout resource
            SetContentView(Resource.Layout.Suggestion);

            L_From = FindViewById<TextView>(Resource.Id.L_From);
            L_Date = FindViewById<TextView>(Resource.Id.L_Date);
            L_State = FindViewById<TextView>(Resource.Id.L_State);

            B_Save = FindViewById<Button>(Resource.Id.B_SaveSuggestion);
            B_Delete = FindViewById<Button>(Resource.Id.B_DeleteSuggestion);

            TB_Subject = FindViewById<EditText>(Resource.Id.TB_SubjectSuggestion);
            TB_Message = FindViewById<EditText>(Resource.Id.TB_MessageSuggestion);

            B_Save.Enabled = (OurSuggestion.Status == E_SuggestionStatus.Open) && OurSuggestion.dirty;
            B_Delete.Enabled = (OurSuggestion.Status == E_SuggestionStatus.Open);

			AI_Busy = new ProgressDialog(this);
			AI_Busy.SetMessage("Please wait...");
			AI_Busy.SetCancelable(false);
			AI_Busy.SetProgressStyle(ProgressDialogStyle.Spinner);

			TB_Message.TextChanged += (sender, e) => 
            {
                OurSuggestion.dirty = true;
				B_Save.Enabled = (OurSuggestion.Status == E_SuggestionStatus.Open) && OurSuggestion.dirty;
			};

            TB_Subject.TextChanged += (sender, e) => 
            {
				OurSuggestion.dirty = true;
				B_Save.Enabled = (OurSuggestion.Status == E_SuggestionStatus.Open) && OurSuggestion.dirty;
			};

            B_Save.Click += async (sender, e) => 
            {
                Global.SelectedSuggestion.Subject = TB_Subject.Text;
                Global.SelectedSuggestion.Text = TB_Message.Text;

                AI_Busy.Show();
				EnableUI(false);

                C_IOResult ior = await SaveSuggestion();

                AI_Busy.Cancel();
				EnableUI(true);

				if (!ior.Success)
				{
                    C_MessageBox mbox = new C_MessageBox(this,
						 "Error",
                         "Unable to add or update the suggestion [" + ior.ErrorMessage + "]",
						 E_MessageBoxButtons.Ok);
                    mbox.Show();

					return;
				}

                Intent register = new Intent(this, typeof(A_Suggestions));
				StartActivity(register);
			};

            B_Delete.Click += (sende1r, e1) => 
            {
                C_MessageBox mbox = new C_MessageBox(this,
						   "Delete item?",
						   "Are you sure you want to delete this suggestion?",
						   E_MessageBoxButtons.YesNo);
                mbox.Dismissed += async (sender2, args2) => 
                {
					if ((args2.Result == E_MessageBoxResults.No) || (Global.SelectedSuggestion.id == -1))
					{
						Global.SelectedSuggestion = null;

						Intent i = new Intent(this, typeof(A_Suggestions));
						StartActivity(i);

						return;
					}

                    AI_Busy.Show();
					EnableUI(false);

                    C_IOResult ior = await Global.RemoveSuggestion(Global.SelectedSuggestion, OurUser.Token);
                    OurUser.Suggestions.Remove(Global.SelectedSuggestion);
                    Global.SelectedSuggestion = null;

                    AI_Busy.Cancel();
					EnableUI(true);

                    if (!ior.Success)
					{
                        C_MessageBox mbox1 = new C_MessageBox(this,
															  "Error",
                                                              "Unable to delete the suggestion [" + ior.ErrorMessage + "]",
														      E_MessageBoxButtons.Ok);
                        mbox.Show();
                        return;
					}

					Intent register = new Intent(this, typeof(A_Suggestions));
					StartActivity(register);
				};

                mbox.Show();
			};

            TB_Subject.Text = OurSuggestion.Subject;
            TB_Message.Text = OurSuggestion.Text;
            L_From.Text = OurUser.Name;
            L_Date.Text = OurSuggestion.CreateDate.ToString("mmm dd, yyyy");
            L_State.Text = OurSuggestion.Status.ToString();
		}

		public override void OnBackPressed()
		{
            Intent i = new Intent(this, typeof(A_Suggestions));
			StartActivity(i);
		}

		private void EnableUI(bool en)
        {
			B_Save.Enabled = en && (OurSuggestion.Status == E_SuggestionStatus.Open) && OurSuggestion.dirty;
			B_Delete.Enabled = en && (OurSuggestion.Status == E_SuggestionStatus.Open);
            TB_Message.Enabled = en;
            TB_Subject.Enabled = en;
		}

        private async Task<C_IOResult> SaveSuggestion()
		{
            C_IOResult ior = null;

			if (Global.SelectedSuggestion.id == -1)
			{
                ior = await Global.AddSuggestion(Global.SelectedSuggestion, OurUser.Token);
				//success = await Global.LoggedInUser.AddSuggestion(Global.SelectedSuggestion);
				OurUser.Suggestions.Add(Global.SelectedSuggestion);
			}
			else
                ior = await Global.UpdateSuggestion(Global.SelectedSuggestion, OurUser.Token);
            
			Global.SelectedSuggestion.dirty = false;

            return ior;
		}
	}
}
