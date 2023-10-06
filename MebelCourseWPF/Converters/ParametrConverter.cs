using MebelCourseWPF.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;

namespace MebelCourseWPF.Converters
{
    public class ParametrConverter : IValueConverter
    {
        public object Convert(object value, System.Type targetType, object parameter, CultureInfo culture)
        {
            var context = new mebelContext();
            int gr = ((ICollection<NewproductCharacter>)value).Count;
            int par = int.Parse(parameter.ToString());
            bool sel = false;
            if (par >= 10)
            {
                sel = true;
                par = par - 10;
            }
            if ((gr - 1) >= par)
            {
                if (sel)
                {
                    int idPar = ((ICollection<NewproductCharacter>)value).ToList()[par].IdParametrNavigation.IdParametr;
                    var parametersChar = context.Parametr.Where(pc => pc.IdCharacter == ((ICollection<NewproductCharacter>)value).ToList()[par].IdCharacterNavigation.IdCharacter).ToList();
                    int j = 0;
                    foreach (var pc in parametersChar)
                    {
                        if (pc.IdParametr == idPar)
                        {
                            return j;
                        }
                        j++;
                    }
                    return 0;
                }
                else
                {
                    return context.Parametr.Where(p => p.IdCharacter == ((ICollection<NewproductCharacter>)value).ToList()[par].IdCharacterNavigation.IdCharacter).Select(p => p.Name).ToList();
                }
            }
            else
            {
                if (sel)
                    return 0;
                int[] arrayNull = new int[5] { 0, 0, 0, 0, 0 };
                return arrayNull;
            }
        }

        public object ConvertBack(object value, System.Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
