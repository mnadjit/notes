# Rhapsody Monitoring Tool

## Components

### API

-   Web Api - ASP.NETCore .NET5.0

### Front-end

-   Angular 12.0.5

### Caching

-   Redis 6.2.4

### Data Storage

-   MS-SQL 2019

## Packages used

### Server-Side

#### dotnet 
- Logging 
    - Serilog
        - `Serilog` version: `2.10.0`
        - `Serilog.Extensions.Hosting` version: `4.1.2`
        - `Serilog.Settings.Configuration` version: `3.1.0`
        - `Serilog.Sinks.Console` version: `3.1.1`
        - `Serilog.Sinks.RollingFile` version: `3.3.0`
        - `Serilog.Sinks.RollingFileAlternate` version: `2.0.9`

- Caching
    - `Microsoft.Extensions.Caching.StackExchangeRedis` version: `5.0.1`
    - `StackExchange.Redis` version: `2.2.4`

### Client-side

-   Highcharts for Angular
    -   `npm install highcharts-angular`
-   Add Angular Material
    -   `ng add @angular/material`
