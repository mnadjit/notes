<#
	Create Date:	2022-01-25
	Author:			Mehdi N Tehrani <mehdi.tehrani@nh.org.au; m.nadji.t@gmail.com>
	Purpose:		Manage days of week alert notifications are sent for each Rhapsody TCP commpoint. Especially, changing setting to "After-Hours" on public holidays in batch for all commpoints, and reverting after the public holiday.
	Overview:		Retreive a list of all TCP commpoints using a GET HTTP call to Rhapsody (Northern Health Integration Engine) server API.
					Each commpoint in most cases has only 2 time periods for notifications:
						1- One is "All Other Times" which is the default and applies to times not specified in any other Time Period(s).
						2- The other time period for most commpoints covers Monday to Friday from 8:30 to 17:15 - For the sake of this script we call it "Week-Day notifications".
						Some commpoints might have more Time Periods - which get logged into a separate log file. These commpoints need to be configued manually.
					Each of these time periods can contain different thresholds for notifications. e.g. During Week-Days a commpoint might send notifications if receives no messages for over 30 minutes, but "All Other Times" this can be set to 2 hours.
					This script prompts the user for days of week on which "Week-Day notifications" (Mon-Fri 8:30-17:15) shall be ENABLED.
					For example, if user enters "Monday, Tuesday, Thursday, Friday" when prompted, all commpoints settings will be "Week-Day notifications" for these days, and for Wednesday "All Other Times" settings will apply for notifications.
					Log files are produced to capture the setting of each commpoint BEFORE, AFTER, CHANGES, MULTIPLES.
						BEFORE: config before any changes were made
						AFTER: config after changes were applied
						CHANGES: only commpoints to which changes were applied to i.e. excluding those which already had that setting in place OR had multiple WEEK-DAY time periods
						MULTIPLES: these are commpoints which have multiple WEEK-DAY time periods and will not be touched. These should be changed manually and should be remembered to set back to original setting after a public holiday.
	Usage:			If more than one LOCKER exists in Rhapsody, user gets presented with a list of Lockers and their indices. User enters the index relevant to their choice. If no value is entered, the first locker would be selected by default.
					Then user is prompted to enter indices for weekdays they would like WEEK-Day notifications be ENABLED on. This can be done by entering weekday indices.
						E.g.
							User input: "123" 		Means: Monday, Tuesday, Wednesday
							User input: "256" 		Means: Tuesday, FDriday, Saturday
					Finally user needs to confirm the changes that are about to be made to the notifications for all eligible* commpoints.
					*eligible - a TCP commpoint - client or server with only one "WEEK-DAY notifications" time priod and one "All Other Times" time period.
	Updates:
					2022-09-22, Mehdi Tehrani, PowerShell Core i.e. version 6 and 7 return webrequest header values as arrays of string, while Windows PowerShell i.e. version 5 and older return string. Fix implemented to account for both.
                    2023-03-09, Mehdi Tehrani, 1. Notifications for selected week-days by the user now get DISABLED. Before notifications would be kept ENABLED for the user-selected days and other days would be DISABLED.
                                               2. Selected weekdays to have their notifications disabled now get the same settings as "All Other Times" alerts. This is the expected behaviour, i.e.
                                                    in case of a public holiday, it's expected for notifications for a commpoint to be the same as after-hours which is "All Other Times" in Rhapsody Custom Notifications.
                                               3. Add feature to be able to backup the current notifications settings for all qualifying commpoints i.e. those with names ending in _IO or _OI meaning input and output commpoints.
#>

<#
    CONFIGURATION *******************************************************************************************************************
#>

# Read config file
$Local:config = Get-Content -Path './config.json' | ConvertFrom-Json

# [Define Constants - Initialise Variables]
$Script:uri_root = $config.uri_root
$Script:uri_commpoint = $config.uri_commpoint
$Script:uri_customSettings = $config.uri_customSettings
$Script:uri_components = $config.uri_components
$Script:max_api_calls_per_minute = $config.max_api_calls_per_minute
$Script:alert_settings_backup_dir = $config.alert_settings_backup_dir

# Initialise commpoints array
$Script:all_tcp_commpoints = @()

<#
    FUNCTIONS *******************************************************************************************************************
#>

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
    return $all_nested_commpoints
}

