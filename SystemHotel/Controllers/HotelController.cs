using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SystemHotel.Services;
using SystemHotel.Models;
using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Linq;

namespace SystemHotel.Controllers
{
    public class HotelController : Controller
    {
        private readonly FindHotelsService findHotels = new FindHotelsService(new HotelContext());

        // GET: Hotel_Controller
        public ActionResult actionSearch()
        {
            var lstModels = findHotels.GetDropDownList();
            
            int selectedIndex = 1;

            ViewBag.Regions = new SelectList(
                lstModels.Result.listOfregions, "Id", "Name", selectedIndex);
            ViewBag.Cities = new SelectList(
                lstModels.Result.listOfcities.Where(c => c.FkRegionId == selectedIndex), "Id", "Name");

            return View();
        }

        public ActionResult GetItems(int id)
        {
            return PartialView(findHotels._dbContext.Cities.Where(c => c.FkRegionId == id).ToList());
        }

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
