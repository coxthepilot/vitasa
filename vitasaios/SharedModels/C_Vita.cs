using System;
using System.Json;
//using System.IO;
using System.Net;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Text;
using System.Net.Http;
using System.Net.Http.Headers;
//using UIKit;
//using System.Linq;

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
	}
}
