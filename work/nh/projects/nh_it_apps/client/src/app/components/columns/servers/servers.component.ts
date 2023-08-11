import { Component, Input, OnInit } from '@angular/core';
import { Server } from 'src/app/models/Server';

@Component({
  selector: 'app-servers',
  templateUrl: './servers.component.html',
  styleUrls: ['./servers.component.scss']
})
export class ServersComponent implements OnInit {
  @Input() server: Server = new Server();

  constructor() { }

  ngOnInit(): void {
  }

}
