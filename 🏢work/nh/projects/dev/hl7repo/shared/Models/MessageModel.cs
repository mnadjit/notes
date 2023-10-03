using System;
using System.Globalization;

namespace Shared.Models
{
    public class MessageModel : IMessageModel
    {
        public MessageModel() {
            this.InsertDateTime = DateTime.Now;
        }
        public MessageModel(string messageContent)
        {
            this.MessageContent = messageContent;
            this.InsertDateTime = DateTime.Now;
        }
        public MessageModel(long id, string sendingApplication, string sendingFacility, string receivingApplication, string receivingFacility, DateTime messageDateTime, DateTime insertDateTime, string messageCode, string triggerEvent, string versionId, string messageControlId, string processingId, string direction, string mRN, string mRN_All, string messageContent, int messageSizeBytes) 
        {
            this.Id = id;
                this.SendingApplication = sendingApplication;
                this.SendingFacility = sendingFacility;
                this.ReceivingApplication = receivingApplication;
                this.ReceivingFacility = receivingFacility;
                this.MessageDateTime = messageDateTime;
                this.InsertDateTime = insertDateTime;
                this.MessageCode = messageCode;
                this.TriggerEvent = triggerEvent;
                this.VersionId = versionId;
                this.MessageControlId = messageControlId;
                this.ProcessingId = processingId;
                this.Direction = direction;
                this.MRN = mRN;
                this.MRN_All = mRN_All;
                this.MessageContent = messageContent;
                this.MessageSizeBytes = messageSizeBytes;
               
        }
                public long Id { get; set; }
        public string SendingApplication { get; set; }
        public string SendingFacility { get; set; }
        public string ReceivingApplication { get; set; }
        public string ReceivingFacility { get; set; }
        public DateTime MessageDateTime { get; set; }
        public DateTime InsertDateTime { get; set; }
        public string MessageCode { get; set; }
        public string TriggerEvent { get; set; }
        public string VersionId { get; set; }
        public string MessageControlId { get; set; }
        public string ProcessingId { get; set; }
        public string Direction { get; set; }
        public string MRN { get; set; }
        public string MRN_All { get; set; }
        public string MessageContent { get; set; }
        public int MessageSizeBytes { get; set; }
        public MessageModel(HL7Message hl7message)
        {
            this.SendingApplication = hl7message.GetHL7Item("MSH-3")[0];
            this.SendingFacility = hl7message.GetHL7Item("MSH-4")[0];
            this.ReceivingApplication = hl7message.GetHL7Item("MSH-5")[0];
            this.ReceivingFacility = hl7message.GetHL7Item("MSH-6")[0];
            this.MessageDateTime = GetDateTime(hl7message.GetHL7Item("MSH-7")[0]); 
            this.InsertDateTime = DateTime.Now;
            this.MessageCode = hl7message.GetHL7Item("MSH-9.1")[0];
            this.TriggerEvent = hl7message.GetHL7Item("MSH-9.2")[0];
            this.MessageControlId = hl7message.GetHL7Item("MSH-10")[0];
            this.ProcessingId = hl7message.GetHL7Item("MSH-11")[0];
            this.VersionId = hl7message.GetHL7Item("MSH-12")[0];
            this.MRN_All = GetHL7Item(hl7message, "PID-3");
            this.MRN = GetMrnFromMrnAll(this.MRN_All);
            this.MessageContent = hl7message.message;
            this.MessageSizeBytes = System.Text.ASCIIEncoding.ASCII.GetByteCount(hl7message.message);
        }

        private string GetMrnFromMrnAll(string mrn_all)
        {
            var nhMrn = mrn_all;

            // if a single component exists in PID-3 field, return it
            if (!mrn_all.Contains('~') && !mrn_all.Contains('^')) return nhMrn;

            // Get mrn repeats by split on '~'
            // if multiple components exist in PID-3 field, return the one with either PID-3.4 (Assigning Auth) of '' or PID-3.5 (Id Type) of 'MR'
            var mrn_repeats = mrn_all.Split('~');
            foreach (string mrn in mrn_repeats)
            {
                var mrn_components = mrn.Split('^');
                if (mrn_components.Length >= 4 && mrn_components[3]=="1280") nhMrn = mrn_components[0];
                if (mrn_components.Length >= 5 && mrn_components[4]=="MR") nhMrn = mrn_components[0];
            }
            
            return nhMrn;
        }

        private DateTime GetDateTime(string msgDatetime)
        {
            var msgDatetimeWithoutTZ = msgDatetime.Split('+')[0];
            if (msgDatetime.Contains('-')) msgDatetimeWithoutTZ = msgDatetime.Split('-')[0];

            var dateFormat = "yyyyMMddHHmmss";
            if (msgDatetimeWithoutTZ.Length == 12) dateFormat = "yyyyMMddHHmm";
            if (msgDatetime.Contains('+') || msgDatetime.Contains('-')) dateFormat = $"{dateFormat}K";
            var datetime = DateTime.Now;
            try
            {
                datetime = string.IsNullOrEmpty(msgDatetime) ? DateTime.Now : DateTime.ParseExact(msgDatetime, dateFormat, CultureInfo.InvariantCulture);
            }
            catch
            {
                if (msgDatetime.Length >= 12) DateTime.ParseExact(msgDatetime.Substring(0, 12), "yyyyMMddHHmm", CultureInfo.InvariantCulture);
            }
            return datetime;
        }

        private string GetHL7Item(HL7Message hl7message, string query)
        {
            var value = string.Empty;
            // Check if query returns any values
            try
            {
                value = hl7message.GetHL7Item(query)[0];
            }
            catch
            {
                if (query.Contains(".")) {
                    // get last index of "."
                    var index = query.LastIndexOf(".");
                    query = query.Substring(0, index);
                }
                return GetHL7Item(hl7message, query);
            }

            return value;
        }
    }
}