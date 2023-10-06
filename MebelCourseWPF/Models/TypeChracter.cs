using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace MebelCourseWPF.Models
{
    public partial class TypeChracter
    {
        public int IdTypeCharacter { get; set; }
        public int IdType { get; set; }
        public int IdCharacter { get; set; }

        public virtual Character IdCharacterNavigation { get; set; }
        public virtual Type IdTypeNavigation { get; set; }
    }
}
