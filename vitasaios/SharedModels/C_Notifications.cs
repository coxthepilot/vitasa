using System;
using System.Threading.Tasks;
using System.Json;
using System.Net;
using System.Text;

namespace zsquared
{
    public static class C_Notifications
    {
        public enum E_Platform { iOS, Android, SMS }

        public const string N_RegistrationToken = "token";
        public const string N_Platform = "platform";

        public static async Task<bool> RegisterNotificationToken(E_Platform platform, string deviceToken, string authToken)
        {
			bool success = false;
			try
			{
				string bodyjson = "{ "
					+ "\"" + N_RegistrationToken + "\" : \"" + deviceToken + "\""
                    + ","
                    + "\"" + N_Platform + "\" : \"" + platform.ToString().ToLower() + "\""
					+ "}";

				string submiturl = "/notification_registrations";
				WebClient wc = new WebClient()
				{
					BaseAddress = C_Vita.VitaCoreUrl
				};
				wc.Headers.Add(HttpRequestHeader.Cookie, authToken);
				wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
				wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

                string responseString = await wc.UploadStringTaskAsync(submiturl, "POST", bodyjson);

				JsonValue responseJson = JsonValue.Parse(responseString);
				// what is the response?
				success = true;
			}
			catch (Exception e)
			{
#if DEBUG
				Console.WriteLine(e.Message);
#endif
				success = false;
			}

			return success;
		}
    }
}
