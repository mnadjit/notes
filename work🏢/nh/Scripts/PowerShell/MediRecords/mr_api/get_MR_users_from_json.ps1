# Get users from a json file extracted from MediRecords web app

$mr_users_in_file = 'C:/temp/MR/mr_users.json'
$mr_users_out_file = 'C:/temp/MR/mr_users.csv'

$mr_users = (Get-Content -Path $mr_users_in_file -Encoding utf8 | ConvertFrom-Json )

$mr_users.data | Where-Object { $_.status -eq 'Active' }  | Select-Object -Property titleName, firstName, lastName, email, moduleCode, hpiINo, erxId | Export-Csv -Path $mr_users_out_file -NoTypeInformation
