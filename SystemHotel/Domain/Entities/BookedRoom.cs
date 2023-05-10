using System;
using System.ComponentModel.DataAnnotations;

namespace SystemHotel
{
    public partial class BookedRoom
    {
        [Key]
        public int FkNumbersOfHotel { get; set; }
        [Key]
        public int FkUserId { get; set; }
        public DateTime DateCheckIn { get; set; }
        public DateTime DateCheckOut { get; set; }

        public virtual NumbersOfHotel FkNumbersOfHotelNavigation { get; set; }
        public virtual UsLoginAndPassword FkUser { get; set; }
    }
}
