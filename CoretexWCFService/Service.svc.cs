using CoretexWCFService.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace CoretexWCFService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service.svc or Service.svc.cs at the Solution Explorer and start debugging.
    public class Service : IService
    {
        private CoretexCodingAssessmentDbEntities _dbContext = new CoretexCodingAssessmentDbEntities();

        public IEnumerable<GetAllVehicles_Result> GetAllVehicles()
        {
            var vehicles = _dbContext.GetAllVehicles();
            return vehicles;
        }

        public GetVehicle_Result GetVehicle(string id)
        {
            var vehicle = _dbContext.GetVehicle(int.Parse(id)).FirstOrDefault();
            return vehicle;
        }

        public string PutVehicle(Vehicle vehicle)
        {
            var result = "";
            if(vehicle.Id == null || vehicle.Id == 0)
            {
                result = AddVehicle(vehicle);
            }
            else
            {
                result = UpdateVehicle(vehicle);
            }

            return result;
        }

        public string DeleteVehicle(string id)
        {
            var result = _dbContext.DeleteVehicle(int.Parse(id)).ToString();
            return result;
        }

        private string AddVehicle(Vehicle vehicle)
        {
            var result = _dbContext.AddVehicle(vehicle.Make, vehicle.Model, vehicle.Year, vehicle.VIN).ToString();
            return result;
        }

        private string UpdateVehicle(Vehicle vehicle)
        {
            var result = _dbContext.UpdateVehicle(vehicle.Id, vehicle.Make, vehicle.Model, vehicle.Year, vehicle.VIN).ToString();
            return result;
        }
    }
}
