using System;
using System.Json;
using System.IO;
using System.Net;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Text;
using System.Net.Http;

namespace zsquared
{
    public class C_Vita
    {
		public static string VitaCoreUrl = "http://vitasa.abandonedfactory.net";
		public static string VitaCoreUrlSSL = "https://vitasa.abandonedfactory.net";
		//string vitaCoreUrl = "https://s3-us-west-2.amazonaws.com/vitasa-static-content-dev/sites.json";
		//string vitaCoreUrl = "https://h4ebpp3rvk.execute-api.us-west-2.amazonaws.com/production/sites";
		
        public C_Vita()
        {
        }

		public static void SetupCertificateHandling()
		{
			ServicePointManager.ServerCertificateValidationCallback += (sender, certificate, chain, sslPolicyErrors) =>
			{
				System.Security.Cryptography.X509Certificates.X509Certificate cert = (System.Security.Cryptography.X509Certificates.X509Certificate)certificate;
				string issuer = cert.Issuer;
				string[] issuers = issuer.Split(new char[] { '=' });
				bool res = issuers.Length == 2;
				if (res)
					res = issuers[1] == "vitasa.abandonedfactory.net";

				return res;
			};

		}

		public static async Task<string> PerformLogin(string userName, string userPassword)
		{
			string loginUrl = "/login";

			var client = new HttpClient();
			client.BaseAddress = new Uri(C_Vita.VitaCoreUrlSSL);

			string jsonData = "{\"email\" : \"" + userName + "\", \"password\" : \"" + userPassword + "\"}";

			C_Vita.SetupCertificateHandling();

			var content = new StringContent(jsonData, Encoding.UTF8, "application/json");
			HttpResponseMessage response = await client.PostAsync(loginUrl, content);

			var result = await response.Content.ReadAsStringAsync();

			if (response.StatusCode != HttpStatusCode.OK)
				return null;

			JsonValue jv = JsonValue.Parse(result);
			if (!jv.ContainsKey("message") || (jv["message"] != "Login successful"))
				return null;

			var headers = response.Headers;
			string setCookie = null;
			foreach (KeyValuePair<string, IEnumerable<string>> kvp in headers)
			{
				if (kvp.Key == "Set-Cookie")
				{
					foreach (string sc in kvp.Value)
					{
						setCookie = sc;
						break;
					}
				}
			}

			string token = null;
			string[] tokens = setCookie.Split(new char[] { ';' });
			foreach (string tok in tokens)
			{
				if (tok.Contains("_rails-base_session"))
				{
					token = tok;
					break;
				}
			}

			return token;
		}




	}
}
