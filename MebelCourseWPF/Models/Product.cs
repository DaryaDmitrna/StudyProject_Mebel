using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace MebelCourseWPF.Models
{
    public partial class Product
    {
        public Product()
        {
            NewProduct = new HashSet<NewProduct>();
        }

        public int IdProduct { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public int IdType { get; set; }
        public int Width { get; set; }
        public int Length { get; set; }
        public int Heigth { get; set; }

        public virtual Type IdTypeNavigation { get; set; }
        public virtual ICollection<NewProduct> NewProduct { get; set; }
    }
}
