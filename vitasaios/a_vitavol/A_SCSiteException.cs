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
    [Activity(Label = "VITA: Site Calendar Exception")]
    public class A_SCSiteException : Activity
    {
        C_Global Global;

        C_VitaUser LoggedInUser;
        C_VitaSite OurSite;

        ProgressDialog AI_Busy;

        TextView L_SiteName;
        TextView L_Date;
        TextView L_DefaultOpenTime;
        TextView L_DefaultCloseTime;
        TextView L_DefaultlNumEFilers;
        CheckBox CB_SiteIsOpen;
        EditText TB_OpenTime;
        EditText TB_CloseTime;
        EditText TB_NumEFilers;
        Button B_SaveCalendarException;
        Button B_RestoreDefaults;

        C_CalendarEntry OurCalendarEntry;
        C_SiteCalendarEntry OurDefaultCalendarEntry;

        bool Dirty;
        bool NewEntry;
        bool killChanges;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;

            if (Global.SelectedDate == null)
                Global.SelectedDate = C_YMD.Now;

            OurSite = Global.GetSiteNoFetch(Global.SelectedSiteSlug);
            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            // Set our view from the "main" layout resource
            SetContentView(Resource.Layout.SCSiteException);

            AI_Busy = new ProgressDialog(this);
            AI_Busy.SetMessage("Please wait...");
            AI_Busy.SetCancelable(false);
            AI_Busy.SetProgressStyle(ProgressDialogStyle.Spinner);

            L_SiteName = FindViewById<TextView>(Resource.Id.L_SiteName);
            L_Date = FindViewById<TextView>(Resource.Id.L_Date);
            CB_SiteIsOpen = FindViewById<CheckBox>(Resource.Id.CB_SiteIsOpen);
            TB_OpenTime = FindViewById<EditText>(Resource.Id.TB_OpenTime);
            TB_CloseTime = FindViewById<EditText>(Resource.Id.TB_CloseTime);
            TB_NumEFilers = FindViewById<EditText>(Resource.Id.TB_NumEFilers);
            B_SaveCalendarException = FindViewById<Button>(Resource.Id.B_SaveDefaults);
            B_RestoreDefaults = FindViewById<Button>(Resource.Id.B_RestoreDefaults);
            CB_SiteIsOpen = FindViewById<CheckBox>(Resource.Id.CB_SiteIsOpen);
            L_DefaultOpenTime = FindViewById<TextView>(Resource.Id.L_DefaultOpenTime);
            L_DefaultCloseTime = FindViewById<TextView>(Resource.Id.L_DefaultCloseTime);
            L_DefaultlNumEFilers = FindViewById<TextView>(Resource.Id.L_DefaultNumEFilers);

            NewEntry = false;
            // see if an exception already exists
            OurCalendarEntry = OurSite.GetCalendarExceptionForDateForSite(Global.SelectedDate);
            int dayOfWeek = (int)Global.SelectedDate.DayOfWeek;
            OurDefaultCalendarEntry = OurSite.SiteCalendar[dayOfWeek];
            if (OurCalendarEntry == null)
            {
                // no entry found, create a new one
                OurCalendarEntry = new C_CalendarEntry()
                {
                    SiteID = OurSite.id,
                    Date = Global.SelectedDate,
                    IsClosed = OurDefaultCalendarEntry.OpenTime == OurDefaultCalendarEntry.CloseTime,
                    NumEFilers = OurDefaultCalendarEntry.NumEFilers
                };
                OurCalendarEntry.OpenTime = OurDefaultCalendarEntry.OpenTime;
                OurCalendarEntry.CloseTime = OurDefaultCalendarEntry.CloseTime;

                B_SaveCalendarException.Text = "Save New Calendar Exception";
                NewEntry = true;
            }

            CB_SiteIsOpen.CheckedChange += (sender, e) =>
            {
                if (killChanges) return;
                Dirty = true;
                B_SaveCalendarException.Enabled = true;

                TB_OpenTime.Enabled = CB_SiteIsOpen.Checked;
                TB_CloseTime.Enabled = CB_SiteIsOpen.Checked;
                TB_NumEFilers.Enabled = CB_SiteIsOpen.Checked;
            };

            TB_OpenTime.TextChanged += (sender, e) =>
            {
                if (killChanges) return;
                try
                {
                    C_HMS tbtime = new C_HMS(TB_OpenTime.Text);
                    Dirty |= tbtime != OurCalendarEntry.OpenTime;
                    B_SaveCalendarException.Enabled = true;
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
                    Dirty |= tbtime != OurCalendarEntry.CloseTime;
                    B_SaveCalendarException.Enabled = true;
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
                try
                {
                    Dirty |= Convert.ToInt32(TB_NumEFilers.Text) != OurCalendarEntry.NumEFilers;
                    B_SaveCalendarException.Enabled = true;
                }
                catch (Exception ex)
                {
#if DEBUG
                    Console.WriteLine(ex.Message);
#endif
                }
            };

            B_SaveCalendarException.Click += (sender, e) =>
            {
                OurCalendarEntry.OpenTime = new C_HMS(TB_OpenTime.Text);
                OurCalendarEntry.CloseTime = new C_HMS(TB_CloseTime.Text);
                OurCalendarEntry.NumEFilers = Convert.ToInt32(TB_NumEFilers.Text);
                OurCalendarEntry.IsClosed = !CB_SiteIsOpen.Checked;

                AI_Busy.Show();
                EnableUI(false);

                Task.Run(async () =>
                {
                    bool success = false;
                    try
                    {
                        if (NewEntry)
                            // create new calendar entry
                            success = await OurSite.CreateCalendarEntry(LoggedInUser.Token, OurCalendarEntry);
                        else
                            // update the entry
                            success = await OurSite.UpdateCalendarEntry(LoggedInUser.Token, OurCalendarEntry);
                    }
                    catch
                    {
                        success = false;
                    }

                    RunOnUiThread(() =>
                    {
                        AI_Busy.Cancel();
                        EnableUI(true);

                        if (!success)
                        {
                            C_MessageBox mbox = new C_MessageBox(this,
                                             "Error",
                                             "Unable to update the calendar entry.",
                                             E_MessageBoxButtons.Ok);
                            mbox.Show();

                            return;
                        }

                        Dirty = false;
                        B_SaveCalendarException.Enabled = false;

                        StartActivity(new Intent(this, typeof(A_SCCalendar)));
                    });
                });
            };

            B_RestoreDefaults.Click += (sender, e) =>
            {
                if (!NewEntry)
                {
                    // delete this calendar exception
                    AI_Busy.Show();
                    EnableUI(false);

                    Task.Run(async () =>
                    {
                        bool success = false;
                        try
                        {
                            success = await OurSite.RemoveCalendarEntry(LoggedInUser.Token, OurCalendarEntry);
                        }
                        catch
                        {
                            success = false;
                        }

                        RunOnUiThread(() =>
                        {
                            AI_Busy.Cancel();
                            EnableUI(true);

                            if (!success)
                            {
                                C_MessageBox mbox = new C_MessageBox(this, "Error", "Unable to update the calendar entry.", E_MessageBoxButtons.Ok);
                                mbox.Show();

                                return;
                            }
                            else
                                StartActivity(new Intent(this, typeof(A_SCCalendar)));
                        });
                    });
                }

                StartActivity(new Intent(this, typeof(A_SCCalendar)));
            };

            L_SiteName.Text = OurSite.Name;
            L_Date.Text = Global.SelectedDate.ToString("mmm dd, yyyy");

            SetDisplayValues();

            EnableUI(CB_SiteIsOpen.Checked);

            Dirty = false;

        }

        private void EnableUI(bool en)
        {
            B_RestoreDefaults.Enabled = en;
            B_SaveCalendarException.Enabled = en && Dirty;
            TB_OpenTime.Enabled = en && CB_SiteIsOpen.Checked;
            TB_CloseTime.Enabled = en && CB_SiteIsOpen.Checked;
            TB_NumEFilers.Enabled = en;
        }

        private void SetDisplayValues()
        {
            killChanges = true;
            TB_OpenTime.Text = OurCalendarEntry.OpenTime.ToString("hh:mm p");
            TB_CloseTime.Text = OurCalendarEntry.CloseTime.ToString("hh:mm p");
            TB_NumEFilers.Text = OurCalendarEntry.NumEFilers.ToString();
            CB_SiteIsOpen.Checked = OurCalendarEntry.OpenTime != OurCalendarEntry.CloseTime;
            killChanges = false;

            L_DefaultOpenTime.Text = "(" + OurDefaultCalendarEntry.OpenTime.ToString("hh:mm p") + ")";
            L_DefaultCloseTime.Text = "(" + OurDefaultCalendarEntry.CloseTime.ToString("hh:mm p") + ")";
            L_DefaultlNumEFilers.Text = "(" + OurDefaultCalendarEntry.NumEFilers + ")";
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
                    B_SaveCalendarException.Enabled = false;
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
