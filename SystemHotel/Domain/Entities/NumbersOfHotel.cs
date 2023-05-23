using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace SystemHotel
{
    public partial class NumbersOfHotel
    {
        public int NumberId { get; set; }
        public int FloorNumber { get; set; }
        public int NumberRoom { get; set; }
        public int FkTypeRoom { get; set; }
        public int AmountSeats { get; set; }
        public int Price { get; set; }
        public bool? Isavaiable { get; set; }

        public int FkHotelId { get; set; }
        public virtual Hotels FkHotel { get; set; }
        public virtual TypeRoom FkTypeRoomNavigation { get; set; }
        public virtual ICollection<BookedRoom> BookedRoom { get; set; }
    }
}
