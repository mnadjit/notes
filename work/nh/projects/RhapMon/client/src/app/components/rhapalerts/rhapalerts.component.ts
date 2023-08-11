import { Component, OnInit } from '@angular/core';
import { RhapAlerts } from 'src/app/models/RhapAlerts';
import { HttpClientService } from 'src/app/services/http-client.service';

@Component({
  selector: 'app-rhapalerts',
  templateUrl: './rhapalerts.component.html',
  styleUrls: ['./rhapalerts.component.scss']
})
export class RhapalertsComponent implements OnInit {
  alerts: RhapAlerts = new RhapAlerts();

  constructor(private client: HttpClientService) { }

  ngOnInit(): void {
    this.client.loadAlerts().subscribe(() => {
      this.alerts = this.client.alerts;
    }, error => {
      console.error("Error occured while retrieving Rhapsody alerts from API.", error);
    });
  }
}
