using System.Security.Cryptography;
using System.Text;
using System.Linq;

namespace SystemHotel.Models
{
    public class UserData
    {
        public int UserId { get; set; }
        public string Login { get; set; }
        public string Pass { get; set; }
        public string GetHashToPassword()
        {
            var md5 = MD5.Create();
            byte[] b = Encoding.UTF8.GetBytes(this.Pass);
            var hash = md5.ComputeHash(b);

            StringBuilder sb = new StringBuilder();

            foreach (var symbols in hash)
                sb.Append(symbols.ToString("X2"));
            
            return (this.Pass) = sb.ToString();
        }
        public bool EqualsPassword(string obj)
        {
            return (this.Pass == obj);
        }
        public bool EqualsLogin(string obj)
        {
            return (this.Login == obj);
        }
    }
}
