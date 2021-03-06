﻿using BusApplication.Models;
using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BusApplication.Controllers
{
    public class HomeController : Controller
    {
        private readonly BusDBlatestEntities _dbcontext = new BusDBlatestEntities();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        [ActionName("Map")]
        public ActionResult Map()
        {
            ViewBag.Message = "Your contact page.";
            ViewBag.BusInfo = _dbcontext.Buses.ToList();
            var temp = (from p in _dbcontext.BusPositions
             select new
             {
                 Id = p.Id,
                 BusId = p.BusId,
                 Latitude = p.Latitude,
                 Longitude = p.Longitude,
                 BusName = p.Buses.BusName,
                 Timestamp = p.Timestamp
             }).ToList();
            List<BusPositionViewModel> posList = new List<BusPositionViewModel>();
            foreach(var i in temp)
            {
                BusPositionViewModel o = new BusPositionViewModel();
                o.Id = i.Id;
                o.BusId = i.BusId;
                o.Latitude = i.Latitude;
                o.Longitude = i.Longitude;
                o.BusName = i.BusName;
                o.Timestamp = i.Timestamp;
                posList.Add(o);
            }
            ViewBag.Bus = posList;
            ViewBag.BusTrace = _dbcontext.BusTrace.OrderBy(a=>a.OrderNum).ToList();
            ViewBag.Stations = _dbcontext.Station.ToList();
            ViewBag.Line = _dbcontext.Line.ToList();
            ViewBag.Timetable = _dbcontext.Timetable.ToList();
            ViewBag.References = _dbcontext.References.ToList();
            ViewBag.MeasuredData = _dbcontext.MeasuredData.ToList();
            ViewBag.BusPositions = _dbcontext.BusPositions.ToList();

            return View();
        }
    }
}