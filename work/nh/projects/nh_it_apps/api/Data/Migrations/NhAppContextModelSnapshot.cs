﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using api.Models.DataModels;

namespace api.Migrations
{
    [DbContext(typeof(NhAppContext))]
    partial class NhAppContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("ProductVersion", "5.0.7")
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("api.Models.Entities.AppService", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Comments")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("LastUpdated")
                        .HasColumnType("datetime2");

                    b.Property<string>("LastUpdatedBy")
                        .HasColumnType("varchar(50)");

                    b.Property<string>("Name")
                        .HasColumnType("varchar(50)");

                    b.Property<int>("NhAppId")
                        .HasColumnType("int");

                    b.Property<string>("Type")
                        .HasColumnType("varchar(20)");

                    b.HasKey("Id");

                    b.HasIndex("NhAppId");

                    b.ToTable("AppServices");
                });

            modelBuilder.Entity("api.Models.Entities.Contact", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Address")
                        .HasColumnType("nvarchar(500)");

                    b.Property<string>("Comments")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Email")
                        .HasColumnType("nvarchar(250)");

                    b.Property<string>("FullName")
                        .HasColumnType("nvarchar(250)");

                    b.Property<DateTime>("LastUpdated")
                        .HasColumnType("datetime2");

                    b.Property<string>("LastUpdatedBy")
                        .HasColumnType("varchar(50)");

                    b.Property<int>("NhAppId")
                        .HasColumnType("int");

                    b.Property<string>("Phone")
                        .HasColumnType("varchar(250)");

                    b.Property<string>("Type")
                        .HasColumnType("varchar(20)");

                    b.Property<string>("Url")
                        .HasColumnType("nvarchar(500)");

                    b.HasKey("Id");

                    b.HasIndex("NhAppId");

                    b.ToTable("Contacts");
                });

            modelBuilder.Entity("api.Models.Entities.IP", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Comments")
                        .HasColumnType("nvarchar(max)");

                    b.Property<bool>("Dhcp")
                        .HasColumnType("bit");

                    b.Property<bool>("DhcpReserved")
                        .HasColumnType("bit");

                    b.Property<string>("Gateway")
                        .HasColumnType("varchar(250)");

                    b.Property<string>("IPAddress")
                        .HasColumnType("varchar(250)");

                    b.Property<DateTime>("LastUpdated")
                        .HasColumnType("datetime2");

                    b.Property<string>("LastUpdatedBy")
                        .HasColumnType("varchar(50)");

                    b.Property<int>("NetworkInterfaceId")
                        .HasColumnType("int");

                    b.Property<int>("Port")
                        .HasColumnType("int");

                    b.Property<string>("Subnet")
                        .HasColumnType("varchar(20)");

                    b.HasKey("Id");

                    b.HasIndex("NetworkInterfaceId");

                    b.ToTable("IPs");
                });

            modelBuilder.Entity("api.Models.Entities.NetworkInterface", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Comments")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("LastUpdated")
                        .HasColumnType("datetime2");

                    b.Property<string>("LastUpdatedBy")
                        .HasColumnType("varchar(50)");

                    b.Property<string>("MacAddress")
                        .HasColumnType("varchar(20)");

                    b.Property<int>("ServerId")
                        .HasColumnType("int");

                    b.Property<string>("Type")
                        .HasColumnType("varchar(20)");

                    b.HasKey("Id");

                    b.HasIndex("ServerId");

                    b.ToTable("NetworkInterfaces");
                });

            modelBuilder.Entity("api.Models.Entities.NhApp", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Comments")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Description")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Environment")
                        .HasColumnType("varchar(20)");

                    b.Property<DateTime>("LastUpdated")
                        .HasColumnType("datetime2");

                    b.Property<string>("LastUpdatedBy")
                        .HasColumnType("varchar(50)");

                    b.Property<string>("MainDepartment")
                        .HasColumnType("nvarchar(50)");

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(250)");

                    b.Property<string>("Vendor")
                        .HasColumnType("nvarchar(250)");

                    b.HasKey("Id");

                    b.ToTable("NhApps");
                });

            modelBuilder.Entity("api.Models.Entities.Server", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("AppServiceId")
                        .HasColumnType("int");

                    b.Property<string>("Comments")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("HostId")
                        .HasColumnType("int");

                    b.Property<string>("Hostname")
                        .HasColumnType("varchar(250)");

                    b.Property<DateTime>("LastUpdated")
                        .HasColumnType("datetime2");

                    b.Property<string>("LastUpdatedBy")
                        .HasColumnType("varchar(50)");

                    b.Property<string>("Location")
                        .HasColumnType("nvarchar(250)");

                    b.Property<string>("Memory")
                        .HasColumnType("nvarchar(250)");

                    b.Property<string>("OS")
                        .HasColumnType("varchar(250)");

                    b.Property<string>("OSVersion")
                        .HasColumnType("varchar(250)");

                    b.Property<string>("Processor")
                        .HasColumnType("nvarchar(250)");

                    b.Property<string>("Type")
                        .HasColumnType("varchar(20)");

                    b.HasKey("Id");

                    b.HasIndex("AppServiceId");

                    b.ToTable("Servers");
                });

            modelBuilder.Entity("api.Models.Entities.Storage", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Comments")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("LastUpdated")
                        .HasColumnType("datetime2");

                    b.Property<string>("LastUpdatedBy")
                        .HasColumnType("varchar(50)");

                    b.Property<string>("Path")
                        .HasColumnType("varchar(250)");

                    b.Property<int>("ServerId")
                        .HasColumnType("int");

                    b.Property<int>("TotalCapacityGB")
                        .HasColumnType("int");

                    b.Property<string>("Type")
                        .HasColumnType("varchar(20)");

                    b.HasKey("Id");

                    b.HasIndex("ServerId");

                    b.ToTable("Storages");
                });

            modelBuilder.Entity("api.Models.Entities.AppService", b =>
                {
                    b.HasOne("api.Models.Entities.NhApp", null)
                        .WithMany("AppServices")
                        .HasForeignKey("NhAppId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("api.Models.Entities.Contact", b =>
                {
                    b.HasOne("api.Models.Entities.NhApp", null)
                        .WithMany("Contacts")
                        .HasForeignKey("NhAppId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("api.Models.Entities.IP", b =>
                {
                    b.HasOne("api.Models.Entities.NetworkInterface", null)
                        .WithMany("IPs")
                        .HasForeignKey("NetworkInterfaceId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("api.Models.Entities.NetworkInterface", b =>
                {
                    b.HasOne("api.Models.Entities.Server", null)
                        .WithMany("NetworkInterfaces")
                        .HasForeignKey("ServerId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("api.Models.Entities.Server", b =>
                {
                    b.HasOne("api.Models.Entities.AppService", null)
                        .WithMany("Servers")
                        .HasForeignKey("AppServiceId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("api.Models.Entities.Storage", b =>
                {
                    b.HasOne("api.Models.Entities.Server", null)
                        .WithMany("Storages")
                        .HasForeignKey("ServerId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("api.Models.Entities.AppService", b =>
                {
                    b.Navigation("Servers");
                });

            modelBuilder.Entity("api.Models.Entities.NetworkInterface", b =>
                {
                    b.Navigation("IPs");
                });

            modelBuilder.Entity("api.Models.Entities.NhApp", b =>
                {
                    b.Navigation("AppServices");

                    b.Navigation("Contacts");
                });

            modelBuilder.Entity("api.Models.Entities.Server", b =>
                {
                    b.Navigation("NetworkInterfaces");

                    b.Navigation("Storages");
                });
#pragma warning restore 612, 618
        }
    }
}
