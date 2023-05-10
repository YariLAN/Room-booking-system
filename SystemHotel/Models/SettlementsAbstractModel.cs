using Microsoft.AspNetCore.Mvc.Rendering;
using System.Collections.Generic;

namespace SystemHotel.Models
{
    public abstract class SettlementsAbstractModel
    {
        public int id { get; set; }
        public string name { get; set; }
        public readonly HotelContext _dbContext;

        public SettlementsAbstractModel() {
            this._dbContext = new HotelContext();
        }
        public SettlementsAbstractModel(int id, string name)
        {
            this.id = id;
            this.name = name;
        }
        public SettlementsAbstractModel(HotelContext dbContext)
        {
            this._dbContext = dbContext;
        }
    }
}
