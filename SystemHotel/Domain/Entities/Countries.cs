using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace SystemHotel
{
    public partial class Countries
    {
        public Countries()
        {
            Hotels = new HashSet<Hotels>();
            Regions = new HashSet<Regions>();
        }

        public int CountryId { get; set; }
        public string CountryName { get; set; }

        public virtual ICollection<Hotels> Hotels { get; set; }
        public virtual ICollection<Regions> Regions { get; set; }
    }
}
