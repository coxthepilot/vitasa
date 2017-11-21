using System.Json;

namespace zsquared
{
    /// <summary>
    /// The details for a site that a user is a site coordinator for.
    /// </summary>
    public class C_SiteCoordinated
    {
        public int SiteId;          // id for the site
        public string Slug;         // site's slug
        public string Name;         // site's name

        public static readonly string N_SiteID = "id";
        public static readonly string N_Slug = "slug";
        public static readonly string N_Name = "name";

        public C_SiteCoordinated(JsonValue jv)
        {
            if (jv.ContainsKey(N_SiteID))
                SiteId = Tools.JsonProcessInt(jv[N_SiteID], SiteId);

			if (jv.ContainsKey(N_Slug))
                Slug = Tools.JsonProcessString(jv[N_Slug], Slug);

			if (jv.ContainsKey(N_Name))
                Name = Tools.JsonProcessString(jv[N_Name], Name);
		}
    }
}