function Start-DelayForApiCall {
	# initialise last_api_call_datetime if not initialised already
	if ($last_api_call_datetime -eq $null) { $Script:last_api_call_datetime = Get-Date }

    $Local:seconds_since_last_api_call = ((Get-Date) - ($last_api_call_datetime)).TotalSeconds
    $Local:minimum_seconds_between_api_calls = 60 / $max_api_calls_per_minute
    if ($seconds_since_last_api_call -lt $minimum_seconds_between_api_calls) {
        $Local:seconds_to_wait = [int]($minimum_seconds_between_api_calls - $seconds_since_last_api_call)
		if ($seconds_to_wait -gt 0) { Write-Host -ForegroundColor DarkGray $(" --- Pausing $($Local:seconds_to_wait) second(s) to avoid excessive API calls to Rhapsody server..." ) }
    }
    While ($Local:seconds_since_last_api_call -lt $Local:minimum_seconds_between_api_calls) { $Local:seconds_since_last_api_call = ((Get-Date) - ($script:last_api_call_datetime)).TotalSeconds }
    $Script:last_api_call_datetime = Get-Date
}

function Write-ErrorCustom ($Local:error, $Local:message) {
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
			{ $Local:data.timePeriodAlerts[0].alerts | Where-Object { $_.alertName -eq "Long Idle Time" } | ForEach-Object { $_.parameters.enabled } } else { "" }), `
		$(if($Script:timePeriodCount -gt 0)
			{ $Local:data.timePeriodAlerts[0].alerts | Where-Object { $_.alertName -eq "Long Idle Time" } | ForEach-Object { "{0} {1}" -f $_.parameters.warning.value, $_.parameters.warning.unit } } else { "" }), `
		$(if($Script:timePeriodCount -gt 0)
			{ $Local:data.timePeriodAlerts[0].alerts | Where-Object { $_.alertName -eq "Long Idle Time" } | ForEach-Object { "{0} {1}" -f $_.parameters.alarm.value, $_.parameters.alarm.unit } } else { "" }), `
		$(if($Script:timePeriodCount -gt 1) { "Y" } else { "N" }), `
		$(if($Script:otherAlertsCount -gt 0)
			{ $Local:data.atAllOtherTimeAlerts | Where-Object { $_.alertName -eq "Long Idle Time" } | ForEach-Object { $_.parameters.enabled } } else { "" }), `
		$(if($Script:otherAlertsCount -gt 0)
			{ $Local:data.atAllOtherTimeAlerts | Where-Object { $_.alertName -eq "Long Idle Time" } | ForEach-Object { "{0} {1}" -f $_.parameters.warning.value, $_.parameters.warning.unit } } else { "" }), `
		$(if($Script:otherAlertsCount -gt 0)
			{ $Local:data.atAllOtherTimeAlerts | Where-Object { $_.alertName -eq "Long Idle Time" } | ForEach-Object { "{0} {1}" -f $_.parameters.alarm.value, $_.parameters.alarm.unit } } else { "" })  `
		| Out-File -Encoding utf8 -Append $Local:log_file_path
}

function Disable-IdleTimeAlerts ([ref]$time_period_alert_obj, [ref]$update_done_bool, $all_other_times_alerts) {
    $tpa = $time_period_alert_obj.Value
    for ($Local:i = 0; $i -lt $tpa.alerts.length; $i++) {
        if (($tpa.alerts[$i].alertMnemonic -eq 'COMMUNICATION_POINT_IDLE_TIME_EXCEEDS_THRESHOLD') `
                -And ($tpa.alerts[$i].enabled -eq $true)) {
            $tpa.alerts[$i].enabled = $false
            $update_done_bool.Value = $true
        }
    }
    $time_period_alert_obj.Value = $tpa
}

function Get-CommonDays ($Local:days1, $Local:days2) {
    $Local:common_week_days = @()
    for ($Local:i = 0; $i -lt $days1.length; $i++) {
        if ($days1[$i] -in $days2) {
            $common_week_days += $days1[$i]
        }
    }
    return $common_week_days
}

