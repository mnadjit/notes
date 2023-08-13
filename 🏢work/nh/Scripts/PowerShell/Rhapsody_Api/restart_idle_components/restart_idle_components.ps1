<#
	Create Date:	2022-12-12
	Author:			Mehdi N Tehrani <mehdi.tehrani@nh.org.au; m.nadji.t@gmail.com>
	Purpose:		Monitor Rhapsody commpoints and restart those idle, or with queued messages.
	Overview:		For each interface listed in the config file, check if 
	Usage:		    Unattended - designed to be run by a scheduled task
#>

# [Define Constants - Initialise Variables]
$config = Get-Content '.\restart_idle_components.config.json' | Out-String | ConvertFrom-Json


$Script:edis_restart_flag_path = $config.edis_restart_flag_path
$Script:interfaces = $config.interfaces
$Script:rhapsody_api_url = $config.rhapsody_api_url
$Script:log_file_path = $config.log_file_path
$Script:error_log_file_path = $config.error_log_file_path
$Script:csrf_token = ''

$Local:username = $config.username
$Local:pw_file_path = $config.pw_file_path
#$Local:pw = gc $Script:pw_file_path | ConvertTo-SecureString
#$Script:cred = New-Object System.Management.Automation.PSCredential ($username, $pw)
$Script:cred = Get-Credential -UserName 'tehranm'

function Get-RhapsodyCommPoint ($cp_id) {
    $local:component_uri = $rhapsody_api_url + $cp_id
    $local:cp_resp = @{}
    try {
        if ($session -eq $null) {
            $cp_resp = Invoke-WebRequest -SessionVariable "Script:session" -Method GET -Uri $component_uri -Credential $cred -Headers @{ "Accept"="application/json" } -UseBasicParsing
        } else {
            $cp_resp = Invoke-WebRequest -WebSession $session -Method GET -Uri $component_uri -Headers @{ "Accept"="application/json" } -UseBasicParsing
        }
        if ($cp_resp.StatusCode -ne '200') { Handle-Error $cp_id "Rhapsody API call via url [GET $($component_uri)] expected status code was 200 but returned the following status code: $($cp_resp.StatusCode)" ''; return $null }
        if ($cp_resp.Content -eq $null) { Handle-Error $cp_id "Rhapsody API call via url [GET $($component_uri)] failed to return the component" ''; return $null }
    } catch {
        Handle-Error $cp_id "Something went wrong when calling Rhapsody API to get a commpoint.`nEndpoint: GET $($component_uri)" $_
        return $null
    }
    $local:cp = ($cp_resp.Content | ConvertFrom-Json).data
    if ($csrf_token -eq '') { $Script:csrf_token = $cp_resp.Headers["X-CSRF-Token"] }
    return $cp
}

function Restart-RhapsodyCommPoint ($cp_id) {
    $local:component_uri = $rhapsody_api_url + $cp_id + '/state'
    try {
		$Local:restart_resp = Invoke-WebRequest -WebSession $session -Method PUT -Uri $component_uri -Body "RESTART" `
												-Headers @{ "Content-Type"="text/plain"; "X-CSRF-Token"=$csrf_token } -UseBasicParsing
        if ($restart_resp.StatusCode -ne '204') { Handle-Error $cp_id "Rhapsody API call via url [PUT $($component_uri)] expected status code was 204 but returned the following status code: $($restart_resp.StatusCode)" '' }
	} catch {
		Handle-Error $cp_id "Something went wrong when calling Rhapsody API to restart a commpoint.`nEndpoint: PUT $($component_uri)" $_
	}
}

function Handle-Error ($cp_id, $error_msg, $error_excp) {
    $local:ex = ""
    if ($error_excp -ne '') { $ex = $error_excp.Exception }

    ECHO '----------------------'           | Out-File -Append -Encoding Utf8 $error_log_file_path
    Get-Date -Format "yyyy-MM-dd HH:mm:ss"  | Out-File -Append -Encoding Utf8 $error_log_file_path
    $error_msg                              | Out-File -Append -Encoding Utf8 $error_log_file_path
    $ex                                     | Out-File -Append -Encoding Utf8 $error_log_file_path
}

function Log-Restart ($cp, $error_msg) {
    ECHO '----------------------'           | Out-File -Append -Encoding Utf8 $log_file_path
    Get-Date -Format "yyyy-MM-dd HH:mm:ss"  | Out-File -Append -Encoding Utf8 $log_file_path
    $error_msg                              | Out-File -Append -Encoding Utf8 $log_file_path
    $cp | Select-Object -Property id,name,folderPath,mode,state,commPointType,inQueueSize,inputIdleTime,outQueueSize,outputIdleTime,uptime  | ConvertTo-Json -Depth 2 | Out-File -Append -Encoding Utf8 $log_file_path
}

function get_minutes ($time_str){
    $local:hr = 0;
    $local:min = 0;
    
    $Matches = $null
    $time_str -match 'PT((?<hour>\d{1,2})H)*((?<minute>\d{1,2})M)*' | Out-Null
    if ($Matches.hour -ne $null) { $hr = [int]$Matches.hour }
    if ($Matches.minute -ne $null) { $min = [int]$Matches.minute }

    return (($hr * 60) + $min)
}

# For each running commpoint, if been idle or has messages queued over the threshold, restart it
$interfaces | %  {
    $local:name = $_.name
    $local:id = $_.id
    $local:in_queue_threshold = $_.in_queue_threshold
    $local:out_queue_threshold = $_.out_queue_threshold
    $local:idle_threshold_mins = $_.idle_threshold_mins

    $local:cp = Get-RhapsodyCommPoint $_.id

    if ($cp -eq $null) { Handle-Error $id "Rhapsody component [$($name)] with id of [$($id)] failed to be retrieved" ''; continue }

    $local:cp_idle_mins = get_minutes $cp.inputIdleTime

    if (($cp.state.ToLower() -eq "running") -And (($cp.inQueueSize -gt $_.in_queue_threshold) -Or ($cp.outQueueSize -gt $_.out_queue_threshold) -Or ($cp_idle_mins -ge $idle_threshold_mins))) { 
        Restart-RhapsodyCommPoint $id
        Log-Restart $cp "Commpoint was restarted."
        # In case it's the EDIS inbound interface, it requires the bouncer gateway service to be restarted as well. Put the flag in the folder where it triggers a scheduled task on EDIS server to restart the service
        if ($id -eq '1310') { ECHO "" > $edis_restart_flag_path }
    }
}