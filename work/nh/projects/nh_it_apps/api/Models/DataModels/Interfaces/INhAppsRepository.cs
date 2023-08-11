using System.Collections.Generic;
using api.Models.Entities;

namespace api.Models.DataModels
{
    public interface INhAppsRepository
    {
        IEnumerable<NhApp> GetAll();
        NhApp GetById(int id);
        bool DatabaseIsAvailable();
        void AddEntity(object model);
        int SaveAll();
    }
}