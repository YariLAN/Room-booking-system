using SystemHotel.Models;
using System.Threading.Tasks;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System;

namespace SystemHotel.Services
{
    public class UserService: HotelContext
    {
        public UserService(): base() {}

        public async Task AddUserAsync(UserData logPass, MainDataUser mainDataUser)
        {
            var entity = new UsLoginAndPassword()
            {
                UserId = logPass.UserId,
                Login = logPass.Login,
                Pass = logPass.GetHashToPassword(),
            };
            this.UsLoginAndPasswords.Add(entity);
            await this.SaveChangesAsync();

            var main = new UsMainData()
            {
                LastName = mainDataUser.LastName,
                FirstName = mainDataUser.FirstName,
                MiddleName = mainDataUser.MiddleName,
                DateOfBirth = mainDataUser.DateOfBirth,
                FkUser = entity,
                FkUserId = entity.UserId,
            };
            this.UsMainDatas.Add(main);
            await this.SaveChangesAsync();
        }

        public async Task<List<UserData>> GetAllLoginPasswords()
        {
            return await this.UsLoginAndPasswords.Select(
                    s => new UserData(s.UserId, s.Login, s.Pass)).ToListAsync();
        }

        public async Task<Tuple<UserData,MainDataUser>> GetUser(string login)
        {
            var logPass = await this.UsLoginAndPasswords.Select(
                    s => new UserData {
                        UserId = s.UserId,
                        Login = s.Login,
                        Pass = s.Pass,
                    }
                ).FirstOrDefaultAsync(l => l.Login == login);

            var dataUser = await this.UsMainDatas.Select(
                    s => new MainDataUser
                    {
                        FkUserID = s.FkUserId,
                        FirstName = s.FirstName,
                        MiddleName = s.MiddleName,
                        LastName = s.LastName,
                        DateOfBirth = s.DateOfBirth,
                    }
                ).FirstOrDefaultAsync(l => l.FkUserID == logPass.UserId);

            return Tuple.Create(logPass, dataUser);
        }

        public async Task<UserData> GetLoginPassword(string login)
        {
            return await this.UsLoginAndPasswords.Select(
                    s => new UserData(s.UserId, s.Login, s.Pass)
                ).FirstOrDefaultAsync(l => l.Login == login);
        }

        public async Task<UserData> GetAdmin()
        {
            return await this.UsLoginAndPasswords.Select(
                    s => new UserData {
                        UserId = s.UserId,
                        Login = s.Login,
                        Pass = s.Pass,
                    }
                ).FirstOrDefaultAsync(l => l.UserId == 1);
        }


        public async Task<bool> IsRegistered(UserData refUser)
        {
            var user = await this.GetLoginPassword(refUser.Login);
            if (user == null || !user.EqualsPassword(refUser.GetHashToPassword()) )
                return false;
            return true;
        }

        public async Task<bool> IsAdmin(UserData refUser)
        {
            //AdminYarik
            var user = await this.GetAdmin();
            if (user.Login != refUser.Login || !user.EqualsPassword(refUser.GetHashToPassword()))
                return false;
            return true;
        }

    }
}
