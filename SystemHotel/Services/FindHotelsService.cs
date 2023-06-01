using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using SystemHotel.Models;

namespace SystemHotel.Services
{
    public class FindHotelsService: HotelContext
    {
        public static CityModel _cm;
        public static CountriesModel _countryModel;

        public FindHotelsService(): base() { }

        public async Task<ListsModels> GetDropDownList()
        {
            ListsModels lmodels = new ListsModels();

            await lmodels.Inisializate();

            return lmodels;
        }

        public List<HotelModel> GetHotels()
        {
            return this.Hotels.Select
              (s => new HotelModel(s.HotelId, s.HotelName, s.FkCountryId, s.FkRegionId,
                         s.FkCityId, s.StreetName, s.HouseNumber)).ToList();
        }

        public async Task AddHotelAsync(HotelModel hm, Images img, IWebHostEnvironment _appEnvironment)
        {
            await this.AddAsync(new Hotels(hm.Id, hm.FkCountryId, hm.FkRegionId, hm.FkCityId,
                hm.StreetName, hm.HouseNumber, hm.Name, hm.FkHotelCategory));

            await this.SaveChangesAsync();

            if (hm.Img.Name == "" || hm.Img == null)
            {
                // функция image для извлечения имени
                var name = img.MyImage.FileName;

                string path = "/img/" + name;
                using (var fileStream = new FileStream(_appEnvironment.WebRootPath + path, FileMode.Create))
                {
                    await img.MyImage.CopyToAsync(fileStream);
                }

                var imgJpeg = new Images(default, hm.FkCityId, name, hm.GetIdByName(hm.Name));
                await this.Images.AddAsync(imgJpeg);
                await this.SaveChangesAsync();
            }
        }
    }
}
