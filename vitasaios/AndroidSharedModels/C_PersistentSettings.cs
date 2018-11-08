using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;
using System.Json;

using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using Android.Util;
using Android.Views;


using Android.Gms.Common.Apis;
using Android.Gms.Maps;
using Android.Gms.Maps.Model;
using Android.Gms.Location;
using Android.Gms.Common;
using Android.Locations;

using zsquared;

namespace zsquared
{
    public class C_PersistentSettings
    {
        public string UserEmail;
        public string UserPassword;

        public float Zoom;
        public float Latitude;
        public float Longitude;

        public bool FirebaseTokenUpdated;
        public string FirebaseMessage;
        public string FirebaseToken;
        public string FirebaseID;

        public C_SitesFilter SitesFilter;

        public C_YMD SeasonFirstDate;
        public C_YMD SeasonLastDate;

        public List<string> PreferedSites;

        readonly Activity activity;

        public readonly static string N_PersistentSettings = "settings";

        public readonly static string N_UserEmail = "username";
        public readonly static string N_UserPassword = "password";
        public readonly static string N_Zoom = "zoom";
        public readonly static string N_Latitude = "latitude";
        public readonly static string N_Longitude = "longitude";
        public readonly static string N_FirebaseUpdated = "firebase_updated";
        public readonly static string N_FirebaseMessage = "firebase_message";
        public readonly static string N_FirebaseToken = "firebase_token";
        public readonly static string N_FirebaseID = "firebase_id";
        public readonly static string N_SitesFilter = "sitesfilter";
        public readonly static string N_FirstDate = "firstdate";
        public readonly static string N_LastDate = "lastdate";
        public readonly static string N_PreferedSites = "preferedsites";

        public C_PersistentSettings(Activity a)
        {
            activity = a;

            Zoom = 10.0f;
            Latitude = 29.41541f;
            Longitude = -98.491823f;

            FirebaseTokenUpdated = false;

            SitesFilter = new C_SitesFilter();

            SeasonFirstDate = new C_YMD(2019, 01, 01);
            SeasonLastDate = new C_YMD(2019, 04, 15);

            PreferedSites = new List<string>();

            try
            {
                string settings_json_s = GetSharedPreferences(activity, N_PersistentSettings, "");

                JsonValue settings_json = JsonValue.Parse(settings_json_s);

                if (settings_json.ContainsKey(N_UserEmail))
                    UserEmail = Tools.JsonProcessString(settings_json[N_UserEmail], null);

                if (settings_json.ContainsKey(N_UserPassword))
                    UserPassword = Tools.JsonProcessString(settings_json[N_UserPassword], null);

                if (settings_json.ContainsKey(N_Zoom))
                    Zoom = Tools.JsonProcessFloat(settings_json[N_Zoom], 10.0f);

                if (settings_json.ContainsKey(N_Latitude))
                    Latitude = Tools.JsonProcessFloat(settings_json[N_Latitude], 10.0f);

                if (settings_json.ContainsKey(N_Longitude))
                    Longitude = Tools.JsonProcessFloat(settings_json[N_Longitude], 10.0f);

                if (settings_json.ContainsKey(N_FirebaseUpdated))
                    FirebaseTokenUpdated = Tools.JsonProcessBool(settings_json[N_FirebaseUpdated], false);

                if (settings_json.ContainsKey(N_FirebaseMessage))
                    FirebaseMessage = Tools.JsonProcessString(settings_json[N_FirebaseMessage], null);

                if (settings_json.ContainsKey(N_FirebaseToken))
                    FirebaseToken = Tools.JsonProcessString(settings_json[N_FirebaseToken], null);

                if (settings_json.ContainsKey(N_FirebaseID))
                    FirebaseID = Tools.JsonProcessString(settings_json[N_FirebaseID], null);

                if (settings_json.ContainsKey(N_SitesFilter))
                {
                    JsonValue jv = settings_json[N_SitesFilter];
                    foreach (JsonValue jvv in jv)
                    {
                        SitesFilter = new C_SitesFilter(jvv);
                        break;
                    }
                }

                if (settings_json.ContainsKey(N_FirstDate))
                    SeasonFirstDate = Tools.JsonProcessDate(settings_json[N_FirstDate], new C_YMD(2019, 01, 01));

                if (settings_json.ContainsKey(N_LastDate))
                    SeasonLastDate = Tools.JsonProcessDate(settings_json[N_LastDate], new C_YMD(2019, 01, 01));

                if (settings_json.ContainsKey(N_PreferedSites))
                {
                    JsonValue jv = settings_json[N_PreferedSites];
                    if (jv is JsonArray)
                    {
                        PreferedSites = new List<string>();
                        foreach(JsonValue jvv in jv)
                        {
                            string s = Tools.JsonProcessString(jvv, "");
                            if (!string.IsNullOrWhiteSpace(s))
                                PreferedSites.Add(s);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Log.Debug("vita", "Failed to obtain the persistent settings. [" + ex.Message + "]");
            }
        }

        public void Save()
        {
            C_JsonBuilder jb = new C_JsonBuilder();

            jb.Add(UserEmail, N_UserEmail);
            jb.Add(UserPassword, N_UserPassword);

            jb.Add(Zoom, N_Zoom);
            jb.Add(Latitude, N_Latitude);
            jb.Add(Longitude, N_Longitude);

            jb.Add(FirebaseTokenUpdated, N_FirebaseUpdated);
            jb.Add(FirebaseMessage, N_FirebaseMessage);
            jb.Add(FirebaseID, N_FirebaseID);
            jb.Add(FirebaseToken, N_FirebaseToken);

            //jb.Add(SitesFilter.ToJson(), N_SitesFilter);
            jb.StartArray(N_SitesFilter);
            jb.AddArrayObject(SitesFilter.ToJson());
            jb.EndArray();

            jb.Add(SeasonFirstDate, N_FirstDate);
            jb.Add(SeasonLastDate, N_LastDate);

            jb.StartArray(N_PreferedSites);
            foreach (string s in PreferedSites)
                jb.AddArrayElement(s);
            jb.EndArray();

            string jbstring = jb.ToString();
            PutSharedPreferences(activity, N_PersistentSettings, jbstring);
#if DEBUG
            try
            {
                string check = GetSharedPreferences(activity, N_PersistentSettings);
                if (check != jbstring)
                    Log.Debug("vita", "save and read from shared preferences failed");
                JsonValue jvt = JsonValue.Parse(check);
            }
            catch (Exception ex)
            {
                Log.Debug("vita", ex.Message);
            }
#endif
        }

        public void AddPreferedSite(string slug)
        {
            if (!PreferedSites.Contains(slug))
                PreferedSites.Add(slug);
        }

        public void RemovePreferedSite(string slug)
        {
            if (PreferedSites.Contains(slug))
                PreferedSites.Remove(slug);
        }

        private string GetSharedPreferences(Android.App.Activity a, string key, string defaultValue = null)
        {
            ISharedPreferences SharedPreferences = a.GetSharedPreferences("vitasa", FileCreationMode.MultiProcess);
            string res = SharedPreferences.GetString(key, defaultValue);

            return res;
        }

        private void PutSharedPreferences(Android.App.Activity a, string key, string value)
        {
            ISharedPreferences SharedPreferences = a.GetSharedPreferences("vitasa", FileCreationMode.MultiProcess);
            ISharedPreferencesEditor Editor = SharedPreferences.Edit();
            Editor.PutString(key, value);
            Editor.Commit();
        }

    }
}
