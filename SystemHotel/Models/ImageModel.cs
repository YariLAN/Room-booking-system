using System.Linq;

namespace SystemHotel.Models
{
    public class ImageModel: SettlementsAbstractModel
    {
        public ImageModel(): base() { }
        public ImageModel(int id, int cityId, string name = "", int hotel = 0) : base(id, name) {
            this.FkCityId = cityId;
            this.FkHotelId = hotel;
        }

        public int FkCityId { get; set; }
        public int FkHotelId { get; set; }
        public virtual Cities FkCity { get; set; }

        public ImageModel GetImg(int hotelId)
        {
            return _dbContext.Images.Select(s => new ImageModel(s.ImageId, s.FkCityId, s.ImageName, s.FkHotelId))
                .ToList().FirstOrDefault(l => l.FkHotelId == hotelId);
        }
    }
}
