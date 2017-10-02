using System.Net;

namespace zsquared
{
    public static class C_Vita
    {
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
