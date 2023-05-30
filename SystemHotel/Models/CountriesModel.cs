using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SystemHotel.Models
{
    public class CountriesModel : SettlementsAbstractModel
    {
        public CountriesModel(int id, string name) : base(id, name) { }
        public CountriesModel() : base() { }

        public async Task<List<CountriesModel>> GetEntities() 
        {
            return await _dbContext.Countries.Select(
                    s => new CountriesModel(s.CountryId, s.CountryName)).ToListAsync();
        }

        public CountriesModel GetCountryById(int id)
        {
            var country = _dbContext.Countries.FirstOrDefault(r => r.CountryId == id);
            return new CountriesModel(country.CountryId, country.CountryName);
        }
    }
}
