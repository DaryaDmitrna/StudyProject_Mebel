using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace MebelCourseWPF.ValidationRules
{
    public class PhoneRule : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            string text = value.ToString();
            foreach (char t in text)
            {
                if (!Char.IsDigit(t))
                    return new ValidationResult(false, "Строка должна состоять только из цифр");
            }
            if (text.Length != 11)
                return new ValidationResult(false, "Строка должна состоять из 11 символов");
            if (text[0] != '8')
                return new ValidationResult(false, "Номер должен быть в формате 8**********");
            return ValidationResult.ValidResult;
        }
    }
}
