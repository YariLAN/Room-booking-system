using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SystemHotel
{
    public partial class Images
    {
        [Key]
        public int ImageId { get; set; }
        public string ImageName { get; set; }
        public int FkCityId { get; set; }
        public int FkHotelId { get; set; }

        [NotMapped]
        public IFormFile MyImage { set; get; }

        public Images() { }
        public Images(int id, int cityId, string name, int hotel)
        {
            ImageId = id;
            FkCityId = cityId;
            ImageName = name;
            FkHotelId = hotel;
        }

        public virtual Cities FkCity { get; set; }
        public virtual Hotels FkHotel { get; set; }
    }
}
