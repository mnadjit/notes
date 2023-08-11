import { HttpClient } from '@angular/common/http'
import { Injectable } from '@angular/core'
import {  map } from 'rxjs/operators'
import { environment } from 'src/environments/environment'
import { RhapAlerts } from '../models/RhapAlerts'
import { RhapCommpointData } from '../models/RhapCommpointData'

@Injectable({
  providedIn: 'root'
})
export class HttpClientService {

  public rhapsodyData: RhapCommpointData[] = []
  public alerts: RhapAlerts = new RhapAlerts();

  constructor(private client:HttpClient) { }

    loadCommpointData(id: string) {
      return this.client.get(`http://${environment.apiHost}:${environment.apiPort}/api/CommpointData/${id}`)
        .pipe(map((data: any) => {
          this.rhapsodyData = data
        }));
    }

    loadAlerts() {
      return this.client.get(`http://${environment.apiHost}:${environment.apiPort}/api/Alerts`)
        .pipe(map((data: any) => {
          this.alerts = data
        }));
    }
}
