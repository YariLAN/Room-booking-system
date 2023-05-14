using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace SystemHotel
{
    public partial class Regions
    {
        public Regions()
        {
            Cities = new HashSet<Cities>();
            Hotels = new HashSet<Hotels>();
        }

        public int RegionId { get; set; }
        public int FkCountryId { get; set; }
        public string RegionName { get; set; }
        public virtual ICollection<Cities> Cities { get; set; }

        public virtual Countries FkCountry { get; set; }
        public virtual ICollection<Hotels> Hotels { get; set; }
    }
}
