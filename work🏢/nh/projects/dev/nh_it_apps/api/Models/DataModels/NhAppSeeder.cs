using api.Models.Entities;
using Microsoft.AspNetCore.Hosting;
using Newtonsoft.Json;
using Serilog;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.Json;

namespace api.Models.DataModels
{
    public class NhAppSeeder : INhAppSeeder
    {
        private readonly NhAppContext _ctx;
        private readonly IWebHostEnvironment _webEnv;

        public NhAppSeeder(NhAppContext ctx, IWebHostEnvironment webEnv)
        {
            _ctx = ctx;
            _webEnv = webEnv;
        }

        public void TrySeeding()
        {
            if (!_ctx.Database.CanConnect()) { 
                Log.Information("Database not available. Skipping seeding...");
                return; 
            };

            _ctx.Database.EnsureCreated();

            if (!_ctx.NhApps.Any())
            {
                Log.Information("No data found in the database. Initiating database seeding...");
                var filePath = Path.Combine(_webEnv.ContentRootPath, "Data", "Samples", "data.json");
                var json = File.ReadAllText(filePath);
                var nhApps = JsonConvert.DeserializeObject<IEnumerable<NhApp>>(json);

                _ctx.NhApps.AddRange(nhApps);

                var rowCount = _ctx.SaveChanges();

                if (nhApps.Any() && rowCount == 0) Log.Error("No data was written into the database!");
            }
        }
    }
}