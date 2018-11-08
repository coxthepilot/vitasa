using System;
using System.Threading.Tasks;
using System.Collections.Generic;

using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using Android.Util;
using Android.Views;

using zsquared;

namespace a_vitavol
{
    [Activity(Theme = "@android:style/Theme.DeviceDefault.NoActionBar", Label = "A_EditHours")]
    public class A_EditHours : Activity
    {
        C_Global Global;
        C_VitaUser LoggedInUser;

        Button B_Save;
        Button B_Date;
        ProgressBar PB_Busy;
        Spinner SP_Site;
        EditText TB_Hours;
        TextView L_Date;

        bool NewWorkLogItem;

        C_DatePicker DatePicker;
        List<C_VitaSite> AllSites;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            MyAppDelegate g = (MyAppDelegate)Application;
            if (g.Global == null)
                g.Global = new C_Global();
            Global = g.Global;

            LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);

            SetContentView(Resource.Layout.EditHours);

            B_Save = FindViewById<Button>(Resource.Id.B_Save);
            PB_Busy = FindViewById<ProgressBar>(Resource.Id.PB_Busy);
            SP_Site = FindViewById<Spinner>(Resource.Id.SP_Site);
            TB_Hours = FindViewById<EditText>(Resource.Id.TB_Hours);
            B_Date = FindViewById<Button>(Resource.Id.B_Date);
            L_Date = FindViewById<TextView>(Resource.Id.L_Date);

            C_Common.SetViewColors(this, Resource.Id.V_EditHours);

            NewWorkLogItem = Global.SelectedWorkItem == null;
            if (NewWorkLogItem)
                Global.SelectedWorkItem = new C_WorkLogItem();
                
            B_Save.Click += (sender, e) => 
            {
                // save the values from the form into the object
                int six = SP_Site.SelectedItemPosition;
                C_VitaSite selSite = AllSites[six];
                Global.SelectedWorkItem.SiteId = selSite.id;
                try { Global.SelectedWorkItem.Hours = Convert.ToSingle(TB_Hours.Text); }
                catch (Exception ex) { Log.Debug("vita", ex.Message); }

                PB_Busy.Visibility = ViewStates.Visible;
                EnableUI(false);

                Task.Run(async () =>
                {
                    C_IOResult ior = NewWorkLogItem
                        ? await Global.AddWorkLogItem(LoggedInUser, LoggedInUser.Token, Global.SelectedWorkItem)
                        : await Global.UpdateWorkLogItem(LoggedInUser, LoggedInUser.Token, Global.SelectedWorkItem);

                    void p()
                    {
                        PB_Busy.Visibility = ViewStates.Invisible;
                        EnableUI(true);

                        if (!ior.Success)
                        {
                            C_MessageBox mbox = new C_MessageBox(this,
                             "Error",
                             "Unable to save the new work item.",
                             E_MessageBoxButtons.Ok);
                            mbox.Show();
                        }
                        else
                            StartActivity(new Intent(this, typeof(A_VolHoursWorked)));
                    }
                    RunOnUiThread(p);
                });
            };

            TB_Hours.TextChanged += (sender, e) => 
                CheckSaveEnable();

            B_Date.Click += (sender, e) => 
                DatePicker.Show(FragmentManager, "vita");

            Task.Run(async () =>
            {
                AllSites = await Global.FetchAllSites();

                void p()
                {
                    ArrayAdapter SitesAdapter = new ArrayAdapter(this, Resource.Layout.SpinnerItem, AllSites);
                    SitesAdapter.SetDropDownViewResource(Resource.Layout.SpinnerItem);
                    SP_Site.Adapter = SitesAdapter;

                    int selix = -1;
                    if (Global.SelectedWorkItem.SiteId != -1)
                    {
                        for (int ix = 0; ix != AllSites.Count; ix++)
                        {
                            if (Global.SelectedWorkItem.SiteId == AllSites[ix].id)
                            {
                                selix = ix;
                                break;
                            }
                        }
                    }

                    if (selix != -1)
                        SP_Site.SetSelection(selix);

                    L_Date.Text = Global.SelectedWorkItem.Date.ToString("mmm dd, yyyy");

                    DatePicker = new C_DatePicker(Global.SelectedWorkItem.Date);
                    DatePicker.DateSelected += (object sender, C_DatePicker.DatePickerEventArgs args) => 
                    {
                        Global.SelectedWorkItem.Date = args.Date;
                        L_Date.Text = args.Date.ToString("mmm dd, yyyy");
                    };
                    L_Date.Text = Global.SelectedWorkItem.Date.ToString("mmm dd, yyyy");

                    TB_Hours.Text = Global.SelectedWorkItem.Hours.ToString();

                    CheckSaveEnable();
                }
                RunOnUiThread(p);
            });
        }

        private void CheckSaveEnable()
        {
            double h;

            B_Save.Enabled =
                      double.TryParse(TB_Hours.Text, out h)
                      && SP_Site.SelectedItemPosition != -1;
        }

        public override void OnBackPressed() => 
            StartActivity(new Intent(this, typeof(A_VolHoursWorked)));

        private void EnableUI(bool en)
        {
            B_Save.Enabled = en;
            SP_Site.Enabled = en;
            TB_Hours.Enabled = en;
            B_Date.Enabled = en;
        }
    }
}
