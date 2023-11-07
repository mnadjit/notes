# Given a directory containing FHIR webhook messages from MediRecords, create a csv file of those with missing encounter or where encounter code is NOT 'VR'

$Script:messages_dir_path = 'c:/users/tehranm/Downloads/mr_messages'
$Script:out_file = "c:/temp/MR_Rx_consultation_types_$(Get-Date -Format 'yyyyMMdd').csv"

ECHO 'UR,Date-Time,Script Id,Encounter Code,Patient Id,Webhook Id' | out-file -Encoding utf8 $out_file;
dir $messages_dir_path | % {
	$msg = gc $_ | ConvertFrom-Json
	$pt = ($msg.payload.event.context[0].resource.entry | Where { $_.resource.resourceType -eq 'Patient'} ).resource
	$ur = ($pt.identifier | Where { $_.system -eq 'urn:uuid:1bac2669-297c-4164-a468-6349cf855df2' }).value
	$enc = ($msg.payload.event.context[0].resource.entry | Where { $_.resource.resourceType -eq 'Encounter'} ).resource
	$medreq = ($msg.payload.event.context[0].resource.entry | Where { $_.resource.resourceType -eq 'MedicationRequest'} ).resource
	$mreq_id = ($medreq.identifier | Where { $_.system -eq 'urn:uuid:1bac2669-297c-4164-a468-6349cf855df2' }).value
	if ($enc.class.code -ne "VR") { "$($ur),$(Get-Date -Format "yyyy-MM-dd HH:mm:ss" $msg.payload.timestamp),$($mreq_id),$($enc.class.code),$($pt.id),$($msg.id)" }
} | out-file -Encoding utf8 $out_file -Append