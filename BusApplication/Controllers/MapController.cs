using BusApplication.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BusApplication.Controllers
{
    public class MapController : Controller
    {
        private readonly BusDBlatestEntities _dbcontext = new BusDBlatestEntities();
        public ActionResult Index()
        {
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
            var model = new EditBusLineViewModel();
            model.Traces = _dbcontext.BusTrace.ToList();
            model.Stations = _dbcontext.Station.ToList();
            model.Lines = _dbcontext.Line.ToList();

            return View(model);
        }

        [HttpPost]
        public ActionResult Index(EditBusLineViewModel model)//[Bind(Include = "StationID,StationName,Longitude,Latitude")] Station station)
        {
            List<BusTrace> oldTraces = _dbcontext.BusTrace.ToList();
            List<Station> oldStations = _dbcontext.Station.ToList();
            List<Line> oldLines = _dbcontext.Line.ToList();
            if(model.Lines != null)
            {

            }
            if (model.Stations != null)
            {
                foreach(var entry in model.Stations)
                {
                    var res = oldStations.Where(x => x.StationID == entry.StationID).FirstOrDefault();
                    if(res != null)
                    {
                        if(entry.Longitude !=0 && entry.Latitude != 0) { 
                            res.StationName = entry.StationName;
                            res.Longitude = entry.Longitude;
                            res.Latitude = entry.Latitude;
                        }
                        else
                        {
                            _dbcontext.Station.Remove(res);
                        }
                    }
                    else
                    {
                        if (entry.Longitude != 0 && entry.Latitude != 0)
                        {
                            _dbcontext.Station.Add(entry);
                        }
                            
                    }
                }
            }
            if (model.Traces != null)
            {
                foreach (var entry in model.Traces)
                {
                    var res = oldTraces.Where(x => x.Id == entry.Id).FirstOrDefault();
                    if (res != null)
                    {
                        if (entry.Longitude != 0 && entry.Latitude != 0)
                        {
                            res.OrderNum = entry.OrderNum;
                            res.EndPoint = entry.EndPoint;
                            res.Timestamp = DateTime.Now;
                            res.Longitude = entry.Longitude;
                            res.Latitude = entry.Latitude;
                        }
                        else
                        {
                            _dbcontext.BusTrace.Remove(res);
                        }
                    }
                    else
                    {
                        if (entry.Longitude != 0 && entry.Latitude != 0)
                        {
                            if (entry.EndPoint == false)
                                entry.EndPoint = true;

                            entry.Timestamp = DateTime.Now;
                            _dbcontext.BusTrace.Add(entry);
                        }

                    }
                }
            }
            _dbcontext.SaveChanges();
            return RedirectToAction("Index");
        }
        
    }
}