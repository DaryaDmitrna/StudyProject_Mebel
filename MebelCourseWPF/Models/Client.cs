using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace MebelCourseWPF.Models
{
    public partial class Client
    {
        public Client()
        {
            Order = new HashSet<Order>();
        }

        public int IdClient { get; set; }
        public string Name { get; set; }
        public string Phone { get; set; }
        public string Adres { get; set; }

        public virtual ICollection<Order> Order { get; set; }
    }
}
