<#
	Create Date:	2022-03-02
	Author:			James Stamkos <james.stamkos@nh.org.au>
	Purpose:		Copy a csv file extracted from iPM containing Diet Codes, across to Delegate Azure Blob Storage
	Overview:		This script first loads required config information from config.json file in the same directory as the script. 
					Then tries to copy the source file into an Azure Blob Storage using Azure copy i.e. azcopy.exe - path to which should have been added to PATH environment variable of user running the script or system
					A copy of the file appended with current timestamp will be srotes in a subdirectory. Script logs are also stored in a LOG subdirectory.
					Azure-Copy job plans and logs are stored in directories set in the following environment variables respectively: $env:azcopy_log_location, $env:azcopy_job_plan_location 
					If the azcopy job fails, an email will be sent out the recipients defined in the config file.
					Historical csv files are stored in the same directory as the source file, but other logs are stored where the script is run from.
					Clean up is done for History, Log, AzCopyLog and AzCopyPlans folders based on the length of time they're supposed to be kept defined in the config file.
	Usage:			Called by Windows Task Scheduler at 15-minute intervals - This script is supposed to be run on NHRhapsodyUAT and NHRhapsodyProd servers
	Update History:
					2022-03-03,	Mehdi N Tehrani <mehdi.tehrani@nh.org.au; m.nadji.t@gmail.com>, Customise to Delegate integration requirements
#>

# [Define Constants - Initialise Variables]

$Script:today_date 					= Get-Date -Format "yyyy-MM-dd"
$Script:logfile 					= "./LOG/Error-$today_date.log"
$Script:log_folder 					= Split-Path $Script:logfile


if (!(Test-Path -path "./config.json")) { Write-Host "ERROR: Could not find the config.json file in the current directory. Exiting now..."; exit }
$Script:config = Get-Content "./config.json" | Out-String | ConvertFrom-Json

$Script:azure_endpoint 				= $Script:config.azure_endpoint
$Script:azure_folder_path 			= $Script:config.azure_folder_path
$Script:azure_sas		 			= $Script:config.azure_sas
$Script:azure_destination 			= "{0}/{1}?{2}" -f $Script:config.azure_endpoint, $Script:config.azure_folder_path, $Script:config.azure_sas
	
$Script:source_file_path 			= $Script:config.source_file_path
	
$env:azcopy_log_location 			= $Script:config.azcopy_log_location
$env:azcopy_job_plan_location 		= $Script:config.azcopy_job_plan_location
$Script:smtp_server 				= $Script:config.smtp_server
$Script:smtp_from 					= $Script:config.smtp_from
$Script:smtp_to 					= $Script:config.smtp_to

$Script:azcopy_logs_cleanup_days	= [Int]$Script:config.azcopy_logs_cleanup_days
$Script:azcopy_plans_cleanup_days	= [Int]$Script:config.azcopy_plans_cleanup_days
$Script:script_logs_cleanup_days	= [Int]$Script:config.script_logs_cleanup_days
$Script:history_cleanup_days		= [Int]$Script:config.history_cleanup_days

$Local:history_folder_name			= $Script:config.history_folder_name
$Script:history_folder 				= Join-Path (Split-Path $Script:source_file_path -Resolve) $Local:history_folder_name

