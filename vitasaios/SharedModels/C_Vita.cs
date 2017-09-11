using System;
using System.Json;
using System.IO;
using System.Net;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Text;
using System.Net.Http;
using System.Net.Http.Headers;
using UIKit;
using System.Linq;

namespace zsquared
{
    public static class C_Vita
    {
		public static string VitaCoreUrlSSL = "https://vitasa.abandonedfactory.net";
		public static string VitaCoreUrl = "https://vitasa.abandonedfactory.net";

        public static void SetupCertificateHandling()
		{
			ServicePointManager.ServerCertificateValidationCallback += (sender, certificate, chain, sslPolicyErrors) =>
			{
				System.Security.Cryptography.X509Certificates.X509Certificate cert = certificate;
				string issuer = cert.Issuer;
				string[] issuers = issuer.Split(new char[] { '=' });
				bool res = issuers.Length == 2;
				if (res)
					res = issuers[1] == "vitasa.abandonedfactory.net";

				return res;
			};

		}

        /// <summary>
        /// Do the login using the provided email and password. This function makes the API call and
        /// either returns null or a C_VitaUser with a valid token. No throws from this function.
        /// </summary>
        /// <returns>The login.</returns>
        /// <param name="email">Email.</param>
        /// <param name="userPassword">User password.</param>
        public static async Task<C_VitaUser> PerformLogin(string email, string userPassword)
		{
            C_VitaUser user = null;
			try
            {
                // do the login with the api's
                string loginUrl = "/login";
                var client = new HttpClient()
                {
                    BaseAddress = new Uri(C_Vita.VitaCoreUrlSSL)
                };
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                string jsonData = "{"
                    + "\"email\" : \"" + email + "\""
                    + ",\"password\" : \"" + userPassword + "\""
                    + "}";

                var content = new StringContent(jsonData, Encoding.UTF8, "application/json");
                HttpResponseMessage response = await client.PostAsync(loginUrl, content);

                var result = await response.Content.ReadAsStringAsync();

                if (response.StatusCode != HttpStatusCode.OK)
                    return null;

                // success should include the user details
                JsonValue jv = JsonValue.Parse(result);
                user = new C_VitaUser(jv);

                // the headers should contain our token in the 'Set-Cookie' header
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

                user.Token = token;
            }
            catch 
            {
                user = null;
            }

			return user;
		}
	}
}
