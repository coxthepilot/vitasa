
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
    [Activity(Label = "VITA: Site Calendar Defaults")]
    public class A_SCSiteDefault : Activity
    {
        C_Global Global;

        C_VitaUser LoggedInUser;
        C_VitaSite OurSite;

        ProgressDialog AI_Busy;

        TextView L_SiteName;
        TextView L_DayOfWeek;
        CheckBox CB_SiteIsOpen;
        EditText TB_OpenTime;
        EditText TB_CloseTime;
        EditText TB_NumEFilers;
        Button B_SaveDefaults;

        bool Dirty;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;

            if (Global.SelectedDate == null)
                Global.SelectedDate = C_YMD.Now;

            OurSite = Global.GetSiteFromCacheNoFetch(Global.SelectedSiteSlug);
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            // Set our view from the "main" layout resource
            SetContentView(Resource.Layout.SCSiteDefault);

            AI_Busy = new ProgressDialog(this);
            AI_Busy.SetMessage("Please wait...");
            AI_Busy.SetCancelable(false);
            AI_Busy.SetProgressStyle(ProgressDialogStyle.Spinner);

            L_SiteName = FindViewById<TextView>(Resource.Id.L_SiteName);
            L_DayOfWeek = FindViewById<TextView>(Resource.Id.L_DayOfWeek);
            CB_SiteIsOpen = FindViewById<CheckBox>(Resource.Id.CB_SiteIsOpen);
            TB_OpenTime = FindViewById<EditText>(Resource.Id.TB_OpenTime);
            TB_CloseTime = FindViewById<EditText>(Resource.Id.TB_CloseTime);
            TB_NumEFilers = FindViewById<EditText>(Resource.Id.TB_NumEFilers);
            B_SaveDefaults = FindViewById<Button>(Resource.Id.B_SaveDefaults);
            CB_SiteIsOpen = FindViewById<CheckBox>(Resource.Id.CB_SiteIsOpen);

            C_SiteCalendarEntry calDefaults = OurSite.SiteCalendar[Global.SelectedDayOfWeek];

            bool killChanges = false;
            CB_SiteIsOpen.CheckedChange += (sender, e) =>
            {
                if (killChanges) return;
                bool calDefaultsIsOpen = (calDefaults.OpenTime != calDefaults.CloseTime);
                Dirty |= CB_SiteIsOpen.Checked != calDefaultsIsOpen;
                EnableUI(CB_SiteIsOpen.Checked);
            };

            TB_OpenTime.TextChanged += (sender, e) =>
            {
                if (killChanges) return;
                try
                {
                    C_HMS tbtime = new C_HMS(TB_OpenTime.Text);
                    Dirty |= tbtime != calDefaults.OpenTime;
                }
                catch (Exception ex)
                {
#if DEBUG
                    Console.WriteLine(ex.Message);
#endif
                }
            };

            TB_CloseTime.TextChanged += (sender, e) =>
            {
                if (killChanges) return;
                try
                {
                    C_HMS tbtime = new C_HMS(TB_CloseTime.Text);
                    Dirty |= tbtime != calDefaults.CloseTime;
                }
                catch (Exception ex)
                {
#if DEBUG
                    Console.WriteLine(ex.Message);
#endif
                }
            };

            TB_NumEFilers.TextChanged += (sender, e) =>
            {
                if (killChanges) return;
                try { Dirty |= Convert.ToInt32(TB_NumEFilers.Text) != calDefaults.NumEFilers; }
                catch (Exception ex)
                {
#if DEBUG
                    Console.WriteLine(ex.Message);
#endif
                }
            };

            B_SaveDefaults.Click += (sender, e) =>
            {
                Task.Run(async () =>
                {
                    bool success = await SaveChanges();

                    RunOnUiThread(() =>
                    {
                        StartActivity(new Intent(this, typeof(A_SCCalendar)));
                    });
                });
            };

            L_SiteName.Text = OurSite.Name;
            L_DayOfWeek.Text = C_YMD.DayOfWeekNames[Global.SelectedDayOfWeek];

            killChanges = true;
            CB_SiteIsOpen.Checked = calDefaults.OpenTime != calDefaults.CloseTime;
            TB_OpenTime.Text = calDefaults.OpenTime.ToString("hh:mm p");
            TB_CloseTime.Text = calDefaults.CloseTime.ToString("hh:mm p");
            TB_NumEFilers.Text = calDefaults.NumEFilers.ToString();
            killChanges = false;

            EnableUI(CB_SiteIsOpen.Checked);

            Dirty = false;
        }

        private void EnableUI(bool en)
        {
            TB_OpenTime.Enabled = en;
            TB_CloseTime.Enabled = en;
            TB_NumEFilers.Enabled = en;
        }

        private async Task<bool> SaveChanges()
        {
            try
            {
                C_HMS openTimex = new C_HMS(TB_OpenTime.Text);
                C_HMS closeTimex = new C_HMS(TB_CloseTime.Text);

                int numEFilers = Convert.ToInt32(TB_NumEFilers.Text);
                if (!CB_SiteIsOpen.Checked)
                    closeTimex = openTimex;

                EnableUI(false);
                AI_Busy.Show();

                bool success = await OurSite.UpdateDefaultCalendar(Global.SelectedDayOfWeek, openTimex, closeTimex, numEFilers, LoggedInUser.Token);

                EnableUI(true);
                AI_Busy.Cancel();

                if (success)
                {
                    C_SiteCalendarEntry ce = OurSite.SiteCalendar[Global.SelectedDayOfWeek];
                    ce.OpenTime = openTimex;
                    ce.CloseTime = closeTimex;
                    ce.NumEFilers = numEFilers;

                    Dirty = false;
                    B_SaveDefaults.Enabled = false;
                }
                else
                {
                    C_MessageBox mbox = new C_MessageBox(this,
                                     "Error",
                                     "Failed to update the Site calendar",
                                     E_MessageBoxButtons.Ok);
                    mbox.Show();
                }
            }
            catch (Exception ex)
            {
#if DEBUG
                Console.WriteLine(ex.Message);
#endif
            }

			// we only have a return value since an async MUST return a value...sigh
			return true;
		}

		public override void OnBackPressed()
		{
            if (Dirty)
            {
                C_MessageBox mbox = new C_MessageBox(this, "Changes", "Changes were made. Save?", E_MessageBoxButtons.YesNo);
                mbox.Dismissed += (sender, args) => 
                {
                    Task.Run(async () => 
                    {
						if (args.Result == E_MessageBoxResults.Yes)
						{
                            AI_Busy.Show();
                            bool success = await SaveChanges();
                            AI_Busy.Cancel();
						}

                        RunOnUiThread(() => 
                        {
							StartActivity(new Intent(this, typeof(A_SCCalendar)));
						});
					});
				};
                mbox.Show();
            }
            else
				StartActivity(new Intent(this, typeof(A_SCCalendar)));
		}
	}
}
