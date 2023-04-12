using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SystemHotel.Controllers
{
    public class LoginAndPasswords : Controller
    {
        private readonly HotelContext _db;

        public LoginAndPasswords(HotelContext db)
        {
            _db = db;
        }

        // GET: LoginAndPasswords
        public ActionResult Index()
        {
            return View();
        }


        // POST: LoginAndPasswords/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: LoginAndPasswords/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: LoginAndPasswords/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: LoginAndPasswords/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: LoginAndPasswords/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
