using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SystemHotel.Models;

namespace SystemHotel.Services
{
    public class FindHotelsService: HotelContext
    {
        public static CityModel _cm;
        public static CountriesModel _countryModel;

        public FindHotelsService(): base() {}

        public async Task<ListsModels> GetDropDownList()
        {
            ListsModels lmodels = new ListsModels();

            await lmodels.Inisializate();

            return lmodels;
        }

        public List<HotelModel> GetHotels()
        {
            return this.Hotels.Select
              (s => new HotelModel(s.HotelId, s.HotelName, s.FkCityId, s.StreetName, s.HouseNumber))
                .ToList();
        }
    }
}
