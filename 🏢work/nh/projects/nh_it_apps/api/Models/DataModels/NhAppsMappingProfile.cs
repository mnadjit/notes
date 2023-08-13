using AutoMapper;
using api.Models.Entities;
using api.Models.ViewModels;

namespace api.Models.DataModels
{
    public class NhAppsMappingProfile : Profile
    {
        public NhAppsMappingProfile()
        {
            CreateMap<NhApp, NhAppViewModel>().ReverseMap();

            CreateMap<AppService, AppServiceViewModel>().ReverseMap();

            CreateMap<Server, ServerViewModel>().ReverseMap();

            CreateMap<Contact, ContactViewModel>().ReverseMap();

            CreateMap<IP, IPViewModel>().ReverseMap();

            CreateMap<NetworkInterface, NetworkInterfaceViewModel>().ReverseMap();

            CreateMap<Storage, StorageViewModel>().ReverseMap();
        }
    }
}