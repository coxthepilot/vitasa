using System;
using System.Collections.Generic;
using System.Json;

namespace zsquared
{
    public enum E_DateFilter { AllDays, Today, Tomorrow, TodayP2, TodayP3, TodayP4, TodayP5, TodayP6, ThisWeek };
    // Note: the following needs to include all items from E_SiteCapabilities
    public enum E_CapabilitiesFilter { Any, Virtual, Express, MFT, InPerson, Mobile };

    public class C_SitesFilter
    {
        private E_DateFilter _DateFilter;
        public E_DateFilter DateFilter
        {
            get { return _DateFilter; }
            set
            {
                _DateFilter = value;
                FilterChanged?.Invoke(this, new EventArgs());
            }
        }

        private List<E_CapabilitiesFilter> _CapabilitiesFilter;

        public event EventHandler FilterChanged;

        public static readonly string N_DateFilter = "datefilter";
        public static readonly string N_CapabilitiesFilters = "capabilitiesfilters";

        public C_SitesFilter()
        {
            DateFilter = E_DateFilter.AllDays;
            _CapabilitiesFilter = new List<E_CapabilitiesFilter>();
        }

        public C_SitesFilter(JsonValue j)
        {
            DateFilter = E_DateFilter.Today;
            _CapabilitiesFilter = new List<E_CapabilitiesFilter>();

            if (!(j is JsonObject))
                return;

            if (j.ContainsKey(N_DateFilter))
            {
                string ndf = Tools.JsonProcessString(j[N_DateFilter], DateFilter.ToString());
                DateFilter = Tools.StringToEnum<E_DateFilter>(ndf);
            }

            if (j.ContainsKey(N_CapabilitiesFilters))
            {
                var jv = j[N_CapabilitiesFilters];
                if (jv is JsonArray)
                {
                    foreach (JsonValue jav in jv)
                    {
                        string ncf = Tools.JsonProcessString(jav, null);
                        if (ncf != null)
                        {
                            E_CapabilitiesFilter cf = Tools.StringToEnum<E_CapabilitiesFilter>(ncf);
                            _CapabilitiesFilter.Add(cf);
                        }
                    }
                }
            }
        }

        public bool FilterIsActive()
        {
            return (DateFilter != E_DateFilter.AllDays) || !_CapabilitiesFilter.Contains(E_CapabilitiesFilter.Any);
        }

        public string ServicesAsString()
        {
            string res = "";

            foreach(E_CapabilitiesFilter cf in _CapabilitiesFilter)
            {
                if (res.Length > 0)
                    res += ", ";
                res += Tools.FixCamelCaseDisplay(cf.ToString());
            }

            return res;
        }

        public string ToJson()
        {
            C_JsonBuilder jb = new C_JsonBuilder();
            jb.Add(DateFilter.ToString(), N_DateFilter);

            jb.StartArray(N_CapabilitiesFilters);
            foreach (E_CapabilitiesFilter cf in _CapabilitiesFilter)
                jb.AddArrayElement(cf.ToString());
            jb.EndArray();

            string res = jb.ToString();
            return res;
        }

        public C_YMD GetDateForFilter()
        {
            C_YMD res = null;

            switch (DateFilter)
            {
                case E_DateFilter.Today: res = C_YMD.Now; break;
                case E_DateFilter.Tomorrow: res = C_YMD.Now.AddDays(1); break;
                case E_DateFilter.TodayP2: res = C_YMD.Now.AddDays(2); break;
                case E_DateFilter.TodayP3: res = C_YMD.Now.AddDays(3); break;
                case E_DateFilter.TodayP4: res = C_YMD.Now.AddDays(4); break;
                case E_DateFilter.TodayP5: res = C_YMD.Now.AddDays(5); break;
                case E_DateFilter.TodayP6: res = C_YMD.Now.AddDays(6); break;
                default: res = null; break;
            }

            return res;
        }

        public void AddSiteCapability(E_CapabilitiesFilter cf)
        {
            if (!_CapabilitiesFilter.Contains(cf))
            {
                _CapabilitiesFilter.Add(cf);
                FilterChanged?.Invoke(this, new EventArgs());
            }
        }

