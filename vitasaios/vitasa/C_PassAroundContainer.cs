using System;
using System.Collections.Generic;

namespace vitasa
{
    public class C_PassAroundContainer
    {
        /// <summary>
        /// The list of sites loaded from the backend 
        /// </summary>
        public List<C_VitaSite> Sites;
        /// <summary>
        /// The time stamp when sites was loaded from the backend.
        /// </summary>
        public DateTime TimeStampWhenSitesLoaded;
        /// <summary>
        /// The current selected site for displaying details
        /// </summary>
        public C_VitaSite SelectedSite;

        public C_PassAroundContainer()
        {
        }
    }
}
