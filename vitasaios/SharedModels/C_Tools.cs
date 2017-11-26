using System;
using System.Json;
using System.Net;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;

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

        public static void UpdateBytesCounter(int b)
        {
#if __ANDROID__
            a_vitavol.MainActivity.BytesReceived += b;
#else
            var myAppDelegate = UIKit.UIApplication.SharedApplication.Delegate;
            I_Global iad = myAppDelegate as I_Global;
            iad.UpdateBytesReceived(b);
#endif
		}

		public static async Task<string> Upload(string httpOp, string submiturl, string bodyjson, string token)
		{
			int retryCount = 0;
			bool retry = false;
			string responseString = null;
			do
			{
				try
				{
					retry = false;

					WebClient wc = new WebClient()
					{
						BaseAddress = C_Vita.VitaCoreUrl
					};
                    if (token != null)
	    				wc.Headers.Add(HttpRequestHeader.Cookie, token);
					wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
					wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

					responseString = await wc.UploadStringTaskAsync(submiturl, httpOp, bodyjson);

					UpdateBytesCounter(responseString.Length);
				}
				catch (WebException we)
				{
					if (we.Status == WebExceptionStatus.ReceiveFailure)
					{
						retry = retryCount < 3;
						retryCount++;
#if DEBUG
						Console.WriteLine(we.Message);
#endif
					}
					else
					{
#if DEBUG
						Console.WriteLine(we.Message);
#endif
						retry = false;
					}
				}
				catch (Exception e)
				{
#if DEBUG
					Console.WriteLine(e.Message);
#endif
				}
			}
			while (retry);

			return responseString;
		}

		public static async Task<string> Download(string submiturl, string token)
		{
			int retryCount = 0;
			bool retry = false;
			string responseString = null;
			do
			{
				try
				{
					retry = false;

					WebClient wc = new WebClient()
					{
						BaseAddress = C_Vita.VitaCoreUrl
					};
                    if (token != null)
    					wc.Headers.Add(HttpRequestHeader.Cookie, token);
					wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
					wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

                    responseString = await wc.DownloadStringTaskAsync(submiturl);

					UpdateBytesCounter(responseString.Length);
				}
				catch (WebException we)
				{
					if (we.Status == WebExceptionStatus.ReceiveFailure)
					{
						retry = retryCount < 3;
						retryCount++;
#if DEBUG
						Console.WriteLine(we.Message);
#endif
					}
					else
					{
#if DEBUG
						Console.WriteLine(we.Message);
#endif
						retry = false;
                        responseString = null;
					}
				}
				catch (Exception e)
				{
#if DEBUG
					Console.WriteLine(e.Message);
#endif
                    responseString = null;
                    retry = false;
				}
			}
			while (retry);

			return responseString;
		}

	}

    public interface I_Global
    {
        C_Global GetGlobal();
        long GetBytesReceived();
        void UpdateBytesReceived(int v);
    }
}
