using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace api.Migrations
{
    public partial class Initial : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "NhApps",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(250)", nullable: true),
                    Environment = table.Column<string>(type: "varchar(20)", nullable: true),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    MainDepartment = table.Column<string>(type: "nvarchar(50)", nullable: true),
                    Vendor = table.Column<string>(type: "nvarchar(250)", nullable: true),
                    Comments = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    LastUpdatedBy = table.Column<string>(type: "varchar(50)", nullable: true),
                    LastUpdated = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_NhApps", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AppServices",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NhAppId = table.Column<int>(type: "int", nullable: false),
                    Name = table.Column<string>(type: "varchar(50)", nullable: true),
                    Type = table.Column<string>(type: "varchar(20)", nullable: true),
                    Comments = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    LastUpdatedBy = table.Column<string>(type: "varchar(50)", nullable: true),
                    LastUpdated = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AppServices", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AppServices_NhApps_NhAppId",
                        column: x => x.NhAppId,
                        principalTable: "NhApps",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Contacts",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NhAppId = table.Column<int>(type: "int", nullable: false),
                    FullName = table.Column<string>(type: "nvarchar(250)", nullable: true),
                    Type = table.Column<string>(type: "varchar(20)", nullable: true),
                    Email = table.Column<string>(type: "nvarchar(250)", nullable: true),
                    Phone = table.Column<string>(type: "varchar(250)", nullable: true),
                    Url = table.Column<string>(type: "nvarchar(500)", nullable: true),
                    Address = table.Column<string>(type: "nvarchar(500)", nullable: true),
                    Comments = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    LastUpdatedBy = table.Column<string>(type: "varchar(50)", nullable: true),
                    LastUpdated = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Contacts", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Contacts_NhApps_NhAppId",
                        column: x => x.NhAppId,
                        principalTable: "NhApps",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Servers",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    AppServiceId = table.Column<int>(type: "int", nullable: false),
                    Hostname = table.Column<string>(type: "varchar(250)", nullable: true),
                    OS = table.Column<string>(type: "varchar(250)", nullable: true),
                    OSVersion = table.Column<string>(type: "varchar(250)", nullable: true),
                    Type = table.Column<string>(type: "varchar(20)", nullable: true),
                    HostId = table.Column<int>(type: "int", nullable: false),
                    Location = table.Column<string>(type: "nvarchar(250)", nullable: true),
                    Processor = table.Column<string>(type: "nvarchar(250)", nullable: true),
                    Memory = table.Column<string>(type: "nvarchar(250)", nullable: true),
                    Comments = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    LastUpdatedBy = table.Column<string>(type: "varchar(50)", nullable: true),
                    LastUpdated = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Servers", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Servers_AppServices_AppServiceId",
                        column: x => x.AppServiceId,
                        principalTable: "AppServices",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "NetworkInterfaces",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ServerId = table.Column<int>(type: "int", nullable: false),
                    Type = table.Column<string>(type: "varchar(20)", nullable: true),
                    MacAddress = table.Column<string>(type: "varchar(20)", nullable: true),
                    Comments = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    LastUpdatedBy = table.Column<string>(type: "varchar(50)", nullable: true),
                    LastUpdated = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_NetworkInterfaces", x => x.Id);
                    table.ForeignKey(
                        name: "FK_NetworkInterfaces_Servers_ServerId",
                        column: x => x.ServerId,
                        principalTable: "Servers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Storages",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ServerId = table.Column<int>(type: "int", nullable: false),
                    Type = table.Column<string>(type: "varchar(20)", nullable: true),
                    Path = table.Column<string>(type: "varchar(250)", nullable: true),
                    TotalCapacityGB = table.Column<int>(type: "int", nullable: false),
                    Comments = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    LastUpdatedBy = table.Column<string>(type: "varchar(50)", nullable: true),
                    LastUpdated = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Storages", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Storages_Servers_ServerId",
                        column: x => x.ServerId,
                        principalTable: "Servers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "IPs",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NetworkInterfaceId = table.Column<int>(type: "int", nullable: false),
                    IPAddress = table.Column<string>(type: "varchar(250)", nullable: true),
                    Subnet = table.Column<string>(type: "varchar(20)", nullable: true),
                    Gateway = table.Column<string>(type: "varchar(250)", nullable: true),
                    Dhcp = table.Column<bool>(type: "bit", nullable: false),
                    DhcpReserved = table.Column<bool>(type: "bit", nullable: false),
                    Port = table.Column<int>(type: "int", nullable: false),
                    Comments = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    LastUpdatedBy = table.Column<string>(type: "varchar(50)", nullable: true),
                    LastUpdated = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_IPs", x => x.Id);
                    table.ForeignKey(
                        name: "FK_IPs_NetworkInterfaces_NetworkInterfaceId",
                        column: x => x.NetworkInterfaceId,
                        principalTable: "NetworkInterfaces",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_AppServices_NhAppId",
                table: "AppServices",
                column: "NhAppId");

            migrationBuilder.CreateIndex(
                name: "IX_Contacts_NhAppId",
                table: "Contacts",
                column: "NhAppId");

            migrationBuilder.CreateIndex(
                name: "IX_IPs_NetworkInterfaceId",
                table: "IPs",
                column: "NetworkInterfaceId");

            migrationBuilder.CreateIndex(
                name: "IX_NetworkInterfaces_ServerId",
                table: "NetworkInterfaces",
                column: "ServerId");

            migrationBuilder.CreateIndex(
                name: "IX_Servers_AppServiceId",
                table: "Servers",
                column: "AppServiceId");

            migrationBuilder.CreateIndex(
                name: "IX_Storages_ServerId",
                table: "Storages",
                column: "ServerId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Contacts");

            migrationBuilder.DropTable(
                name: "IPs");

            migrationBuilder.DropTable(
                name: "Storages");

            migrationBuilder.DropTable(
                name: "NetworkInterfaces");

            migrationBuilder.DropTable(
                name: "Servers");

            migrationBuilder.DropTable(
                name: "AppServices");

            migrationBuilder.DropTable(
                name: "NhApps");
        }
    }
}
