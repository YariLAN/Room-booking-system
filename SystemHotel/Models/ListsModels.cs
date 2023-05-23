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
        public List<CountriesModel> listOfcountries { get; private set; }

        public async Task Inisializate()
        {
            var cm = new CityModel();
            var rm = new RegionsModel();
            var gosm = new CountriesModel();

            this.listOfcities = await cm.GetEntities();
            this.listOfregions = await rm.GetEntities();
            this.listOfcountries = await gosm.GetEntities();

            return;
        }
    }
}
