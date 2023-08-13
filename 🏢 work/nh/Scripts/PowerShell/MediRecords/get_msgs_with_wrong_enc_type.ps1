# Build a report of messages with encounter types other than VR and create a csv file

if ($args.length -eq 0) { Write-Host "Please enter the path to the zip file containing MediRecords webhook messages"; EXIT }
$Local:zip_file_path = Get-ChildItem $args[0]
if (-Not (Test-Path $zip_file_path)) {  Write-Host "Zip file does not exist on the following path`n$($zip_file_path)"; EXIT } 

if ($args.length -ne 2) { Write-Host "Usage:`n> ./get_mesgs_with_wrong_enc_types.ps1  /path/to/zip_file /path/to/dir_to_drop_report_in"; EXIT }
$Local:report_dir = $args[1]

#$Local:messages_dir_path = 'c:/users/tehranm/Downloads/mr_messages'
$Local:out_file = Join-Path $report_dir "MR_Rx_consultation_types_$(Get-Date -Format 'yyyyMMdd').csv"
$Local:tz_code = ((Get-TimeZone).id.split(' ') | % { $_[0] }) -join ''

$messages_dir_path = Join-Path $zip_file_path.DirectoryName 'mr_messages'
if (-Not (Test-Path $messages_dir_path)) { md $messages_dir_path }
Expand-Archive -Path $zip_file_path -DestinationPath $messages_dir_path

#ls $dl_dir | % {
   #if ($_.Name -like 'messages*.zip') { Expand-Archive -Path $_.FullName -DestinationPath $mr_dir }
#}

ECHO "UR,Date-Time ($($tz_code)),Script Id,Encounter Code,Clinician,Patient Id,Webhook Id,Doc-Ref Id" | out-file -Encoding utf8 $out_file

Get-ChildItem $messages_dir_path | ForEach-Object {
    $msg = gc $_ | ConvertFrom-Json
    $pt = ($msg.payload.event.context[0].resource.entry | Where { $_.resource.resourceType -eq 'Patient'} ).resource
    $ur = ($pt.identifier | Where { $_.system -eq 'urn:uuid:1bac2669-297c-4164-a468-6349cf855df2' }).value
    $enc = ($msg.payload.event.context[0].resource.entry | Where { $_.resource.resourceType -eq 'Encounter'} ).resource
    $medreq = ($msg.payload.event.context[0].resource.entry | Where { $_.resource.resourceType -eq 'MedicationRequest'} ).resource
	$doc_ref = ($msg.payload.event.context[0].resource.entry | Where { $_.resource.resourceType -eq 'DocumentReference'} ).resource
    $clinician = $doc_ref.author.display
    $mreq_id = ($medreq.identifier | Where { $_.system -eq 'urn:uuid:1bac2669-297c-4164-a468-6349cf855df2' }).value
    $msg_date = Get-Date -Format 'yyyy-MM-dd HH:mm:ss' "$(Get-Date -Format "yyyy-MM-ddTHH:mm:ss" $($msg.payload.timestamp))Z"
    if ($enc.class.code -ne "VR") { "$($ur),$($msg_date),$($mreq_id),$($enc.class.code),$($clinician),$($pt.id),$($msg.id),$($doc_ref.id)" }
} | out-file -Encoding utf8 $out_file -Append