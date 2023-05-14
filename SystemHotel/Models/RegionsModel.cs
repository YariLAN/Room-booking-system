using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SystemHotel.Models
{
    public class RegionsModel: SettlementsAbstractModel
    {
        public RegionsModel(int id, string name) : base(id, name) { }
        public RegionsModel() : base() { }

        public async Task<List<RegionsModel>> GetEntities()
        {
            return await _dbContext.Regions.Select(
                    s => new RegionsModel(s.RegionId, s.RegionName)).ToListAsync();
        }
    }
}
