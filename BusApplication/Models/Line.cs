//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BusApplication.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Line
    {
        public int ID { get; set; }
        public int LineID { get; set; }
        public int StationID { get; set; }
        public int StationNr { get; set; }
    
        public virtual Station Station { get; set; }
    }
}