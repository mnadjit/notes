<#
	Create Date:	2022-09-20
	Author:			Mehdi N Tehrani <mehdi.tehrani@nh.org.au; m.nadji.t@gmail.com>
	Purpose:		
    Usage:			
                    
#>

function HandleError ($Msg, $Err) {
    $script:output_message = "{0}: {1}`n`n{2}" -f "ERROR", $Msg, $Err 
    Write-Host -ForegroundColor Red $output_message
    ECHO $script:output_message >> $LogPath
    EXIT
}


# Get Configs
try {
    $script:LogPath = Join-Path -Path $(Get-Location).Path -ChildPath "Log.txt"

    ECHO "`r`n" >> $LogPath
    ECHO "----------------------------------------------------------" >> $LogPath
    ECHO "DateTime: $(Get-Date -Format "yyyy-MM-dd HH:mm")" >> $LogPath
    
    $configJson = Get-Content '.\config.json' | Out-String | ConvertFrom-Json

    $script:EnginePath = $configJson.Rhapsody_Engine_Path
	$script:DataPath = $configJson.Rhapsody_Data_Path
    $script:InstallerPath = $configJson.Rhapsody_Installer_Path
    $script:ResponseDatRelPath = $configJson.Rhapsody_ResponseDat_Path 
	$script:CertDirSourceRelPath = $configJson.TLS_Cert_Dir_Source_Path
    $script:CertDestRelPath = $configJson.TLS_Cert_Dir_Destination_Path
	$script:RhapPropRelPath = $configJson.Rhapsody_Properties_Path
	$script:LdapPropRelPath = $configJson.Ldap_Properties_Path
        
    ECHO "Successfully retrieved configuration parameters from config.json file.`r`n" >> $LogPath
}
catch {
    HandleError "`nFailed to retrieve configuration parameters from config.json file." $_
}

# exit if Rhapsody already installed
$script:rhapsody_is_installed = (Get-Service -Name *Rhapsody*).Count -gt 0
if ($rhapsody_is_installed) {
	Write-Host -ForegroundColor Red "`nRhapsody needs to be removed before this script can be used. Exiting the script...`n"
	EXIT
}

# Install Rhapsody
$script:ResponseDatPath = Join-Path -Path $(Get-Location).Path -ChildPath $ResponseDatRelPath
try {
    Start-Process -FilePath $InstallerPath -ArgumentList "-q","-splash","Installing Rhapsody","-varfile",$ResponseDatPath
    ECHO "Successfully installed Rhapsody Engine.`r`n" >> $LogPath
}
catch {
    HandleError "`nFailed to install Rhapsody Engine." $_
}

# Prepare variables to file paths
$CertDirSourcePath = Join-Path -Path $(Get-Location).Path -ChildPath $CertDirSourceRelPath
$CertDestPath = Join-Path -Path $EnginePath -ChildPath $CertDestRelPath

$RhapPropSourcePath = Join-Path -Path $(Get-Location).Path -ChildPath $RhapPropRelPath
$RhapPropDestPath = Join-Path -Path $EnginePath -ChildPath "rhapsody/rhapsody.properties"

$LdapPropSourcePath = Join-Path -Path $(Get-Location).Path -ChildPath $LdapPropRelPath
$LdapPropDestPath = Join-Path -Path $DataPath -ChildPath "users/ldap.properties"

# Wait until the service is up i.e. installation is completed
$rhapsody_is_installed = (Get-Service -Name *Rhapsody*).Count -gt 0
while (-Not $rhapsody_is_installed) {
    Start-Sleep -Seconds 15
    $rhapsody_is_installed = (Get-Service -Name *Rhapsody*).Count -gt 0
}

# Copy TLS Certificate
try {
    cp $CertDirSourcePath $CertDestPath -Recurse
    ECHO "Successfully copied the certificate folder to destination.`r`n" >> $LogPath
}
catch {
    HandleError "`nFailed to copy the certificate folder to destination." $_
}

# Copy Rhapsody Properties
try {
    mv $RhapPropDestPath ("{0}_{1}.bak" -f $RhapPropDestPath, (Get-Date -format "yyyyMMddHHmmss"))
    cp $RhapPropSourcePath $RhapPropDestPath
    ECHO "Successfully copied rhapsody properties file to destination.`r`n" >> $LogPath
}
catch {
    HandleError "`nFailed to copy rhapsody properties file to destination." $_
}

# Copy LDAP Properties
try {
    mv $LdapPropDestPath ("{0}_{1}.bak" -f $LdapPropDestPath, (Get-Date -format "yyyyMMddHHmmss"))
    cp $LdapPropSourcePath $LdapPropDestPath
    ECHO "Successfully copied ldap properties file to destination.`r`n" >> $LogPath
}
catch {
    HandleError "`nFailed to copy ldap properties file to destination." $_
}

