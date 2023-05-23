using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace SystemHotel.Models
{
    public class NumbersOfHotelModel
    {
        [Key]
        public int NumberId { get; set; }
        public int FkHotelId { get; set; }
        public int FloorNumber { get; set; }
        public int NumberRoom { get; set; }
        public int FkTypeRoom { get; set; }
        public int AmountSeats { get; set; }
        public int Price { get; set; }
        public bool? Isavaiable { get; set; }

        public virtual Hotels FkHotel { get; set; }
        public virtual TypeRoom FkTypeRoomNavigation { get; set; }
        public virtual ICollection<BookedRoom> BookedRoom { get; set; }

        public NumbersOfHotelModel() { }

        public NumbersOfHotelModel(int id, int number, int hotel,
            int floor, int type, int seats, int price, bool? isav)
        {
            NumberId = id;
            NumberRoom = number;
            FkHotelId = hotel;
            FloorNumber = floor;
            FkTypeRoom = type;
            AmountSeats = seats;
            Price = price;
            Isavaiable = isav;
        }

    }
}
