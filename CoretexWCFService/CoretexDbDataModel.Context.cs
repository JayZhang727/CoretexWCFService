﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CoretexWCFService
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class CoretexCodingAssessmentDbEntities : DbContext
    {
        public CoretexCodingAssessmentDbEntities()
            : base("name=CoretexCodingAssessmentDbEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
    
        public virtual int AddVehicle(string make, string model, Nullable<short> year, string vin)
        {
            var makeParameter = make != null ?
                new ObjectParameter("make", make) :
                new ObjectParameter("make", typeof(string));
    
            var modelParameter = model != null ?
                new ObjectParameter("model", model) :
                new ObjectParameter("model", typeof(string));
    
            var yearParameter = year.HasValue ?
                new ObjectParameter("year", year) :
                new ObjectParameter("year", typeof(short));
    
            var vinParameter = vin != null ?
                new ObjectParameter("vin", vin) :
                new ObjectParameter("vin", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("AddVehicle", makeParameter, modelParameter, yearParameter, vinParameter);
        }
    
        public virtual int DeleteVehicle(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("Id", id) :
                new ObjectParameter("Id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("DeleteVehicle", idParameter);
        }
    
        public virtual ObjectResult<GetAllVehicles_Result> GetAllVehicles()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetAllVehicles_Result>("GetAllVehicles");
        }
    
        public virtual ObjectResult<GetVehicle_Result> GetVehicle(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("Id", id) :
                new ObjectParameter("Id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetVehicle_Result>("GetVehicle", idParameter);
        }
    
        public virtual int UpdateVehicle(Nullable<int> id, string make, string model, Nullable<short> year, string vin)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            var makeParameter = make != null ?
                new ObjectParameter("make", make) :
                new ObjectParameter("make", typeof(string));
    
            var modelParameter = model != null ?
                new ObjectParameter("model", model) :
                new ObjectParameter("model", typeof(string));
    
            var yearParameter = year.HasValue ?
                new ObjectParameter("year", year) :
                new ObjectParameter("year", typeof(short));
    
            var vinParameter = vin != null ?
                new ObjectParameter("vin", vin) :
                new ObjectParameter("vin", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("UpdateVehicle", idParameter, makeParameter, modelParameter, yearParameter, vinParameter);
        }
    }
}
