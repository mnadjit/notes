using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;
using System.IO;
using Microsoft.Extensions.Configuration;

using Serilog;
using Serilog.Events;
using Serilog.Sinks.RollingFileAlternate;

namespace api
{
    public class Program
    {
        public static void Main(string[] args)
        {
            InitLog();

            CreateHostBuilder(args).Build()
                .Run();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .UseSerilog((context, services, configuration) => configuration
                    .MinimumLevel.Override("api", LogEventLevel.Information)
                    .ReadFrom.Configuration(context.Configuration)
                    .ReadFrom.Services(services)
                    .Enrich.FromLogContext())
                .ConfigureAppConfiguration(UseCustomConfigFile)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                });

        private static void UseCustomConfigFile(HostBuilderContext hostBldr, IConfigurationBuilder cfgBldr)
        {
            var customCfgBuilder = new ConfigurationBuilder();

            var config = customCfgBuilder
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("config.json", optional: false, reloadOnChange: true)
                .AddJsonFile("config.override.json", optional: true, reloadOnChange: true)
                .Build();

            cfgBldr.Sources.Insert(1, customCfgBuilder.Sources[0]);
            cfgBldr.Sources.Insert(2, customCfgBuilder.Sources[1]);
        }

        private static void InitLog()
        {
            Log.Logger = new LoggerConfiguration()
                .MinimumLevel.Debug()
            .MinimumLevel.Override("Microsoft", LogEventLevel.Warning)
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
