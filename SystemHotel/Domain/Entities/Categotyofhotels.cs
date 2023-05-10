using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace SystemHotel
{
    public partial class Categotyofhotels
    {
        public Categotyofhotels()
        {
            Hotels = new HashSet<Hotels>();
        }

        public int CategoryId { get; set; }
        public string CategoryValue { get; set; }

        public virtual ICollection<Hotels> Hotels { get; set; }
    }
}