# Restart Rhapsody Service for the TLS certificate and rhapsody.properties and ldap.properties files to get used
PowerShell -c "Restart-Service Rhapsody"

# SIG # Begin signature block
# MIIFqQYJKoZIhvcNAQcCoIIFmjCCBZYCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQU2781lXLJB38GF9Xoj+DOaOyH
# VA6gggM8MIIDODCCAiCgAwIBAgIQVk4ouBdw9JNH/N6xDvo+mTANBgkqhkiG9w0B
# AQsFADAiMSAwHgYDVQQDDBdtZWhkaS50ZWhyYW5pQG5oLm9yZy5hdTAeFw0yMjA5
# MDgwNTQ1NTFaFw0yNTA5MDgwNTU1NTFaMCIxIDAeBgNVBAMMF21laGRpLnRlaHJh
# bmlAbmgub3JnLmF1MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtDiy
# iCPU5m5fHc/rrKh61Omxia2WUCSiBRcfFNYF3g98KBlJtpgdBWucW696lrnR2jW7
# EuzpkqdJRCoImLdkaTjwmWxOBzqQ4cTZVTY6rnAqgiEKVVJoIpVSNZmymjF8+ivn
# R08ccqMiQmkNNR99U4u6MpEWaMmXFr9Ox9vk+DvqAQ+G5V8VFzVbrDS+YWzsXC0m
# 8CvF1maYIUWrKMUx+zBzg3+R3wFE4+kzaS3Y7Cw13Rkq9DMh2i/q5hEYi8rosTmN
# xpxBLyLDkv6Q/X9e74fIRJIThQ+JputTEKnuK4YTbmDr/iHjom7R/hhiOQzkrEXE
# Fa3x0vH41XaYiDjcxQIDAQABo2owaDAOBgNVHQ8BAf8EBAMCB4AwEwYDVR0lBAww
# CgYIKwYBBQUHAwMwIgYDVR0RBBswGYIXbWVoZGkudGVocmFuaUBuaC5vcmcuYXUw
# HQYDVR0OBBYEFHuDHsdutgIcuy4Eod0oi9AIKohZMA0GCSqGSIb3DQEBCwUAA4IB
# AQAI2QhbVHsIhU9pNvVWj+OrMc6BeatrVVes4E/W5/bx8/8ATXumVreavF4xu4n4
# NbGwNC9nKSp3Tb2nII4JpUlplaUd4jLneNRuDGVL48i22Z5QDG5s6sGFRY6G2CYG
# nHCCRwt9KOWL6uG5+bgFUT9D6ZOS6Up7plEwVRWmtOZbZJsRS/jX8DE2RfJH6zLl
# VUaTktlLSuO5FPbxi8ZibNuDLiLt7wdWPKKMAvS8pXSQvuTO08/7wai92ZSwggRb
# 5tlLzYFo/sCeqIjXQJ8FL1MYwLesygpF9kmc0+UemC23uutM9IhzBhzAQWqMnRih
# AVm+Q2o0bPf0bO5tKkXhPvLNMYIB1zCCAdMCAQEwNjAiMSAwHgYDVQQDDBdtZWhk
# aS50ZWhyYW5pQG5oLm9yZy5hdQIQVk4ouBdw9JNH/N6xDvo+mTAJBgUrDgMCGgUA
# oHgwGAYKKwYBBAGCNwIBDDEKMAigAoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYB
# BAGCNwIBBDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0B
# CQQxFgQUNnPrFshMtfAiJAhw+FnzmPUPHQwwDQYJKoZIhvcNAQEBBQAEggEAT4jW
# J80KyxJ0tp2jRET1b7SlwhzSk5T6Wu0MeLwIo4HugXO53fctHdG98yKPmfamLZZw
# NePYeOY/KnxYTw6Hnpw7+grcwI5hswdD2SPA9uHP1rxu9yhlCGxobLDmHUjGolAp
# irX8oGxD3wlpzAAA3sJwb03B15GC7Ll4z4LKwFZkiqofmv4Z9uBG62bF7Oo+T5TN
# VuRcZO4D66NXcUk9bep66aW1SIAqtIRgCYW9G7u2eLwmPKlONMCr1ZtMxTWzsF73
# bXLhDL2Yh97GWbz6DCS/IJoVZnTS3DOASRu/YsfMUCURhiMMLt4P1aA9fDP385z1
# /TbPWLOa2gRqxgEsVQ==
# SIG # End signature block
