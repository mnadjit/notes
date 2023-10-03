using api.Services;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.OpenApi.Models;
using RhapmonShared.ServiceWrappers;
using Serilog;
using StackExchange.Redis;

namespace api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers();

            services.AddCors(options => {
                options.AddDefaultPolicy(builder => {
                    builder.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader();
                });
            });

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "Rhapsody Monitor API", Version = "v1" });
            });

            var redisConnectionString = Configuration.GetValue<string>("Redis:ConnectionString", "");
            services.AddStackExchangeRedisCache(options => {
                if (redisConnectionString == "") throw new System.Exception("Failed to get Redis connection string from app configuration");
                options.Configuration = redisConnectionString;
            });
            services.AddSingleton<IConnectionMultiplexer>(ConnectionMultiplexer.Connect(redisConnectionString));

            services.AddTransient<ICacheReader, CacheReader>();
            services.AddTransient<IDatabaseWrapper, DatabaseWrapper>();
            services.AddTransient<IJsonSerializerWrapper, JsonSerializerWrapper>();

            Log.Information("Web API .NET Services are now added.");
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "api v1"));
            }

            app.UseRouting();

            app.UseCors();
            
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });

            Log.Information("Configuration complete.");
        }
    }
}
