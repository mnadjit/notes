$local:guids = Import-Csv './sample_guids.csv'

for ($i=0; $i -lt $guids.length; $i++){
    $local:guid = $guids[$i].guid

    $local:pat = Invoke-RestMethod -Method GET -Uri "https://api-v1.medirecords.com/fhir/v1/Patient/$($guid)" -Headers @{"Authorization"="Bearer 8TD5f4qX3unf-8s7oTY_bOj0RGg"}
    ECHO "$($pat.id) `t $($pat.name.text) `t $($pat.birthDate)"
    

    if ($local:pat.identifier.length -gt 0) {  $pat.PSObject.Properties.Remove('identifier')    }
    $pat.active = $false;

    $local:updated_pat = Invoke-RestMethod -Method PUT -Uri "https://api-v1.medirecords.com/fhir/v1/Patient/$($guid)" `
        -Headers @{"Authorization"="Bearer 8TD5f4qX3unf-8s7oTY_bOj0RGg";"Content-Type"="application/json"} `
        -Body $($pat | ConvertTo-Json -Depth 10)

    ECHO "$($updated_pat.id) `t $($updated_pat.name.text) `t $($updated_pat.birthDate)"
    ECHO ""
}