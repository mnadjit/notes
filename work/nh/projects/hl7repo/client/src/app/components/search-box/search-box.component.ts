import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { FormControl } from '@angular/forms';
import * as triggerEventObj from './trigger-events.json';

@Component({
  selector: 'app-search-box',
  templateUrl: './search-box.component.html',
  styleUrls: ['./search-box.component.scss']
})
export class SearchBoxComponent implements OnInit {
  mrnSearchValue = '';
  triggerEvents = new FormControl();
  messageCodeList: string[] = [];
  selectedMessageCodes: string[] = [];
  triggerEventList: string[] = [];
  @Output() search_init : EventEmitter<Object> = new EventEmitter();

  constructor() {
    this.messageCodeList = Object.keys(triggerEventObj).filter(x => x !== 'default');
    Object.entries(triggerEventObj).forEach(x => {
      if (this.selectedMessageCodes.includes(x[0]) && x[0] !== 'default')
        this.triggerEventList = this.triggerEventList.concat(x[1]);
    });
  }

  // is called when a message code is selected - a list of relevant Trigger Events get added to its form control
  selectMessageCode(event: string[]){
    this.selectedMessageCodes = event;
    this.triggerEventList = [];
    Object.entries(triggerEventObj).forEach(x => {
      if (this.selectedMessageCodes.includes(x[0]))
        this.triggerEventList = this.triggerEventList.concat(x[1]);
    });
    // make all options selected by default
    this.triggerEvents = new FormControl(this.triggerEventList);
  }

  // is called when user clicks on search button
  onSearchClicked(data:any){
    data['triggerEvents']= this.triggerEvents.value;
    this.search_init.emit(data);
  }

  test(event:any){
    console.log(event);
    //event.stopPropagation();
  }

  ngOnInit(): void {
  }
}
