using SystemHotel.Models;
using System.Threading.Tasks;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;

namespace SystemHotel.Services
{
    public class UserService
    {
        private readonly HotelContext DbContext;

        public UserService(HotelContext DbContext)
        {
            this.DbContext = DbContext;
        }

        public async Task AddUserAsync(UserData logPass, MainDataUser mainDataUser)
        {
            var entity = new UsLoginAndPassword()
            {
                UserId = logPass.UserId,
                Login = logPass.Login,
                Pass = logPass.GetHashToPassword(),
            };
            DbContext.UsLoginAndPasswords.Add(entity);
            await DbContext.SaveChangesAsync();

            var main = new UsMainData()
            {
                LastName = mainDataUser.LastName,
                FirstName = mainDataUser.FirstName,
                MiddleName = mainDataUser.MiddleName,
                DateOfBirth = mainDataUser.DateOfBirth,
                FkUser = entity,
                //FkUserId = entity.UserId,
            };

            DbContext.UsMainDatas.Add(main);
            await DbContext.SaveChangesAsync();
        }

        public async Task<List<UserData>> GetAllLoginPasswords()
        {
            return await DbContext.UsLoginAndPasswords.Select(
                    s => new UserData
                    {
                        UserId = s.UserId,
                        Login = s.Login,
                        Pass = s.Pass,
                    }
                ).ToListAsync();
        }

        public async Task<UserData> GetLoginPassword(string login)
        {
            return await DbContext.UsLoginAndPasswords.Select(
                    s => new UserData
                    {
                        UserId = s.UserId,
                        Login = s.Login,
                        Pass = s.Pass,
                    }
                ).FirstOrDefaultAsync(l => l.Login == login);
        }

        public async Task<bool> IsRegistered(UserData refUser)
        {
            var user = await this.GetLoginPassword(refUser.Login);
            if (user == null || !user.EqualsPassword(refUser.GetHashToPassword()) )
                return false;
            return true;
        }

    }
}
