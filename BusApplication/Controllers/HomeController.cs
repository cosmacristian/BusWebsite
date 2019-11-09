using BusApplication.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BusApplication.Controllers
{
    public class HomeController : Controller
    {
        private readonly BusDBEntities1 _dbcontext = new BusDBEntities1();
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
            ViewBag.Bus = _dbcontext.Bus.ToList();
            ViewBag.BusTrace = _dbcontext.BusTrace.ToList();
            ViewBag.Stations = _dbcontext.Station.ToList();
            ViewBag.Line = _dbcontext.Line.ToList();
            ViewBag.Timetable = _dbcontext.Timetable.ToList();
            ViewBag.References = _dbcontext.References.ToList();
            ViewBag.MeasuredData = _dbcontext.MeasuredData.ToList();
            return View();
        }
    }
}