using BusApplication.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BusApplication.Controllers
{
    public class DataController : Controller
    {
        private readonly BusDBlatestEntities _dbcontext = new BusDBlatestEntities();
        // GET: Data
        public ActionResult GetLine()
        {
            return View();
        }
    }
}