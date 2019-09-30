namespace zsquared
{
    public enum E_CalendarDateDetailsSaveAction { None, Save, ReadOnly }
    public class C_CalendarDateDetails
    {
        public E_CalendarDateDetailsSaveAction SaveAction;
        public string MainTitle;
        public string SiteName;
        public string Date;
        public string Note;
        public C_CalendarEntry CalendarEntry;
        public E_ViewCameFrom CameFrom;
    }
}
