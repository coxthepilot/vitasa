using System;
using System.Threading.Tasks;
using System.Json;
using System.Net;

namespace zsquared
{
    public static class C_Notifications
    {
        public enum E_Platform { iOS, Android, SMS }

        public const string N_RegistrationToken = "token";
        public const string N_Platform = "platform";

        /// <summary>
        /// Registers a token with the backend for use in sending notifications.
        /// </summary>
        /// <returns>The notification token.</returns>
        /// <param name="platform">Platform.</param>
        /// <param name="deviceToken">This is the token that we are to save, obtained from the push provider</param>
        /// <param name="authToken">this is the cookie that allows us to access the backend</param>
        public static async Task<bool> RegisterNotificationToken(E_Platform platform, string deviceToken, string authToken)
        {
			int retryCount = 0;
			bool retry = false;

			bool success = false;
            do
            {
                try
                {
                    retry = false;
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
				catch (WebException we)
				{
					if (we.Status == WebExceptionStatus.ReceiveFailure)
					{
						success = false;
						retry = retryCount < 3;
						retryCount++;
					}
				}
				catch (Exception e)
                {
#if DEBUG
                    Console.WriteLine(e.Message);
#endif
                    success = false;
                }
            }
            while (retry);

			return success;
		}
    }
}
