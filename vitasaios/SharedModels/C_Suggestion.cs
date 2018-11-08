using System.Json;

namespace zsquared
{
    public enum E_SuggestionStatus { Open, Closed, WontFix, InProgress, Unknown }

    public class C_Suggestion
    {
        public int id;
        public readonly int UserId;
        public string Subject;
        public string Text;
        public readonly C_YMD CreateDate;
		public readonly C_YMD UpdateDate;
		public E_SuggestionStatus Status;
        public readonly bool FromPublic;

        public bool dirty; // not saved or restored

        public static readonly string N_ID = "id";
        public static readonly string N_UserId = "user_id";
        public static readonly string N_Subject = "subject";
        public static readonly string N_Text = "details";
        public static readonly string N_CreateDate = "created_at";
		public static readonly string N_UpdateDate = "created_at";
		public static readonly string N_Status = "status";
        public static readonly string N_FromPublic = "from_public";

        public C_Suggestion(int userId, C_YMD date, bool fromPublic)
        {
            id = -1; // make sure we know that this a new item, never from the DB (yet)
            Status = E_SuggestionStatus.Open;

            UserId = userId;
            CreateDate = date;
            UpdateDate = CreateDate;
            FromPublic = fromPublic;
        }

        public C_Suggestion(JsonValue j)
        {
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

            if (j.ContainsKey(N_CreateDate))
                CreateDate = Tools.JsonProcessDate(j[N_CreateDate], CreateDate);

            if (j.ContainsKey(N_UpdateDate))
                UpdateDate = Tools.JsonProcessDate(j[N_UpdateDate], UpdateDate);

			if (j.ContainsKey(N_Status))
            {
                string ssv = Tools.JsonProcessString(j[N_Status], E_SuggestionStatus.Unknown.ToString());
                Status = Tools.StringToEnum<E_SuggestionStatus>(ssv);
            }

            if (j.ContainsKey(N_FromPublic))
                FromPublic = Tools.JsonProcessBool(j[N_FromPublic], FromPublic);

            dirty = false;
        }
	}
}