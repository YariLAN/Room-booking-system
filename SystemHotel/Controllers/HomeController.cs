using Microsoft.AspNetCore.Mvc;
using SystemHotel.Services;
using SystemHotel.Models;
using System.Threading.Tasks;

namespace SystemHotel.Controllers
{
    public class HomeController : Controller
    {
        private readonly UserService UserService = new UserService(new HotelContext());

        [ModelStateMergeFilter]
        [RestoreModelStateFromTempDataAttribute]
        public IActionResult Index()
        {
            return View();
        }

        // POST: Home/Profile
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ModelStateMergeFilterAttribute]
        [RestoreModelStateFromTempDataAttribute]
        public async Task<IActionResult> Login(UserData logPass)
        {
            if (!ModelState.IsValid)
                return View(logPass);

            if (!(await this.UserService.IsRegistered(logPass)))
            {
                ModelState.AddModelError("notSignIn", "Введен неверный логин или пароль");
                return RedirectToAction(nameof(Index), "Home");
            }
            // тут
            return RedirectToAction(nameof(Index), "LoginAndPasswords", logPass);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Registration(MainDataUser newUser, UserData logPass)
        {
            if (await this.UserService.IsRegistered(logPass))
                ModelState.AddModelError("alreadyRegistr", "Данный пользователь уже зарегистрирован");

            await this.UserService.AddUserAsync(logPass, newUser);
            return RedirectToAction(nameof(Index), "Home");
        }
    }
}
