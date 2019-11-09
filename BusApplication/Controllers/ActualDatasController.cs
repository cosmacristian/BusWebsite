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
    public class ActualDatasController : Controller
    {
        private BusDBEntities1 db = new BusDBEntities1();

        // GET: ActualDatas
        public ActionResult Index()
        {
            return View(db.ActualData.ToList());
        }

        // GET: ActualDatas/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ActualData actualData = db.ActualData.Find(id);
            if (actualData == null)
            {
                return HttpNotFound();
            }
            return View(actualData);
        }

        // GET: ActualDatas/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ActualDatas/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,BusNr,LastStation,Time")] ActualData actualData)
        {
            if (ModelState.IsValid)
            {
                db.ActualData.Add(actualData);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(actualData);
        }

        // GET: ActualDatas/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ActualData actualData = db.ActualData.Find(id);
            if (actualData == null)
            {
                return HttpNotFound();
            }
            return View(actualData);
        }

        // POST: ActualDatas/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,BusNr,LastStation,Time")] ActualData actualData)
        {
            if (ModelState.IsValid)
            {
                db.Entry(actualData).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(actualData);
        }

        // GET: ActualDatas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ActualData actualData = db.ActualData.Find(id);
            if (actualData == null)
            {
                return HttpNotFound();
            }
            return View(actualData);
        }

        // POST: ActualDatas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ActualData actualData = db.ActualData.Find(id);
            db.ActualData.Remove(actualData);
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
