using MebelCourseWPF.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Data;

namespace MebelCourseWPF.Converters
{
    public class VisibilityConverter : IValueConverter
    {
        public object Convert(object value, System.Type targetType, object parameter, CultureInfo culture)
        {
            int gr = ((ICollection<NewproductCharacter>)value).Count;
            int par = int.Parse(parameter.ToString());
            if ((gr - 1) >= par)
            {
                return Visibility.Visible;
            }
            else return Visibility.Hidden;
        }

        public object ConvertBack(object value, System.Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
