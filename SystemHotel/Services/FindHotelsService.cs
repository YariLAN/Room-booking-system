using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
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
    }
}