# [Define Functions]
Function LogWrite ([string]$Local:logString)
{
	$Local:timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
	Add-content $Script:logfile -value "$Local:timestamp - $Local:logString"

	if (!(Test-Path -Path ".\Error.flag"))
	{
		New-Item -ItemType File ".\Error.flag" -Value "Time: $(Get-date) -Error:$Local:logString)" -Force | Out-Null
		Send-MailMessage -SmtpServer $Script:smtp_server -From $Script:smtp_from -To $Script:smtp_to -Subject "Delegate AzureCopy CSV Transfer Error" `
			-Body "There was an error transferring Delegate's CSV files on $($env:computername.ToUpper()).<br/>Please check the logs in $(Resolve-Path -Path './LOG')<br/><br/>ERROR:<br/>$($Local:logString)" -BodyAsHtml
	}
}

Function RemoveOldItems {
	Get-ChildItem $env:azcopy_log_location -Include "*.log" -Recurse | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-$Script:azcopy_logs_cleanup_days)} | Remove-Item
	Get-ChildItem $env:azcopy_job_plan_location -Include "*.steV16" -Recurse | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-$Script:azcopy_plans_cleanup_days)} | Remove-Item
	Get-ChildItem $Script:log_folder -Include "*.log" -Recurse | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-$Script:script_logs_cleanup_days)} | Remove-Item
	Get-ChildItem $Script:history_folder -Include "*.csv" -Recurse | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-$Script:history_cleanup_days)} | Remove-Item
}

<# -----------------------------
[SCRIPT - START]
----------------------------- #>

try
{
	if (!(Test-Path -path $Script:log_folder)) 		{ mkdir $Script:log_folder | Out-Null }	
	if (!(Test-Path -path $Script:history_folder)) 	{ mkdir $Script:history_folder | Out-Null }
	
	# Main command copying the csv file across to the Delegate's Azure blob
	$Script:Output = azcopy.exe cp $Script:source_file_path $Script:azure_destination --log-level ERROR --overwrite=true
	
	Write-Host $Script:Output
	if ($LASTEXITCODE -ne 0) { LogWrite $Script:Output	}	# If azcopy job failed
	else { 													# If successful
		Copy-Item -Path $Script:source_file_path -Destination (Join-Path $Script:history_folder (Split-Path -Path $Script:source_file_path -Leaf).replace(".csv", "-$(Get-Date -Format 'yyyy-MM-dd_HH-mm').csv"))
		if (Test-Path -Path ".\Error.flag") { Remove-Item -Path ".\Error.flag" -Force }
	}   
}
catch
{
	Write-Host $Error[0]
	LogWrite $Error[0]
	LogWrite "An error occurred when the files are downloaded."
}

RemoveOldItems

<# -----------------------------
[SCRIPT - END]
----------------------------- #>

# SIG # Begin signature block
# MIIFoQYJKoZIhvcNAQcCoIIFkjCCBY4CAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUBC+E/LUzgntkvIXS53Min9Wg
# mwigggM2MIIDMjCCAhqgAwIBAgIQeW+lf5ctUqFN7JPdjCn+0jANBgkqhkiG9w0B
# AQsFADAgMR4wHAYDVQQDDBV0ZWhyYW5tLWFkbUBuaC5vcmcuYXUwHhcNMjEwNjE3
# MDk0OTM2WhcNMjIwNjE3MTAwOTM2WjAgMR4wHAYDVQQDDBV0ZWhyYW5tLWFkbUBu
# aC5vcmcuYXUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDEghOqI0Cq
# LIBcBHm3EufqMTR2RzfTUgryVkMnkqHZ3IcYFhFhcProwug8wZPf/qweECBf0sM4
# ICf6VqSN5LMmn9DQkNsvK1c3qUMzofwn6RbNiHlD6Lu4Cg02x6yYpkMTmhBXCsZ7
# +cOrvVZnPyNAplnNxSX6voXsz0axLPrSPblnNyXOt9ivB/IuUoYP37IdOG+rIYBt
# /UV4qPfEYWaFn0A3fpQ9iVMH4UwD1BJHLB+YqQa+hh2HFqNRLta5GiAIof2G6gw2
# +lbxuOSP7xW5k236Llb7exK1mzUM8ofwZa4vYKwiQ7dKF9A3vy4gYoloZhkwFwDP
# +Hha1uhg+7F5AgMBAAGjaDBmMA4GA1UdDwEB/wQEAwIHgDATBgNVHSUEDDAKBggr
# BgEFBQcDAzAgBgNVHREEGTAXghV0ZWhyYW5tLWFkbUBuaC5vcmcuYXUwHQYDVR0O
# BBYEFAOao34TUppqt1Ytzu8bt/3nfrNPMA0GCSqGSIb3DQEBCwUAA4IBAQCklli6
# VpSn/C68ZmkYuJfjXi5e4pJe3L2nvtoqVQurV4XPKuUq3uu93N7eD897p+aDkZg3
# N27x+UcmUOs1lAzJ4KHuBwBpuvCLo4bAeF/lHf8ap0F6jAqoenbKRrOFAYrOSYz+
# dMjbvGoPvzArKxdwxqyDA2mK+ADkNMXsQtH/fL3eG2moPk/vDrbLlXSrLuRseEhZ
# ra6o3ONEZirJvL7rKLrspmpxo0fRVuveL0Qf22Pzmnzv875TUd8GDpNkgrGsCt+A
# iWZ9fnD75lYTD/aQ0H05pnaQ/9cby+BXcEelTE/d1cg1LDaj/Qcr1eDwBiPURR7O
# 6DGzynpvoO8/fLdoMYIB1TCCAdECAQEwNDAgMR4wHAYDVQQDDBV0ZWhyYW5tLWFk
# bUBuaC5vcmcuYXUCEHlvpX+XLVKhTeyT3Ywp/tIwCQYFKw4DAhoFAKB4MBgGCisG
# AQQBgjcCAQwxCjAIoAKAAKECgAAwGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQw
# HAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwIwYJKoZIhvcNAQkEMRYEFG4z
# iO2T10cvjA2N0vNlRfk/nK81MA0GCSqGSIb3DQEBAQUABIIBAB0uT4luMHzjt8eO
# FL4mKyjQP2kWXQfewFLQysJOSYEU++4HvlsM0gvR3ITD0qqBvzCMZjxJKFWFecqR
# Y1n0uL3zkb/4ARxq2IG2kKvLtBJBetV12RwaSuCtUBeFQPypKz4L87clgUG/QAxc
# 17lf2olJKsEQifloj63k/SuiIOuRR8QJMiQf/4GVNc3oXR1EXoK7vK3aogv6LyI3
# zgmU1sy2XrpT5C8icFcdokLAVTkT6vokVKRkR45VIHcXuSf053tempUpnEMasQee
# 3cltIky97NuSCeDm2DoKyN5wWZ2UFX8x/fPP0wz008AG2ubjgWjfMvgRx3AKKjSd
# 78n/7dQ=
# SIG # End signature block
