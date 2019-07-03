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
        private readonly BusDBEntities9 _dbcontext = new BusDBEntities9();
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
            ViewBag.Buses = _dbcontext.Buses.ToList();
            ViewBag.BusTrace = _dbcontext.BusTraces.ToList();
            ViewBag.Stations = _dbcontext.Stations.ToList();
            return View();
        }
    }
}