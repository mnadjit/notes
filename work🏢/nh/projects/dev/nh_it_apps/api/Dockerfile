FROM mcr.microsoft.com/dotnet/sdk:5.0 as nhitapps_api_build
WORKDIR /app
COPY . .
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /app
COPY --from=nhitapps_api_build ./app/out .
RUN echo "Australia/Melbourne" > /etc/timezone
ENTRYPOINT ["dotnet", "api.dll"]