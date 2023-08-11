# NH IT Apps Inventory Website 
> Hosted in a docker container using EntityFramework Core to connect with SQL Server database
---
## Componenets
- Framework
    - ASP .net core 5 MVC
- Data
    - MS SQL Server 15.0.4138 (Docker tag: 2019-latest)
    - EntityFramework Core v5.0.7
    - Newtonsoft.Json v5.0.7
    - AutoMapper v8.1.1
- Front-end
    - Angular v12.0.4
    - JQuery v3.6.0
    - Bootstrap v5.0.1
    - Fontawesome v5.15.3
    - ngx-toastr v14.0.0
    - Razor Pages v5.0.7
    - Angular Material v12.0.5
    - Angular Flex Layout v12.0.0-beta.34
- Hosting Environment
    - Docker v20.10.6,-build 370c289

## Requirements for development environment
### dotnet sdk 5
Install dotnet sdk 5 from the following [link](https://dotnet.microsoft.com/download/dotnet/5.0)

### EntityFramework Core v5.0.6
Once dotnet cli is installed, install EntityFramework core using the following command:
`dotnet tool install dotnet-ef`

### Docker
#### Windows
Install Docker Desktop from the following [link](https://docs.docker.com/docker-for-windows/install/)
#### Linux e.g. Ubuntu server 21
`sudo apt install docker-ce docker-ce-cli containerd.io`
`sudo usermod -aG docker $USER`
##### Install docker-compose
`sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose`
`sudo chmod +x /usr/local/bin/docker-compose`

### Make
#### Windows
In order to use Makefile shortcut commands on Windows, first install Makefile package using [cygwin](https://cygwin.com/install.html)
#### Linux e.g. Ubuntu server 21
`sudo apt install make`

## Libraries
### Server-Side
#### Entityframework Core
- `dotnet add package Microsoft.EntityFrameworkCore.SqlServer`
#### AutoMapper
- `dotnet add package AutoMapper.Extensions.Microsoft.DependencyInjection`
#### Newtonsoft Json
This package is a built-in component of .NET core. This package is needed if there is need for serializing self-referencing objects.
- `dotnet add package Microsoft.AspNetCore.Mvc.NewtonsoftJson`
#### Razor Pages Runtime Compilation
- `dotnet add package Microsoft.AspNetCore.Mvc.Razor.RuntimeCompilation`
- Version 5.0.7 (2021-06-12)
### Client-Side
#### Angular 
Install *node.js* latest version via the following [link](https://nodejs.org/en/download/current/):
- node version: 16.2.0
- npm version: 7.15.1
    - Install Angular globally i.e. not just for this project
        - `npm install @angular/cli -g`
#### Bootstrap
Download manually or use Visual Studio `Add` > `Client-side library` which uses Libman
#### Fontawesome
Download manually or use Visual Studio `Add` > `Client-side library` which uses Libman

## Angular
### Create a new Angular project
- `ng new MyClientName --skip-git --skip-tests --minimal --defaults`
### Change build output directory using the following configuration in `angular.json` file:
- `projects/client/architect/build/options/outputPath`
### Build the project
- `ng build`
- `ng build --watch` (to constantly build once a change is made to any file)
- `ng build --configuration production --watch`
- `ng build --configuration development --watch`
### Install Bootstrap, Jquery and its definitions to use in Angular
#### JQuery & Bootstrap
- `npm install bootstrap jquery`
- `npm install -D @types/bootstrap @types/jquery`
#### Toastr
- `npm install ngx-toastr`
- add `toastr.css` link to the html file it's being used in. *Only adding the css into the component when page is served by ASP.NETcore.*
### Run Angular to serve the client app and view it in a browser (if want to view the angular page independently from ASP.NETcore app)
- `ng serve`

## Razor Pages
Not to be confused with Razor **Views**
### Configuration required for Razor pages:
1. .cshtml residing in a Pages folder in the project root
2. `@Page` at the top of the .cshtml file
3. Requires its own _ViewStart.cshtml and _ViewImports.cshtml in Pages folder if needed.
3. `Startup.cs` > `ConfigureServices` > `services.AddRazorPages();`
4. `Startup.cs` > `Configure` > `app.UseEndpoints(cfg => cfg.MapRazorPages(););`
5. `Startup.cs` > `ConfigureServices` > `services.AddControllerWithViews().AddRazorRuntimeCompilation();` 
    - This requires the following package `Microsoft.AspNetCore.Mvc.Razor.RuntimeCompilation`

## Debugging
In order to run the app in debug mode and be albe to connect to the database, the connection string needs to be added as a **user** environment variable with key name `DB_CONNECTION_STRING` and the following value:
`Server=.,11433;Database=ApplicationsDb;User=sa;Password=ThiIsReallySecure!3;MultipleActiveResultSets=true`
e.g. using PowerShell command:
`setx DB_CONNECTION_STRING "Server=.,11433;Database=ApplicationsDb;User=sa;Password=ThiIsReallySecure!3;MultipleActiveResultSets=true"`

## Helpful vscode extensions
- C# (Microsoft) aka Omnisharp v1.23.12
- C# Extensions (JosKreativ) v1.4.0
- Gitignore Templates (Hasan Ali) v1.0.1
- Material Icon Theme (Philipp Kief) v4.7.0
- Docker (Microsoft) v1.13.0
- Markdown Preview Enhanced (Yiyi Wang) v0.5.21

## To Be Implemented
### API Put & Delete
