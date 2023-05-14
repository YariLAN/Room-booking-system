using Microsoft.AspNetCore.Mvc.Rendering;
using System.Collections.Generic;

namespace SystemHotel.Models
{
    public abstract class SettlementsAbstractModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public readonly HotelContext _dbContext;

        public SettlementsAbstractModel() {
            this._dbContext = new HotelContext();
        }
        public SettlementsAbstractModel(int id, string name)
        {
            this.Id = id;
            this.Name = name;
        }
        public SettlementsAbstractModel(HotelContext dbContext)
        {
            this._dbContext = dbContext;
        }
    }
}
