using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace MebelCourseWPF.Models
{
    public partial class Character
    {
        public Character()
        {
            NewproductCharacter = new HashSet<NewproductCharacter>();
            Parametr = new HashSet<Parametr>();
            TypeChracter = new HashSet<TypeChracter>();
        }

        public int IdCharacter { get; set; }
        public string Name { get; set; }

        public virtual ICollection<NewproductCharacter> NewproductCharacter { get; set; }
        public virtual ICollection<Parametr> Parametr { get; set; }
        public virtual ICollection<TypeChracter> TypeChracter { get; set; }
    }
}
