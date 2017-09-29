using System;
using System.Json;

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
	}
}
