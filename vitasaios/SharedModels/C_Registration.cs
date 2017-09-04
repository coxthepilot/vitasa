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
        public C_Registration()
        {
        }

        public static async Task<bool> SubmitRegistration(string username, string email, string password, string phone, E_Certification cert)
        {
            // todo: move over to use SSL; hangs if using SSL
            //SetupCertificateHandling(); // only needed if SSL

            string submiturl = C_Vita.VitaCoreUrlSSL + "/users";

			string bodyjson = "{ "
				+ "\"name\" : \"" + username + "\""
				+ ",\"email\" : \"" + email + "\""
				+ ",\"password\" : \"" + password + "\""
				+ ",\"password_confirmation\" : \"" + password + "\""
				+ ",\"phone\" : \"" + phone + "\""
                + ",\"certification\" : \"" + cert.ToString() + "\""
				+ "}";

			bool error = false;
			try
			{
				WebClient wc = new WebClient()
				{
                    BaseAddress = C_Vita.VitaCoreUrlSSL
				};
				wc.Headers.Add(HttpRequestHeader.ContentType, "application/json");
				wc.Headers.Add(HttpRequestHeader.Accept, "application/json");

				byte[] dataBytes = Encoding.UTF8.GetBytes(bodyjson);
                // do the actual web request
                byte[] responseBytes = await wc.UploadDataTaskAsync(submiturl, "POST", dataBytes);

				string responseString = Encoding.UTF8.GetString(responseBytes);
				JsonValue responseJson = JsonValue.Parse(responseString);
                // if it parses then it is our success result
                error = false;
			}
			catch (Exception e)
			{
				Console.WriteLine("Attempt to update site status or response parsing failed: " + e.Message);
				error = true;
			}

			return !error;        
        }
    }
}
