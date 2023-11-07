<#
	Create Date:	2022-01-25
	Author:			Mehdi N Tehrani <mehdi.tehrani@nh.org.au; m.nadji.t@gmail.com>
	Purpose:		Monitor Rhapsody commpoints and start those stopped in error.
	Overview:		Retreive a list of all components i.e. COMMUNICATION POINTS and ROUTES across all Lockers, using a GET HTTP call to Rhapsody (Northern Health Integration Engine) server API.
					Find those which have stopped in error i.e. Status="ERROR"
					Try starting the component - commpoint or route, which are stopped in error using a PUT API call to the Rhapsody API.
					User password is retrieved from a text file containing user the encrypted secure string format of the password.
	Usage:			In case of unattended use i.e. credentials provided to the script, there will be no user interfaces and the script can be called using a scheduled task.
#>


# [Define Constants - Initialise Variables]
$config = Get-Content '.\Configs\start_stopped_components.json' | Out-String | ConvertFrom-Json

$Script:uri_root = 							$config.uri_root
$Script:uri_commpoint = 					$config.uri_commpoint
$Script:uri_route = 						$config.uri_route
$Script:uri_state = 						$config.uri_state
$Script:uri_components = 					$config.uri_components
$Script:pass_file_path = 					$config.pass_file_path
$Script:max_api_calls_per_minute = 			$config.max_api_calls_per_minute
$Script:username = 							$config.username
$Script:log_folder_folder_name = 			$config.log_folder_folder_name
$Script:log_file_name_extension = 			$config.log_file_name_extension
$Script:log_error_file_name_extension = 	$config.log_error_file_name_extension
$Script:edis_cp_id =  					    $config.edis_cp_id
$Script:edis_restart_flag_path =  		    $config.edis_restart_flag_path
$Script:in_queue_threshold = 				$config.in_queue_threshold
$Script:out_queue_threshold = 				$config.out_queue_threshold

