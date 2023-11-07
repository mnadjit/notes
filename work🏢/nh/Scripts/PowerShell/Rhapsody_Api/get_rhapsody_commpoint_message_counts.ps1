# [Define Constants - Initialise Variables]
$Script:uri_root = "https://nhrhapsodyprod.nh.org.au:8444/api"
$Script:uri_commpoint = "/commpoint"
$Script:uri_message_count = "/messagecount"
$Script:uri_components = "/components"
$Script:max_api_calls_per_minute = 55
$Script:default_sampling_resolution_minutes = "5"
$Script:all_tcp_commpoints = @()

Write-Host " ┣ Retriving a list of all components from Rhapsody via a GET API call..."
# Initialise last api call datetime to now
$script:last_api_call_datetime = Get-Date

if ($Script:cred -eq $null) { $Script:cred = $(Get-Credential -credential $env:USERNAME) }     # Get credentials - prompt user the first time
$Script:resp = Invoke-WebRequest -SessionVariable "session" -Method GET -Uri ($Script:uri_root + $Script:uri_components) -Credential $Script:cred -Headers @{"Accept"="application/json"}
$Script:resp_obj = ConvertFrom-Json $Script:resp

#$Script:resp_obj = Get-Content -Raw -Path c:\temp\rhap_resp_components.json | ConvertFrom-Json
Write-Host " ┗ Finished retriving components."

function Get-ChildFolderContent ($folder) {
    $Script:all_nested_commpoints = @()
    if ($folder.childComponents.Count -gt 0) {
        foreach ($childComponent in $folder.childComponents) {
            # Add components to the list of ALL components if the type is COMMUNICATION_POINT
            if ($childComponent.type -eq "COMMUNICATION_POINT" -and 
                ($childComponent.name.SubString($childComponent.name.length - 3, 3) -eq "_IO" -or $childComponent.name.SubString($childComponent.name.length - 3, 3) -eq "_OI")
                ) 
            {
                $Script:all_nested_commpoints = $Script:all_nested_commpoints + $childComponent 
            }
        }
    }

    # Check all nested childFolders recursively
    if ($folder.childFolders.Count -gt 0) { 
        foreach ($childFolder in $folder.childFolders) {            
            $Script:all_nested_commpoints = $Script:all_nested_commpoints + (Get-ChildFolderContent $childFolder)
        }
    }
    return $Script:all_nested_commpoints
}

function Start-DelayForApiCall {
    $Local:seconds_since_last_api_call = ((Get-Date) - ($script:last_api_call_datetime)).TotalSeconds
    $Local:minimum_seconds_between_api_calls = 60 / $Script:max_api_calls_per_minute
    if ($Local:seconds_since_last_api_call -lt $Local:minimum_seconds_between_api_calls) { 
        $Local:seconds_to_wait = [int]($Local:minimum_seconds_between_api_calls - $Local:seconds_since_last_api_call)
		if ($Local:seconds_to_wait -gt 0) { Write-Host -ForegroundColor DarkGray $(" ┣ Pausing $($Local:seconds_to_wait) second(s) to avoid excessive API calls to Rhapsody server..." ) }
    }
    While ($Local:seconds_since_last_api_call -lt $Local:minimum_seconds_between_api_calls) { $Local:seconds_since_last_api_call = ((Get-Date) - ($script:last_api_call_datetime)).TotalSeconds }
    $script:last_api_call_datetime = Get-Date
}

