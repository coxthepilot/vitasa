using System;
using System.Json;
using System.IO;
using System.Net;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Text;
using System.Net.Http;
using UIKit;
using System.Linq;

namespace zsquared
{
    public enum E_SuggestionStatus { Open, Closed, WontFix, InProgress, Unknown }

    public class C_Suggestion
    {
        public int id;
        public int UserId;
        public string Subject;
        public string Text;
        public C_YMD Date;
        public E_SuggestionStatus Status;
        public bool FromPublic;
        public bool dirty; // not save or restored

        public static readonly string N_ID = "id";
        public static readonly string N_UserId = "user_id";
        public static readonly string N_Subject = "subject";
        public static readonly string N_Text = "details";
        public static readonly string N_Date = "created_at";
        public static readonly string N_Status = "status";
        public static readonly string N_FromPublic = "from_public";

        public C_Suggestion()
        {
            id = -1; // make sure we know that this a new item, never from the DB (yet)
            Status = E_SuggestionStatus.Open;
        }

        public C_Suggestion(JsonValue j)
        {
            if (!(j is JsonObject))
                throw new ApplicationException("we can only work with an object");

            if (j.ContainsKey(N_ID))
                id = Tools.JsonProcessInt(j[N_ID], id);

            if (j.ContainsKey(N_UserId))
                UserId = Tools.JsonProcessInt(j[N_UserId], UserId);

            if (j.ContainsKey(N_Subject))
                Subject = Tools.JsonProcessString(j[N_Subject], Subject);

            if (j.ContainsKey(N_Text))
            {
                string unescapedText = Tools.JsonProcessString(j[N_Text], Text);
                if (unescapedText != null)
                    Text = unescapedText.Replace("\\n", "\n");
            }

            if (j.ContainsKey(N_Date))
                Date = Tools.JsonProcessDate(j[N_Date], Date);

            if (j.ContainsKey(N_FromPublic))
                FromPublic = Tools.JsonProcessBool(j[N_FromPublic], FromPublic);

			if (j.ContainsKey(N_Status))
            {
                string ssv = Tools.JsonProcessString(j[N_Status], E_SuggestionStatus.Unknown.ToString());
                Status = Tools.StringToEnum<E_SuggestionStatus>(ssv);
            }

            dirty = false;
        }

		public static List<C_Suggestion> ImportSuggestion(JsonValue json)
		{
			if (!(json is JsonArray))
				throw new ApplicationException("the sites list must be an array");

			// create the holding place for the results
			List<C_Suggestion> res = new List<C_Suggestion>();
			foreach (JsonValue j in json)
			{
				C_Suggestion vs = new C_Suggestion(j);
				res.Add(vs);
			}

			return res;
		}
	}
}