function Get-IdleAlertIsEnabled ($Local:time_period_alert) {
    for ($Local:i = 0; $i -lt $time_period_alert.alerts.length; $i++) {
        if (($time_period_alert.alerts[$i].alertMnemonic -eq 'COMMUNICATION_POINT_IDLE_TIME_EXCEEDS_THRESHOLD') `
                -And ($time_period_alert.alerts[$i].enabled -eq $true)) {
            return $true
        }
    }
    return $false
}

function Update-Alert ($Local:time_period_alert, $Local:selected_week_days, $update_done_bool, $all_other_times_alerts) {
    [System.Collections.ArrayList]$Local:updated_alerts = @()

    # check if all items in time_period_alert.daysOfWeek array are among those selected by the user
    $Local:all_time_period_days_are_selected = $true
    $time_period_alert.daysOfWeek | ForEach-Object {
        if ($selected_week_days -notcontains $_) { $all_time_period_days_are_selected = $false }
    }
    # if yes, then disable the alert
    if ($all_time_period_days_are_selected) {
        $time_period_alert.alerts = $all_other_times_alerts
        $updated_alerts += $time_period_alert
        $update_done_bool = $true
    } else {
        # if time period contains days NOT selected by user:
        #   1- Find common days between time_period_alert.daysOfWeek and selected_week_days
        $Local:common_days = @()
        $common_days += (Get-CommonDays $time_period_alert.daysOfWeek $selected_week_days)
        if ($common_days.Count -eq 0) { return $time_period_alert, $update_done_bool } # no common days found, skip to next time period

        #   2- Remove common days from the time_period_alert.daysOfWeek array
        $Local:tpa_days = $time_period_alert.daysOfWeek
        $time_period_alert.daysOfWeek = @()
        $time_period_alert.daysOfWeek += $tpa_days | Where-Object { $common_days -notcontains $_ }

        $updated_alerts += ($time_period_alert | ConvertTo-Json -Depth 15 | ConvertFrom-Json)

        #   3- Make a copy of time period alerts
        $Local:time_period_alert_copy = ($time_period_alert | ConvertTo-Json -Depth 15 | ConvertFrom-Json)

        #   4- add the removed weekdays to the copy of time period alerts
        $time_period_alert_copy.daysOfWeek = @()
        $time_period_alert_copy.daysOfWeek += $common_days

        #   5- Set alerts to be the same as atAllOtherTimeAlerts
        $time_period_alert_copy.alerts = $all_other_times_alerts
        $update_done_bool = $true

        $updated_alerts += $time_period_alert_copy
    }
    return $updated_alerts, $update_done_bool
}

function Get-BackupFiles {
    Write-Host " ┣ Restoring original Idle notification alerts settings..."
    Write-Host " ┣ Default directory to read original settings from currently set to:`n`n" -NoNewline
    Write-Host " $($alert_settings_backup_dir)`n" -ForegroundColor Yellow
    Write-Host " ┣ Do you want to change it? [y/N] " -NoNewline
    $Local:change_backup_dir = Read-Host
    if ($change_backup_dir -eq 'y') {
        Write-Host " ┣ Enter new directory path: " -NoNewline
        $alert_settings_backup_dir = Read-Host
    }
    if (-Not (Test-Path $alert_settings_backup_dir)) {
        Write-Host " ┗ ERROR: Directory '$($alert_settings_backup_dir)' does not exist. Exiting script...`n"
        EXIT
    }
    $local:backup_folders = Get-ChildItem $alert_settings_backup_dir -Directory | Where-Object { $_.Name -match "^\d+_\d+$" } | Sort-Object { $_.LastWriteTime } -Descending
    if ($backup_folders.Count -eq 0) {
        Write-Host " ┗ ERROR: No backup folders found in '$($alert_settings_backup_dir)' matching '###_###' format. Exiting script...`n"
        EXIT
    }
    $Local:backup_folder = $backup_folders | Select-Object -First 1
    $local:backup_files = (Get-ChildItem $backup_folder -Filter "*.json" | Where-Object { $_.Name -match "\d+_\S+.json$" })
    return $backup_files
}

function Restore-ToOriginalSetting {
    $Local:backup_files = Get-BackupFiles
    if ($backup_files.Count -eq 0) {
        Write-Host " ┗ ERROR: No backup files found in '$($backup_folder)' matching '###_*.json' format. Exiting script...`n"
    }

    $backup_files | ForEach-Object {
        $Local:cp_alerts_file = $_
        $Local:cp_id = "" #$cp_alerts_file.Name.Split('_')[0]
        $Local:cp_alert_settings = Get-Content -Encoding Utf8 $cp_alerts_file

        $Local:cp_name = ""
        $cp_alerts_file.Name -match "^(\d+)_(\S+).json$" | Out-Null
        if ($matches.Count -eq 3) {
            $cp_id = $matches[1]
            $cp_name = $matches[2]
        }

        $Local:cp_settings_uri = $uri_root + $uri_commpoint + "/" + $cp_id + $uri_customSettings

        Write-Host " ┣ Retrieving Idle alerts settings for commpoint " -NoNewline
        Write-Host $cp_name -NoNewline -BackgroundColor Black -ForegroundColor Red
        Write-Host " id " -NoNewline
        Write-Host $cp_id -BackgroundColor Black -ForegroundColor Red

        $Local:get_resp, $Local:csrf_token = Get-DataFromRhapsodyApi $cp_settings_uri

        Write-Host " ┣ Updating   Idle alerts settings for commpoint " -NoNewline -ForegroundColor Yellow
        Write-Host $cp_name -NoNewline -BackgroundColor Black -ForegroundColor Red
        Write-Host " id " -NoNewline -ForegroundColor Yellow
        Write-Host $cp_id -BackgroundColor Black -ForegroundColor Red

        $local:update_resp = Update-CommpointAlertSettings $session $cp_settings_uri $cp_alert_settings $csrf_token

        # TODO: Handle Errors
    }
}

function Update-CommpointAlertSettings ($session, $cp_settings_uri, $alerts, $csrf_token) {
	Start-DelayForApiCall
    $Local:update_alert_resp = Invoke-WebRequest -WebSession $session -Method PUT -Uri $cp_settings_uri -Body $alerts `
                                             -Headers @{ "Content-Type"="application/json"; "Accept"="application/json"; "X-CSRF-Token"=$csrf_token }

	return $update_alert_resp
}

function Get-DataFromRhapsodyApi ($uri) {
    if ($null -eq $cred) { $Script:cred = $(Get-Credential -credential $env:USERNAME) }     # Get credentials - prompt user the first time
    #if ($null -eq $cred) { $Script:cred = $(Get-Credential -credential "administrator") }     # Get credentials - prompt user the first time

    $Local:response = (Invoke-WebRequest -SessionVariable "Script:session" -Method GET -Uri ($uri_root + $uri_components) -Credential $cred -Headers @{"Accept"="application/json"})

    # get csrf token from the last response
	$Local:csrf_token = $response.Headers["X-CSRF-Token"]
	if ($response.Headers["X-CSRF-Token"] -is [array]) { $csrf_token = $csrf_token[0] }

    return $response, $csrf_token
}

<#
    MAIN SECTION *************************************************************************************************************************
#>

Clear-Host

# [Input - Script Action] Get user to select an action: either Disable Idle notification alerts to Revert to original settings
Write-Host " ┏ Select an action: "
Write-Host " ┣ 1. Disable Idle notification alerts (Set notification settings to be the same as after-hours settings)"
Write-Host " ┣ 2. Restore original alerts settings"
Write-Host " ┣ 3. Backup currently configured alert settings"
Write-Host " ┗ 4. Exit"
Write-Host " ----------------------------------------"
Write-Host " > " -NoNewline

$Local:script_action = Read-Host

# [ Branch by user input]
if (('1', '2', '3') -notcontains $script_action) {
    Write-Host " ┗ Exiting script...`n"
    EXIT
} elseif ($script_action -eq 2) {
    Restore-ToOriginalSetting
    EXIT
}

# [ Branch - Disable Idle Notification Alerts

Write-Host " ┣ Retriving a list of all components from Rhapsody via a GET API call..."

# [ API Call ] Get call to retrieve all commponents from Rhapsody server
$Local:resp_obj, $Local:csrf_token = Get-DataFromRhapsodyApi ($uri_root + $uri_components)
$Local:resp = ConvertFrom-Json $resp_obj

Write-Host " ┗ Finished retrieving components."

# [Input - Rhapsody Locker] If more than one locker exists, get user to pick one
if ($resp.data.childFolders.Count -gt 1) {
    Write-Host -ForegroundColor Green "`nPlease select a locker or all lockers by entering the index:"
    for ($Local:i = 0; $i -lt $resp.data.childFolders.length; $i++) {  Write-Host -ForegroundColor Gray "  [$($i)] $($resp.data.childFolders[$i].name)" }
    #$resp.data.childFolders | ForEach-Object { $Local:i = 0; Write-Host -ForegroundColor Gray "  [$($i)] $($_.name)"; $i++ }
    Write-Host -ForegroundColor Gray "  [$($resp.data.childFolders.Count)] ALL LOCKERS"
    Write-Host -ForegroundColor Green -NoNewline "> "
    $Script:selected_locker_index = Read-Host
    if ($selected_locker_index -eq "") { $Script:selected_locker_index = 0 }
    if ($selected_locker_index -notmatch "^[\d]+$" -or [int]$Script:selected_locker_index -gt ($resp.data.childFolders.Count)) { Write-Host "INVALID value entered. Exiting the script...`n"; exit }
    $Script:lockers = @()
    if ([int]$Script:selected_locker_index -eq $resp.data.childFolders.Count) { $resp.data.childFolders | ForEach-Object { $lockers += $_.name } }   # All locker selected
    else { $lockers += $resp.data.childFolders[$Script:selected_locker_index].name } # a single locker was selected
} else {
    $Script:lockers += $resp.data.childFolders[0].name
}


# [Log] Set up log folder using current datetime timestamp
$Local:timestamp = Get-Date -Format 'yyyyMMdd_HHmmss'
$Script:log_folder_path = Join-Path (Get-Location) "Logs/$($timestamp)"
if (-Not (Test-Path $log_folder_path)) { New-Item -ItemType directory -Path $log_folder_path | Out-Null }

$Script:backup_folder_path = Join-path $alert_settings_backup_dir $timestamp
if (-Not (Test-Path $backup_folder_path)) { New-Item -ItemType directory -Path $backup_folder_path | Out-Null }

$Script:log_alert_settings_folder_path = Join-Path $log_folder_path "alert_settings"
if (-Not (Test-Path $log_alert_settings_folder_path)) { New-Item -ItemType directory -Path $log_alert_settings_folder_path | Out-Null }

$Script:log_alert_settings_updated_folder_path = Join-Path $log_folder_path "alert_settings_updated"
if (-Not (Test-Path $log_alert_settings_updated_folder_path)) { New-Item -ItemType directory -Path $log_alert_settings_updated_folder_path | Out-Null }

if ($script_action -eq 1) {
    # [Input] Prompt user to select a subset of weekdays. This list will be used to update all eligible commpoints alert settings.
    Write-Host "Select week days on which notifications will be DISABLED:`n  [1] Monday`n  [2] Tuesday`n  [3] Wednesday`n  [4] Thursday`n  [5] Friday`n  [6] Saturday`n  [7] Sunday`n"
    Write-Host -NoNewline -ForegroundColor Green "Enter selected days indices. e.g. for Monday, Tuesday & Friday only; enter: 125> "
    $Script:selected_week_days_indices = Read-Host

    $Script:week_days = [ordered]@{
        "1" = "MONDAY"; "2" = "TUESDAY"; "3" = "WEDNESDAY"; "4" = "THURSDAY"; "5" = "FRIDAY"; "6" = "SATURDAY"; "7" = "SUNDAY"
    }

    # [Input] User to select days of week they desire to enable alert notifications on
    $Local:selected_week_days = @()
    $week_days.keys | ForEach-Object { if ($Script:selected_week_days_indices.Contains($_)) { $selected_week_days += $week_days[$_] } }
    if ($selected_week_days.Count -eq 0) { Write-Host "At least one day should be selected. Exiting the script...`n"; exit }
    else {
        Write-Host "--------------------------------------------------------------------------"
        Write-Host "`nDisabling Rhapsody notifications  on following days in selected locker(s):"
        #Write-Host -NoNewline -ForegroundColor Red $lockerName.ToUpper()
        #Write-Host -NoNewline " on following days:`n   "
        $Script:selected_week_days | ForEach-Object {
            Write-Host -NoNewline "  "
            Write-Host -NoNewline -BackgroundColor Blue -ForegroundColor Yellow " $($_) "
        }
        Write-Host "`n`n--------------------------------------------------------------------------"
    }

    # [Input] User to confirm selected options
    $Script:confirm = (Read-Host "Confirm [y/n]").ToLower()
    if ($Script:confirm -ne "y" -and $Script:confirm -ne "n") { Write-Host "INVALID value entered. Exiting the script...`n"; exit }

    # [Log] Initialise new csv file to log state of alerts for each
    $Script:commpoint_settings_before_log_file_path = Join-Path $Script:log_folder_path "commpoints_alert_settings.before.csv"
    $Script:commpoint_settings_after_log_file_path = Join-Path $Script:log_folder_path "commpoints_alert_settings.after.csv"
    $Script:commpoint_settings_changes_log_file_path = Join-Path $Script:log_folder_path "commpoints_alert_settings.changes.csv"
    #$Script:commpoint_settings_multiple_timeperiods_log_file_path = Join-Path $Script:log_folder_path "commpoints_alert_settings.multiples.csv"
    $Script:commpoint_settings_no_timeperiods_log_file_path = Join-Path $Script:log_folder_path "commpoints_alert_settings.notimeperiods.csv"

    $Script:commpoint_settings_changes_log_file_header = ("Commpoint Id,Commpoint Name,Days of Week (1st Time_Period),Long_Idle Enabled (1st Time_Period),Long_Idle Warning (1st Time_Period),Long_Idle Alarm (1st Time_Period)," +
    "Has more than one time period,Long_Idle Enabled (Other),Long_Idle Warning (Other),Long_Idle Alarm (Other)")

    $Script:commpoint_settings_changes_log_file_header | Out-File -Encoding utf8 $commpoint_settings_before_log_file_path
    $Script:commpoint_settings_changes_log_file_header | Out-File -Encoding utf8 $commpoint_settings_after_log_file_path
    $Script:commpoint_settings_changes_log_file_header | Out-File -Encoding utf8 $commpoint_settings_changes_log_file_path
    #$Script:commpoint_settings_changes_log_file_header | Out-File -Encoding utf8 $commpoint_settings_multiple_timeperiods_log_file_path
    $Script:commpoint_settings_changes_log_file_header | Out-File -Encoding utf8 $commpoint_settings_no_timeperiods_log_file_path
}

$lockers | ForEach-Object {
    $Local:lockerName = $_

    # [Filter] Find all eligible Communication Points in the selected locker. Eligible meaning commpoint name ending in _IO or _OI which includes TCP servers adn clients and  excludes dynamic routers, email senders, database endpoints etc.
    $Script:all_tcp_commpoints = Get-ChildFolderContent $($resp.data.childFolders | Where-Object { $_.name -eq $lockerName })
    Write-Host -NoNewline  "`nNumber of input/output components i.e. name ending in _IO/_OI found in the locker" $lockerName.ToUpper()": "
    Write-Host -ForegroundColor Yellow ($all_tcp_commpoints.Count)`n

    # [Log] name of commpoints into a single file
    $Script:all_tcp_commpoints | ForEach-Object { ("{0},{1}" -f $_.name, $_.id) | Out-File -Encoding utf8 -Append (Join-Path $Script:log_folder_path "List_of_Commpoints.csv") }

    # Loop through commpoints and check days of weeks they are enabled
    Write-Host "`nChecking alert settings for each commpoint and updating those with different days of week enabled"
    for ($Local:i = 0; $i -lt $all_tcp_commpoints.Count; $i++) {
        # [Prep] Initialise variables
        $Local:compId = $all_tcp_commpoints[$i].id
        $Local:cp_settings_uri = $uri_root + $uri_commpoint + "/" + $compId + $uri_customSettings
        # [Prep] Display commpoint name
        Write-host ("`n[{0}/{1}] {2}_{3}" -f ($i + 1).ToString().PadLeft(2, '0'), $all_tcp_commpoints.Count, $all_tcp_commpoints[$i].id, $all_tcp_commpoints[$i].name)
        # [Prep] Set up logging
        $Local:log_file_path_noext = Join-Path $log_alert_settings_folder_path ("{0}_{1}" -f $all_tcp_commpoints[$i].id, $all_tcp_commpoints[$i].name)
        $Local:log_file_path = "$($log_file_path_noext).json"

        #$Local:backup_file_path = "$(Join-Path $backup_folder_path ("{0}_{1}" -f $all_tcp_commpoints[$i].id, $all_tcp_commpoints[$i].name)).json"

        try {
            Write-Host -ForegroundColor DarkGray " ┣ Retreiving alert settings data from Rhapsody API..."
            if ($cred -eq $null) { $cred = $(Get-Credential -credential $env:USERNAME) }     # Get credentials - prompt user the first time
            #if ($cred -eq $null) { $cred = $(Get-Credential -credential "administrator") }     # Get credentials - prompt user the first time
            # [Api call - GET] Make a GET API call to Rhapsody and retrive commpoint alert settings
            $Script:get_alerts_api_resp = Invoke-WebRequest -WebSession $session -Method GET -Uri $cp_settings_uri -Credential $cred -Headers @{"Accept"="application/json"}
        }
        catch  {
                Write-ErrorCustom $_ ("Something went wrong when accessing Rhapsody API via the following URI: `n" + $cp_settings_uri)
                if ($_.Exception -is [System.Net.WebException]) {
                    Write-Host -ForegroundColor Red "`n Too many API calls to Rhapsody server. Retrying last commpoint in 10 seconds..."
                    Start-Sleep -Seconds 10
                    $i--
                    continue
                } else {
                    exit
                }
        }
        try {
            # [Data Consumption] Convert retrieved JSON data into an object
            Write-Host -ForegroundColor DarkGray " ┣ Consuming data and logging..."
            $Local:alerts_api_data = (ConvertFrom-Json $get_alerts_api_resp).data
            $Local:updated_alerts_api_data = $alerts_api_data

            # [Log] Write CURRENT alert settings into a json file
            $Local:log_file_content = ConvertTo-Json -Depth 15 $alerts_api_data
            $Local:log_file_content | Out-File -Encoding utf8 $log_file_path

            # [Log] Add alert settings data for commpoint into a single csv file if updating commpoints
		    if ($script_action -eq 1) { LogToCsvLogFile $commpoint_settings_before_log_file_path $alerts_api_data }
            # otherwise, copy the log file into the backup directory and skip this iteration
            elseif ($script_action -eq 3) {
                Copy-Item -Path $log_file_path -Destination $backup_folder_path
                continue
            }
        }
        catch {
            Write-ErrorCustom $_ "Something went wrong when transforming JSON data into an object and logging into files. Error Message:"
            exit
        }

        $Local:update_done = $false
        try {
            [System.Collections.ArrayList]$Local:updated_time_period_alerts = @()

            $Local:all_other_times_alerts = $updated_alerts_api_data.atAllOtherTimeAlerts
            $updated_alerts_api_data.timePeriodAlerts | ForEach-Object {
                $Local:time_period_alert = $_

                $Local:updated_time_period_alert, $update_done = Update-Alert $time_period_alert $selected_week_days $update_done $all_other_times_alerts
                $updated_time_period_alert = $updated_time_period_alert | ConvertTo-Json -Depth 15 | ConvertFrom-Json

                $updated_time_period_alerts += ($updated_time_period_alert | convertto-json -depth 15 | convertfrom-json)
            }

            # [Action - Update Alert Settings] if selected days of week by user is different to commpoint alert settings
            if ($updated_alerts_api_data.timePeriodAlerts.Count -eq 0) {
                Write-Host -ForegroundColor DarkGray " ┗ No Time Period has been configured for this commpoint."

			    # [Log]
			    LogToCsvLogFile $commpoint_settings_no_timeperiods_log_file_path $Script:alerts_api_data
		    } elseif ($update_done) {
                $updated_alerts_api_data.timePeriodAlerts = $updated_time_period_alerts

                # [Log] Write UPDATED alert settings into a json file
                $Local:log_file_path_updated_noext = Join-Path $log_alert_settings_updated_folder_path ("{0}_{1}" -f $all_tcp_commpoints[$i].id, $all_tcp_commpoints[$i].name)
                $updated_log_file_path = $log_file_path_updated_noext + ".json"
                $updated_alerts = ConvertTo-Json -Depth 15 $updated_alerts_api_data
                $updated_alerts | Out-File -Encoding utf8 $updated_log_file_path
                #Write-Host "Payload: $($updated_alerts)"

			    Write-Host -ForegroundColor DarkGray -NoNewline " ┗ "
                Write-Host -ForegroundColor Yellow "Updating alert settings for commpoint by making a PUT API call to Rhapsody server..."

                # [API call - Update] update commpoint alert setting by making an api call to Rhapsody server
                $Local:update_api_call_resp = Update-CommpointAlertSettings $session $cp_settings_uri $updated_alerts $csrf_token

                if ($update_api_call_resp.error -ne $null) { Write-Host "[Error]: " $update_api_call_resp.error }

			    #[Log]
			    LogToCsvLogFile $Script:commpoint_settings_after_log_file_path $Script:updated_alerts_api_data
			    LogToCsvLogFile $Script:commpoint_settings_changes_log_file_path $Script:updated_alerts_api_data
            } else {
                Write-Host -ForegroundColor DarkGray " ┗ No need to make any updates to the current setting."

			    # [Log]
			    LogToCsvLogFile $Script:commpoint_settings_after_log_file_path $Script:alerts_api_data
            }
            if ($update_done -And (Test-Path $log_file_path)) { Copy-Item $log_file_path -Destination $backup_folder_path }
        }
        catch {
            Write-ErrorCustom $_ "Something went wrong during API call to Rhapsody API to update alert settings."
            if ($_.Exception -is [System.Net.WebException]) {
			    $Local:seconds_to_wait = 10
                Write-Host -ForegroundColor Red "`n Too many API calls to Rhapsody server. Retrying last commpoint in ${$Local:seconds_to_wait} seconds..."
                Start-Sleep -Seconds $Local:seconds_to_wait
                $i--
                continue
            } else {
                exit
            }
        }
    }

}

# SIG # Begin signature block
# MIIFzgYJKoZIhvcNAQcCoIIFvzCCBbsCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCB8DSlTBpI5SF5d
# KDKLQ0c+8YAZukSL76Bd39Vha9DzEKCCAzwwggM4MIICIKADAgECAhBWTii4F3D0
# k0f83rEO+j6ZMA0GCSqGSIb3DQEBCwUAMCIxIDAeBgNVBAMMF21laGRpLnRlaHJh
# bmlAbmgub3JnLmF1MB4XDTIyMDkwODA1NDU1MVoXDTI1MDkwODA1NTU1MVowIjEg
# MB4GA1UEAwwXbWVoZGkudGVocmFuaUBuaC5vcmcuYXUwggEiMA0GCSqGSIb3DQEB
# AQUAA4IBDwAwggEKAoIBAQC0OLKII9Tmbl8dz+usqHrU6bGJrZZQJKIFFx8U1gXe
# D3woGUm2mB0Fa5xbr3qWudHaNbsS7OmSp0lEKgiYt2RpOPCZbE4HOpDhxNlVNjqu
# cCqCIQpVUmgilVI1mbKaMXz6K+dHTxxyoyJCaQ01H31Ti7oykRZoyZcWv07H2+T4
# O+oBD4blXxUXNVusNL5hbOxcLSbwK8XWZpghRasoxTH7MHODf5HfAUTj6TNpLdjs
# LDXdGSr0MyHaL+rmERiLyuixOY3GnEEvIsOS/pD9f17vh8hEkhOFD4mm61MQqe4r
# hhNuYOv+IeOibtH+GGI5DOSsRcQVrfHS8fjVdpiIONzFAgMBAAGjajBoMA4GA1Ud
# DwEB/wQEAwIHgDATBgNVHSUEDDAKBggrBgEFBQcDAzAiBgNVHREEGzAZghdtZWhk
# aS50ZWhyYW5pQG5oLm9yZy5hdTAdBgNVHQ4EFgQUe4Mex262Ahy7LgSh3SiL0Agq
# iFkwDQYJKoZIhvcNAQELBQADggEBAAjZCFtUewiFT2k29VaP46sxzoF5q2tVV6zg
# T9bn9vHz/wBNe6ZWt5q8XjG7ifg1sbA0L2cpKndNvacgjgmlSWmVpR3iMud41G4M
# ZUvjyLbZnlAMbmzqwYVFjobYJgaccIJHC30o5Yvq4bn5uAVRP0Ppk5LpSnumUTBV
# Faa05ltkmxFL+NfwMTZF8kfrMuVVRpOS2UtK47kU9vGLxmJs24MuIu3vB1Y8oowC
# 9LyldJC+5M7Tz/vBqL3ZlLCCBFvm2UvNgWj+wJ6oiNdAnwUvUxjAt6zKCkX2SZzT
# 5R6YLbe660z0iHMGHMBBaoydGKEBWb5DajRs9/Rs7m0qReE+8s0xggHoMIIB5AIB
# ATA2MCIxIDAeBgNVBAMMF21laGRpLnRlaHJhbmlAbmgub3JnLmF1AhBWTii4F3D0
# k0f83rEO+j6ZMA0GCWCGSAFlAwQCAQUAoIGEMBgGCisGAQQBgjcCAQwxCjAIoAKA
# AKECgAAwGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEO
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIPyygQAia+vnhkN2L20TFLLy
# UiOmyJ8Vje4Z2e0HfILDMA0GCSqGSIb3DQEBAQUABIIBAJdkFXhCnUzQx6xiHOfP
# lAHG8txOYjC44QZeBcE4Tdjm7M5xIfwwXkq9bG/Pu5L6vJ/eFQ/ESRXMkOPJYiQM
# iKPSlIkWJnj2hCxSVrRWgZthfWyTwZVNieYYZzSsbZHIKT90gCjjumlpicZMUlSV
# 51ThNTb8Sn0m9QA7YlXjLp6+gwrWIrIwkIc8L/52m/meXitnxI/ufMpInHOxZzN/
# GGv3y7fPv5E4inu/0+IpxLNio7xtY0/ZLwSeyiY5wgIDcZyK2b8QZsJiKUWl480w
# CGz+K7I3H8yREKxNZp/nR4cC5BQBCnScugY8yRQanUVcBl1qn4biDhihKd2k100h
# jpQ=
# SIG # End signature block
