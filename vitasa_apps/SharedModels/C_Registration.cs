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
    }
}
