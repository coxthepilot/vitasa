using System.Json;

namespace zsquared
{
    /// <summary>
    /// The details for a site that a user is a site coordinator for.
    /// </summary>
    public class C_SiteCoordinated
    {
        /// <summary>
        /// The id of the site.
        /// </summary>
        public int SiteId;
        /// <summary>
        /// The slug for the site.
        /// </summary>
        public string Slug;
        /// <summary>
        /// Site name.
        /// </summary>
        public string Name;

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

		public override bool Equals(System.Object obj)
		{
			if (obj == null)
				return false;

			C_SiteCoordinated g = obj as C_SiteCoordinated;
			if ((System.Object)g == null)
				return false;

			bool res = true;

            res &= SiteId == g.SiteId;
			if (Slug != null)
				res &= Slug == g.Slug;
			if (Name != null)
				res &= Name == g.Name;

			return res;
		}

		public static bool operator ==(C_SiteCoordinated a, C_SiteCoordinated b)
		{
			// If both are null, or both are same instance, return true.
			if (System.Object.ReferenceEquals(a, b))
			{
				return true;
			}

			// If one is null, but not both, return false.
			if (((object)a == null) || ((object)b == null))
			{
				return false;
			}

			// Return true if the fields match:
			return a.Equals(b);
		}

		public static bool operator !=(C_SiteCoordinated a, C_SiteCoordinated b)
		{
			return !(a == b);
		}

		public override int GetHashCode()
		{
			int hash = 269;
            hash = (hash * 47) * SiteId.GetHashCode();
            hash = (hash * 47) * Slug.GetHashCode();
            hash = (hash * 47) * Name.GetHashCode();

			return hash;
		}

    }
}
