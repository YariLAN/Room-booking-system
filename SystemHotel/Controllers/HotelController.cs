﻿using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SystemHotel.Services;
using SystemHotel.Models;
using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Linq;
using Microsoft.EntityFrameworkCore;

namespace SystemHotel.Controllers
{
    public class HotelController : Controller
    {
        public HotelController() : base() { }

        private readonly FindHotelsService findHotels = new FindHotelsService();
        private readonly NumbersHotelService numbersHotel = new NumbersHotelService();

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

        // GET: Hotel_Controller
        public ActionResult actionSearch()
        {
            SetViewBagsHotel();

            return View();
        }

        // GET: Hotel/GetCities/id
        public ActionResult GetCities(int id)
        {
            var city = findHotels.Cities.Where(
                c => c.FkRegionId == id || c.CityId == 0).ToList();

            return PartialView(city);
        }

        // GET: Hotel/GetCountries/id
        public ActionResult GetRegions(int id)
        {
            var reg = findHotels.Regions.Where(
                c => c.FkCountryId == id || c.RegionId == 0).ToList();

            return PartialView(reg);
        }

        // POST: Hotel/Search
        public ActionResult Search(int id)
        {
            var hotel = findHotels.GetHotels();
            return PartialView(hotel.Where(s => s.FkCityId == id).ToList());
        }

        // GET: Hotel/Booking/?HotelId
        [HttpGet]
        public ActionResult Booking(int Id)
        {
            var num = numbersHotel.GetNumbersHotel(Id);
            ViewBag.FkHotelId = Id;

            return View(num.Result.Where(s => s.FkHotelId == Id).ToList());
        }

        // POST: Hotel/Booking/?
        [HttpPost]
        public ActionResult Booking(BookedRoomModel booked, NumbersOfHotelModel numbers)
        {
            var num = numbersHotel.GetNumbersHotel(numbers.FkHotelId);
            ViewBag.FkHotelId = numbers.FkHotelId;

            return View(num.Result.Where(s => s.FkHotelId == numbers.FkHotelId &&
                s.AmountSeats >= numbers.AmountSeats).ToList());
        }

        // GET: Hotel/Details/5
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
