using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace SystemHotel
{
    public partial class Hotels
    {
        public Hotels()
        {
            NumbersOfHotel = new HashSet<NumbersOfHotel>();
        }

        public int HotelId { get; set; }
        public int FkCountryId { get; set; }
        public int FkRegionId { get; set; }
        public int FkCityId { get; set; }
        public string StreetName { get; set; }
        public int HouseNumber { get; set; }
        public string HotelName { get; set; }
        public int FkHotelCategory { get; set; }

        public virtual Cities FkCity { get; set; }
        public virtual Countries FkCountry { get; set; }
        public virtual Categotyofhotels FkHotelCategoryNavigation { get; set; }
        public virtual Regions FkRegion { get; set; }
        public virtual ICollection<NumbersOfHotel> NumbersOfHotel { get; set; }
    }
}