# [Define Functions]
function Get-ComponentsStoppedInError ($folder) {
    $Script:all_nested_commpoints = @()
    if ($folder.childComponents.Count -gt 0) {
        foreach ($childComponent in $folder.childComponents) {
            # Add components to the list of ALL components if the type is COMMUNICATION_POINT
            if ($childComponent.state -eq "ERROR") {
                $Script:all_nested_commpoints = $Script:all_nested_commpoints + $childComponent 
            }
        }
    }

    # Check all nested childFolders recursively
    if ($folder.childFolders.Count -gt 0) { 
        foreach ($childFolder in $folder.childFolders) {            
            $Script:all_nested_commpoints = $Script:all_nested_commpoints + (Get-ComponentsStoppedInError $childFolder)
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
        Write-Host "Line:" $Local:error.InvocationInfo.ScriptLineNumber
        Write-Host $Local:error.Exception`n
		
		# Log to file
		"-----------------" 				| Out-File -Append -Encoding Utf8 $Script:log_error_file_path
		Get-Date 							| Out-File -Append -Encoding Utf8 $Script:log_error_file_path
		$Local:message						| Out-File -Append -Encoding Utf8 $Script:log_error_file_path
		($Local:error.Exception + "`n") 	| Out-File -Append -Encoding Utf8 $Script:log_error_file_path
}

<# 
-----------------------------
[SCRIPT - START]
-----------------------------
#>

# [Log] Set up log folder using current datetime timestamp
if ($args.Count -gt 0 -AND $args[0] -ne "") { 
	$Script:log_stopped_components_folder_path = $args[0] 
} else {
	$Script:log_folder_path = Join-Path (Get-Location) ("Logs/" + (Get-Date -Format "yyyyMMdd_HHmmss"))
	if (-Not (Test-Path $Script:log_folder_path)) { New-Item -ItemType directory -Path $log_folder_path | Out-Null }
	$Script:log_stopped_components_folder_path = Join-Path $Script:log_folder_path $log_folder_folder_name
} 
if (-Not (Test-Path $Script:log_stopped_components_folder_path)) { New-Item -ItemType directory -Path $Script:log_stopped_components_folder_path | Out-Null }
$Script:log_stopped_components_file_path = 	Join-Path $log_stopped_components_folder_path $log_file_name_extension
$Script:log_error_file_path = 				Join-Path $log_stopped_components_folder_path $log_error_file_name_extension
# [Log] Create log file in CSV format if does not exist already
if (-Not (Test-Path $Script:log_stopped_components_file_path)) { "date_time,id,component_name,component_type,URI,response_status_code" | Out-File -Encoding Utf8 $log_stopped_components_file_path }

# Initialise last api call datetime to now
Write-Host " ┣ Retriving a list of all components from Rhapsody via a GET API call..."
$script:last_api_call_datetime = Get-Date

# [Authentication] Get user credentials - if available to the script already use it, otherwise prompt the user for password
try {
	$Local:pass = gc $Script:pass_file_path | ConvertTo-SecureString
	$Script:cred = New-Object System.Management.Automation.PSCredential ($username, $pass)
} catch {
	Display-Error $_ "Something went wrong when retrieving credentials for user: " + $username
}

# [API Call] Get a list of all Rhapsody components via Rhapsody API by a GET HTTP call
$Script:resp = Invoke-WebRequest -SessionVariable "session" -Method GET -Uri ($uri_root + $uri_components) -Credential $cred -Headers @{"Accept"="application/json"} -UseBasicParsing
$Script:resp_obj = ConvertFrom-Json $resp
Write-Host " ┗ Finished retriving components."

# [Filter] Find all eligible COMPONENTS including Communication Points and Routes which have stopped in ERROR across all lockers.
$Script:components_stopped_in_error = Get-ComponentsStoppedInError $($resp_obj.data.childFolders) # | Where { $_.name -eq $Script:lockerName })
Write-Host -NoNewline  "`nNumber of components STOPPED IN ERROR found: " # in the locker" $Script:lockerName.ToUpper()": "
Write-Host -ForegroundColor Yellow ($Script:components_stopped_in_error.Count)`n

# For each component stopped in error, make an API call to start it again and log the details and response result i.e. http response status code
$components_stopped_in_error | % {
	$Local:comp_id = $_.id
	$Local:comp_name = $_.name
	$Local:comp_type = $_.type
	$Local:component_uri = ""
	$Local:post_api_body = "START"
	
	if ($comp_type -eq "COMMUNICATION_POINT")
		{ $component_uri = $uri_root + $uri_commpoint + "/" + $comp_id + $uri_state }
	elseif ($Local:comp_type -eq "ROUTE") 
		{ $component_uri = $uri_root + $uri_route + "/" + $comp_id + $uri_state }

	# [API Call] For each stopped component in error, try starting the component
	#if ($Script:cred -eq $null) { $Script:cred = $(Get-Credential -credential $Script:username) }     # Get credentials - prompt user if no credentials are available
	Start-DelayForApiCall
	
	try {
		$Local:start_resp = Invoke-WebRequest -WebSession $session -Method PUT -Uri $component_uri -Body $post_api_body `
															 -Headers @{ "Content-Type"="text/plain"; "X-CSRF-Token"=$resp.Headers["X-CSRF-Token"] } -UseBasicParsing
	} catch {
		Display-Error $_ ("Something went wrong when calling Rhapsody API`nLog File Path: " + $log_stopped_components_file_path)
	}
	
	try {
		# [Log] If any components are stopped in error, log its details into the log file. If the response was not successful, add status code of the response to the log 
		$Local:resp_status_code = $start_resp.StatusCode
		("{0},{1},{2},{3},{4},{5}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"),$comp_id, $comp_name, $comp_type, $component_uri, $start_resp.StatusCode) `
			| Out-File -Append -Encoding Utf8 $log_stopped_components_file_path
	} catch {
		Display-Error $_ ("Something went wrong when writing to the log file after calling Rhapsody API`nLog File Path: " + $log_stopped_components_file_path)
	}
}