function Display-Error ($Local:error, $Local:message) {
        Write-Host -ForegroundColor Red ("[ERROR] " + $Local:message)
        Write-Host "Line:" $_.InvocationInfo.ScriptLineNumber
        Write-Host $_.Exception`n
}

function LogToCsvLogFile ($Local:log_file_path, $Local:data) {
	$Script:timePeriodCount = $Local:data.timePeriodAlerts.Count
	$Script:otherAlertsCount = $Local:data.atAllOtherTimeAlerts.Count
	"{0},{1},{2},{3},{4},{5},{6},{7},{8},{9}" -f `
		$Script:all_tcp_commpoints[$Script:i].id, $Script:all_tcp_commpoints[$Script:i].name, `
		$(if($Script:timePeriodCount -gt 0)
			{ $Local:data.timePeriodAlerts[0].daysOfWeek -join ";" } else { "" }), `
		$(if($Script:timePeriodCount -gt 0)
			{ $Local:data.timePeriodAlerts[0].alerts | Where { $_.alertName -eq "Long Idle Time" } | % { $_.parameters.enabled } } else { "" }), `
		$(if($Script:timePeriodCount -gt 0)
			{ $Local:data.timePeriodAlerts[0].alerts | Where { $_.alertName -eq "Long Idle Time" } | % { "{0} {1}" -f $_.parameters.warning.value, $_.parameters.warning.unit } } else { "" }), `
		$(if($Script:timePeriodCount -gt 0)
			{ $Local:data.timePeriodAlerts[0].alerts | Where { $_.alertName -eq "Long Idle Time" } | % { "{0} {1}" -f $_.parameters.alarm.value, $_.parameters.alarm.unit } } else { "" }), `
		$(if($Script:timePeriodCount -gt 1) { "Y" } else { "N" }), `
		$(if($Script:otherAlertsCount -gt 0)
			{ $Local:data.atAllOtherTimeAlerts | Where { $_.alertName -eq "Long Idle Time" } | % { $_.parameters.enabled } } else { "" }), `
		$(if($Script:otherAlertsCount -gt 0)
			{ $Local:data.atAllOtherTimeAlerts | Where { $_.alertName -eq "Long Idle Time" } | % { "{0} {1}" -f $_.parameters.warning.value, $_.parameters.warning.unit } } else { "" }), `
		$(if($Script:otherAlertsCount -gt 0)
			{ $Local:data.atAllOtherTimeAlerts | Where { $_.alertName -eq "Long Idle Time" } | % { "{0} {1}" -f $_.parameters.alarm.value, $_.parameters.alarm.unit } } else { "" })  `
		| Out-File -Encoding utf8 -Append $Local:log_file_path
}

function Build_Config_File ($Local:config_file_path, $Local:all_tcp_commpoints) {
	$Local:config_obj = @{}
		
	$Local:config_obj.timePeriod = @{}
	$Local:config_obj.timePeriod.startTime = "2022-01-10T00:00:00.00"
	$Local:config_obj.timePeriod.endTime = "2022-01-11T00:00:00.00"
	$Local:config_obj.commpoints = @()
		
	$Local:all_tcp_commpoints | % {
		$Local:commpoint = @{}
		$Local:commpoint.id = $_.id.ToString()
		$Local:commpoint.name = $_.name
		
		$Local:commpoint.samplingResolution = "PT{0}M" -f $Script:default_sampling_resolution_minutes
		if ($Local:commpoint.name.SubString($Local:commpoint.name.length - 3, 3) -eq "_OI") { $Local:commpoint.messageCountType = "SENT" } else { $Local:commpoint.messageCountType = "RECEIVED" }
		
		$Local:config_obj.commpoints = $Local:config_obj.commpoints + $Local:commpoint		
	}
	ConvertTo-Json $Local:config_obj | Out-File -Encoding Utf8 $Local:config_file_path
}

# [Input - Rhapsody Locker] If more than one locker exists, get user to pick one
if ($Script:resp_obj.data.childFolders.Count -gt 1) {        
    Write-Host -ForegroundColor Green "`nPlease select a locker by entering the index. [Default=0]"
    $Script:resp_obj.data.childFolders | % { $i=0 } { Write-Host -ForegroundColor Gray " "`[$i`] $_.name; $i++ }
    Write-Host -ForegroundColor Green -NoNewline "> "
    $Script:selected_locker_index = Read-Host
    if ($Script:selected_locker_index -eq "") { $Script:selected_locker_index = 0 }
    if ($Script:selected_locker_index -notmatch "^[\d]+$" -or [int]$Script:selected_locker_index -gt ($resp_obj.data.childFolders.Count - 1)) { Write-Host "INVALID value entered. Exiting the script...`n"; exit }
    $Script:lockerName = $resp_obj.data.childFolders[$Script:selected_locker_index].name
} else { $Script:lockerName = $resp_obj.data.childFolders[0].name }

