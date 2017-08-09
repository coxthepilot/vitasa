using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Globalization;

namespace zsquared
{
    /// <summary>
    /// This class implements DateTime as only a Year, Month and Day - no time of day.
    /// </summary>
    public class C_YMD : IComparable
    {
        int _year = 2013;
        public int Year
        {
            get { return _year; }
            set
            {
                //if ((value < DateTime.MinValue.Year) || (value > DateTime.MaxValue.Year))
                //    throw new ApplicationException("Year value must be " + DateTime.MinValue.Year.ToString() + "..." + DateTime.MaxValue.Year.ToString());
                _year = value;
            }
        }

        int _month = 1;
        public int Month
        {
            get { return _month; }
            set
            {
                //if ((value < 1) || (value > 12))
                //    throw new ApplicationException("Month value must be 1..12");
                _month = value;
            }
        }

        int _day = 0;
        public int Day
        {
            get { return _day; }
            set
            {
                //if ((value < 1) || (value > 31))
                //    throw new ApplicationException("Month value must be 1..31");
                _day = value;
            }
        }

        public int WeekOfYear
        {
            get
            {
                DateTime dt = new DateTime(Year, Month, Day);
                DateTimeFormatInfo dfi = DateTimeFormatInfo.CurrentInfo;
                Calendar cal = dfi.Calendar;
                int woy = cal.GetWeekOfYear(dt, CalendarWeekRule.FirstDay, DayOfWeek.Sunday);

                return woy;
            }
        }

        public C_YMD(int year, int month, int day)
        {
            Year = year;
            Month = month;
            Day = day;
        }

        public C_YMD(DateTime dt)
        {
            Year = dt.Year;
            Month = dt.Month;
            Day = dt.Day;
        }

        public C_YMD(string s)
        {
            string[] ss = s.Split(new char[] { '-' });
            if (ss.Length != 3)
                throw new ApplicationException("Unexpected format");

            try
            {
                Year = Convert.ToInt32(ss[0]);
                Month = Convert.ToInt32(ss[1]);
                Day = Convert.ToInt32(ss[2]);
            }
            catch (Exception e)
            {
                throw new ApplicationException("Conversion error (" + e.Message + ")");
            }
        }

        public C_YMD(C_YMD ymd)
        {
            Year = ymd.Year;
            Month = ymd.Month;
            Day = ymd.Day;
        }

        public static C_YMD None
        {
            get { return new C_YMD(0, 0, 0); }
        }

        public void SubtractMonths(int count)
        {
            for(int ix = 0; ix != count; ix++)
            {
                if (_month == 1)
                {
                    _year--;
                    _month = 12;
                }
                else
                    _month--;
            }

            if (_day > DateTime.DaysInMonth(_year, _month))
                _day = DateTime.DaysInMonth(_year, _month);
        }

        public void AddMonths(int count)
        {
            for (int ix = 0; ix != count; ix++)
            {
                if (_month == 12)
                {
                    _year++;
                    _month = 1;
                }
                else
                    _month++;
            }

            if (_day > DateTime.DaysInMonth(_year, _month))
                _day = DateTime.DaysInMonth(_year, _month);
        }

        public C_YMD SubtractDays(int num)
        {
            // make a copy
            C_YMD res = new C_YMD(this);

            // move back one _day at a time
            for (int ix = 0; ix != num; ix++)
            {
                res._day--;
                if (res._day < 1)
                {
                    res._month--;
                    if (res._month < 1)
                    {
                        res._year--;
                        res._month = 12;
                    }
                    res._day = DateTime.DaysInMonth(res._year, res._month);
                }
            }

            return res;
        }

        public C_YMD AddDays(int num)
        {
            // make a copy
            C_YMD res = new C_YMD(this);

            if (num > 0)
            {
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
            }
            else if (num < 0)
            {
                // move backward one _day at a time
                int nnum = -num;
                for (int ix = 0; ix != nnum; ix++)
                {
                    res._day--;
                    if (res._day < 1)
                    {
                        res._month--;
                        if (res._month < 1)
                        {
                            res._year--;
                            res._month = 12;
                        }
                        res._day = DateTime.DaysInMonth(res._year, res._month);
                    }
                }
            }

            return res;
        }

        public DateTime ToDateTime()
        {
            if ((Year == 0) && (Month == 0) && (Day == 0))
                return DateTime.MinValue;
            else
                return new DateTime(Year, Month, Day);
        }

        public DateTime ToDateTime(C_HMS hms)
        {
            return new DateTime(Year, Month, Day, hms.Hour, hms.Minutes, hms.Seconds);
        }

        public static C_YMD MinValue
        {
            get
            {
                return new C_YMD(DateTime.MinValue.Year, DateTime.MinValue.Month, DateTime.MinValue.Day);
            }
        }

        public static C_YMD MaxValue
        {
            get
            {
                return new C_YMD(DateTime.MaxValue.Year, DateTime.MaxValue.Month, DateTime.MaxValue.Day);
            }
        }

