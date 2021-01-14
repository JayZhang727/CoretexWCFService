using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace CoretexWCFService.Models
{
    [DataContract]
    public class Vehicle
    {
        [DataMember]
        public int? Id { get; set; }
        [DataMember]
        public string Make { get; set; }
        [DataMember]
        public string Model { get; set; }
        [DataMember]
        public short Year { get; set; }
        [DataMember]
        public string VIN { get; set; }
    }
}