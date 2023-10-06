using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace MebelCourseWPF.Models
{
    public partial class Order
    {
        public Order()
        {
            NewProduct = new HashSet<NewProduct>();
        }

        public int IdOrder { get; set; }
        public int IdClient { get; set; }
        public DateTime DateAccept { get; set; }
        public DateTime? DateExacute { get; set; }
        public DateTime? DateDeliver { get; set; }
        public decimal Sum { get; set; }
        public decimal Prepayment { get; set; }
        public int IdStatus { get; set; }
        public string Image { get; set; }
        public string Number { get; set; }

        public virtual Client IdClientNavigation { get; set; }
        public virtual Status IdStatusNavigation { get; set; }
        public virtual ICollection<NewProduct> NewProduct { get; set; }
    }
}
