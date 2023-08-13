# Given a directory containing FHIR webhook messages from MediRecords, create a csv file of those with message time within a certain time of day e.g. messages with timestamp of after 1pm 

$Script:messages_dir_path = 'c:/users/tehranm/Downloads/mr_messages'
$Script:out_file = 'c:/temp/MR_Rx_after_1pm.csv'

ECHO 'UR,Date-Time,Script Id,Encounter Code,Patient Id,Webhook Id,Doc Date,Message Date' | out-file -Encoding utf8 $out_file;
dir $messages_dir_path | % {
    $msg = gc $_ | ConvertFrom-Json
    $msg_date = $msg.payload.timestamp
    $pt = ($msg.payload.event.context[0].resource.entry | Where { $_.resource.resourceType -eq 'Patient'} ).resource
    $ur = ($pt.identifier | Where { $_.system -eq 'urn:uuid:1bac2669-297c-4164-a468-6349cf855df2' }).value
    $doc_ref = ($msg.payload.event.context[0].resource.entry | Where { $_.resource.resourceType -eq 'DocumentReference'} ).resource
    $enc = ($msg.payload.event.context[0].resource.entry | Where { $_.resource.resourceType -eq 'Encounter'} ).resource
    $medreq = ($msg.payload.event.context[0].resource.entry | Where { $_.resource.resourceType -eq 'MedicationRequest'} ).resource
    $mreq_id = ($medreq.identifier | Where { $_.system -eq 'urn:uuid:1bac2669-297c-4164-a468-6349cf855df2' }).value
    if (((Get-Date -AsUTC -Date $doc_ref.date).Hour) -ge 13) {
        cp $_ ../mr_wrong_doc_dates/
        ECHO "$($ur),$(Get-Date -Format "yyyy-MM-dd HH:mm:ss" $msg.payload.timestamp),$($mreq_id),$($enc.class.code),$($pt.id),$($msg.id),$(Get-Date -Date ($doc_ref.date) -Format "yyyy-MM-dd HH:mm:ss" -AsUTC),$(Get-Date -Date $msg_date -Format "yyyy-MM-dd HH:mm:ss" -AsUTC)"
    }
} | out-file -Encoding utf8 $out_file -Append