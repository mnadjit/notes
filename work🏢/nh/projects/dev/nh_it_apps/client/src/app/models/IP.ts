export class IP {
    id:number = 0;
    networkInterfaceId : number = 0;
    ipAddress: string = "";
    subnet: string = "";
    gateway: string = "";
    dhcp: boolean = false;
    dhcpReserved: boolean = false;
    port: number = 0;
    comments: string = "";
    lastUpdatedBy: string = "";
    lastUpdated: Date = new Date();
}