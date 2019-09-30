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

                // CN=DigiCert Baltimore CA-2 G2, OU=www.digicert.com, O=DigiCert Inc, C=US
                if (!res)
                    res = issuer.Contains("OU=www.digicert.com");

#if DEBUG
                if (!res)
                    Console.WriteLine("failed to validate certificate.");
#endif
                return res;
			};
		}
	}
}
