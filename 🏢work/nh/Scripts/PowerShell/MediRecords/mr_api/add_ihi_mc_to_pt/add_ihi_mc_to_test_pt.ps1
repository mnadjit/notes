param(
	[Parameter(Mandatory=$false)] [String] $action,
    [Parameter(Mandatory=$false)] [String] $test_pat_guid
)

$Script:pt_with_ihi_path = './pt_guid_with_ihi.txt'

if (@("add","rm") -notcontains $action.ToLower()) { 
    Write-Error "`n`nValid action parameters are 'add' and 'rm'.`nUsage:`n`t./script.ps1 [add|rm] [patient_guid]`n`te.g.`n`t`t./script.ps1 add b5f2256f-1205-486d-9534-41000e1bb50f`n`t`t./script.ps1 rm"
    EXIT
}

if (($test_pat_guid -eq '') -And (Test-Path -Path $pt_with_ihi_path) -And ($action.ToLower() -eq "rm")) { $test_pat_guid = gc $pt_with_ihi_path -Raw }
if ((Test-Path -Path $pt_with_ihi_path) -And ($action.ToLower() -eq "add")) { Write-Warning "The dummy IHI has already been added to a patient in MR.`t`nPatient MR GUID containing the dummy IHI number:`n`t$($test_pat_guid)"; EXIT }
if ($test_pat_guid -eq '') { Write-Error "`n`nTest patient GUID was not provided to the script as a parameter, or not found in the file containing the patient MR guid which contains the dummy IHI number." ; EXIT }

$local:config = gc './config.json' -Raw | ConvertFrom-Json
$Script:api_url = $config.api_url
$Script:api_token = $config.api_token
$Script:dummy_ihi = $config.dummy_ihi
$Script:dummy_mc = $config.dummy_mc

$Script:ihi_str = "{`"extension`":[{`"url`":`"http://hl7.org.au/fhir/StructureDefinition/ihi-status`",`"valueCoding`":{`"system`":`"https://healthterminologies.gov.au/fhir/CodeSystem/ihi-status-1`",`"code`":`"active`",`"display`":`"active`"}},{`"url`":`"http://hl7.org.au/fhir/StructureDefinition/ihi-record-status`",`"valueCoding`":{`"system`":`"https://healthterminologies.gov.au/fhir/CodeSystem/ihi-record-status-1`",`"code`":`"verified`",`"display`":`"verified`"}}],`"type`":{`"coding`":[{`"system`":`"http://terminology.hl7.org/CodeSystem/v2-0203`",`"code`":`"NI`"}]},`"system`":`"http://ns.electronichealth.net.au/id/hi/ihi/1.0`",`"value`":`"$($dummy_ihi)`",`"period`":{`"end`":`"2023-11-23T12:44:42+00:00`"}}"
$Script:mc_str = "{`"type`":{`"coding`":[{`"system`":`"http://terminology.hl7.org/CodeSystem/v2-0203`",`"code`":`"MC`"}]},`"system`":`"http://ns.electronichealth.net.au/id/medicare-number`",`"value`":`"$($dummy_mc)`",`"period`":{`"end`":`"2025-07`"}}"

$Script:ihi = ConvertFrom-Json $Script:ihi_str
$Script:mc = ConvertFrom-Json $Script:mc_str

# get test patient
$local:pat_under_test_orig = Invoke-RestMethod -Method GET -Uri "$($api_url)/$($test_pat_guid)" -Headers @{"Authorization"="Bearer $($api_token)"}
$local:pat_under_test_updated = $pat_under_test_orig

if ($pat_under_test_orig.resourceType -ne "Patient") { Write-Host -ForegroundColor DarkYellow "`nFailed to retrieve patient from api.`n"; ECHO $pat_under_test_orig; EXIT }

# if action is 'ADD' add MC/IHI to test patient 
if ($action.ToLower() -eq "add") {
    $pat_under_test_updated.identifier += $ihi
    $pat_under_test_updated.identifier += $mc
    ECHO $test_pat_guid | Out-File -FilePath $pt_with_ihi_path -Encoding utf8
}
# if action is 'RM' remove MC/IHI from test patient 
elseif ($action.ToLower() -eq "rm") {
    $local:updated_ids = @()
    $pat_under_test_updated.identifier | Where { @("http://ns.electronichealth.net.au/id/hi/ihi/1.0", "http://ns.electronichealth.net.au/id/medicare-number") -notcontains $_.system } | % { $updated_ids += $_ }
    $pat_under_test_updated.identifier = $updated_ids
}

$local:updated_pat_resp = Invoke-RestMethod -Method PUT -Uri "$($api_url)/$($test_pat_guid)" `
        -Headers @{"Authorization"="Bearer $($api_token)";"Content-Type"="application/json"} `
        -Body $($pat_under_test_updated | ConvertTo-Json -Depth 10)

Write-Host "  Found following identifiers in updated patient record:"
$updated_pat_resp.identifier | % { Write-Host "  ┣ $($_.value)" }

# If successfull and action is "rm" i.e. remove ids from patient, delete the file that contains the patient guid
if (($action.ToLower() -eq "rm") -And (Test-Path -Path $pt_with_ihi_path) -And ($test_pat_guid -eq (gc $pt_with_ihi_path -Raw)) -And ($updated_pat_resp.identifier -ne $null)) { rm $pt_with_ihi_path }