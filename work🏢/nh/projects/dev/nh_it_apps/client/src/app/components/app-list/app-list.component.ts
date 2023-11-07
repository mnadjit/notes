import { Component, OnInit, ViewChild } from '@angular/core';
import { Client } from 'src/app/services/client.service';
import { NhApp } from 'src/app/models/NhApp';
import { ApplicationsComponent } from '../columns/applications/applications.component';
import { FilterComponent } from '../columns/applications/filter.component';
import { Server } from 'src/app/models/Server';
import { IP } from 'src/app/models/IP';
import * as $ from 'jquery'

@Component({
  selector: 'app-root',
  templateUrl: './app-list.component.html',
  styleUrls: ['./app-list.component.scss']
})
export class AppListComponent implements OnInit {
    @ViewChild('application') application!: ApplicationsComponent;
    @ViewChild('filter') filter!: FilterComponent;
    
    nhApps: NhApp[] = [];
    selectedApp: NhApp = new NhApp();
    selectedServers: Server[] = [];
    selectedIps: IP[] = []

    selectApp(nhApp: NhApp){
        this.selectedApp = nhApp;
        this.filter.filterValue = nhApp.name;
        var serverArrays = nhApp.appServices?.map(svc => svc.servers);
        this.selectedServers = serverArrays.length > 0 ? serverArrays.reduce((acc, val) => acc.concat(val)) : [];
        var networkArrays = this.selectedServers.map(srvr => srvr.networkInterfaces);
        var ipArrays = networkArrays.length > 0 ? networkArrays.reduce((acc, val) => acc.concat(val)) : [];
        this.selectedIps = ipArrays.length > 0 ? ipArrays.map(net => net.iPs)?.reduce((acc, val) => acc.concat(val)) : [];
    }

    getServiceIdForNetwork(networkId: number):string {
        var serviceId = 0;
        this.selectedApp.appServices.forEach(svc => {
            var networks = svc.servers.map(srvr => srvr.networkInterfaces);
            if (networks.length>0) {
                var networkIds = networks.reduce((acc, val) => acc.concat(val)).map(net => net.id);
                if (networkIds.includes(networkId)) serviceId = svc.id;
            }
        })
        return serviceId.toString();
    }

    getServerIdForNetwork(networkId: number):string {
        var serverId = 0;
        this.selectedServers.forEach(srvr => {
            if (srvr.networkInterfaces.map(net => net.id).includes(networkId))
                serverId = srvr.id;
        });
        return serverId.toString();
    }

    nhAppContainsFilter(nhAppName:string): boolean {
        if (this.filter?.filterValue == "") { 
            this.selectedApp = new NhApp(); 
            this.selectedServers = []; 
            this.selectedIps = []; 
        }
        return  this.filter?.filterValue == "" || 
                nhAppName.toLowerCase()
                    .includes(this.filter?.filterValue.toLowerCase());
    }
    
    filterCleared(){
        this.filter.filterValue = "";
    }

    serviceHighlight(event:any): void {
        var items = getElementsForService(event);
        items.addClass('highlight-card');
    }

    serviceRemoveHighlight(event:any): void {
        var items = getElementsForService(event);
        items.removeClass('highlight-card');
    }

    constructor(public client: Client) {    }

    ngOnInit(): void {
        this.client.loadNhApps().subscribe(
            () => {
                this.nhApps = this.client.nhApps;
            },
            error => {
                console.error("An error occured while retrieving data from the API.", error);
        });
  }
}

function getElementsForService(event: any):JQuery<HTMLElement> {
    var serviceClassName = $(event.target).closest("app-services").attr("class")?.split(' ').find(cls => cls.includes("service-"))
    var itemsWithClass = $('mat-grid-list').find('.'+serviceClassName)
    return itemsWithClass.find('mat-card');
}