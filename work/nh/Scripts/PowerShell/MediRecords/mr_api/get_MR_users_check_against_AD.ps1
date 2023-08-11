# Get users from MR and check if AD user is enabled

$Script:max_user_count = 700
$Script:mr_users_api = "https://api-mrapp.medirecords.com/secure/api-mrapp/users/search?q=status%3D%3DActive&page=0&size=$($max_user_count)"
$Script:api_token = 'Ojqf_OhdeDYXNTXUkKYd_y645ps'
$Script:out_file_path =  'c:/temp/mr_disabled_users.csv'

ECHO "List of clinicians in MediRecords whose Active Directory user has been disabled:"

$resp = Invoke-WebRequest -UseBasicParsing -Uri $mr_users_api `
-Headers @{
  "accept"="application/json"
  "authorization"="Bearer $($api_token)"
}

$users = ($resp.Content | ConvertFrom-Json).data | Select-Object -Property email, AD_Found, AD_Enabled

# Check each user in Active Directory - Find 
for ($local:i = 0; $i -lt $users.Count; $i++) {
	$email = $users[$i].email
	$ad_user = Get-ADUser -Filter { UserPrincipalName -eq $email }
	$users[$i].AD_Found = $ad_user -ne $null
	if ($ad_user -ne $null) { $users[$i].AD_Enabled = $ad_user.Enabled }
	else { $users[$i].AD_Enabled = $false }
}

# Filter MR users which are either not found in Active Directory or have been deactivated
$users | WHERE {$_.AD_Enabled -eq $false} | Export-Csv $out_file_path