using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SystemHotel.Models
{
    public class ListsModels
    {
        public List<SelectListItem> listOfcities { get; private set; }
        public List<SelectListItem> listOfcountries { get; private set; }

        public async Task<List<SelectListItem>> CityToSelectListItem()
        {
            var cm = new CityModel();
            this.listOfcities = new List<SelectListItem>(); 

            var list = await cm.GetEntities();
            foreach (var item in list)
            {
                this.listOfcities.Add(new SelectListItem
                {
                    Text = item.name,
                    Value = item.id.ToString()
                });
            }
            return this.listOfcities;
        }

        public async Task<List<SelectListItem>> CountryToSelectListItem()
        {
            var cm = new CountriesModel();
            this.listOfcountries = new List<SelectListItem>();

            var list = await cm.GetEntities();
            foreach (var item in list)
            {
                this.listOfcountries.Add(new SelectListItem
                {
                    Text = item.name,
                    Value = item.id.ToString()
                });
            }
            return this.listOfcountries;
        }

    }
}
