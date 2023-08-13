$Script:input_folder_path = "C:\MyFiles\Scripts\PowerShell\Toggle-Rhapsody-Idle-Notifications\Logs\20220106_143211_complete_nochange\alert_settings"
$Script:reports_folder = Join-Path $(Get-Location) "Reports"
$Script:out_log_file_path = Join-Path $Script:reports_folder "alert_settings_report.csv"

function Analyse_Alert ($Local:alert) {
    $Local:enabled = $Local:alert.enabled
    $Local:severity = $Local:alert.parameters.severity
    $Local:warning = if ($Local:alert.parameters.warning -ne $null) { "$($Local:alert.parameters.warning.value) $($Local:alert.parameters.warning.unit)" } else { "" }
    $Local:alarm = if ($Local:alert.parameters.alarm -ne $null) { "$($Local:alert.parameters.alarm.value) $($Local:alert.parameters.alarm.unit)" } else { "" }

    $Local:log_string = "{0},{1},{2},{3},{4}" -f $Local:alert.alertName, $Local:enabled, $Local:severity, $Local:warning, $Local:alarm
    return $Local:log_string
}

if (-Not (Test-Path $Script:reports_folder)) { New-Item -ItemType directory -Path $Script:reports_folder | Out-Null }

$Script:log_file_csv_header = "CP Id & Name,Alert Name,Enabled?,Severity,Warning,Alarm,Time Period Type,DaysOfWeek,From,To"
$Script:log_file_csv_header | Out-File -Encoding utf8 $Script:out_log_file_path

Get-ChildItem $Script:input_folder_path | % {
    $Local:file_name = $_.Name
    # [Read File] Get File Content and convert JSON to object
    
    $Local:file_content = Get-Content -Raw (Join-Path $Script:input_folder_path $Local:file_name)
    $Local:file_content_obj = ConvertFrom-Json $Local:file_content
        
    $Local:file_content_obj.timePeriodAlerts | % {
        $Local:cp_id_name = $Local:file_name -replace ".old.json", ""
        
        $Local:alert_time_period_type = "Time Period"
        $Local:alert_DOW = $_.daysOfWeek -join ";"
        $Local:alert_from = "$($_.startTime.hourOfDay):$($_.startTime.minuteOfHour)"
        $Local:alert_to = "$($_.endTime.hourOfDay):$($_.endTime.minuteOfHour)"

        $_.alerts | % {
            $Local:alert_Info = Analyse_Alert $_

            $Local:out_line = "{0},{1},{2},{3},{4},{5}" -f $Local:cp_id_name, $Local:alert_Info, $Local:alert_time_period_type, $Local:alert_DOW, $Local:alert_from, $Local:alert_to

            $Local:out_line | Out-File -Append $Script:out_log_file_path
        }
            
    }

    $Local:file_content_obj.atAllOtherTimeAlerts | % {
        $Local:cp_id_name = $Local:file_name -replace ".old.json", ""
        
        $Local:alert_time_period_type = "Other"
        
        $_.alerts | % {
            $Local:alert_Info = Analyse_Alert $_

            $Local:out_line = "{0},{1},{2}" -f $Local:cp_id_name, $Local:alert_Info, $Local:alert_time_period_type

            $Local:out_line | Out-File -Append $Script:out_log_file_path
        }
    }
}