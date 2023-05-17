using System.Linq;

namespace SystemHotel.Models
{
    public class ImageModel: SettlementsAbstractModel
    {
        public ImageModel(): base() { }
        public ImageModel(int id, int cityId, string name = "") : base(id, name) {
            this.FkCityId = cityId;
        }

        public int FkCityId { get; set; }
        public virtual Cities FkCity { get; set; }

        public ImageModel GetImg(int cityId, string name)
        {
            return _dbContext.Images.Select(s => new ImageModel(s.ImageId, s.FkCityId, s.ImageName))
                .ToList().FirstOrDefault(l => l.FkCityId == cityId && l.Name == name);
        }
    }
}
