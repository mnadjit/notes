import { IP } from "./IP";

export class NetworkInterface {
    id: number = 0;
    serverId : number = 0;
    type: string = "";
    macAddress: string = "";
    comments: string = "";
    lastUpdatedBy: string = "";
    lastUpdated: Date = new Date();
    iPs: IP[] = [];
}