using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace MebelCourseWPF.Models
{
    public partial class NewProduct
    {
        public NewProduct()
        {
            NewproductCharacter = new HashSet<NewproductCharacter>();
        }

        public int IdNewProduct { get; set; }
        public int IdOrder { get; set; }
        public int IdProduct { get; set; }

        public virtual Order IdOrderNavigation { get; set; }
        public virtual Product IdProductNavigation { get; set; }
        public virtual ICollection<NewproductCharacter> NewproductCharacter { get; set; }
    }
}
