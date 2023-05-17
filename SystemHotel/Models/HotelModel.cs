using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;
using Microsoft.EntityFrameworkCore;

namespace SystemHotel.Models
{
    public class HotelModel: SettlementsAbstractModel
    {
        public int FkCountryId { get; set; }
        public int? FkRegionId { get; set; }
        public int FkCityId { get; set; }
        public string StreetName { get; set; }
        public int HouseNumber { get; set; }
        public int FkHotelCategory { get; set; }
       
        public HotelModel() : base() { }
        public HotelModel(int id, string nm, int city, string street, int house) : base(id, nm)
        {
            this.FkCityId = city;
            this.StreetName = street;
            this.HouseNumber = house;
        }

        public ImageModel Img {
            get
            {
                var img = new ImageModel().GetImg(FkCityId, $"{FkCityId} {Id}.jpg");
                if (img == null)
                {
                    return new ImageModel(0, 0);
                }
                return img;
            }
            private set { }
        }

        public Cities FkCity { get; set; }
        public Countries FkCountry { get; set; }
        public Categotyofhotels FkHotelCategoryNavigation { get; set; }
        public Regions FkRegion { get; set; }
        public ICollection<NumbersOfHotel> NumbersOfHotel { get; set; }
    }
}
