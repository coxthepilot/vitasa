using System;
using System.Json;
using System.Collections.Generic;

namespace zsquared
{
    public enum E_SuggestionStatus { Submitted, ActionPending, Closed, Enhancement, Unknown }
    
    public class C_Suggestion
    {
        public int id;
        public string Submitter;
        public string ManagingRegion;
        public string Title;
        public string Text;
        public C_YMD Date;
        public E_SuggestionStatus Status;

        public static readonly string N_ID = "id";
        public static readonly string N_Submitter = "submitter";
        public static readonly string N_Title = "title";
        public static readonly string N_ManagingRegion = "managingregion";
        public static readonly string N_Text = "text";
        public static readonly string N_Date = "date";
        public static readonly string N_Status = "status";

        public C_Suggestion()
        {
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


		public C_Suggestion(JsonValue j)
		{
			if (!(j is JsonObject))
				throw new ApplicationException("we can only work with an object");

			if (j.ContainsKey(N_ID))
				id = j[N_ID];

			if (j.ContainsKey(N_Submitter))
                Submitter = j[N_Submitter];

            if (j.ContainsKey(N_Title))
                Title = j[N_Title];

			if (j.ContainsKey(N_ManagingRegion))
                ManagingRegion = j[N_ManagingRegion];

			if (j.ContainsKey(N_Text))
                Text = j[N_Text];

            if (j.ContainsKey(N_Date))
                Date = new C_YMD((string)j[N_Date]);

			if (j.ContainsKey(N_Status))
			{
				string ssv = j[N_Status];

				foreach (E_SuggestionStatus ss in Enum.GetValues(typeof(E_SuggestionStatus)))
				{
					if (ssv == ss.ToString())
					{
						Status = ss;
						break;
					}
				}
			}
		}

	}
}
