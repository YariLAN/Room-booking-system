using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SystemHotel.Models
{
    public class ListsModels
    {
        public List<CityModel> listOfcities { get; private set; }
        public List<RegionsModel> listOfregions { get; private set; }

        public async Task<Tuple<List<CityModel>, List<RegionsModel>>> Inisializate()
        {
            var cm = new CityModel();
            var rm = new RegionsModel();

            this.listOfcities = await cm.GetEntities();
            this.listOfregions = await rm.GetEntities();

            return Tuple.Create(listOfcities, listOfregions);
        }
    }
}
