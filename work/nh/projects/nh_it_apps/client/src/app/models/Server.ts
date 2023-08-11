import { NetworkInterface } from "./NetworkInterface";

export class Server {
    id: number = 0;
    appServiceId : number = 0;
    hostname: string = "";
    os: string = "";
    osVersion: string = "";
    type: string = "";
    hostId: number = 0;
    location: string = "";
    processor: string = "";
    memory: string = "";
    storage: Storage[] = [];
    networkInterfaces: NetworkInterface[] = [];
    comments: string = "";
    lastUpdatedBy: string = "";
    lastUpdated: Date = new Date();
}