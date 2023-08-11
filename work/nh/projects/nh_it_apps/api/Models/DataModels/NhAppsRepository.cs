using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using api.Models.Entities;

namespace api.Models.DataModels
{
    public class NhAppsRepository : INhAppsRepository
    {
        private readonly NhAppContext _ctx;

        public DbSet<NhApp> NhApps { get; set; }
        public NhAppsRepository(NhAppContext ctx)
        {
            _ctx = ctx;
        }
        public IEnumerable<NhApp> GetAll () {
            return _ctx.NhApps.ToList();
        }
        public bool DatabaseIsAvailable()
        {
            return _ctx.Database.CanConnect();
        }
        public void AddEntity(object model)
        {
            _ctx.Add(model);
        }
        public int SaveAll()
        {
            return _ctx.SaveChanges();
        }

        public NhApp GetById(int id)
        {
             var nhApp =    _ctx.NhApps
                            .Include(o => o.Contacts)
                            .Include(o => o.AppServices)
                                .ThenInclude(o => o.Servers)
                                    .ThenInclude(o => o.Storages)
                            .Include(o => o.AppServices)
                                .ThenInclude(o => o.Servers)
                                    .ThenInclude(o => o.NetworkInterfaces)
                                        .ThenInclude(o => o.IPs)
                            .Where(app => app.Id == id)
                            .FirstOrDefault();
            return nhApp;
        }

        public NhApp GetByIdwContent(int id)
        {
            var app =  _ctx.NhApps.Where(a => a.Id == id).FirstOrDefault();

            return app;
            
            /* _ctx.NhApps
                        .Include(o => o.AppServices)
                        .Include(o => o.Contacts)
                        .Where(o => o.Id == id)
                        .FirstOrDefault(); */
        }
    }
}