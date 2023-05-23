using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SystemHotel.Models
{
    public class BookedRoomModel
    {
        [Key]
        public int BookedId { get; set; }
        public int FkNumbersOfHotel { get; set; }
        public int FkUserId { get; set; }
        public DateTime DateCheckIn { get; set; }
        public DateTime DateCheckOut { get; set; }

        public virtual NumbersOfHotel FkNumbersOfHotelNavigation { get; set; }
        public virtual UsLoginAndPassword FkUser { get; set; }
    }
}
