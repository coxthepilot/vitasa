using System;
using Android.Content;

namespace zsquared
{
    public static class C_SharedPreferencesY
    {
        public static string GetSharedPreferences(Android.App.Activity a, string key, string defaultValue = null)
        {
            ISharedPreferences SharedPreferences = a.GetSharedPreferences("vitasa", FileCreationMode.MultiProcess);
            string res = SharedPreferences.GetString(key, defaultValue);

            return res;
        }

        public static void PutSharedPreferences(Android.App.Activity a, string key, string value)
        {
            ISharedPreferences SharedPreferences = a.GetSharedPreferences("vitasa", FileCreationMode.MultiProcess);
            ISharedPreferencesEditor Editor = SharedPreferences.Edit();
            Editor.PutString(key, value);
            Editor.Commit();
        }
    }
}
