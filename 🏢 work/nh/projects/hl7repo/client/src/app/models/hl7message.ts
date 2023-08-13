export class HL7Message {
  id: number = 0;
  sendingApplication: string = "";
  sendingFacility: string = "";
  receivingApplication: string = "";
  receivingFacility: string = "";
  messageDateTime: Date = new Date();
  insertDateTime: Date = new Date();
  messageCode: string = "";
  triggerEvent: string = "";
  versionId: string = "";
  messageControlId: string = "";
  processingId: string = "";
  direction: string = "";
  mrn: string = "";
  messageContent: string = "";
  messageSizeBytes: number = 0;
}
