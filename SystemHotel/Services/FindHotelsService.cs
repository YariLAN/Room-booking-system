using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SystemHotel.Models;

namespace SystemHotel.Services
{
    public class FindHotelsService
    {
        public readonly HotelContext _dbContext;
        public static CityModel _cm;
        public static CountriesModel _countryModel;

        public FindHotelsService(HotelContext dbContext)
        {
            this._dbContext = dbContext;
        }

        public async Task<ListsModels> GetDropDownList()
        {
            ListsModels lmodels = new ListsModels();

            var lstModels = await lmodels.Inisializate();

            return lmodels;
        }

        public List<HotelModel> GetHotels()
        {
            return _dbContext.Hotels.Select
              (s => new HotelModel(s.HotelId, s.HotelName, s.FkCityId, s.StreetName, s.HouseNumber))
                .ToList();
        }
    }
}
