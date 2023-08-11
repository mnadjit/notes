using System;

namespace Shared.Models
{
    interface IMessageModel
    {
        Int64 Id { get; set; }
        string MRN { get; set; }
        string MRN_All { get; set; }
        DateTime MessageDateTime { get; set; }
        string MessageCode { get; set; }
        string TriggerEvent { get; set; }
        string VersionId { get; set; }
        string SendingApplication { get; set; }
        string SendingFacility { get; set; }
        string ReceivingApplication { get; set; }
        string ReceivingFacility { get; set; }
        DateTime InsertDateTime { get; set; }
        string MessageControlId { get; set; }
        string ProcessingId { get; set; }
        string Direction { get; set; }
        string MessageContent { get; set; }
        int MessageSizeBytes { get; set; }
    }
}