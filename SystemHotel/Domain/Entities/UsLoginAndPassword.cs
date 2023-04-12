using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using SystemHotel.Models;
// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace SystemHotel
{
    public partial class UsLoginAndPassword
    {
        
        public int UserId { get; set; }
        [Required]
        public string Login { get; set; }
        [Required]
        public string Pass { get; set; }
    }
}
