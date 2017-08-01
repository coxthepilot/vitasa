using System;
using System.Collections.Generic;

namespace vitasa
{
    public enum E_CameFrom {List, Map, Unknown }

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
        /// <summary>
        /// The details view controller needs to know where to go "Back" to
        /// </summary>
        public E_CameFrom DetailsCameFrom = E_CameFrom.Unknown;

        public C_PassAroundContainer()
        {
        }
    }
}
