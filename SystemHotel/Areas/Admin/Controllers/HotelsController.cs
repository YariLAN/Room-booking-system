using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using SystemHotel.Models;
using SystemHotel.Services;

namespace SystemHotel.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class HotelsController : Controller
    {
        private readonly FindHotelsService findHotels = new FindHotelsService();

        public HotelsController(HotelContext context) {}

        // GET: Admin/HotelModels
        public IActionResult Index()
        {
            var hotelContext = findHotels.GetHotels();
            return PartialView(hotelContext.ToList());
        }

        // GET: Admin/HotelModels/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var hotelModel = findHotels.GetHotels().FirstOrDefault(m => m.Id == id);
            if (hotelModel == null)
            {
                return NotFound();
            }

            return View(hotelModel);
        }

        // GET: Admin/HotelModels/Create
        public IActionResult Create()
        {
            ViewData["FkCityId"] = new SelectList(findHotels.Cities, "CityId", "CityName");
            ViewData["FkCountryId"] = new SelectList(findHotels.Countries, "CountryId", "CountryName");
            ViewData["FkRegionId"] = new SelectList(findHotels.Regions, "RegionId", "RegionName");
            return View();
        }

        // POST: Admin/HotelModels/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("FkCountryId,FkRegionId,FkCityId,StreetName,HouseNumber,FkHotelCategory,Id,Name")] HotelModel hotelModel)
        {
            if (ModelState.IsValid)
            {
                findHotels.Add(hotelModel);
                await findHotels.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["FkCityId"] = new SelectList(findHotels.Cities, "CityId", "CityName", hotelModel.FkCityId);
            ViewData["FkCountryId"] = new SelectList(findHotels.Countries, "CountryId", "CountryName", hotelModel.FkCountryId);
            ViewData["FkRegionId"] = new SelectList(findHotels.Regions, "RegionId", "RegionName", hotelModel.FkRegionId);
            return View(hotelModel);
        }

        // GET: Admin/HotelModels/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var hotelModel = await findHotels.HotelModel.FindAsync(id);
            if (hotelModel == null)
            {
                return NotFound();
            }
            ViewData["FkCityId"] = new SelectList(findHotels.Cities, "CityId", "CityName", hotelModel.FkCityId);
            ViewData["FkCountryId"] = new SelectList(findHotels.Countries, "CountryId", "CountryName", hotelModel.FkCountryId);
            ViewData["FkRegionId"] = new SelectList(findHotels.Regions, "RegionId", "RegionName", hotelModel.FkRegionId);
            return View(hotelModel);
        }

        // POST: Admin/HotelModels/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("FkCountryId,FkRegionId,FkCityId,StreetName,HouseNumber,FkHotelCategory,Id,Name")] HotelModel hotelModel)
        {
            if (id != hotelModel.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    findHotels.Update(hotelModel);
                    await findHotels.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!HotelModelExists(hotelModel.Id))
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
            ViewData["FkCityId"] = new SelectList(findHotels.Cities, "CityId", "CityName", hotelModel.FkCityId);
            ViewData["FkCountryId"] = new SelectList(findHotels.Countries, "CountryId", "CountryName", hotelModel.FkCountryId);
            ViewData["FkRegionId"] = new SelectList(findHotels.Regions, "RegionId", "RegionName", hotelModel.FkRegionId);
            return View(hotelModel);
        }

        // GET: Admin/HotelModels/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var hotelModel = await findHotels.HotelModel
                .Include(h => h.FkCity)
                .Include(h => h.FkCountry)
                .Include(h => h.FkRegion)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (hotelModel == null)
            {
                return NotFound();
            }

            return View(hotelModel);
        }

        // POST: Admin/HotelModels/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var hotelModel = await findHotels.HotelModel.FindAsync(id);
            findHotels.HotelModel.Remove(hotelModel);
            await findHotels.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool HotelModelExists(int id)
        {
            return findHotels.HotelModel.Any(e => e.Id == id);
        }
    }
}
