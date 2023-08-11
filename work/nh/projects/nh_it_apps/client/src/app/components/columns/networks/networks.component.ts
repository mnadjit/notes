import { Component, Input, OnInit } from '@angular/core';
import { IP } from 'src/app/models/IP';

@Component({
  selector: 'app-networks',
  templateUrl: './networks.component.html',
  styleUrls: ['./networks.component.scss']
})
export class NetworksComponent implements OnInit {
  @Input() ip: IP = new IP();
  
  constructor() { }

  ngOnInit(): void {
  }

}
