using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using api.Models.Entities;

namespace api.Models.DataModels
{
    public class NhAppContext : DbContext
    {
        private readonly IConfiguration _config;

        public DbSet<NhApp> NhApps { get; set; }
        public DbSet<AppService> AppServices { get; set; }
        public DbSet<Contact> Contacts { get; set; }
        public DbSet<IP> IPs { get; set; }
        public DbSet<NetworkInterface> NetworkInterfaces { get; set; }
        public DbSet<Server> Servers { get; set; }
        public DbSet<Storage> Storages { get; set; }
        public NhAppContext(IConfiguration config)
        {
            _config = config;
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            var connectionString = _config.GetValue<string>("DB_CONNECTION_STRING");

            optionsBuilder.UseSqlServer(connectionString);
        }
    }
}