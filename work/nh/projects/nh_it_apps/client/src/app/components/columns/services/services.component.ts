import { Component, Input, OnInit } from '@angular/core';
import { AppService } from 'src/app/models/AppService';

@Component({
  selector: 'app-services',
  templateUrl: './services.component.html',
  styleUrls: ['./services.component.scss']
})
export class ServicesComponent implements OnInit {
  @Input() appService: AppService = new AppService();

  constructor() { }

  ngOnInit(): void {
  }

}
