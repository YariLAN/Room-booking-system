using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace SystemHotel
{
    public partial class Images
    {
        public int ImageId { get; set; }
        public int FkCityId { get; set; }
        public string ImageName { get; set; }

        public virtual Cities FkCity { get; set; }
    }
}
