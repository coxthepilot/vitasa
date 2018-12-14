using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zsquared
{
    public enum C_YMDhmsKind { AsSpecified, PT, MT, CT, ET, UTC, Unknown }
    public enum C_YMDhmsStringFormat { C_YMDhms, CSV, EODdata, InteractiveBroker, Unknown }
    /// <summary>
    /// This class represents a year/month/day + hour/min/sec in Pacific time. It can import from UTC or Eastern time
    /// but the presented value is always Pacific time.
    /// </summary>
    public class C_YMDhms
    {
        public int _year = 2013;
        public int Year
        {
            get { return _year; }
            set
            {
                if ((value < DateTime.MinValue.Year) || (value > DateTime.MaxValue.Year))
                    throw new ApplicationException("Year value must be " + DateTime.MinValue.Year.ToString() + "..." + DateTime.MaxValue.Year.ToString());
                _year = value;
            }
        }

        public int _month = 1;
        public int Month
        {
            get { return _month; }
            set
            {
                if ((value < 1) || (value > 12))
                    throw new ApplicationException("Month value must be 1..12");
                _month = value;
            }
        }

        public int _day;
        public int Day
        {
            get { return _day; }
            set
            {
                if ((value < 1) || (value > 31))
                    throw new ApplicationException("Month value must be 1..31");
                _day = value;
            }
        }

        int _hour;
        public int Hour
        {
            get { return _hour; }
            set
            {
                if ((value < 0) || (value > 23))
                    throw new ApplicationException("Hour must be 0..23");
                _hour = value;
            }
        }

        int _minutes;
        public int Minutes
        {
            get { return _minutes; }
            set
            {
                if ((value < 0) || (value > 59))
                    throw new ApplicationException("Minutes must be 0..59");
                _minutes = value;
            }
        }

        public int _seconds;
        public int Seconds
        {
            get { return _seconds; }
            set
            {
                if ((value < 0) || (value > 59))
                    throw new ApplicationException("Seconds must be 0..59");
                _seconds = value;
            }
        }

        public C_YMDhms(DateTime dt, C_YMDhmsKind kind)
        {
            DateTime dtx = new DateTime(dt.Ticks);
            if (kind == C_YMDhmsKind.AsSpecified)
            {
                if (dt.Kind == DateTimeKind.Utc)
                    // should convert to pacific time (assumes local machine is on pacific time!)
                    dtx = TimeZoneInfo.ConvertTimeFromUtc(dt, TimeZoneInfo.Local);
                else if (dt.Kind == DateTimeKind.Unspecified)
                    throw new ApplicationException("Kind must be found in the DateTime object as either UTC or Local");
                else if (dt.Kind == DateTimeKind.Local)
                    dtx = TimeZoneInfo.ConvertTime(dt, TimeZoneInfo.Local, TimeZoneInfo.FindSystemTimeZoneById("America/Chicago"));
            }
            else if (kind == C_YMDhmsKind.UTC)
            {
                if (dt.Kind == DateTimeKind.Utc)
                    dtx = TimeZoneInfo.ConvertTimeFromUtc(dt, TimeZoneInfo.Local);
                else
                    throw new ApplicationException("Timezone kinds do not match");
            }
            else if (kind == C_YMDhmsKind.ET)
                dtx = TimeZoneInfo.ConvertTime(dt, TimeZoneInfo.FindSystemTimeZoneById("eastern standard time"), TimeZoneInfo.FindSystemTimeZoneById("central standard time"));
            else if (kind == C_YMDhmsKind.PT)
                dtx = TimeZoneInfo.ConvertTime(dt, TimeZoneInfo.FindSystemTimeZoneById("pacific standard time"), TimeZoneInfo.FindSystemTimeZoneById("central standard time"));
            else if (kind == C_YMDhmsKind.CT)
                dtx = TimeZoneInfo.ConvertTime(dt, TimeZoneInfo.FindSystemTimeZoneById("central standard time"), TimeZoneInfo.FindSystemTimeZoneById("central standard time"));
            else
                throw new ApplicationException("Unknown kind");

            Year = dtx.Year;
            Month = dtx.Month;
            Day = dtx.Day;
            Hour = dtx.Hour;
            Minutes = dtx.Minute;
            Seconds = dtx.Second;
        }

        public C_YMDhms(C_YMDhms from)
        {
            _year = from.Year;
            _month = from.Month;
            _day = from.Day;
            _hour = from.Hour;
            _minutes = from.Minutes;
            _seconds = from.Seconds;
        }

        private C_YMDhms(int y, int m, int d, int H, int M, int S)
        {
            Year = y;
            Month = m;
            Day = d;
            Hour = H;
            Minutes = M;
            Seconds = S;
        }

        /// <summary>
        /// Import a text string of a date and time, in a specified timezone, and using the specified format.
        /// </summary>
        /// <param name="s"></param>
        /// <param name="kind"></param>
        /// <param name="fmt"></param>
        public C_YMDhms(string s, C_YMDhmsKind kind, C_YMDhmsStringFormat fmt)
        {
            List<string> months = new List<string>() { "jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec" };
            if (fmt == C_YMDhmsStringFormat.CSV)
            {
                // "dd-mmm-yyyy", mm is 3 leters at front of month name
                string[] ss = s.Split(new char[] { '-' });
                if (ss.Length != 3)
                    throw new ApplicationException("Should only be 3 entries");

                Day = Convert.ToInt32(ss[0]);
                Year = Convert.ToInt32(ss[2]);
                string sm = ss[1].ToLower();
                if (!months.Contains(sm))
                    throw new ApplicationException("Should have found the month name; likely bad format");
                Month = months.IndexOf(sm) + 1;
                Hour = 0;
                Minutes = 0;
                Seconds = 0;
            }
            else if (fmt == C_YMDhmsStringFormat.EODdata)
            {
                throw new ApplicationException("todo");
            }
            else if (fmt == C_YMDhmsStringFormat.InteractiveBroker)
            {
                string[] ss = s.Split(new char[] { ' ', ':' });
                if (ss.Length != 5)
                    throw new ApplicationException("unknown format in convert from Interactive Broker format");
                string year_s = ss[0].Substring(0, 4);
                string month_s = ss[0].Substring(4, 2);
                string day_s = ss[0].Substring(6, 2);

                int year = Convert.ToInt32(year_s);
                int month = Convert.ToInt32(month_s);
                int day = Convert.ToInt32(day_s);
                int hour = Convert.ToInt32(ss[2]);
                int minute = Convert.ToInt32(ss[3]);
                int second = Convert.ToInt32(ss[4]);

                DateTime dt_et = new DateTime(year, month, day, hour, minute, second);
                DateTime res = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(dt_et, "eastern standard time", "pacific standard time");

                Year = res.Year;
                Month = res.Minute;
                Day = res.Day;
                Hour = res.Hour;
                Minutes = res.Minute;
                Seconds = res.Second;
            }
            else if (fmt == C_YMDhmsStringFormat.C_YMDhms)
            {
                // 012345678901234
                // YYYYMMDD hhmmss
                string year_s = s.Substring(0, 4);
                string month_s = s.Substring(4, 2);
                string day_s = s.Substring(6, 2);
                string hour_s = s.Substring(9, 2);
                string min_s = s.Substring(11, 2);
                string sec_s = s.Substring(13, 2);

                try
                {
                    Year = Convert.ToInt32(year_s);
                    Month = Convert.ToInt32(month_s);
                    Day = Convert.ToInt32(day_s);
                    Hour = Convert.ToInt32(hour_s);
                    Minutes = Convert.ToInt32(min_s);
                    Seconds = Convert.ToInt32(sec_s);
                }
                catch { }
            }
            else
                throw new ApplicationException("Unknown format");
        }

        public C_YMDhms(C_YMD ymd, C_HMS hms)
        {
            _year = ymd.Year;
            _month = ymd.Month;
            _day = ymd.Day;

            _hour = hms.Hour;
            _minutes = hms.Minutes;
            _seconds = hms.Seconds;
        }

        public long Ticks
        {
            get
            {
                DateTime dt = new DateTime(_year, _month, _day, _hour, _minutes, _seconds, DateTimeKind.Local);
                return dt.Ticks;
            }
        }

        public C_YMDhms(long ticks)
        {
            DateTime dt = new DateTime(ticks);
            DateTime dt_et = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(dt, "eastern standard time", "pacific standard time");

            Year = dt_et.Year;
            Month = dt_et.Month;
            Day = dt_et.Day;

            Hour = dt_et.Hour;
            Minutes = dt_et.Minute;
            Seconds = dt_et.Second;
        }

        public DateTime ToDateTime()
        {
            DateTime res = DateTime.MinValue;
            try
            {
                res = new DateTime(_year, _month, _day, _hour, _minutes, _seconds);
            }
            catch { }
            return res;
        }

        public C_YMD YMD
        {
            get { return new C_YMD(_year, _month, _day); }
        }

        public C_HMS HMS
        {
            get { return new C_HMS(_hour, _minutes, _seconds); }
        }

        public static C_YMDhms Now
        {
            get
            {
                DateTime now = DateTime.Now;
                return new C_YMDhms(now, C_YMDhmsKind.AsSpecified);
            }
        }

        public static C_YMDhms None
        {
            get 
            {
                return new C_YMDhms(0);
            }
        }

        public DayOfWeek DayOfWeek
        {
            get
            {
                DateTime dt = new DateTime(_year, _month, _day, _hour, _minutes, _seconds);
                return dt.DayOfWeek;
            }
        }

        public C_YMDhms AddDays(int num)
        {
            // make a copy
            C_YMDhms res = new C_YMDhms(this);

            // move forward one _day at a time
            for (int ix = 0; ix != num; ix++)
            {
                res._day++;
                if (res._day > DateTime.DaysInMonth(res._year, res._month))
                {
                    res._month++;
                    if (res._month > 12)
                    {
                        res._year++;
                        res._month = 1;
                    }
                    res._day = 1;
                }

            }

            return res;
        }

        public C_YMDhms SubtractDays(int num)
        {
            // make a copy
            C_YMDhms res = new C_YMDhms(this);

            // move back one _day at a time
            for (int ix = 0; ix != num; ix++)
            {
                res._day--;
                if (res._day <= 0)
                {
                    res._month--;
                    if (_month <= 0)
                    {
                        res._year--;
                        res._month = 12;
                    }
                    res._day = DateTime.DaysInMonth(res._year, res._month);
                }
            }

            return res;
        }

        public C_YMDhms AddMonths(int num)
        {
            // make a copy
            C_YMDhms res = new C_YMDhms(this);

            // move forward one _month at a time
            for (int ix = 0; ix != num; ix++)
            {
                res._month++;
                if (res._month > 12)
                {
                    res._year++;
                    res._month = 1;
                }
            }

            int dim = DateTime.DaysInMonth(res._year, res._month);
            if (res._day > dim)
                res._day = dim;

            return res;
        }

        public C_YMDhms SubtractMonths(int num)
        {
            // make a copy
            C_YMDhms res = new C_YMDhms(this);

            // move back one _month at a time
            for (int ix = 0; ix != num; ix++)
            {
                res._month--;
                if (res._month <= 0)
                {
                    res._year--;
                    res._month = 12;
                }
            }

            int dim = DateTime.DaysInMonth(res._year, res._month);
            if (res._day > dim)
                res._day = dim;

            return res;
        }

        public C_YMDhms AddMinutes(int num)
        {
            // make a copy
            C_YMDhms res = new C_YMDhms(this);

            res._minutes += num;
            if (res._minutes > 59)
            {
                res._minutes = res._minutes % 60;
                res._hour++;
                if (res._hour > 23)
                {
                    res._hour = 0;
                    res = res.AddDays(1);
                }
            }

            return res;
        }

        // always returns YYYYMMDD hhmmss
        public override string ToString()
        {
            return _year.ToString("D4") + _month.ToString("D2") + _day.ToString("D2") + " " +
                _hour.ToString("D2") + _minutes.ToString("D2") + _seconds.ToString("D2");
        }

        /// <summary>
        /// returns a formated time using the provided format
        /// "YYYYMMDD hhmmss"
        /// </summary>
        /// <returns></returns>
        public string ToString(string fmt)
        {
            string res = fmt;

            if (res.Contains("YYYY"))
                res = res.Replace("YYYY", _year.ToString("D4"));
            if (res.Contains("MM"))
                res = res.Replace("MM", _month.ToString("D2"));
            if (res.Contains("DD"))
                res = res.Replace("DD", _day.ToString("D2"));
            if (res.Contains("hh"))
                res = res.Replace("hh", _hour.ToString("D2"));
            if (res.Contains("mm"))
                res = res.Replace("mm", _minutes.ToString("D2"));
            if (res.Contains("ss"))
                res = res.Replace("ss", _seconds.ToString("D2"));

            return res;
        }

        // always returns YYYYMMDDhhmmss
        public string ToDictionaryIndex()
        {
            return _year.ToString("D4") + _month.ToString("D2") + _day.ToString("D2") +
                _hour.ToString("D2") + _minutes.ToString("D2") + _seconds.ToString("D2");
        }

        public int CompareTo(C_YMDhms v2)
        {
            int res = 1;
            if ((_year == v2._year) && (_month == v2._month) && (_day == v2._day)
                && (_hour == v2._hour) && (_minutes == v2._minutes) && (_seconds == v2._seconds))
                res = 0;
            else if ((_year < v2._year)
                || ((_year == v2._year) && (_month < v2._month))
                || ((_year == v2._year) && (_month == v2._month) && (_day < v2._day))
                || ((_year == v2._year) && (_month == v2._month) && (_day == v2._day) && (_hour < v2._hour))
                || ((_year == v2._year) && (_month == v2._month) && (_day == v2._day) && (_hour == v2._hour) &&(_minutes < v2._minutes))
                || ((_year == v2._year) && (_month == v2._month) && (_day == v2._day) && (_hour == v2._hour) && (_minutes == v2._minutes) && (_seconds < v2._seconds))
                )
                res = -1;

            return res;
        }

        public static bool operator >(C_YMDhms v1, C_YMDhms v2)
        {
            bool res = ((v1._year > v2._year)
                || ((v1._year == v2._year) && (v1._month > v2._month))
                || ((v1._year == v2._year) && (v1._month == v2._month) && (v1._day > v2._day))
                || ((v1._year == v2._year) && (v1._month == v2._month) && (v1._day == v2._day) && (v1._hour > v2._hour))
                || ((v1._year == v2._year) && (v1._month == v2._month) && (v1._day == v2._day) && (v1._hour == v2._hour) && (v1._minutes > v2._minutes))
                || ((v1._year == v2._year) && (v1._month == v2._month) && (v1._day == v2._day) && (v1._hour == v2._hour) && (v1._minutes == v2._minutes) && (v1._seconds > v2._seconds))
                );

            return res;
        }

        public static bool operator >=(C_YMDhms v1, C_YMDhms v2)
        {
            bool res = (((v1._year == v2._year) && (v1._month == v2._month) && (v1._day == v2._day) && (v1._hour == v2._hour) && (v1._minutes == v2._minutes) && (v1._seconds == v2._seconds))
                || (v1._year > v2._year)
                || ((v1._year == v2._year) && (v1._month > v2._month))
                || ((v1._year == v2._year) && (v1._month == v2._month) && (v1._day > v2._day))
                || ((v1._year == v2._year) && (v1._month == v2._month) && (v1._day == v2._day) && (v1._hour > v2._hour))
                || ((v1._year == v2._year) && (v1._month == v2._month) && (v1._day == v2._day) && (v1._hour == v2._hour) && (v1._minutes > v2._minutes))
                || ((v1._year == v2._year) && (v1._month == v2._month) && (v1._day == v2._day) && (v1._hour == v2._hour) && (v1._minutes == v2._minutes) && (v1._seconds > v2._seconds))
                );

            return res;
        }

        public static bool operator <(C_YMDhms v1, C_YMDhms v2)
        {
            bool res = ((v1._year < v2._year)
                || ((v1._year == v2._year) && (v1._month < v2._month))
                || ((v1._year == v2._year) && (v1._month == v2._month) && (v1._day < v2._day))
                || ((v1._year == v2._year) && (v1._month == v2._month) && (v1._day == v2._day) && (v1._hour < v2._hour))
                || ((v1._year == v2._year) && (v1._month == v2._month) && (v1._day == v2._day) && (v1._hour == v2._hour) && (v1._minutes < v2._minutes))
                || ((v1._year == v2._year) && (v1._month == v2._month) && (v1._day == v2._day) && (v1._hour == v2._hour) && (v1._minutes == v2._minutes) && (v1._seconds < v2._seconds))
                );

            return res;
        }

        public static bool operator <=(C_YMDhms v1, C_YMDhms v2)
        {
            bool res = (((v1._year == v2._year) && (v1._month == v2._month) && (v1._day == v2._day))
                || (v1._year < v2._year)
                || ((v1._year == v2._year) && (v1._month < v2._month))
                || ((v1._year == v2._year) && (v1._month == v2._month) && (v1._day < v2._day))
                || ((v1._year == v2._year) && (v1._month == v2._month) && (v1._day == v2._day) && (v1._hour < v2._hour))
                || ((v1._year == v2._year) && (v1._month == v2._month) && (v1._day == v2._day) && (v1._hour == v2._hour) && (v1._minutes < v2._minutes))
                || ((v1._year == v2._year) && (v1._month == v2._month) && (v1._day == v2._day) && (v1._hour == v2._hour) && (v1._minutes == v2._minutes) && (v1._seconds < v2._seconds))
                );

            return res;
        }

        public static bool operator ==(C_YMDhms v1, C_YMDhms v2)
        {
            if ((v1 is null) && (!(v2 is null)))
                return false;
            if ((!(v1 is null)) && (v2 is null))
                return false;
            if ((v1 is null) && (v2 is null))
                return true;


            return (v1._year == v2._year) && (v1._month == v2._month) && (v1._day == v2._day)
                && (v1._hour == v2._hour) && (v1._minutes == v2._minutes) && (v1._seconds == v2._seconds);
        }

        public static bool operator !=(C_YMDhms v1, C_YMDhms v2)
        {
            if ((v1 is null) && (!(v2 is null)))
                return true;
            if ((!(v1 is null)) && (v2 is null))
                return true;
            if ((v1 is null) && (v2 is null))
                return false;

            return (v1._year != v2._year) || (v1._month != v2._month) || (v1._day != v2._day)
                && (v1._hour != v2._hour) || (v1._minutes != v2._minutes) || (v1._seconds != v2._seconds);
        }

        // Override the Object.Equals(object o) method:
        public override bool Equals(object obj)
        {
            try
            {
                return (bool)(this == (C_YMDhms)obj);
            }
            catch
            {
                return false;
            }
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }
    }
}
