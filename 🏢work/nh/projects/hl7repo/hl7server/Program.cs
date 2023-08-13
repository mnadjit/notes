using System.IO;
using System.Threading.Tasks;

using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

using HL7server.Services;

using Serilog;
using Serilog.Sinks.RollingFileAlternate;

using Shared.Encryption;

namespace HL7server
{
    class Program
    {
        static Task Main(string[] args)
        {
            InitLog();

            var host = CreateHostBuilder(args).Build();

            //var fileProcessor = host.Services.GetService<FileProcessor>();

            //ProcessFiles(fileProcessor, host);

            var listenerIsRunning = Start_HL7_Listener(host);

            if (listenerIsRunning) return host.RunAsync();
            else return Task.CompletedTask;
        }

        private static bool Start_HL7_Listener(IHost host)
        {
            var cfg = host.Services.GetService<IConfiguration>();
            var cache = host.Services.GetService<CacheService>();

            var csForLog = string.Empty;
            var connectionStringParts = cache.ConnectionString.Split("password=");
            // Get the first letter of the password for the log
            if (connectionStringParts.Length > 1) csForLog=$"{connectionStringParts[0]}password={connectionStringParts[1][0]}";
            else csForLog = cache.ConnectionString;

            if (!cache.CacheServerIsAvailable()) {
                Log.Error($"Unable to connect to Redis server using the following connection string: {csForLog}");
                return false;
            } else {
                Log.Information($"Successfully connected to Redis server using the following connection string: {csForLog}");
            }

            var recordExpiryMinutes = cfg.GetValue<int?>("redis:expiryMinutes");
            
            var allowedHosts = cfg.GetSection("hl7listener:allowedHosts").Get<string[]>();
            var hl7listenerPort = cfg.GetValue<int>("hl7listener:port");
            
            // TODO: Use DI
            //host.Services.GetService<HL7TCPListener>();
            var hl7listener = new HL7TCPListener(hl7listenerPort, allowedHosts, cache, recordExpiryMinutes);

            hl7listener.Start();
            
            Log.Information("HL7 Listener service started.");
            return true;
        }

        

        static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureAppConfiguration((ctx, cfgbldr) => UseCustomConfiguration(ctx, cfgbldr, args))
                .ConfigureServices((ctx, services) => {
                    services.AddStackExchangeRedisCache(options => {
                        var redisHost = ctx.Configuration.GetValue<string>("redis:host");
                        var redisPort = ctx.Configuration.GetValue<int>("redis:port");
                        var redisPassword = ctx.Configuration.GetValue<string>("redis:password");

                        options.Configuration = $"{redisHost}:{redisPort.ToString()},password={redisPassword}";
                        options.InstanceName = ctx.Configuration.GetValue<string>("redis:instanceName");
                    });
                    services.AddTransient<CacheService>();
                    services.AddSingleton<HL7TCPListener>();
                    services.AddSingleton<Encryptor>();
                });

        private static void UseCustomConfiguration(HostBuilderContext hostBldrCtx, IConfigurationBuilder cfgBldr, string[] args)
        {
            var customCfgBuilder = new ConfigurationBuilder();

            var config = customCfgBuilder
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("config.json", optional: false, reloadOnChange: true)
                .AddJsonFile("config.override.json", optional: true, reloadOnChange: true)
                .Build();

            cfgBldr.Sources.Insert(1, customCfgBuilder.Sources[0]);
            cfgBldr.Sources.Insert(2, customCfgBuilder.Sources[1]);

            if (hostBldrCtx.HostingEnvironment.IsDevelopment()) {
                cfgBldr.AddUserSecrets<Program>();
            }

            Log.Information("Configuration loaded.");
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

            Log.Information("HL7 Listener service starting...");
        }
    }
}
