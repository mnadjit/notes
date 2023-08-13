import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HttpClientModule } from '@angular/common/http';
import { HttpClientService } from './services/http-client.service';
import { RhapdataComponent } from './components/rhapdata/rhapdata.component';
import { HighchartsChartModule  } from "highcharts-angular";
import { BrowserAnimationsModule } from '@angular/platform-browser/animations'
import { MaterialModule } from './shared/material.module';
import { RhapalertsComponent } from './components/rhapalerts/rhapalerts.component';

@NgModule({
  declarations: [
    AppComponent,
    RhapdataComponent,
    RhapalertsComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    HighchartsChartModule,
    BrowserAnimationsModule,
    MaterialModule
  ],
  providers: [
    HttpClientService
  ],
  bootstrap: [
    AppComponent
  ]
})
export class AppModule { }
