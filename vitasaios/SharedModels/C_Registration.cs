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
        public const string N_Name = "name";
        public const string N_Email = "email";
        public const string N_Password = "password";
        public const string N_PasswordConfirmation = "password_confirmation";
        public const string N_Phone = "phone";
        public const string N_Certification = "certification";

        public static async Task<bool> SubmitRegistration(string username, string email, string password, string phone, E_Certification cert)
        {
            C_JsonBuilder jb = new C_JsonBuilder();
            jb.Add(username, N_Name);
            jb.Add(email, N_Email);
            jb.Add(password, N_Password);
            jb.Add(password, N_PasswordConfirmation);
            jb.Add(phone, N_Phone);
            jb.Add(cert.ToString(), N_Certification);
            string bodyjson = jb.ToString();

			string submiturl = "/users/";

            string responseString = await Tools.Upload("POST", submiturl, bodyjson, null);

            return responseString != null;
        }
    }
}
