function CreateFailureFlagFile {
    $script:FailureFilePath = "$(Get-Location)\\_Failure-$(Get-Date -format yyyyMMdd).txt"
    ECHO 'Issue occured during processing of MasterLog-Transfer.ps1 - Please refer to log file in same directory named log.txt' | Out-File -FilePath $FailureFilePath
}

function GetConfigs {
    try {
        $script:LogPath = Join-Path -Path $(Get-Location).Path -ChildPath "TransferLog.txt"

        MoveLogToOldLogIfLarge

        ECHO "`r`n" >> $LogPath
        ECHO "----------------------------------------------------------" >> $LogPath
        ECHO "Start: $(Get-Date -Format "yyyy-MM-dd HH:mm")" >> $LogPath
    
        $configJson = Get-Content '.\config.json' | Out-String | ConvertFrom-Json
    
        $script:LogsPath = $configJson.TransferMonitor.LogsPath
        $script:DriveToCheckSpace = $configJson.TransferMonitor.DriveToCheckSpace
        $script:FreeSpaceThreshold = $configJson.TransferMonitor.FreeSpaceThreshold
        $script:FreeSpacePercThreshold = $configJson.TransferMonitor.FreeSpacePercThreshold
        $script:FailureFilePrefix = $configJson.TransferMonitor.FailureFilePrefix

        $script:SmtpServer = $configJson.Email.SmtpServer
        $script:EmailSender = $configJson.Email.EmailSender
        $script:EmailRecipients = $configJson.Email.EmailRecipients
        $script:EmailSubject = $configJson.Email.EmailSubject
        $script:EmailPriority = $configJson.Email.EmailPriority

        $script:FailureDetectedEmailBodyRaw = Get-Content -Raw $configJson.Email.FailureDetectedEmailBody
        $script:DiskSizeIssueEmailBodyRaw = Get-Content -Raw $configJson.Email.DiskSizeIssueEmailBody

        $script:SourceFolderPath = $configJson.MasterLogTransfer.SourceFolderPath
        $script:DestinationUNCPath = $configJson.MasterLogTransfer.DestinationUNCPath
    
        ECHO 'Successfully retrieved configuration parameters from config.json file.' >> $LogPath
    }
    catch {
        ECHO 'Failed to retrieve configuration parameters from config.json file.' >> $LogPath
        ECHO $_ >> $LogPath
        EXIT
    }
}

function NotifyIfAnyIssues {
    $Disks=Get-CimInstance -Class CIM_LogicalDisk | Select-Object @{Name="SizeGB";Expression={[math]::Round($_.size/1gb)}}, @{Name="FreeSpace";Expression={[math]::Round($_.freespace/1gb)}}, @{Name="FreePerc";Expression={[math]::Round(($_.freespace/1gb)*100 / ($_.size/1gb))}}, DeviceID, DriveType | Where-Object DriveType -EQ '3'
    $DiskToCheck=$Disks | Where-Object { $_.DeviceID -eq $DriveToCheckSpace}
    $FreeGB = $DiskToCheck.FreeSpace
    $FreePerc = $DiskToCheck.FreePerc
    $DiskSize = $DiskToCheck.SizeGB

    $emailParams = @{
	    SmtpServer = $SmtpServer
	    To = $EmailRecipients
	    From = $EmailSender
	    Priority = $EmailPriority
	    Subject = $EmailSubject
    }

    if ($(Get-ChildItem | Where {$_.Name.Contains("_Failure") -And $_.CreationTime -lt (Get-Date).AddMinutes(-5) }).Count -gt 0) { 
        ECHO '*** FAILURE *** Failure flag file detected in the folder where this process is running. Something has gone wrong in previous instances of this process.' >> $LogPath
        $FailureDetectedEmailBody = $ExecutionContext.InvokeCommand.ExpandString($FailureDetectedEmailBodyRaw) | Out-String
	    Send-MailMessage @emailParams -Body $FailureDetectedEmailBody -BodyAsHtml
    }

    if ($FreeGB -lt $FreeSpaceThreshold -Or $FreePerc -lt $FreeSpacePercThreshold) {
        ECHO '*** ISSUE *** Disk free space is lower than thresholds set in the config file.' >> $LogPath
        $DiskSizeIssueEmailBody = $ExecutionContext.InvokeCommand.ExpandString($DiskSizeIssueEmailBodyRaw) | Out-String
	    Send-MailMessage @emailParams -Body $DiskSizeIssueEmailBody -BodyAsHtml
    }
}

function MoveFoldersExceptTodayFolder {
    $OldFolder = dir $SourceFolderPath -Recurse -Depth 2 -Directory -Exclude .temp | Where { $_.Name.Length -eq 8 -AND $_.Name -ne $(Get-Date -Format yyyyMMdd) } 
        
    $OldFolder | ForEach-Object -Process { 
        $newFolderPath = Join-Path $DestinationUNCPath -ChildPath $_.FullName.Replace($SourceFolderPath,"")
        try { 
            $OldFolderCount = $(Get-ChildItem $_).Count

            MOVE -Force $_ $newFolderPath

            Get-Job | Wait-Job
            $NewFolderCount = $(Get-ChildItem $newFolderPath).Count

            if ($OldFolderCount -ne $NewFolderCount) {
                ECHO "*** FAILURE *** Number of files in the old folder [$_] do not match the destination folder [$newFolderPath]" >> $LogPath
                EXIT
            }
            ECHO "*** SUCCESS *** Successfully moved [$_] folder to destination folder [$newFolderPath]" >> $LogPath
            RM $FailureFilePath
        } catch {
            ECHO "*** FAILURE *** Failed to move [$_] folder to destination folder [$newFolderPath]" >> $LogPath
        }
    }
}

function MoveLogToOldLogIfLarge {
    $LogSize = $(Get-Item $LogPath).Length
    ECHO $LogSize >> $LogPath
    if ($LogSize -gt 500000) {
        MOVE -Force $LogPath "$($LogPath.substring(0, $LogPath.length - 4)).old.txt"
    }
}

CreateFailureFlagFile

GetConfigs

NotifyIfAnyIssues

MoveFoldersExceptTodayFolder