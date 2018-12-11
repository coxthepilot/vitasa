using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;
using System.Json;

using Foundation;

namespace zsquared
{
    public class C_PersistentSettings
    {
        private string _UserEmail;
        public string UserEmail
        {
            get { return _UserEmail; }
            set 
            {
                _UserEmail = value;
                Save();
            }
        }

        private string _UserPassword;
        public string UserPassword
        {
            get { return _UserPassword; }
            set 
            {
                _UserPassword = value;
                Save();
            }
        }

        private float _Zoom;
        public float Zoom
        {
            get { return _Zoom; }
            set
            {
                _Zoom = value;
                Save();
            }
        }

        private float _Latitude;
        public float Latitude
        {
            get { return _Latitude; }
            set
            {
                _Latitude = value;
                Save();
            }
        }

        private float _Longitude;
        public float Longitude
        {
            get { return _Longitude; }
            set
            {
                _Longitude = value;
                Save();
            }
        }

        private bool _NotificationTokenUpdated;
        public bool NotificationTokenUpdated
        {
            get { return _NotificationTokenUpdated; }
            set
            {
                _NotificationTokenUpdated = value;
                Save();
            }
        }

        private string _FirebaseMessage;
        public string FirebaseMessage
        {
            get { return _FirebaseMessage; }
            set
            {
                _FirebaseMessage = value;
                Save();
            }
        }

        private string _NotificationToken;
        public string NotificationToken
        {
            get { return _NotificationToken; }
            set
            {
                _NotificationToken = value;
                Save();
            }
        }

        private string _FirebaseID;
        public string FirebaseID
        {
            get { return _FirebaseID; }
            set
            {
                _FirebaseID = value;
                Save();
            }
        }

        public C_SitesFilter SitesFilter;

        private C_YMD _SeasonFirstDate;
        public C_YMD SeasonFirstDate
        {
            get { return _SeasonFirstDate; }
            set
            {
                _SeasonFirstDate = value;
                Save();
            }
        }

        private C_YMD _SeasonLastDate;
        public C_YMD SeasonLastDate
        {
            get { return _SeasonLastDate; }
            set
            {
                _SeasonLastDate = value;
                Save();
            }
        }

        private List<string> _PreferedSites;

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

