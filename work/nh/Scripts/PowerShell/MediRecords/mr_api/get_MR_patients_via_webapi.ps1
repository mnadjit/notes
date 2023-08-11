# Get MediRecords Patient data from Api

$resp_payload1 = ''
$resp_payload2 = ''

$j = $resp_payload1 | ConvertFromJson
$j += $resp_payload2 | ConvertFromJson

$d = $j | Select-Object -Property 'titleName','firstName','lastName','middleName','fullName','dob','mobilePhone','email','patientGUID','genderText','addresses'

$d | % { $_ | Add-Member 'address' -NotePropertyValue "$($_.addresses[0].addressLine1) $($_.addresses[0].addressLine2) $($_.addresses[0].city) $($_.addresses[0].postCode) $($_.addresses[0].stateCode) $($_.addresses[0].countryCode)" }

$d | export-csv -Encoding utf8 -path "D:\temp\data_extraction\MediRecords\Prod\2022-11-18_153700_Active_without_UR_with_script\2022-11-18_153700_Active_without_UR_with_script.csv"