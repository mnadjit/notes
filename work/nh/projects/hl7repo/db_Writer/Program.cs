using System.IO;
using Shared.Repository;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Serilog;
using Serilog.Events;
using Serilog.Sinks.RollingFileAlternate;
using db_Writer.Services;
using Shared.Encryption;

namespace db_Writer
{
    public class Program
    {
        public static void Main(string[] args)
        {
            InitLog();

            CreateHostBuilder(args).Build().Run();

            Log.Information("DB_Writer service running.");
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .UseSerilog((context, services, configuration) => configuration
                    .MinimumLevel.Override("db_Writer", LogEventLevel.Information)
                    .ReadFrom.Configuration(context.Configuration)
                    .ReadFrom.Services(services)
                    .Enrich.FromLogContext())
                .ConfigureAppConfiguration(UseCustomConfigFileAndAddSecrets)
                .ConfigureServices((hostContext, services) =>
                {
                    services.AddStackExchangeRedisCache(options =>
                    {
                        options.Configuration = hostContext.Configuration.GetValue<string>("redis:ConnectionString");
                        options.InstanceName = hostContext.Configuration.GetValue<string>("redis:InstanceName");
                    });
                    services.AddHostedService<Worker>();
                    services.AddTransient<IMessageRepo_Repository, MessageRepo_Repository>();
                    services.AddTransient<Encryptor>();
                    services.AddSingleton<FileProcessor>();
                });


        private static void UseCustomConfigFileAndAddSecrets(HostBuilderContext hostBldr, IConfigurationBuilder cfgBldr)
        {
            var customCfgBuilder = new ConfigurationBuilder();

            var config = customCfgBuilder
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("config.json", optional: false, reloadOnChange: true)
                .AddJsonFile("config.override.json", optional: true, reloadOnChange: true)
                .Build();

            cfgBldr.Sources.Insert(1, customCfgBuilder.Sources[0]);
            cfgBldr.Sources.Insert(2, customCfgBuilder.Sources[1]);

            if (hostBldr.HostingEnvironment.IsDevelopment())
            {
                //cfgBldr.AddUserSecrets<Program>();
            }
        }

        private static void InitLog()
        {
            Log.Logger = new LoggerConfiguration()
                .MinimumLevel.Debug()
                .Enrich.FromLogContext()
                .WriteTo.Console()
                .WriteTo.RollingFileAlternate(
                    Path.Combine(Directory.GetCurrentDirectory(), "logs"),
                    fileSizeLimitBytes: 1_000_000)
            .CreateLogger();

            Log.Information("DB_Writer service starting...");
        }
    }
}
