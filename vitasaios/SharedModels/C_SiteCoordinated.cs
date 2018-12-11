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

        public bool Include;        // not saved

        public static readonly string N_SiteID = "id";
        public static readonly string N_Slug = "slug";
        public static readonly string N_Name = "name";

        public C_SiteCoordinated(JsonValue jv)
        {
            Include = false;

            if (jv.ContainsKey(N_SiteID))
                SiteId = Tools.JsonProcessInt(jv[N_SiteID], SiteId);

			if (jv.ContainsKey(N_Slug))
                Slug = Tools.JsonProcessString(jv[N_Slug], Slug);

			if (jv.ContainsKey(N_Name))
                Name = Tools.JsonProcessString(jv[N_Name], Name);
		}

        public C_SiteCoordinated(C_VitaSite site)
        {
            SiteId = site.id;
            Slug = site.Slug;
            Name = site.Name;
            Include = false;
        }

        public string ToJson()
        {
            C_JsonBuilder jb = new C_JsonBuilder();

            jb.Add(SiteId, N_SiteID);
            jb.Add(Slug, N_Slug);
            jb.Add(Name, N_Name);

            return jb.ToString();
        }

        public static int CompareByNameToLower(C_SiteCoordinated sc1, C_SiteCoordinated sc2)
        {
            return string.Compare(sc1.Name.ToLower(), sc2.Name.ToLower(), System.StringComparison.Ordinal);
        }
    }
}
