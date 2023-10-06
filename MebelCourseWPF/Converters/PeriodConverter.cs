using System;
using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;
using System.Windows.Media;

namespace MebelCourseWPF.Converters
{
    public class PeriodConverter : IValueConverter
    {
        public object Convert(object value, System.Type targetType, object parameter, CultureInfo culture)
        {
            DateTime today = DateTime.Today.AddDays(3);
            DateTime d = DateTime.Parse(value.ToString()).AddMonths(1);
            System.Windows.Media.Color red = Colors.Red;
            System.Windows.Media.Color white = Colors.White;
            if (d.CompareTo(today) < 0 || d.CompareTo(today) == 0)
                return new SolidColorBrush(red);
            else
                return new SolidColorBrush(white);
        }

        public object ConvertBack(object value, System.Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
