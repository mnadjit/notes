using System.IO;
using System.Net;
using System.Net.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using RhapmonShared.ServiceWrappers;
using Serilog;
using Serilog.Events;
using Serilog.Sinks.RollingFileAlternate;
using StackExchange.Redis;
using worker.Services;

namespace worker
{
    public class Program
    {
        public static void Main(string[] args)
        {
            InitLog();

            CreateHostBuilder(args).Build().Run();
        }
        
        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .UseSerilog((context, services, configuration) => configuration
                    .MinimumLevel.Override("worker", LogEventLevel.Information)
                    .ReadFrom.Configuration(context.Configuration)
                    .ReadFrom.Services(services)
                    .Enrich.FromLogContext())
                .ConfigureAppConfiguration(UseCustomConfigFileAndAddSecrets)
                .ConfigureServices((hostContext, services) =>
                {
                    services.AddStackExchangeRedisCache(options => {
                        options.Configuration = hostContext.Configuration.GetValue<string>("Redis:ConnectionString");
                        options.InstanceName = hostContext.Configuration.GetValue<string>("Redis:InstanceName");
                    });
                    services.AddHttpClient("UseCredentials")
                        .ConfigurePrimaryHttpMessageHandler(() => new HttpClientHandler() {
                            Credentials = GetCredentials(hostContext),
                            PreAuthenticate = true
                        });
                    services.AddTransient<IWorkerTaskRunner, WorkerTaskRunner>();
                    services.AddHostedService<Worker>();
                    services.AddTransient<ICacheService, CacheService>();
                    services.AddTransient<INotificationManager, NotificationManager>();
                    services.AddTransient<INotificationService, NotificationService>();
                    services.AddTransient<IDatabaseWrapper, DatabaseWrapper>();
                    services.AddTransient<IJsonSerializerWrapper, JsonSerializerWrapper>();
                    var redisConnectionString = hostContext.Configuration.GetValue<string>("Redis:ConnectionString");
                    services.AddSingleton<IConnectionMultiplexer>(ConnectionMultiplexer.Connect(redisConnectionString));
                });

        private static ICredentials GetCredentials(HostBuilderContext ctx)
        {
            var username = ctx.Configuration.GetValue<string>("RhapsodyApiCreds:Username");
            var password = ctx.Configuration.GetValue<string>("RhapsodyApiCreds:Password");
            
            Log.Warning($"Rhapsody API User: {username}");
            return new NetworkCredential {
                UserName = username,
                Password = password
            };
        }

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

            if (hostBldr.HostingEnvironment.IsDevelopment()) {
                cfgBldr.AddUserSecrets<Program>();
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

            Log.Information("Worker starting...");
        }
    }
}
