using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using SystemHotel.Services;
using SystemHotel.Models;
using Newtonsoft.Json;

namespace SystemHotel.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class HomeController : Controller
    {
        private readonly UserService UserService = new UserService();

        public HomeController(HotelContext context) { }

        // GET: Admin/Home
        public IActionResult Index()
        {
            return View();
        }

        // POST: Home/Profile
        [HttpPost]
        [ValidateAntiForgeryToken]

        public async Task<IActionResult> Login(UserData logPass)
        {
            if (!ModelState.IsValid)
                return View(logPass);

            if (!(await UserService.IsAdmin(logPass)))
            {
                ModelState.AddModelError("notSignIn", "Введен неверный логин или пароль админа");
                return RedirectToAction(nameof(Index), "Home");
            }
            var user = await UserService.GetUser(logPass.Login);

            var str = JsonConvert.SerializeObject(user);
            TempData["CompleteSignIn"] = str;

            return RedirectToAction("Index", "Menu");
        }



        // GET: Admin/Home/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var usLoginAndPassword = await UserService.UsLoginAndPasswords
                .FirstOrDefaultAsync(m => m.UserId == id);
            if (usLoginAndPassword == null)
            {
                return NotFound();
            }

            return View(usLoginAndPassword);
        }

        // GET: Admin/Home/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Admin/Home/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("UserId,Login,Pass")] UsLoginAndPassword usLoginAndPassword)
        {
            if (ModelState.IsValid)
            {
                UserService.Add(usLoginAndPassword);
                await UserService.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(usLoginAndPassword);
        }

        // GET: Admin/Home/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var usLoginAndPassword = await UserService.UsLoginAndPasswords.FindAsync(id);
            if (usLoginAndPassword == null)
            {
                return NotFound();
            }
            return View(usLoginAndPassword);
        }

        // POST: Admin/Home/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("UserId,Login,Pass")] UsLoginAndPassword usLoginAndPassword)
        {
            if (id != usLoginAndPassword.UserId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    UserService.Update(usLoginAndPassword);
                    await UserService.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!UsLoginAndPasswordExists(usLoginAndPassword.UserId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(usLoginAndPassword);
        }

        // GET: Admin/Home/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var usLoginAndPassword = await UserService.UsLoginAndPasswords
                .FirstOrDefaultAsync(m => m.UserId == id);
            if (usLoginAndPassword == null)
            {
                return NotFound();
            }

            return View(usLoginAndPassword);
        }

        // POST: Admin/Home/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var usLoginAndPassword = await UserService.UsLoginAndPasswords.FindAsync(id);
            UserService.UsLoginAndPasswords.Remove(usLoginAndPassword);
            await UserService.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool UsLoginAndPasswordExists(int id)
        {
            return UserService.UsLoginAndPasswords.Any(e => e.UserId == id);
        }
    }
}
