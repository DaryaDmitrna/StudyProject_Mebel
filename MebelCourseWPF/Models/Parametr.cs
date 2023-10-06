using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace MebelCourseWPF.Models
{
    public partial class Parametr
    {
        public Parametr()
        {
            NewproductCharacter = new HashSet<NewproductCharacter>();
        }

        public int IdParametr { get; set; }
        public int IdCharacter { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }

        public virtual Character IdCharacterNavigation { get; set; }
        public virtual ICollection<NewproductCharacter> NewproductCharacter { get; set; }
    }
}
