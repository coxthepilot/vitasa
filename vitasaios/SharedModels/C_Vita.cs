using System;
using System.Net;

namespace zsquared
{
    public static class C_Vita
    {
        public static void SetupCertificateHandling(string host)
		{
			ServicePointManager.ServerCertificateValidationCallback += (sender, certificate, chain, sslPolicyErrors) =>
			{
				System.Security.Cryptography.X509Certificates.X509Certificate cert = certificate;

                string issuer = cert.Issuer;
                // CN=Let's Encrypt Authority X3, O=Let's Encrypt, C=US
                bool res = issuer.Contains("Let's Encrypt Authority");

    //            string issuer = cert.Subject;
    //            string[] issuers = issuer.Split(new char[] { '=' });

				////string issuer = cert.Issuer;
				////string[] issuers = issuer.Split(new char[] { '=' });

				//bool res = issuers.Length == 2;
				//if (res)
					//res = issuers[1] == host;
                //res = issuers[1] == "vitasa.abandonedfactory.net";

                if (!res)
                    Console.WriteLine("failed to validate certificate.");

				return res;
			};
		}
	}
}
