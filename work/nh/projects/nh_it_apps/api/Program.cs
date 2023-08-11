using api.Models.DataModels;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Serilog;
using Serilog.Events;
using Serilog.Sinks.RollingFileAlternate;
using System;
using System.IO;

namespace api
{
    public class Program
    {
        public static void Main(string[] args)
        {
            InitLog();

            var host = CreateHostBuilder(args).Build();
            RunSeeding(host);

            Log.Information("API starting...");
            host.Run();
        }
        private static void RunSeeding(IHost host)
        {
            var scopeFactory = host.Services.GetService<IServiceScopeFactory>();
            try
            {
                using (var scope = scopeFactory.CreateScope())
                {
                    var seeder = scope.ServiceProvider.GetService<INhAppSeeder>();
                    seeder.TrySeeding();
                }    
            }
            catch (Exception ex) {
                Log.Error<Exception>("Database seeding failed due to following error:", ex);
            }
        }
 
        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .UseSerilog((context, services, configuration) => configuration
                    .MinimumLevel.Override("api", LogEventLevel.Information)
                    .ReadFrom.Configuration(context.Configuration)
                    .ReadFrom.Services(services)
                    .Enrich.FromLogContext())
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                });

        private static void InitLog()
        {
            Log.Logger = new LoggerConfiguration()
                .MinimumLevel.Debug()
            .MinimumLevel.Override("Microsoft", LogEventLevel.Information)
            .Enrich.FromLogContext()
            .WriteTo.Console()
            .WriteTo.RollingFileAlternate(
                Path.Combine(Directory.GetCurrentDirectory(), "logs"),
                fileSizeLimitBytes: 1_000_000)
            .CreateLogger();

            Log.Information("API app initialization satrting...");
        }
    }
}
