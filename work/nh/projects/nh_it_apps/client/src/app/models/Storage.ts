export class Storage {
    id: number = 0;
    serverId : number = 0;
    type: string = "";
    path: string = "";
    totalCapacityGB: number = 0;
    comments: string = "";
    lastUpdatedBy: string = "";
    lastUpdated: Date = new Date();
}