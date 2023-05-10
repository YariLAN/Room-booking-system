using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SystemHotel.Services;
using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace SystemHotel.Controllers
{
    public class HotelController : Controller
    {
        private readonly FindHotelsService findHotels = new FindHotelsService(new HotelContext());

        // GET: Hotel_Controller
        public ActionResult actionSearch()
        {
            var adressTuple = findHotels.GetDropDownList();

            return View(adressTuple);
        }

        //public Task<IActionResult> Search()
        //{

        //}



        // GET: Hotel_Controller/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }


        // GET: Hotel_Controller/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Hotel_Controller/Edit/5
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

        // GET: Hotel_Controller/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Hotel_Controller/Delete/5
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
