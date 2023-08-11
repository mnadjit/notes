import { Component, EventEmitter, Input, OnInit, Output, ViewChild } from '@angular/core';
import { NhApp } from 'src/app/models/NhApp';
import { Client } from 'src/app/services/client.service';
import * as $ from 'jquery';

@Component({
  selector: 'app-applications',
  templateUrl: './applications.component.html',
  styleUrls: ['./applications.component.scss'],
})
export class ApplicationsComponent implements OnInit {
  @Input() nhApp: NhApp = new NhApp();
  @Output() appIsSelected: EventEmitter<NhApp> = new EventEmitter<NhApp>();

  constructor(private client: Client) {}

  nhAppContainsFilter(o:string, filter:string): boolean {
    return o.toLowerCase().includes(filter.toLowerCase());
  }

  selectApp(event: any, nhAppId: number) {
    if (!$(event.target).hasClass('mat-button-wrapper') && event.target.nodeName.toLowerCase() != "button") {
        this.GetNhAppFromApi(nhAppId);
    }
  }

  GetNhAppFromApi(nhAppId: number): NhApp {
    this.client.loadNhAppById(nhAppId).subscribe(
        () => {
            this.appIsSelected.emit(this.client.nhApp);
        },
        error => {
            console.error("An error occured while retrieving data from the API.", error);
    });
    return this.client.nhApp;
  }

  ngOnInit(): void {}
}
