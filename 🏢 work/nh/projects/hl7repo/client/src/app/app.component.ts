import { Component, ElementRef, ViewChild } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { MessageListComponent } from './components/message-list/message-list.component';
import { HL7Message } from './models/hl7message';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'client';
  @ViewChild('messageList') messageList!: MessageListComponent;

  constructor() {

  }

  search_init(data:any) {
    if (!data.mrn && !data.triggerEvents)
      this.messageList.client.loadMessagesByCount().subscribe(()=>{
        this.AddMessagesToMessageList();
      }, error => {
        console.error("Error while retrieving data from API", error);
      });
    else
      this.messageList.client.loadMessagesByMrnDateTriggerEvent(data).subscribe(()=>{
        this.AddMessagesToMessageList();
      }, error => {
        console.error("Error while retrieving data from API", error);
      });
  }

  AddMessagesToMessageList() {
    this.messageList.messages = this.messageList.client.hl7Messages;
    console.log('Number of retrieved messages:', this.messageList.messages.length);
    this.messageList.datasource = new MatTableDataSource<HL7Message>(this.messageList.messages);
    this.messageList.datasource.paginator = this.messageList.paginator;
    this.messageList.datasource.sort = this.messageList.sort;
  }
}
