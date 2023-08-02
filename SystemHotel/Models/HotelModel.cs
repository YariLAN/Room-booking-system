using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;
using Microsoft.EntityFrameworkCore;

namespace SystemHotel.Models
{
    public class HotelModel: SettlementsAbstractModel
    {
        public int FkCountryId { get; set; }
        public int FkRegionId { get; set; }
        public int FkCityId { get; set; }
        public string StreetName { get; set; }
        public int HouseNumber { get; set; }
        public int FkHotelCategory { get; set; }
       
        public HotelModel() : base() { }
        public HotelModel(int id, string nm, int country, int reg,
            int city, string street, int house, int category) : base(id, nm)
        {
            this.FkCountryId = country;
            this.FkRegionId = reg;
            this.FkCityId = city;
            this.StreetName = street;
            this.HouseNumber = house;
            this.FkHotelCategory = category;
        }

        public ImageModel Img {
            get
            {
                var img = new ImageModel().GetImg(Id);
                if (img == null)
                {
                    return new ImageModel(0, 0, "", 0);
                }
                return img;
            }
            set { }
        }

        public CityModel FkCity { 
            get
            {
                var city = new CityModel().GetCityById(this.FkCityId);
                if(city == null)
                {
                    return new CityModel(0, "-", 0);
                }
                return city;
            }
            private set { } 
        }

        public CountriesModel FkCountry { 
            get
            {
                var country = new CountriesModel().GetCountryById(this.FkCountryId);
                if (country == null)
                {
                    return new CountriesModel(0, "-");
                }
                return country;
            }
            private set { }
        }
        public Categotyofhotels FkHotelCategoryNavigation { get; set; }
        public RegionsModel FkRegion {
            get 
            {
                var reg = new RegionsModel().GetRegById(FkRegionId);
                if (reg == null)
                {
                    return new RegionsModel(0, "-", 0);
                }
                return reg;
            }
            private set { }
        }

        public int GetIdByName(string name)
        {
            var hotel = _dbContext.Hotels.Select(
                    s => new HotelModel(s.HotelId, s.HotelName,
                    s.FkCountryId, s.FkRegionId, s.FkCityId, s.StreetName, s.HouseNumber, s.FkHotelCategory)
                ).ToList().FirstOrDefault(l => l.Name == name);

            return hotel.Id;
        }

        public ICollection<NumbersOfHotel> NumbersOfHotel { get; set; }
    }
}