# [Filter] Find all eligible Communication Points in the selected locker. Eligible meaning commpoint name ending in _IO or _OI which includes TCP servers and clients and  excludes dynamic routers, email senders, database endpoints etc.
$Script:all_tcp_commpoints = Get-ChildFolderContent $($Script:resp_obj.data.childFolders | Where { $_.name -eq $Script:lockerName })
Write-Host -NoNewline  "`nNumber of input/output components i.e. name ending in _IO/_OI found in the locker" $Script:lockerName.ToUpper()": "
Write-Host -ForegroundColor Yellow ($Script:all_tcp_commpoints.Count)`n

# [Log] Set up log folder using current datetime timestamp
$Script:log_folder_path = Join-Path (Get-Location) ("Logs/" + (Get-Date -Format "yyyyMMdd_HHmmss"))
if (-Not (Test-Path $Script:log_folder_path)) { New-Item -ItemType directory -Path $Script:log_folder_path | Out-Null }
$Script:log_message_counts_folder_path = Join-Path $Script:log_folder_path "message_counts"
if (-Not (Test-Path $Script:log_message_counts_folder_path)) { New-Item -ItemType directory -Path $Script:log_message_counts_folder_path | Out-Null }

# [Input] Ask user whether to build the config file or skip this step
$Script:create_new_config_file = Read-Host "`nDo you want a new config file to be built from commpoints? [y/N]"
if ($Script:create_new_config_file.toLower() -notmatch "^[yn]?$") { Write-Host "INVALID value entered. Exiting the script...`n"; exit }

# Build Config file
$Script:config_file_name = "message_count_config.json"
if ($Script:create_new_config_file.ToLower() -eq "y") { 
	$Script:config_file_path = Join-Path $Script:log_folder_path $Script:config_file_name
	Build_Config_File $Script:config_file_path $Script:all_tcp_commpoints
} else {
	# Default config file path
	$Script:config_folder_path = Join-Path $(Get-Location) "Configs"
	$Script:config_file_path = Join-Path $Script:config_folder_path $Script:config_file_name
}

# [Input] Ask user whether to retrieve message countes from Rhapsody API or skip this step
$Script:get_message_counts_from_server = Read-Host "`nDo you want to retrieve message counts from Rhapsody server? [y/N]"
if ($Script:get_message_counts_from_server.toLower() -notmatch "^[yn]?$") { Write-Host "INVALID value entered. Exiting the script...`n"; exit }

# [Config] Read config from config file
$Script:config_obj = Get-Content -Raw -Path $Script:config_file_path | ConvertFrom-Json