        public C_PersistentSettings()
        {
            _Zoom = 10.0f;
            _Latitude = 29.41541f;
            _Longitude = -98.491823f;

            _NotificationTokenUpdated = false;

            SitesFilter = new C_SitesFilter();
            SitesFilter.FilterChanged += SitesFilter_FilterChanged;

            _SeasonFirstDate = new C_YMD(2019, 01, 01);
            _SeasonLastDate = new C_YMD(2019, 04, 15);

            _PreferedSites = new _List<string>();
            //PreferedSites.ListChanged += PreferedSites_ListChanged;

            try
            {
                string settings_json_s = GetSharedPreferences(N_PersistentSettings, "");

                JsonValue settings_json = JsonValue.Parse(settings_json_s);

                if (settings_json.ContainsKey(N_UserEmail))
                    _UserEmail = Tools.JsonProcessString(settings_json[N_UserEmail], null);

                if (settings_json.ContainsKey(N_UserPassword))
                    _UserPassword = Tools.JsonProcessString(settings_json[N_UserPassword], null);

                if (settings_json.ContainsKey(N_Zoom))
                    _Zoom = Tools.JsonProcessFloat(settings_json[N_Zoom], 10.0f);

                if (settings_json.ContainsKey(N_Latitude))
                    _Latitude = Tools.JsonProcessFloat(settings_json[N_Latitude], 10.0f);

                if (settings_json.ContainsKey(N_Longitude))
                    _Longitude = Tools.JsonProcessFloat(settings_json[N_Longitude], 10.0f);

                if (settings_json.ContainsKey(N_FirebaseUpdated))
                    _NotificationTokenUpdated = Tools.JsonProcessBool(settings_json[N_FirebaseUpdated], false);

                if (settings_json.ContainsKey(N_FirebaseMessage))
                    _FirebaseMessage = Tools.JsonProcessString(settings_json[N_FirebaseMessage], null);

                if (settings_json.ContainsKey(N_FirebaseToken))
                    _NotificationToken = Tools.JsonProcessString(settings_json[N_FirebaseToken], null);

                if (settings_json.ContainsKey(N_FirebaseID))
                    _FirebaseID = Tools.JsonProcessString(settings_json[N_FirebaseID], null);

                if (settings_json.ContainsKey(N_SitesFilter))
                {
                    JsonValue jv = settings_json[N_SitesFilter];
                    foreach (JsonValue jvv in jv)
                    {
                        SitesFilter = new C_SitesFilter(jvv);
                        SitesFilter.FilterChanged += SitesFilter_FilterChanged;
                        break;
                    }
                }

                if (settings_json.ContainsKey(N_FirstDate))
                    _SeasonFirstDate = Tools.JsonProcessDate(settings_json[N_FirstDate], new C_YMD(2019, 01, 01));

                if (settings_json.ContainsKey(N_LastDate))
                    _SeasonLastDate = Tools.JsonProcessDate(settings_json[N_LastDate], new C_YMD(2019, 01, 01));

                if (settings_json.ContainsKey(N_PreferedSites))
                {
                    JsonValue jv = settings_json[N_PreferedSites];
                    if (jv is JsonArray)
                    {
                        _PreferedSites = new _List<string>();
                        //PreferedSites.ListChanged += PreferedSites_ListChanged;
                        foreach (JsonValue jvv in jv)
                        {
                            string s = Tools.JsonProcessString(jvv, "");
                            if (!string.IsNullOrWhiteSpace(s))
                                _PreferedSites.Add(s);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
#if DEBUG
                Console.WriteLine("Failed to obtain the persistent settings. [" + ex.Message + "]");
#endif
            }
        }

        //void PreferedSites_ListChanged(object sender, EventArgs e)
        //{
        //    Save();
        //}

        void SitesFilter_FilterChanged(object sender, EventArgs e)
        {
            Save();
        }

        private void Save()
        {
            C_JsonBuilder jb = new C_JsonBuilder();

            jb.Add(UserEmail, N_UserEmail);
            jb.Add(UserPassword, N_UserPassword);

            jb.Add(Zoom, N_Zoom);
            jb.Add(Latitude, N_Latitude);
            jb.Add(Longitude, N_Longitude);

            jb.Add(NotificationTokenUpdated, N_FirebaseUpdated);
            jb.Add(FirebaseMessage, N_FirebaseMessage);
            jb.Add(FirebaseID, N_FirebaseID);
            jb.Add(NotificationToken, N_FirebaseToken);

            //jb.Add(SitesFilter.ToJson(), N_SitesFilter);
            jb.StartArray(N_SitesFilter);
            jb.AddArrayObject(SitesFilter.ToJson());
            jb.EndArray();

            jb.Add(SeasonFirstDate, N_FirstDate);
            jb.Add(SeasonLastDate, N_LastDate);

            jb.StartArray(N_PreferedSites);
            foreach (string s in _PreferedSites)
                jb.AddArrayElement(s);
            jb.EndArray();

            string jbstring = jb.ToString();
            PutSharedPreferences(N_PersistentSettings, jbstring);
#if DEBUG
            try
            {
                string check = GetSharedPreferences(N_PersistentSettings);
                if (check != jbstring)
                    Console.WriteLine("save and read from shared preferences failed");
                JsonValue jvt = JsonValue.Parse(check);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
#endif
        }

        public void AddPreferedSite(string slug)
        {
            if (!_PreferedSites.Contains(slug))
                _PreferedSites.Add(slug);
            Save();
        }

        public void RemovePreferedSite(string slug)
        {
            if (_PreferedSites.Contains(slug))
                _PreferedSites.Remove(slug);
            Save();
        }

        public List<string> GetPreferedSites()
        {
            return _PreferedSites.ToList();
        }

        public void ClearPreferedSites()
        {
            _PreferedSites = new List<string>();
        }

        public bool IsPreferedSite(string siteslug)
        {
            return _PreferedSites.Contains(siteslug);
        }

        private string GetSharedPreferences(string key, string defaultValue = null)
        {
            string res = NSUserDefaults.StandardUserDefaults.StringForKey(key);
            if (string.IsNullOrWhiteSpace(res))
                res = defaultValue;

            return res;
        }

        private void PutSharedPreferences(string key, string value)
        {
            NSUserDefaults.StandardUserDefaults.SetString(value, key);
        }

        public class _List<T> : List<T>
        {
            public event EventHandler ListChanged;

            readonly List<T> _list;
            public _List()
            {
                _list = new List<T>();
            }

            public new void Add(T item)
            {
                _list.Add(item);
                ListChanged?.Invoke(this, new EventArgs());
            }

            public new void Remove(T item)
            {
                _list.Remove(item);
                ListChanged?.Invoke(this, new EventArgs());
            }

            public new bool Contains(T item)
            {
                return _list.Contains(item);
            }

            public List<T> ToList()
            {
                List<T> res = new List<T>();
                foreach (T t in _list)
                    res.Add(t);

                return res;
            }
        }
    }
}
