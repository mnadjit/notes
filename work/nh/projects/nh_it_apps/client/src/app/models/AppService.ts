import { Server } from "./Server";

export class AppService {
    id: number = 0;
    nhAppId : number = 0;
    name: string = "";
    type: string = "";
    comments: string = "";
    lastUpdatedBy: string = "";
    lastUpdated: Date = new Date();
    servers: Server[] = [];
}