if ($Script:get_message_counts_from_server.ToLower() -eq "y") {
	$Script:config_obj.commpoints | % {
		$Local:comp_id = $_.id
		$Local:comp_name = $_.name
		$Local:cp_message_count_uri = $Script:uri_root + $Script:uri_commpoint + "/" + $Script:comp_id + $Script:uri_message_count		
		$Local:post_api_body = @{
			"messageCountType"= $_.messageCountType
			"startTime"= $Script:config_obj.timePeriod.startTime
			"endTime"= $Script:config_obj.timePeriod.endTime
			"samplingResolution"= $_.samplingResolution
		}
	
		# [API Call] Get message counts using the config file
		if ($Script:cred -eq $null) { $Script:cred = $(Get-Credential -credential $env:USERNAME) }     # Get credentials - prompt user the first time
		Start-DelayForApiCall
		
		$Local:message_count_resp = Invoke-WebRequest -WebSession $session -Method POST -Uri $Local:cp_message_count_uri -Body (ConvertTo-Json $Local:post_api_body) `
                                                             -Headers @{ "Content-Type"="application/json"; "Accept"="application/json"; "X-CSRF-Token"=$Script:resp.Headers["X-CSRF-Token"] }
		
		$Local:message_count_resp_obj = ConvertFrom-Json $Local:message_count_resp

		$Local:log_message_counts_file_path = Join-Path $Script:log_message_counts_folder_path $("{0}_{1}.json" -f $Local:comp_id, $Local:comp_name)
		$Local:message_count_resp_obj.data | ConvertTo-Json -Depth 10 | Out-File -Encoding Utf8 $Local:log_message_counts_file_path
	}
} 


# Analyse json files and generate a report of message countes




exit















# [Log] Initialise new csv file to log state of alerts for each
$Script:message_count_config_file_path = Join-Path $Script:log_folder_path "commpoints_alert_settings.before.csv"

$Script:commpoint_settings_changes_log_file_header = ("Commpoint Id,Commpoint Name,Days of Week (1st Time_Period),Long_Idle Enabled (1st Time_Period),Long_Idle Warning (1st Time_Period),Long_Idle Alarm (1st Time_Period)," +
"Has more than one time period,Long_Idle Enabled (Other),Long_Idle Warning (Other),Long_Idle Alarm (Other)") 

$Script:commpoint_settings_changes_log_file_header | Out-File -Encoding utf8 $Script:commpoint_settings_before_log_file_path
$Script:commpoint_settings_changes_log_file_header | Out-File -Encoding utf8 $Script:commpoint_settings_after_log_file_path
$Script:commpoint_settings_changes_log_file_header | Out-File -Encoding utf8 $Script:commpoint_settings_changes_log_file_path

# [Log] name of commpoints into a single file
$Script:all_tcp_commpoints | % { ("{0},{1}" -f $_.name, $_.id) | Out-File -Encoding utf8 -Append (Join-Path $Script:log_folder_path "List_of_Commpoints.csv") }

# Loop through commpoints and check days of weeks they are enabled
Write-Host "`nChecking alert settings for each commpoint and updating those with different days of week enabled"
for ($Script:i = 0; $Script:i -lt $Script:all_tcp_commpoints.Count; $Script:i++) {
#for ($Script:i = 0; $Script:i -lt 10; $Script:i++) {
    # [Prep] Initialise variables
    $Script:compId = $Script:all_tcp_commpoints[$Script:i].id
    $Script:cp_settings_uri = $Script:uri_root + $Script:uri_commpoint + "/" + $Script:compId + $Script:uri_customSettings
    # [Prep] Display commpoint name
    Write-host ("`n[{0}/{1}] {2}_{3}" -f ($Script:i + 1).ToString().PadLeft(2, '0'), $Script:all_tcp_commpoints.Count, $Script:all_tcp_commpoints[$Script:i].id, $Script:all_tcp_commpoints[$Script:i].name)
    # [Prep] Set up logging
    $Script:log_file_path_noext = Join-Path $Script:log_message_counts_folder_path ("{0}_{1}" -f $Script:all_tcp_commpoints[$Script:i].id, $Script:all_tcp_commpoints[$Script:i].name)
    $Script:log_file_path = $Script:log_file_path_noext + ".old.json"
    
    try {
        Write-Host -ForegroundColor DarkGray " ┣ Retreiving alert settings data from Rhapsody API..."
        if ($Script:cred -eq $null) { $Script:cred = $(Get-Credential -credential $env:USERNAME) }     # Get credentials - prompt user the first time
        # [Api call - GET] Make a Get API call to Rhapsody and retrive commpoint alert settings
        Start-DelayForApiCall
        $Script:get_alerts_api_resp = Invoke-WebRequest -WebSession $session -Method GET -Uri $Script:cp_settings_uri -Credential $Script:cred -Headers @{"Accept"="application/json"}
    }
    catch  {
            Display-Error $_ ("Something went wrong when accessing Rhapsody API via the following URI: `n" + $Script:cp_settings_uri)
            if ($_.Exception -is [System.Net.WebException]) {
                Write-Host -ForegroundColor Red "`n Too many API calls to Rhapsody server. Retrying last commpoint in 10 seconds..."
                Start-Sleep -Seconds 10
                $Script:i--
                continue
            } else {
                exit
            }
    }
    try {
        # [Data Consumption] Convert retrived JSON data into an object
        Write-Host -ForegroundColor DarkGray " ┣ Consuming data and logging..."
        $Script:alerts_api_data = (ConvertFrom-Json $Script:get_alerts_api_resp).data
        $Script:updated_alerts_api_data = $Script:alerts_api_data

        # [Log] Write CURRENT alert settings into a json file
        ConvertTo-Json -Depth 15 $Script:alerts_api_data | Out-File -Encoding utf8 $Script:log_file_path

        # [Log] Add alert settings data for commpoint into a single csv file
		LogToCsvLogFile $Script:commpoint_settings_before_log_file_path $Script:alerts_api_data
    }
    catch {
        Display-Error $_ "Something went wrong when transforming JSON data into an object and logging into files. Error Message:"
        exit
    }

    try {
        # [Logic] Check if selected days of week by user is different to commpoint alert settings
        Write-Host -ForegroundColor DarkGray " ┣ Checking if there is need for an update..."
        $Script:missing_weekday_found = $false;
        if ($Script:alerts_api_data.timePeriodAlerts.Count -gt 0) {
            $Script:alerts_api_data.timePeriodAlerts[0].daysOfWeek | % { 
                if (
                    ($Script:alerts_api_data.timePeriodAlerts[0].daysOfWeek.Count -ne $Script:selected_week_days.Count) -Or    # if two arrays have different number of items OR
                    (-Not $Script:selected_week_days.Contains($_)))                                                            # if items do not match
                { $Script:missing_weekday_found = $true }
            }
        }
    }
    catch {
        Display-Error $_ "Something went wrong when comparing weekdays selected by user and comparing with retrieved data from Rhapsody API. Error Message:"
        exit
    }

    try {
        # [Action - Update Alert Settings] if selected days of week by user is different to commpoint alert settings
        if ($Script:missing_weekday_found -And $Script:updated_alerts_api_data.timePeriodAlerts.Count -eq 1) {
			# [Update Data] Set "days of week" in the api data object to what user has selected
			$Script:updated_alerts_api_data.timePeriodAlerts[0].daysOfWeek = $Script:selected_week_days

            # [Log] Write UPDATED alert settings into a json file
            $Script:updated_log_file_path = $Script:log_file_path_noext + ".json"
            $Script:updated_alerts = ConvertTo-Json -Depth 15 $Script:updated_alerts_api_data

            # [Log] Write updated alert settings into a json file
            $Script:updated_alerts | Out-File -Encoding utf8 $Script:updated_log_file_path
            
			# [Pause]
			Start-DelayForApiCall
			
			Write-Host -ForegroundColor DarkGray -NoNewline " ┗ "
            Write-Host -ForegroundColor Yellow "Updaing alert settings for commpoint by making a PUT API call to Rhapsody server..."
			
            # [API call - Update] update commpoint alert setting by making an api call to Rhapsody server
            $Script:update_api_call_resp = Invoke-WebRequest -WebSession $session -Method PUT -Uri $Script:cp_settings_uri -Body $Script:updated_alerts `
                                                             -Headers @{  "Content-Type"="application/json"; "Accept"="application/json"; "X-CSRF-Token"=$Script:get_alerts_api_resp.Headers["X-CSRF-Token"]}

            if ($Script:update_api_call_resp.error -ne $null) { Write-Host "[Error]: " $Script:update_api_call_resp.error }
			
			#[Log]
			LogToCsvLogFile $Script:commpoint_settings_after_log_file_path $Script:updated_alerts_api_data
			LogToCsvLogFile $Script:commpoint_settings_changes_log_file_path $Script:updated_alerts_api_data
        } else {
            Write-Host -ForegroundColor DarkGray " ┗ No need to make any updates to the current setting."
			
			# [Log]
			LogToCsvLogFile $Script:commpoint_settings_after_log_file_path $Script:alerts_api_data
        }
    }
    catch {
        Display-Error $_ "Something went wrong during API call to Rhapsody API to update alert settings."
        if ($_.Exception -is [System.Net.WebException]) {
			$Local:seconds_to_wait = 10
            Write-Host -ForegroundColor Red "`n Too many API calls to Rhapsody server. Retrying last commpoint in ${$Local:seconds_to_wait} seconds..."
            Start-Sleep -Seconds $Local:seconds_to_wait
            $Script:i--
            continue
        } else {
            exit
        }
    }
}