using CoretexWCFService.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace CoretexWCFService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService" in both code and config file together.
    [ServiceContract]
    public interface IService
    {
        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "GetAllVehicles/", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        IEnumerable<GetAllVehicles_Result> GetAllVehicles();

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "GetVehicle/{id}", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        GetVehicle_Result GetVehicle(string id);

        [OperationContract]
        [WebInvoke(Method = "PUT", UriTemplate = "PutVehicle/", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        string PutVehicle(Vehicle vehicle);

        [OperationContract]
        [WebInvoke(Method = "DELETE", UriTemplate = "DeleteVehicle/{id}", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        string DeleteVehicle(string id);

    }
}
