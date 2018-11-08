using System;
using System.Collections.Generic;
using Foundation;

namespace zsquared
{
    public static class C_StoredUserCredentials
    {
        public static Dictionary<string, string> GetUserCredentials()
        {
            Dictionary<string, string> res = null;

            string email = NSUserDefaults.StandardUserDefaults.StringForKey("email");
            string pw = NSUserDefaults.StandardUserDefaults.StringForKey("password");

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

        public static void UpdateUserCredentials(string email, string pw)
        {
            if (string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(pw))
                return;

            NSUserDefaults.StandardUserDefaults.SetString(email, "email");
            NSUserDefaults.StandardUserDefaults.SetString(pw, "password");
        }

        public static void ClearUserCredentials()
        {
            NSUserDefaults.StandardUserDefaults.SetString("", "email");
            NSUserDefaults.StandardUserDefaults.SetString("", "password");
        }
    }
}
