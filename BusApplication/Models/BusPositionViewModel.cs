using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BusApplication.Models
{
    public class BusPositionViewModel
    {
        public int Id;
        public String BusId;
        public double Latitude;
        public double Longitude;
        public String BusName;

        public BusPositionViewModel()
        {

        }
    }
}