        public void RemoveSiteCapability(E_CapabilitiesFilter cf)
        {
            if (_CapabilitiesFilter.Contains(cf))
            {
                _CapabilitiesFilter.Remove(cf);
                FilterChanged?.Invoke(this, new EventArgs());
            }
        }

        public void ClearSiteCapabilities()
        {
            _CapabilitiesFilter.Clear();
            FilterChanged?.Invoke(this, new EventArgs());
        }

        public bool SiteCapabilityContains(E_CapabilitiesFilter cf)
        {
            return _CapabilitiesFilter.Contains(cf);
        }

        public int SiteCapabilitiesCount
        {
            get { return _CapabilitiesFilter.Count; }
        }

        public bool SiteHasCapabilities(C_VitaSite site, bool userHasMobile)
        {
            // if the user is not mobile, but the site is: it doesn't matter anything else, not a match
            if (!userHasMobile && (site.SiteType == E_SiteType.Mobile))
                return false;

            // if the filter is not looking for any capabilities in specific: then this is a match
            if (((_CapabilitiesFilter.Count == 0) || (_CapabilitiesFilter.Contains(E_CapabilitiesFilter.Any))) && (site.SiteType != E_SiteType.Mobile)) 
                return true;

            // we are now looking for sites that have at least one of the capabilities specified
            bool res = false;
            foreach (E_CapabilitiesFilter cf in _CapabilitiesFilter)
            {
                switch (cf)
                {
                    case E_CapabilitiesFilter.Virtual: res = site.SiteCapabilities.Contains(E_SiteCapabilities.DropOff); break;
                    case E_CapabilitiesFilter.Express: res = site.SiteCapabilities.Contains(E_SiteCapabilities.Express); break;
                    case E_CapabilitiesFilter.MFT: res = site.SiteCapabilities.Contains(E_SiteCapabilities.MFT); break;
                    case E_CapabilitiesFilter.InPerson: res = site.SiteCapabilities.Contains(E_SiteCapabilities.InPersonTaxPrep); break;
                    case E_CapabilitiesFilter.Mobile: res = site.SiteType == E_SiteType.Mobile; break;
                }
                // if the site has any of these desired capabilities, then this site is a match
                if (res)
                    break;
            }

            return res;
        }

        public static C_SitesFilter GetDefaultFilter(string filterjson)
        {
            C_SitesFilter Filter = new C_SitesFilter();
            if (filterjson != null)
            {
                try
                {
                    JsonValue filterjsonparsed = JsonValue.Parse(filterjson);
                    Filter = new C_SitesFilter(filterjsonparsed);
                }
                catch
                {
                    Filter = new C_SitesFilter();
                }
            }

            return Filter;
        }

        /// <summary>
        /// Convert the date filter into standard text replacing the P2..p6 with actual dates
        /// </summary>
        /// <returns>The friendly string.</returns>
        /// <param name="datefilter">Datefilter.</param>
        public static string GetFriendlyString(E_DateFilter datefilter)
        {
            string res = null;

            switch (datefilter)
            {
                case E_DateFilter.AllDays : res = datefilter.ToString(); break;
                case E_DateFilter.Today : res = datefilter.ToString(); break;
                case E_DateFilter.Tomorrow : res = datefilter.ToString(); break;
                case E_DateFilter.TodayP2 : res = C_YMD.Now.AddDays(2).ToString("dow mmm dd, yyyy"); break;
                case E_DateFilter.TodayP3: res = C_YMD.Now.AddDays(3).ToString("dow mmm dd, yyyy"); break;
                case E_DateFilter.TodayP4: res = C_YMD.Now.AddDays(4).ToString("dow mmm dd, yyyy"); break;
                case E_DateFilter.TodayP5: res = C_YMD.Now.AddDays(5).ToString("dow mmm dd, yyyy"); break;
                case E_DateFilter.TodayP6: res = C_YMD.Now.AddDays(6).ToString("dow mmm dd, yyyy"); break;
                default: res = "Unknown"; break;
            }

            return res;
        }
    }
}
