import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { NhApp } from "../models/NhApp";
import { map } from "rxjs/operators";
import { environment } from "src/environments/environment";

@Injectable()
export class Client {
    public nhApps: NhApp[] = [];
    public nhApp: NhApp = new NhApp();

    constructor(private http: HttpClient){
    }

    loadNhApps(){
        return this.http.get<NhApp[]>(`${environment.apiUrl}:${environment.apiPort}/api/nhapp`)
            .pipe(map(data => {
                this.nhApps = data;
            }));
    }

    loadNhAppById (nhAppid: number){
        return this.http.get<NhApp>(`${environment.apiUrl}:${environment.apiPort}/api/nhapp/${nhAppid}`)
            .pipe(map(data => {
                this.nhApp = data;
            }));
    }

    /*addNewMyObject(newMyObject:NhApp){
        return this.http.post("/api/nhapp", newMyObject)
            .pipe(map((data: any) => {
                return data.id;
            })
        );
    }*/
}
