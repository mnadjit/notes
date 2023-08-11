import { HttpClient } from '@angular/common/http'
import { Injectable } from '@angular/core'
import {  map } from 'rxjs/operators'
import { environment } from 'src/environments/environment';
import { HL7Message } from '../models/hl7message';

@Injectable({
  providedIn: 'root'
})
export class HttpClientService {

  hl7Messages: HL7Message[] = []

  constructor(private client:HttpClient) { }
    apiHost: string = environment.apiHost;
    apiPort: string = environment.apiPort;

    loadMessage(id: string) {
      return this.client.get(`${this.apiHost}:${this.apiPort}/api/message/${id}`)
        .pipe(map((data: any) => {
          this.hl7Messages = data
        }));
    }

    loadMessagesByDate() {
      const query = '/api/message/from/202106170000/to/202106180000';
      console.log(`${this.apiHost}:${this.apiPort}${query}`);
      return this.client.get(`${this.apiHost}:${this.apiPort}${query}`)
        .pipe(map((data: any) => {
          this.hl7Messages = data
        }));
    }

    loadMessagesByCount() {
      const query = '/api/message/recent';
      console.log(`${this.apiHost}:${this.apiPort}${query}`);
      return this.client.get(`${this.apiHost}:${this.apiPort}${query}`)
        .pipe(map((data: any) => {
          this.hl7Messages = data
        }));
    }

    loadMessagesByMrnDateTriggerEvent(data:any) {
      //TODO: Implement time range for search
      let query = `${this.apiHost}:${this.apiPort}/api/message/search?mrn=${data.mrn}&from=2021-07-01&to=2021-07-25`;
      if (data.triggerEvents) query += `&triggerEvents=${data.triggerEvents?.join()}`;
      console.log(query);
      return this.client.get(query).pipe(map((data: any) => {
          this.hl7Messages = data
        }));
    }

    loadMessagesWithContent(data:any) {
      let query = `${this.apiHost}:${this.apiPort}/api/message/mrn/${data.mrn}/id/${data.id}`;
      console.log(query);
      return this.client.get(query).pipe(map((data: any) => {
        this.hl7Messages = [];
        this.hl7Messages.push(data);
      }));
    }
}
