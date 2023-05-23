using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SystemHotel.Models;

namespace SystemHotel.Services
{
    public class NumbersHotelService: HotelContext
    {
        public NumbersHotelService(): base() { }

        public async Task<List<NumbersOfHotelModel>> GetModels(int Id)
        {
            return await this.NumbersOfHotel.Select(
                s => new NumbersOfHotelModel(
                    s.NumberId, s.NumberRoom, s.FkHotelId, s.FloorNumber,
                    s.FkTypeRoom, s.AmountSeats, s.Price, s.Isavaiable)
                ).ToListAsync();
        }


    }
}
