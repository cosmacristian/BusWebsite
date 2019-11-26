using BusApplication.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace BusApplication.Controllers
{
    public class TimeController : Controller
    {
        static HttpClient client = new HttpClient();
        // GET: Time
        [HttpGet]
        public async Task<Object> Index(int stationId)
        {
            //Proxy needed, because cross domain requests are blocked 
            List<BusTime> busTimes = new List<BusTime>();
            HttpResponseMessage response = await client.GetAsync("http://193.226.0.198:5210/WCFService/Service1/web/GetTimeList?StationID=" + stationId);
            if (response.IsSuccessStatusCode)
            {
                string data = await response.Content.ReadAsStringAsync();
                //JavaScriptSerializer JsonConvert = new JavaScriptSerializer();
                busTimes = JsonConvert.DeserializeObject<List<BusTime>>(data);
            }
            return Json(busTimes);
        }
    }
}