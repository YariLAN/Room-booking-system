using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace SystemHotel
{
    public partial class Cities
    {
        public Cities()
        {
            Hotels = new HashSet<Hotels>();
        }

        public int CityId { get; set; }
        public int FkRegionId { get; set; }
        public string CityName { get; set; }

        public virtual Regions FkRegion { get; set; }
        public virtual ICollection<Hotels> Hotels { get; set; }
    }
}
