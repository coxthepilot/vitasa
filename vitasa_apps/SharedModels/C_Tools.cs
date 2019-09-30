using System;
using System.Json;
using System.Collections.Generic;
using System.Text.RegularExpressions;

namespace zsquared
{
    public static class Tools
    {
        public static T StringToEnum<T>(string v)
        {
            T res = default(T);

            foreach (T ss in Enum.GetValues(typeof(T)))
            {
                if (v == ss.ToString())
                {
                    res = ss;
                    break;
                }
            }

            return res;
        }

        public static List<T> EnumToList<T>()
        {
            List<T> tlist = new List<T>();

            foreach (T ss in Enum.GetValues(typeof(T)))
            {
                tlist.Add(ss);
            }

            return tlist;
        }

        public static List<DayOfWeek> DaysOfWeekList()
        {
            List<DayOfWeek> tlist = new List<DayOfWeek>();

            foreach (DayOfWeek ss in Enum.GetValues(typeof(DayOfWeek)))
                tlist.Add(ss);

            return tlist;
        }

        public static int JsonProcessInt(JsonValue jv, int defValue)
        {
            int res = defValue;
            if (jv == null)
                res = defValue;
            else if (jv.JsonType == JsonType.Number)
                res = jv;
            else if (jv.JsonType == JsonType.String)
            {
                try
                {
                    string ns = (string)jv;
                    int ix = Convert.ToInt32(ns);
                    res = ix;
                }
                catch
                {
                    res = defValue;
                }
            }
            return res;
        }

        public static string JsonProcessString(JsonValue jv, string defValue)
        {
            string res = defValue;
            if (jv == null)
                res = defValue;
            else if (jv.JsonType == JsonType.String)
                res = jv;

            return res;
        }

        public static C_YMD JsonProcessDate(JsonValue jv, C_YMD defValue)
        {
            C_YMD res = defValue;

            if (jv == null)
                res = defValue;
            else if (jv.JsonType == JsonType.String)
            {
                try
                {
                    res = new C_YMD((string)jv);
                }
                catch
                {
                    res = defValue;
                }
            }

            return res;
        }

        public static DateTime JsonProcessDateTime(JsonValue jv, DateTime defValue)
        {
            DateTime res = defValue;

            if (jv == null)
                res = defValue;
            else if (jv.JsonType == JsonType.String)
            {
                try
                {
                    string s_jv = (string)jv;
                    res = DateTime.Parse(s_jv, null, System.Globalization.DateTimeStyles.RoundtripKind);
                }
                catch
                {
                    res = defValue;
                }
            }

            return res;
        }

        public static C_HMS JsonProcessTime(JsonValue jv, C_HMS defValue)
        {
            C_HMS res = defValue;

            if (jv == null)
                res = defValue;
            else if (jv.JsonType == JsonType.String)
            {
                try
                {
                    res = new C_HMS((string)jv);
                }
                catch
                {
                    res = defValue;
                }
            }
            else if (jv.JsonType == JsonType.Object)
            {
                int hour = 0;
                int min = 0;
                if (jv.ContainsKey("hour"))
                    hour = JsonProcessInt(jv["hour"], 0);
                if (jv.ContainsKey("minute"))
                    min = JsonProcessInt(jv["minute"], 0);
                res = new C_HMS(hour, min, 0);
            }

            return res;
        }

        public static float JsonProcessFloat(JsonValue jv, float defValue)
        {
            float res = defValue;

            if (jv == null)
                res = defValue;
            else if (jv.JsonType == JsonType.Number)
                res = (float)jv;
            else if (jv.JsonType == JsonType.String)
            {
                try
                {
                    string ns = jv;
                    res = Convert.ToSingle(ns);
                }
                catch
                {
                    res = defValue;
                }
            }

            return res;
        }

        public static bool JsonProcessBool(JsonValue jv, bool defValue)
        {
            bool res = defValue;

            if (jv == null)
                res = defValue;
            else if (jv.JsonType == JsonType.Boolean)
                res = jv;
            else if (jv.JsonType == JsonType.String)
                res = (string)jv == "true";

            return res;
        }

        public static bool EmailAddressIsValid(string email)
        {
            const string pattern = @"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$";
            const RegexOptions options = RegexOptions.Compiled | RegexOptions.IgnoreCase | RegexOptions.ExplicitCapture;

            Regex regex = new Regex(pattern, options);
            var res = regex.Match(email);

            return res.Length > 0;
        }

        public static string FixCamelCaseDisplay(string s)
        {
            string res = "";

            bool first = true;
            foreach (char c in s)
            {
                if (!first)
                {
                    if (char.IsUpper(c))
                        res += ' ';
                }

                res += c;

                first = false;
            }

            return res;
        }
    }
}
