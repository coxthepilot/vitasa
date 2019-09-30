using System;
using System.Collections.Generic;

namespace zsquared
{
    public static class C_StoredUserCredentials
    {
        public static Dictionary<string, string> GetUserCredentials(Android.App.Activity a)
        {
            Dictionary<string, string> res = null;

            string email = C_SharedPreferences.GetSharedPreferences(a, "email");
            string pw = C_SharedPreferences.GetSharedPreferences(a, "password");

            if (!string.IsNullOrWhiteSpace(email) && !string.IsNullOrWhiteSpace(pw))
            {
                res = new Dictionary<string, string>
                {
                    { "email", email },
                    { "password", pw }
                };
            }

            return res;
        }

        public static void UpdateUserCredentials(Android.App.Activity a, string email, string pw)
        {
            if (string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(pw))
                return;

            C_SharedPreferences.PutSharedPreferences(a, "email", email);
            C_SharedPreferences.PutSharedPreferences(a, "password", pw);
        }

        public static void ClearUserCredentials(Android.App.Activity a)
        {
            C_SharedPreferences.PutSharedPreferences(a, "email", "");
            C_SharedPreferences.PutSharedPreferences(a, "password", "");
        }
    }
}
