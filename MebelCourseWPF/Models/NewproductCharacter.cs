using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace MebelCourseWPF.Models
{
    public partial class NewproductCharacter
    {
        public int IdNewProductCharacter { get; set; }
        public int IdNewProduct { get; set; }
        public int IdCharacter { get; set; }
        public int IdParametr { get; set; }

        public virtual Character IdCharacterNavigation { get; set; }
        public virtual NewProduct IdNewProductNavigation { get; set; }
        public virtual Parametr IdParametrNavigation { get; set; }
    }
}
