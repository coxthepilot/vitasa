using System;
using System.Json;
using System.Net;
using System.Threading.Tasks;
using System.Text;

namespace zsquared
{
    public enum E_Certification { Basic, Advanced, Unknown };

    public static class C_Registration
    {
        public static async Task<bool> SubmitRegistration(string username, string email, string password, string phone, E_Certification cert)
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
                        + "\"name\" : \"" + username + "\""
                        + ",\"email\" : \"" + email + "\""
                        + ",\"password\" : \"" + password + "\""
                        + ",\"password_confirmation\" : \"" + password + "\""
                        + ",\"phone\" : \"" + phone + "\""
                        + ",\"certification\" : \"" + cert.ToString() + "\""
                        + "}";

                    string submiturl = "/users";
                    WebClient wc = new WebClient()
                    {
                        BaseAddress = C_Vita.VitaCoreUrl
                    };
                    wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
                    wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

                    byte[] dataBytes = Encoding.UTF8.GetBytes(bodyjson);
                    // do the actual web request
                    byte[] responseBytes = await wc.UploadDataTaskAsync(submiturl, "POST", dataBytes);

                    string responseString = Encoding.UTF8.GetString(responseBytes);
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
