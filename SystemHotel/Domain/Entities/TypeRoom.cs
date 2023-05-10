using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace SystemHotel
{
    public partial class TypeRoom
    {
        public TypeRoom()
        {
            NumbersOfHotel = new HashSet<NumbersOfHotel>();
        }

        public int TypeRoomId { get; set; }
        public string TypeRoomName { get; set; }

        public virtual ICollection<NumbersOfHotel> NumbersOfHotel { get; set; }
    }
}
