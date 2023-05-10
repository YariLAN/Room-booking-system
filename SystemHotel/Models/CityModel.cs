using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;

namespace SystemHotel.Models
{
    public class CityModel : SettlementsAbstractModel
    {
        
        public CityModel(int id, string name) : base(id, name) { }
        public CityModel() : base() { }

        public async Task<List<CityModel>> GetEntities()
        {
            return await _dbContext.Cities.Select(
                    s => new CityModel(s.CityId, s.CityName)).ToListAsync();
        }
    }
}