using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SystemHotel.Models
{
    public class RegionsModel : SettlementsAbstractModel
    {
        public int FkCountryId {get; set;}
        public RegionsModel() : base() { }
        public RegionsModel(int id, string name, int fkRegionId) : base(id, name) {
            this.FkCountryId = fkRegionId;
        }

        public async Task<List<RegionsModel>> GetEntities()
        {
            return await _dbContext.Regions.Select(
                    s => new RegionsModel(s.RegionId, s.RegionName, s.FkCountryId)).ToListAsync();
        }
    }
}
