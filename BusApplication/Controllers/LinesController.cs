using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BusApplication.Models;

namespace BusApplication.Controllers
{
    public class LinesController : Controller
    {
        private BusDBlatestEntities db = new BusDBlatestEntities();

        // GET: Lines
        public ActionResult Index()
        {
            var lines = db.Line.Include(l => l.Station).ToList();
            return View(lines);
        }

        // GET: Lines/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Line line = db.Line.Find(id);
            if (line == null)
            {
                return HttpNotFound();
            }
            return View(line);
        }

        // GET: Lines/Create
        public ActionResult Create()
        {
            ViewBag.StationID = new SelectList(db.Station, "StationID", "StationName");
            return View();
        }

        // POST: Lines/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LineID,StationID,StationNr")] Line line)
        {
            if (ModelState.IsValid)
            {

                var id = db.Line.Count();
                line.ID = id;

                db.Line.Add(line);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.StationID = new SelectList(db.Station, "StationID", "StationName", line.StationID);
            return View(line);
        }

        // GET: Lines/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Line line = db.Line.Find(id);
            if (line == null)
            {
                return HttpNotFound();
            }
            ViewBag.StationID = new SelectList(db.Station, "StationID", "StationName", line.StationID);
            return View(line);
        }

        // POST: Lines/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LineID,StationID,StationNr")] Line line)
        {
            if (ModelState.IsValid)
            {


                db.Entry(line).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.StationID = new SelectList(db.Station, "StationID", "StationName", line.StationID
                );
            return View(line);
        }

        // GET: Lines/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Line line = db.Line.Find(id);
            if (line == null)
            {
                return HttpNotFound();
            }
            return View(line);
        }

        // POST: Lines/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Line line = db.Line.Find(id);
            db.Line.Remove(line);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
