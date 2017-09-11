using System;
using System.Json;
using System.IO;
using System.Net;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Text;
using System.Net.Http;
using UIKit;

namespace zsquared
{
    public enum E_Certification { Basic, Advanced, Unknown };
    public class C_Registration
    {
        public static async Task<bool> SubmitRegistration(string username, string email, string password, string phone, E_Certification cert)
        {
            bool success = false;
			try
			{
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

                success = true;
			}
			catch (Exception e)
			{
                success = false;
			}

			return success;        
        }
    }
}
