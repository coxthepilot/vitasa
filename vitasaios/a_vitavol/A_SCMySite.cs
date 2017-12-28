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
    [Activity(Label = "VITA: My Site")]
    public class A_SCMySite : Activity
    {
		C_Global Global;

		C_VitaUser LoggedInUser;
        C_VitaSite OurSite;

        TextView L_SiteName;
        TextView L_ClientStatus;

        Button B_ManageVolunteers;
        Button B_EditSiteCalendar;
        Button B_EditProfile;
		Button B_Closed;
		Button B_Accepting;
		Button B_NearLimit;
		Button B_AtLimit;

        CheckBox CB_DropOff;
		CheckBox CB_Express;
		CheckBox CB_MFT;

		ProgressDialog AI_Busy;

		protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

			MyAppDelegate g = (MyAppDelegate)Application;
			if (g.Global == null)
				g.Global = new C_Global();
			Global = g.Global;

			// Set our view from the "main" layout resource
            SetContentView(Resource.Layout.SCMySite);

			L_SiteName = FindViewById<TextView>(Resource.Id.L_SCMySite_SiteName);
            L_ClientStatus = FindViewById<TextView>(Resource.Id.L_SCMySite_ClientStatus);

            B_ManageVolunteers = FindViewById<Button>(Resource.Id.B_SCMySite_ManageVolunteers);
            B_EditSiteCalendar = FindViewById<Button>(Resource.Id.B_SCMySite_EditSiteCalendar);
            B_EditProfile = FindViewById<Button>(Resource.Id.B_SCMySite_EditProfile);
            B_Closed = FindViewById<Button>(Resource.Id.B_SCMySite_Closed);
            B_Accepting = FindViewById<Button>(Resource.Id.B_SCMySite_Accepting);
            B_NearLimit = FindViewById<Button>(Resource.Id.B_SCMySite_NearLimit);
            B_AtLimit = FindViewById<Button>(Resource.Id.B_SCMySite_AtLimit);

            CB_DropOff = FindViewById<CheckBox>(Resource.Id.CB_SCMySite_DropOff);
            CB_Express = FindViewById<CheckBox>(Resource.Id.CB_SCMySite_Express);
            CB_MFT = FindViewById<CheckBox>(Resource.Id.CB_SCMySite_MFT);

			AI_Busy = new ProgressDialog(this);
			AI_Busy.SetMessage("Please wait...");
			AI_Busy.SetCancelable(false);
			AI_Busy.SetProgressStyle(ProgressDialogStyle.Spinner);

			B_ManageVolunteers.Click += (sender, e) => 
            {
                StartActivity(new Intent(this, typeof(A_SCSiteVolCalendar)));
				//StartActivity(new Intent(this, typeof(A_SCSiteVol)));
			};

            B_EditSiteCalendar.Click += (sender, e) => 
            {
                StartActivity(new Intent(this, typeof(A_SCCalendar)));
            };

            B_EditProfile.Click += (sender, e) => 
            {
                Global.ViewCameFrom = E_ViewCameFrom.SCSite;
                StartActivity(new Intent(this, typeof(A_Profile)));
			};

            CB_DropOff.CheckedChange += (sender, e) => CommonSiteCapabilitiesUpdate();

            CB_Express.CheckedChange += (sender, e) => CommonSiteCapabilitiesUpdate();

            CB_MFT.CheckedChange += (sender, e) => CommonSiteCapabilitiesUpdate();

            B_Closed.Click += (sender, e) => CommonSiteStatusUpdate(E_ClientSiteStatus.Closed);

            B_Accepting.Click += (sender, e) => CommonSiteStatusUpdate(E_ClientSiteStatus.Accepting);

            B_NearLimit.Click += (sender, e) => CommonSiteStatusUpdate(E_ClientSiteStatus.NearLimit);

            B_AtLimit.Click += (sender, e) => CommonSiteStatusUpdate(E_ClientSiteStatus.NotAccepting);

            Task.Run(async () => 
            {
				LoggedInUser = Global.GetUserFromCacheNoFetch(Global.LoggedInUserId);
				OurSite = await Global.GetSiteFromCache(Global.SelectedSiteSlug);

                RunOnUiThread(() => 
                {
					L_SiteName.Text = OurSite.Name;

					EnableUI(true);
				});
			});
		}

        private void CommonSiteCapabilitiesUpdate()
        {
            if (killChanges) return;
            EnableUI(false);
            AI_Busy.Show();

            OurSite.SiteCapabilities = new List<E_SiteCapabilities>();
            if (CB_DropOff.Checked)
                OurSite.SiteCapabilities.Add(E_SiteCapabilities.DropOff);
            if (CB_Express.Checked)
                OurSite.SiteCapabilities.Add(E_SiteCapabilities.Express);
            if (CB_MFT.Checked)
                OurSite.SiteCapabilities.Add(E_SiteCapabilities.MFT);

            Task.Run(async () => 
            {
                C_IOResult ior = await Global.UpdateSiteCapabilities(OurSite, LoggedInUser.Token);

                RunOnUiThread(() => 
                {
                    EnableUI(true);
                    AI_Busy.Cancel();

                    if (!ior.Success)
                    {
                        C_MessageBox mbox = new C_MessageBox(this, "Error", "Unable to update site capabilities [" + ior.ErrorMessage + "]", E_MessageBoxButtons.Ok);
                        mbox.Show();
                    }
                });
            });
        }

        private void CommonSiteStatusUpdate(E_ClientSiteStatus newStatus)
        {
            EnableUI(false);

            Task.Run(async () => 
            {
                C_VitaSite site = await Global.GetSiteFromCache(Global.SelectedSiteSlug);
                if (site == null)
                {
                    RunOnUiThread(() => 
                    {
                        EnableUI(true);
                        return;
                    });
                }

                C_IOResult ior = await Global.UpdateSiteStatus(site, newStatus, LoggedInUser.Token);

                RunOnUiThread(() => 
                {
                    EnableUI(true);
                    if (!ior.Success)
                    {
                        C_MessageBox mbox = new C_MessageBox(this, "Error", "Unable to update site status [" + ior.ErrorMessage + "]", E_MessageBoxButtons.Ok);
                        mbox.Show();
                    }
                });
            });
        }

        bool killChanges;
        private void EnableUI(bool en)
        {
            if (en)
            {
                killChanges = true;
                L_ClientStatus.Text = "Client status currently: " + C_VitaSite.N_ClientStatusNames[(int)OurSite.ClientStatus];
                CB_DropOff.Checked = OurSite.SiteCapabilities.Contains(E_SiteCapabilities.DropOff);
                CB_Express.Checked = OurSite.SiteCapabilities.Contains(E_SiteCapabilities.Express);
                CB_MFT.Checked = OurSite.SiteCapabilities.Contains(E_SiteCapabilities.MFT);
                killChanges = false;
			}
            
            B_EditProfile.Enabled = en;
            B_EditSiteCalendar.Enabled = en;
            B_ManageVolunteers.Enabled = en;

            CB_DropOff.Enabled = en;
            CB_Express.Enabled = en;
            CB_MFT.Enabled = en;

            B_Closed.Enabled = en && (OurSite.ClientStatus != E_ClientSiteStatus.Closed);
            B_Accepting.Enabled = en && (OurSite.ClientStatus != E_ClientSiteStatus.Accepting);
            B_NearLimit.Enabled = en && (OurSite.ClientStatus != E_ClientSiteStatus.NearLimit);
            B_AtLimit.Enabled = en && (OurSite.ClientStatus != E_ClientSiteStatus.NotAccepting);
		}

		public override void OnBackPressed()
		{
            if (LoggedInUser.SitesCoordinated.Count == 1)
            {
                Intent i = new Intent(this, typeof(MainActivity));
				StartActivity(i);
			}
            else
            {
                Intent i = new Intent(this, typeof(A_SCMySites));
				StartActivity(i);
			}
		}
	}
}
