using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Xml.Linq;
using SystemHotel.Models;

namespace SystemHotel.Services
{
    public class FindHotelsService: HotelContext
    {
        public static CityModel _cm;
        public static CountriesModel _countryModel;

        private const string PATH_IMG_FOLDER = "/img/";

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
                         s.FkCityId, s.StreetName, s.HouseNumber, s.FkHotelCategory)).ToList();
        }

        public async Task<HotelModel> GetHotel(int? id)
        {
            var h = await Hotels.Select
                (
                    s => new HotelModel(s.HotelId, s.HotelName, s.FkCountryId, s.FkRegionId,
                        s.FkCityId, s.StreetName, s.HouseNumber, s.FkHotelCategory)
                ).ToListAsync();

            return h.Where(item => item.Id == id).FirstOrDefault();
        }

        public async Task AddHotelAsync(HotelModel hm, Images img, IWebHostEnvironment _appEnvironment)
        {
            await this.AddAsync(new Hotels(hm.Id, hm.FkCountryId, hm.FkRegionId, hm.FkCityId,
                hm.StreetName, hm.HouseNumber, hm.Name, hm.FkHotelCategory));

            await this.SaveChangesAsync();

            if (hm.Img.Name == "" || hm.Img == null)
            {
                var myImage = img.MyImage;
                await TransmitImgFolder(myImage, _appEnvironment);
                var imgJpeg = new Images(default, hm.FkCityId, myImage.FileName, hm.GetIdByName(hm.Name));

                await this.Images.AddAsync(imgJpeg);
                await this.SaveChangesAsync();
            }
        }

        private async Task TransmitImgFolder(IFormFile img, IWebHostEnvironment _appEnvironment)
        {
            string name = img.FileName;

            string path = PATH_IMG_FOLDER + name;
            using (var fileStream = new FileStream(_appEnvironment.WebRootPath + path, FileMode.Create))
            {
                await img.CopyToAsync(fileStream);
            }  
        }

        private void DeleteImgFromFolder(ImageModel oldImg)
        {
            var path = "wwwroot" + PATH_IMG_FOLDER + oldImg.Name;

            if(File.Exists(path))
                File.Delete(path);
        }

        public async Task UpdateHotelAsync(HotelModel hM, IWebHostEnvironment _appEnvironment, Images newImg)
        {
            Hotels h = new Hotels(
                hM.Id, hM.FkCountryId, hM.FkRegionId,hM.FkCityId, 
                hM.StreetName, hM.HouseNumber, hM.Name, hM.FkHotelCategory
            );

            var myImage = newImg.MyImage;
            if (myImage != null)
            {
                if(hM.Img.Name != myImage.FileName)
                {
                    DeleteImgFromFolder(hM.Img);
                    await TransmitImgFolder(myImage, _appEnvironment);
                }

                newImg = new Images(hM.Img.Id, hM.FkCityId, myImage.FileName, hM.Id);

                this.Images.Update(newImg);
                await this.SaveChangesAsync();
            }

            this.Hotels.Update(h);
            await this.SaveChangesAsync();
        }

        public async Task DeleteHotelAsync(HotelModel hM)
        {
            Hotels h = new Hotels(
                hM.Id, hM.FkCountryId, hM.FkRegionId, hM.FkCityId,
                hM.StreetName, hM.HouseNumber, hM.Name, hM.FkHotelCategory
            );

            if(hM.Img != null)
            {
                DeleteImgFromFolder(hM.Img);
                var img = new Images(hM.Img.Id, hM.FkCityId, hM.Img.Name, hM.Id);

                this.Images.Remove(img);
                await this.SaveChangesAsync();
            }

            this.Hotels.Remove(h);
            await this.SaveChangesAsync();
        }
    }
}
