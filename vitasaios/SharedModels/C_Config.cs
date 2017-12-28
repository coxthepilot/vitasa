using System;
using System.Json;
using System.Collections.Generic;

namespace zsquared
{
    public class C_Config
    {
        public readonly string BackendUrl;
        public readonly string SitesJsonUrl;
        public readonly bool Offline;
        public readonly Dictionary<string, string> MinimumVersions;

        readonly DateTime SampleValidUntil;

        public const string N_BackendUrl = "hostname";
        public const string N_SitesJsonUrl = "sites_url";
        public const string N_Offline = "offline";
        public const string N_MinimumVersions = "minimum-versions";

        public const double ValidTimeHours = 1.0d;

        public const string N_IOS_Vol_Phone = "ios-vol-phone";
        public const string N_Android_Vol_Phone = "android-vol-phone";
        public const string N_IOS_Admin_Tablet = "ios-admin-tablet";

        public C_Config()
        {
            BackendUrl = "https://vitasa.abandonedfactory.net";
            SitesJsonUrl = null;
            Offline = false;
            MinimumVersions = new Dictionary<string, string>();

            SampleValidUntil = DateTime.Now;
        }

        public C_Config(JsonValue jv)
        {
            BackendUrl = "https://vitasa.abandonedfactory.net";
            SitesJsonUrl = null;
            Offline = false;
            MinimumVersions = new Dictionary<string, string>();

            if (jv.ContainsKey(N_BackendUrl))
            {
                BackendUrl = Tools.JsonProcessString(jv[N_BackendUrl], BackendUrl);
                if (BackendUrl.IndexOf('/') == -1)
                    BackendUrl = "https://" + BackendUrl + "/";
            }

            if (jv.ContainsKey(N_SitesJsonUrl))
                SitesJsonUrl = Tools.JsonProcessString(jv[N_SitesJsonUrl], SitesJsonUrl);

            if (jv.ContainsKey(N_Offline))
                Offline = Tools.JsonProcessBool(jv[N_Offline], Offline);

            if (jv.ContainsKey(N_MinimumVersions))
                ProcessMinimumVersions(jv[N_MinimumVersions]);

            SampleValidUntil = DateTime.Now.AddHours(ValidTimeHours);

#if DEBUG
            // this is where we set the backend we will test against
            //BackendUrl = "https://vitasa.abandonedfactory.net/";
            BackendUrl = "https://volunteer-savvy.com/";
            Offline = false;
            //MinimumVersions = new Dictionary<string, string>();
#endif
            Uri uri = new Uri(BackendUrl);

            if (uri.Scheme == "https")
                C_Vita.SetupCertificateHandling(uri.Host);
        }

        private void ProcessMinimumVersions(JsonValue jv)
        {
            if (jv.ContainsKey(N_IOS_Vol_Phone))
            {
                string s = Tools.JsonProcessString(jv[N_IOS_Vol_Phone], null);
                if (s != null)
                    MinimumVersions.Add(N_IOS_Vol_Phone, s);
            }

			if (jv.ContainsKey(N_Android_Vol_Phone))
			{
				string s = Tools.JsonProcessString(jv[N_Android_Vol_Phone], null);
				if (s != null)
					MinimumVersions.Add(N_Android_Vol_Phone, s);
			}

			if (jv.ContainsKey(N_IOS_Admin_Tablet))
			{
				string s = Tools.JsonProcessString(jv[N_IOS_Admin_Tablet], null);
				if (s != null)
					MinimumVersions.Add(N_IOS_Admin_Tablet, s);
			}
		}

        public bool IsValid()
        {
            return DateTime.Now < SampleValidUntil;
        }
    }
}
