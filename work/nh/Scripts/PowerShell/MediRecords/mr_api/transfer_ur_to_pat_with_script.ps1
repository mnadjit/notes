#
$Script:in_file_path = 'D:\temp\data_extraction\MediRecords\Prod\2022-11-30_URs_to_transfer.csv'
$Script:err_file_path = 'D:\temp\data_extraction\MediRecords\Prod\2022-11-30_URs_to_transfer.errors.csv'
$Script:patient_uri = 'https://api-v1.medirecords.com/fhir/v1/Patient'
$Script:patient_ur_uri ='https://api-v1.medirecords.com/fhir/v1/Patient?identifier:of-type=http://terminology.hl7.org/CodeSystem/v2-0203%7CPT%7C'
$Script:api_token = '8TD5f4qX3unf-8s7oTY_bOj0RGg'

# Get a list of patients with UR number, and guid of the patient UR needs to be transferred to
$local:pats = Import-Csv $in_file_path

function get_patient_by_ur ([String]$nh_ur) {
    $local:patient = Invoke-RestMethod -Method GET -Uri "$($patient_ur_uri)$($nh_ur)" -Headers @{"Authorization"="Bearer $($api_token)"}
    $patient
}

function get_patient_by_guid ([String]$pat_guid) {
    $local:patient = Invoke-RestMethod -Method GET -Uri "$($patient_uri)/$($pat_guid)" -Headers @{"Authorization"="Bearer $($api_token)"}
    $patient
}

function update_patient ([System.Object]$patient) {
    $local:uri = "$($patient_uri)/$($patient.id)"
    $local:updated_patient = Invoke-RestMethod  -Method PUT -Uri $uri `
                                                -Headers @{"Authorization"="Bearer $($api_token)";"Content-Type"="application/json"} `
                                                -Body $($patient | ConvertTo-Json -Depth 10)
    $updated_patient
}

ECHO "guid,ur,error" | Out-File $err_file_path -Encoding utf8

for ($local:i = 116; $i -lt $pats.guid.length; $i++){
    Write-Host "-------------------------------------------`n"

    $local:guid = $pats.guid[$i]
    $local:ur = $pats.ur[$i]

    Write-Host "($i)`nMajor`t$guid"
    if ($ur -eq '') { ECHO "$($guid),,UR not found" | Out-File $err_file_path -Append -Encoding utf8; Write-Host -ForegroundColor Yellow "UR not found"; continue }

    # get patient with guid (Major Record)
    $local:major = get_patient_by_guid($guid)

    # make sure it doesn't have a UR already
    
    if ($major.PSObject.Properties.Name -contains 'identifier' -And $major.identifier.system -contains 'urn:uuid:1bac2669-297c-4164-a468-6349cf855df2') { 
        Write-Host "UR`t$(($major.identifier | Where { $_.system -eq 'urn:uuid:1bac2669-297c-4164-a468-6349cf855df2' }).value)"
        ECHO "$($guid),$($ur),patient record with guid contains UR already" | Out-File $err_file_path -Append -Encoding utf8
        Write-Host -ForegroundColor Yellow "patient record with guid contains UR already"
        continue
    }
    #Write-Host "Major`n$($major.PSObject.Properties.Name -contains 'identifier')"

    # get patient using search with UR (minor Record)
    $local:minor_search_result = get_patient_by_ur($ur)

    
    if ($minor_search_result.total -eq 0) { ECHO "$($guid),$($ur),patient not found for that UR" | Out-File $err_file_path -Append -Encoding utf8; Write-Host -ForegroundColor Yellow "patient not found for that UR"; continue }
    if ($minor_search_result.total -gt 1) { ECHO "$($guid),$($ur),multiple patients found for that UR" | Out-File $err_file_path -Append -Encoding utf8; Write-Host -ForegroundColor Yellow "multiple patients found for that UR"; continue }
    $local:minor = $minor_search_result.entry[0].resource

    Write-Host "Minor`t$($minor.id)`t$ur"

    # copy all identifiers from minor to Major record
    for ($local:j = 0; $j -lt $minor.identifier.length; $j++) {
        if ($major.identifier.system -notcontains $minor.identifier[$j].system){
            if ($major.identifier -eq $null) { $major | Add-Member -NotePropertyName "identifier" -NotePropertyValue @() }
            $major.identifier += $minor.identifier[$j]
        }
    }

    # if major and minor name and dob don't match, skip this entry
    if (($major.birthDate -ne $minor.birthDate) -or ($major.name[0].text.ToLower() -ne $minor.name[0].text.ToLower())) {
        $local:major_mc = ($major.identifier | Where { $_.system -eq 'http://ns.electronichealth.net.au/id/medicare-number' }).value
        $local:minor_mc = ($minor.identifier | Where { $_.system -eq 'http://ns.electronichealth.net.au/id/medicare-number' }).value

        Write-Host -ForegroundColor Blue "Major Patient:`t`tDOB: $($major.birthDate)`t`tName: $($major.name[0].text)`t`tMC: $($major_mc)`t`tAddress: $($major.address.line)"
        Write-Host -ForegroundColor Blue "Minor Patient:`t`tDOB: $($minor.birthDate)`t`tName: $($minor.name[0].text)`t`tMC: $($minor_mc)`t`tAddress: $($minor.address.line)" -NoNewline
        Write-Host " "
        $local:next_action = Read-Host "Do both records belong to the same person? [y/N] "
        if ($next_action.toLower() -ne 'y') {
            ECHO "$($guid),$($ur),major & minor records don't match" | Out-File $err_file_path -Append -Encoding utf8
            Write-Host -ForegroundColor Yellow "major & minor records don't match"
            continue
        }
    }

    $local:updated_major = update_patient($major)
    #Write-Host -ForegroundColor Gray "Updated Major Patient ids: $($updated_major.identifier)"

    # if successfull, remove identifiers from minor record and mark as inactive
    if ($major.PSObject.Properties.Name -notcontains 'identifier') { ECHO "$($guid),$($ur),major record update failed" | Out-File $err_file_path -Append -Encoding utf8; Write-Host -ForegroundColor Yellow "major record update failed"; continue }

    $minor.PSObject.Properties.Remove('identifier')
    $minor.active = $false
    $local:updated_minor = update_patient($minor)
    #Write-Host -ForegroundColor Gray "Updated Minor Patient ids: $($updated_minor.identifier)"
}
