import { animate, state, style, transition, trigger } from '@angular/animations';
import { AfterViewInit, Component, OnInit, ViewChild, ViewEncapsulation } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatTableDataSource } from '@angular/material/table';
import { HL7Message } from '../../models/hl7message';
import { HttpClientService } from '../../services/http-client.service';
import { MatSort } from '@angular/material/sort';
import * as HL7Fields from './hl7fields.json';

@Component({
  selector: 'app-message-list',
  templateUrl: './message-list.component.html',
  styleUrls: ['./message-list.component.scss'],
  animations: [
    trigger('detailExpand', [
      state('collapsed', style({height: '0px', minHeight: '0'})),
      state('expanded', style({height: '*'})),
      transition('expanded <=> collapsed', animate('200ms cubic-bezier(0.4, 0.0, 0.2, 1)')),
    ]),
  ],
  encapsulation: ViewEncapsulation.None,
})
export class MessageListComponent implements OnInit, AfterViewInit {
  messages: HL7Message[] = [];
  expandedMessage: HL7Message | null = new HL7Message();
  datasource = new MatTableDataSource<HL7Message>();
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild(MatSort) sort!: MatSort;

  displayedColumns: string[] = [
    'mrn', 'messageDateTime', 'messageCode', 'triggerEvent', 'sendingApplication', 'receivingApplication',
    'insertDateTime', 'messageControlId', 'processingId', 'versionId', 'direction', 'messageSizeBytes'
  ];

  constructor(public client: HttpClientService) {
  }

  ngOnInit(): void {
    this.client.loadMessagesByCount().subscribe(()=>{
      this.messages = this.client.hl7Messages;
      console.log('Number of retrieved messages:', this.messages.length);
      this.datasource = new MatTableDataSource<HL7Message>(this.messages);
      this.datasource.paginator = this.paginator;
      this.datasource.sort = this.sort;
    }, error => {
      console.error("Error while retrieving data from API", error);
    });
  }

  ngAfterViewInit() {

  }

  // ViewMessageContent(elem:any, message:HL7Message){
  //   var tr = elem.target.closest('tr');
  //   var messageContent = tr.getAttribute('data-message-content')
  //   if (!messageContent)
  //     this.client.loadMessagesWithContent({'mrn': message.mrn, 'id': message.id}).subscribe(()=>{
  //       messageContent = this.client.hl7Messages[0].messageContent;
  //       tr.setAttribute('data-message-content', messageContent)
  //     }, error => {
  //       console.error("Error while retrieving data from API", error);
  //     });
  //   else {
  //   }
  // }

  GetMessageContent(message:HL7Message) {
    if (!message.messageContent) {
      this.client.loadMessagesWithContent({'mrn': message.mrn, 'id': message.id}).subscribe(()=>{
        message.messageContent = GetContentAsHtml(this.client.hl7Messages[0].messageContent);
        this.expandedMessage = message;
      }, error => {
        console.error("Error while retrieving data from API", error);
      });
      // If message content is already loaded, and its not been converted to HTML yet, convert it to HTML
    } else if (!message.messageContent.startsWith("<")) message.messageContent = GetContentAsHtml(message.messageContent);
    this.expandedMessage = this.expandedMessage === message ? null : message;
  }
}

function GetContentAsHtml(text:string){
  let html = text;

  // detect line break
  let lineBreak = text.includes('\r\n') ? '\r\n' : '\r';
  if (text.includes('\n')) lineBreak = '\n';

  html = AddTooltips(html, lineBreak);

  // add style to segment headers
  html = html.split(lineBreak).map(segment => {
    const segmentName = GetSegmentName(segment);
    return segmentName ? segment.replace(segmentName, `<span class="segment-name">${segmentName}</span>`) : segmentName;
  }).join(lineBreak);

  // add styling to field separators
  html = html.split('|').join('<span class="field-sep">|</span>');

  // replace line breaks with <br/>
  html = html.split(lineBreak).join('<br/>');

  html = `<code class="message-content">${html}</code>`;

  return html;
}

function AddTooltips(html: string, lineBreak: string): string {
  html = html.split(lineBreak).map(segment => {
    const segmentName = GetSegmentName(segment);
    segment = segment.split('|').map((field, i) => {
      return AddTooltipForField(field, i, segmentName);
    }).join('|');
    return segment;
  }).join(lineBreak);

  return html;
}

function GetSegmentName(segment: string): string {
  return /^[A-Za-z]\w{2}/g.exec(segment)?.toString() ?? segment;
}

function AddTooltipForField(fieldText: string, i: number, segmentName: string): any {
  const hl7fields:any = Object.values(HL7Fields)[Object.values(HL7Fields).length - 1];
  let fieldName = '';
  hl7fields.forEach((e: any) => {
    if (e["SegmentName"] == segmentName) {
      if (segmentName == 'MSH') i += 1;
      const field = (e["Fields"].find((f:any) => f["FieldIndex"] === i));
      if (field) fieldName = field["FieldName"];
    }
  });

  if (fieldName) {
    fieldText = `<span class="tooltip">${fieldText}<span class="tooltiptext">${fieldName}</span></span>`;
  }

  return fieldText;
}

