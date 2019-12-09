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
            List<Buses> busList = _dbcontext.Buses.ToList();
            ViewBag.BusInfo = busList;
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
            model.Traces = _dbcontext.BusTrace.OrderBy(C => C.OrderNum).ToList();
            model.Stations = _dbcontext.Station.ToList();
            model.Lines = _dbcontext.Line.ToList();
            int maxId = model.Traces.Max(a => a.Id);
            foreach(Buses b in busList)
            {
                int traceNum = model.Traces.Where(a => a.BusId == b.BusId).Count();
                
                if(traceNum == 0)
                {
                    var stations = model.Lines.Where(l => l.LineID == b.BusId).OrderBy(l=>l.StationNr).ToList();
                    if(stations.Count != 0)
                    {
                        //int order = 0;
                        foreach(Line st in stations)
                        {
                            maxId += 1;
                            Station station = model.Stations.Find(s => s.StationID == st.StationID);
                            BusTrace trace = new BusTrace();
                            trace.BusId = b.BusId;
                            trace.Id = maxId;
                            trace.Latitude = station.Latitude;
                            trace.Longitude = station.Longitude;
                         //   trace.OrderNum = order;
                         //   order += 1;
                            model.Traces.Add(trace);
                        }
                    }
                }

            }
            int order = 0;
            foreach (BusTrace trace in model.Traces)
            {
                trace.OrderNum = order;
                //   order += 1;
            }

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