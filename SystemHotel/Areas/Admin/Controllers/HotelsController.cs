using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using SystemHotel.Models;
using SystemHotel.Services;
using SystemHotel.Controllers;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Hosting;

namespace SystemHotel.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class HotelsController : Controller
    {
        IWebHostEnvironment _appEnvironment;
        private HotelController _hotelCont = new HotelController();
        private readonly FindHotelsService findHotels = new FindHotelsService();

        public HotelsController(IWebHostEnvironment appEnvironment) 
        {
            _appEnvironment = appEnvironment;
        }

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
            SetViewBagsHotel();

            return View();
        }

        // GET: HotelModels/GetCities/
        public ActionResult GetCities(int id)
        {
            return _hotelCont.GetCities(id);
        }

        // GET: HotelModels/GetCountries/
        public ActionResult GetRegions(int id)
        {
            return _hotelCont.GetRegions(id);
        }

        // POST: Admin/HotelModels/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(HotelModel hM, [FromForm] Images img)
        {

            if (ModelState.IsValid)
            {
                await findHotels.AddHotelAsync(hM, img, _appEnvironment);
                return RedirectToAction(nameof(Index));
            }

            ViewData["FkCityId"] = new SelectList(findHotels.Cities, "CityId", "CityName", hM.FkCityId);
            ViewData["FkCountryId"] = new SelectList(findHotels.Countries, "CountryId", "CountryName", hM.FkCountryId);
            ViewData["FkRegionId"] = new SelectList(findHotels.Regions, "RegionId", "RegionName", hM.FkRegionId);

            return View(hM);
        }

        public void SetViewBagsHotel(int countryId = 1, int cityId = 1, int regionId = 1, int category = 1)
        {
            var lstModels = findHotels.GetDropDownList();

            ViewBag.Countries = new SelectList(
                lstModels.Result.listOfcountries, "Id", "Name", countryId);

            ViewBag.Regions = new SelectList(lstModels.Result.listOfregions.Where(
                b => b.FkCountryId == countryId || b.Id == 0), "Id", "Name", regionId);

            ViewBag.Cities = new SelectList(lstModels.Result.listOfcities.Where(
                c => c.FkRegionId == regionId || c.Id == 0), "Id", "Name", cityId);

            ViewBag.Category = new SelectList(
                lstModels.Result.listOfcategories, "Id", "Name", category);
        }


        // GET: Admin/HotelModels/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var hM = await findHotels.GetHotel(id);
            if (hM == null)
            {
                return NotFound();
            }

            SetViewBagsHotel(hM.FkCountryId, hM.FkCityId, hM.FkRegionId, hM.FkHotelCategory);

            return View(hM);
        }

        // POST: Admin/HotelModels/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, HotelModel hM, [FromForm] [Bind("MyImage")] Images img)
        {
            if (id != hM.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    await findHotels.UpdateHotelAsync(hM, _appEnvironment, img);
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!HotelModelExists(hM.Id))
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

            SetViewBagsHotel(hM.FkCountryId, hM.FkCityId, hM.FkRegionId, hM.FkHotelCategory);

            return View(hM);
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
