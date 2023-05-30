using System;

namespace SystemHotel.Models
{
    public class MainDataUser
    {
        public int FkUserID { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public DateTime DateOfBirth { get; set; }

        public MainDataUser() { }
    }
}
