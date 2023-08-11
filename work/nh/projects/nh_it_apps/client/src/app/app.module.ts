import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';

import { Client } from './services/client.service';
import { FormsModule } from '@angular/forms';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { FlexLayoutModule } from '@angular/flex-layout';
import { AppListComponent } from './components/app-list/app-list.component';
import { MaterialModule } from './shared/material/material.module';
import { ApplicationsComponent } from './components/columns/applications/applications.component';
import { ServicesComponent } from './components/columns/services/services.component';
import { ServersComponent } from './components/columns/servers/servers.component';
import { NetworksComponent } from './components/columns/networks/networks.component';
import { FilterComponent } from './components/columns/applications/filter.component';

@NgModule({
  declarations: [
    AppListComponent,
    ApplicationsComponent,
    ServicesComponent,
    ServersComponent,
    NetworksComponent,
    FilterComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    FormsModule,
    BrowserAnimationsModule,
    FlexLayoutModule,
    MaterialModule
  ],
  providers: [
    Client
  ],
  bootstrap: [ AppListComponent ]
})
export class AppModule { }
