function Set-HttpHeaders() {
	param(
		[Parameter(Mandatory)] [SecureString] $accessKey,
		[Parameter(Mandatory)] [SecureString] $secretKey,
		[Parameter(Mandatory)] [string] $out_file_path
}

# Set HTTP headers
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Accept", "application/json")
$headers.Add("X-ApiKeys", "accessKey=$($accessKey); secretKey=$($secretKey)")

# Make a call to the API to get overview of all scans; folder_id of 423 relates to "My Scans" folder
$response = Invoke-RestMethod 'https://cloud.tenable.com/scans?folder_id=423' -Method 'GET' -Headers $headers

$scans_output = @();
$response.scans | Where-Object { $_.shared -eq $true -and $_.status -ne 'empty' -and $_.enabled -eq $true } | ForEach-Object {
  $scans_data = @{}
  $scans_data.name = $_.name
  $scans_data.schedule = $_.rrules
  $scans_data.starttime = $_.starttime
  $scans_data.owner = $_.owner
  $scans_data.comments = ''
  $scans_data.scan_permissions = @{'0'='No Access';'16'='Can View';'32'='Can Execute';'64'='Can Edit';'128'='Owner' }["$($_.permissions)"]
  
  # Make the 2nd call to the API this time to get the details for each scan
  $resp = Invoke-RestMethod "https://cloud.tenable.com/editor/scan/$($_.id)" -Method 'GET' -Headers $headers
  
  $scans_data.type = $resp.title
  $resp.settings.basic.inputs | % {
    if ($_.name -eq 'Target Groups') {
      $target_groups = $_.options | Select-Object -Property id, name
      $target_group_ids = $_.default
      $scans_data.target_groups = ($target_groups | Where { $target_group_ids -contains $_.id }).name -join ';'
    }
    elseif ($_.name -eq 'Targets') {
      $scans_data.targets = $_.default ?? ''
    }
  }
  $scans_data.assessment_mode = $resp.settings.assessment.modes.default ?? ''
  
  # Add scan data to the array which will be 
  $scans_output += $scans_data
};

# Set CSV headers in desired order and export to csv file
$scans_output | Select-Object -Property name, target_groups, targets, schedule, starttime, scan_permissions, type, assessment_mode, comments | Export-Csv -Path $out_file_path -NoTypeInformation -Encoding utf8