        public static C_YMD Now
        {
            get
            {
                return new C_YMD(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
            }
        }

        public DayOfWeek DayOfWeek
        {
            get
            {
                DateTime dt = new DateTime(Year, Month, Day, 0, 0, 0);
                return dt.DayOfWeek;
            }
        }


        public int CompareTo(C_YMD v2)
        {
            int res = 1;
            if ((Year == v2.Year) && (Month == v2.Month) && (Day == v2.Day))
                res = 0;
            else if ((Year < v2.Year)
                || ((Year == v2.Year) && (Month < v2.Month))
                || ((Year == v2.Year) && (Month == v2.Month) && (Day < v2.Day))
                )
                res = -1;

            return res;
        }

        public int CompareTo(object o)
        {
            if (o == null) return 1;

            C_YMD otherYMD = o as C_YMD;
            if (otherYMD != null)
                return CompareTo(otherYMD);
            else
                throw new ApplicationException("Object is not a C_YMD");
        }

        public static int CompareYMD(C_YMD ymd1, C_YMD ymd2)
        {
            return ymd1.CompareTo(ymd2);
        }

        public static int CompareYMDReverse(C_YMD ymd1, C_YMD ymd2)
        {
            return ymd2.CompareTo(ymd1);
        }

        public static bool operator >(C_YMD v1, C_YMD v2)
        {
            bool res = false;

            if ((v1.Year > v2.Year)
                || ((v1.Year == v2.Year) && (v1.Month > v2.Month))
                || ((v1.Year == v2.Year) && (v1.Month == v2.Month) && (v1.Day > v2.Day))
                )
                res = true;

            return res;
        }

        public static bool operator >=(C_YMD v1, C_YMD v2)
        {
            bool res = false;

            if (((v1.Year == v2.Year) && (v1.Month == v2.Month) && (v1.Day == v2.Day))
                || (v1.Year > v2.Year)
                || ((v1.Year == v2.Year) && (v1.Month > v2.Month))
                || ((v1.Year == v2.Year) && (v1.Month == v2.Month) && (v1.Day > v2.Day))
                )
                res = true;

            return res;
        }

        public static bool operator <(C_YMD v1, C_YMD v2)
        {
            bool yearsEqual = v1.Year == v2.Year;
            if ((yearsEqual) && (v1.Month == v2.Month) && (v1.Day < v2.Day))
                return true;
            else if ((yearsEqual) && (v1.Month < v2.Month))
                return true;
            else if (v1.Year < v2.Year)
                return true;

            return false;
        }

        public static bool operator <=(C_YMD v1, C_YMD v2)
        {
            bool res = false;

            if (((v1.Year == v2.Year) && (v1.Month == v2.Month) && (v1.Day == v2.Day))
                || (v1.Year < v2.Year)
                || ((v1.Year == v2.Year) && (v1.Month < v2.Month))
                || ((v1.Year == v2.Year) && (v1.Month == v2.Month) && (v1.Day < v2.Day))
                )
                res = true;

            return res;
        }

        public static bool operator ==(C_YMD v1, C_YMD v2)
        {
            if (((object)v1 == null) && ((object)v2 != null))
                return false;
            if (((object)v1 != null) && ((object)v2 == null))
                return false;
            if (((object)v1 == null) && ((object)v2 == null))
                return true;


            return (v1.Year == v2.Year) && (v1.Month == v2.Month) && (v1.Day == v2.Day);
        }

        public static bool operator !=(C_YMD v1, C_YMD v2)
        {
            if (((object)v1 == null) && ((object)v2 != null))
                return true;
            if (((object)v1 != null) && ((object)v2 == null))
                return true;
            if (((object)v1 == null) && ((object)v2 == null))
                return false;

            return (v1.Year != v2.Year) || (v1.Month != v2.Month) || (v1.Day != v2.Day);
        }

        public static TimeSpan operator -(C_YMD v1, C_YMD v2)
        {
            return v1.ToDateTime() - v2.ToDateTime();
        }

        public DayOfWeek GetDayOfWeek()
        {
            DateTime dt = ToDateTime();
            return dt.DayOfWeek;
        }

        public override string ToString()
        {
            return Year.ToString("D4") + "-" + Month.ToString("D2") + "-" + Day.ToString("D2");
        }

        static readonly List<string> MonthNames = new List<string>() { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };
        /// <summary>
        /// returns a formated time using the provided format
        /// "yyyy" is replaced with 4 digit year, "yy" is replaced with last two digits of year
        /// "mm" is replaced with month number (1..12); "mmm" is replaced with month short name
        /// "dd" is replaced with day number (1..31)
        /// all other characters in the string are unchanged
        /// </summary>
        /// <param name="fmt"></param>
        /// <returns></returns>
        public string ToString(string fmt)
        {
            string res = fmt;

            res = res.ToLower();

            if (res.Contains("yyyy"))
                res = res.Replace("yyyy", Year.ToString("D4"));
            else if (res.Contains("yy"))
            {
                string ys = Year.ToString("D4");
                ys = ys.Substring(2, 2);
                res = res.Replace("yy", ys);
            }

            if (res.Contains("mmm"))
            {
                res = res.Replace("mmm", MonthNames[Month]);
            }
            else if (res.Contains("mm"))
                res = res.Replace("mm", Month.ToString("D2"));
            
            if (res.Contains("dd"))
                res = res.Replace("dd", Day.ToString("D2"));

            return res;
        }

        public override int GetHashCode()
        {
            return Year * 12 * 35 + Month * 35 + Day;
        }

        public override bool Equals(object obj)
        {
            if (obj == null || !(obj is C_YMD))
                return false;
            else
            {
                C_YMD nn = (C_YMD)obj;
                return (Year == nn.Year) && (Month == nn.Month) && (Day == nn.Day);
            }
        }

        public static C_YMD GetMostRecentOfThese(C_YMD ymd1, C_YMD ymd2, C_YMD ymd3)
        {
            C_YMD res = ymd1;
            if (ymd2 > res)
                res = ymd2;
            if (ymd3 > res)
                res = ymd3;
            return res;
        }
    }

}
