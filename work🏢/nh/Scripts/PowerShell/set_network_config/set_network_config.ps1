<#
	Create Date:	2022-08-30
	Author:			Mehdi N Tehrani <mehdi.tehrani@nh.org.au; m.nadji.t@gmail.com>
	Purpose:		Set network setting to static IP, default gateway and DNS server using details in config file.
                    Revert network setting back to DHCP
    Usage:			
                    .\set_network_config.ps1 current    
                    .\set_network_config.ps1 static
                    .\set_network_config.ps1 dhcp
    Parameters:		static | dhcp | current
#>

param (
    #[Parameter(Mandatory=$true)]
    [string]$action
)

function GetConfigs {
    try {
        $script:LogPath = Join-Path -Path $(Get-Location).Path -ChildPath "Log.txt"

        ECHO "`r`n" >> $LogPath
        ECHO "----------------------------------------------------------" >> $LogPath
        ECHO "DateTime: $(Get-Date -Format "yyyy-MM-dd HH:mm")" >> $LogPath
    
        $configJson = Get-Content '.\config.json' | Out-String | ConvertFrom-Json

        $script:IP_Address = $configJson.Rhapsody_Prod.IP_Address
		$script:PefixLength = $configJson.Rhapsody_Prod.PefixLength
		$script:Gateway = $configJson.Rhapsody_Prod.Gateway
		$script:DNS1 = $configJson.Rhapsody_Prod.DNS1
		$script:DNS2 = $configJson.Rhapsody_Prod.DNS2
        
        ECHO "Successfully retrieved configuration parameters from config.json file.`r`n" >> $LogPath
    }
    catch {
        HandleError "`nFailed to retrieve configuration parameters from config.json file." $_
    }
}

function SetNetworkConfigToStaticIP {
    try {
        GetCurrentConfig

        ECHO "`r`n[ACTION] Setting network configuration to static..." >> $LogPath
        
        if (Test-Connection -ComputerName $IP_Address -Count 1 -Quiet) { 
            $script:Log_text = "`r`n[FAIL] IP address ($IP_Address) seems to be in use by this or another device. Exiting the script now..."
            Write-Host -ForegroundColor Yellow $Log_text
            ECHO $Log_text >> $LogPath
            Write-Host -NoNewLine 'Press any key to continue...';
            $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
            Exit
        }        

        $NetAdapter = Get-NetAdapter | WHERE { $_.Name -like 'Ethernet*' }
        Write-Host -ForegroundColor Yellow "`n Setting network configuration to static..."

        Write-Host -ForegroundColor Yellow " ┣ Disabling DHCP"
        ECHO "  Disabling DHCP" >> $LogPath
        Set-NetIpInterface -InterfaceIndex $NetAdapter.ifIndex -Dhcp Disabled | Out-Null

        Write-Host -ForegroundColor Yellow -NoNewline " ┣ Setting IP address to: `t`t"
        Write-Host -ForegroundColor Green ("{0}/{1}" -f $IP_Address, $PefixLength)
        ECHO ("  Setting IP address to: `t`t{0}/{1}" -f $IP_Address, $PefixLength) >> $LogPath
        New-NetIPAddress -AddressFamily IPv4 -InterfaceIndex $NetAdapter.ifIndex -IPAddress $IP_Address -PrefixLength $PefixLength -Confirm:$false | Out-Null

        Write-Host -ForegroundColor Yellow -NoNewline " ┣ Setting Default Getway to:`t"
        Write-Host -ForegroundColor Green $Gateway
        ECHO ("  Setting Default Getway to: `t`t{0}" -f $Gateway) >> $LogPath
        New-NetRoute -AddressFamily IPv4 -InterfaceIndex $NetAdapter.ifIndex -DestinationPrefix "0.0.0.0/0" -NextHop $Gateway -Confirm:$false | Out-Null

        Write-Host -ForegroundColor Yellow -NoNewline " ┣ Setting DNS Servers to:`t`t"
        Write-Host -ForegroundColor Green ("{0}  {1}" -f $DNS1, $DNS2)
        ECHO ("  Setting DNS servers to: `t`t{0}  {1}" -f $DNS1, $DNS2) >> $LogPath
        Set-DnsClientServerAddress -InterfaceIndex $NetAdapter.ifIndex -ServerAddresses $DNS1, $DNS2 | Out-Null

        ECHO "`r`nSuccessfully set network configuration to static." >> $LogPath
    }
    catch {
        HandleError "`nERROR: Failed to set network configuration to static!" $_
    }

    GetCurrentConfig
}

function SetNetworkConfigToDhcp {
    try {
        GetCurrentConfig

        ECHO "`r`n[ACTION] Setting network configuration to DHCP..." >> $LogPath

        $script:NetConfig = Get-NetIPConfiguration | WHERE { $_.InterfaceAlias -like 'Ethernet*' }
        if ($NetConfig.NetIPv4Interface.Dhcp -eq 'Enabled') {
            Write-Host -ForegroundColor Yellow " `nNetwork configuration is already set to DHCP. No actoins taken. Exiting the script..." 
            ECHO " `r`nNetwork configuration is already set to DHCP. No actoins taken. Exiting the script..." >> $LogPath
            EXIT
        }

        $script:NetAdapter = Get-NetAdapter | WHERE { $_.Name -like 'Ethernet*' }
        Write-Host -ForegroundColor Yellow "`n Setting network configuration to DHCP..."

        Write-Host -ForegroundColor Yellow " ┣ Removing IP address"
        ECHO "  - Removing IP address..." >> $LogPath
        Remove-NetIPAddress -InterfaceIndex $NetAdapter.ifIndex -Confirm:$false | Out-Null

        Write-Host -ForegroundColor Yellow " ┣ Removing Default Gateway"
        ECHO "  - Removing Default Gateway..." >> $LogPath
        Remove-NetRoute -InterfaceIndex $NetAdapter.ifIndex -Confirm:$false | Out-Null

        Write-Host -ForegroundColor Yellow " ┣ Removing DNS Servers"
        ECHO "  - Removing DNS servers..." >> $LogPath
        Set-DnsClientServerAddress -InterfaceIndex $NetAdapter.ifIndex -ResetServerAddresses | Out-Null

        Write-Host -ForegroundColor Yellow " ┣ Enbling DHCP"
        ECHO "  - Enabling DHCP..." >> $LogPath
        Set-NetIpInterface -InterfaceIndex $NetAdapter.ifIndex -Dhcp Enabled

        GetCurrentConfig $LogPath
    }
    catch {
        HandleError "`nFailed to set network configuration to DHCP." $_
    }
}

function GetCurrentConfig {
    try {
        ECHO "`r`n[ACTION] Retrieving network configuration..." >> $LogPath

        $script:NetConfig = Get-NetIPConfiguration | WHERE { $_.InterfaceAlias -like 'Ethernet*' }
        $script:current_ip = $NetConfig.IPv4Address.IPAddress
        $script:prefix_length = $NetConfig.IPv4Address.PrefixLength
        $script:current_gateway = (Get-NetRoute -DestinationPrefix '0.0.0.0/0').NextHop
        $script:current_dns_servers = ($NetConfig.DNSServer | WHERE { $_.AddressFamily -eq 2 }).ServerAddresses
        $script:current_dhcp_status = $NetConfig.NetIPv4Interface.Dhcp

        Write-Host -ForegroundColor Yellow "`n Current network configuration:" 
        Write-Host -ForegroundColor DarkGray -NoNewline " ┣ IP Address/Prefix Length`t`t"
        Write-Host -ForegroundColor Green ("{0}/{1}" -f $current_ip, $prefix_length) 
        Write-Host -ForegroundColor DarkGray -NoNewline " ┣ Default Gateway`t`t`t" 
        Write-Host -ForegroundColor Green $current_gateway
        Write-Host -ForegroundColor DarkGray -NoNewline " ┣ DNS Servers`t`t`t`t"
        Write-Host -ForegroundColor Green $current_dns_servers
        Write-Host -ForegroundColor DarkGray -NoNewline " ┗ DHCP`t`t`t`t`t"
        Write-Host -ForegroundColor Green $current_dhcp_status

        $script:log_text = (" Current network configuration:`r`n  - IP Address/Prefix Length`t`t{0}/{1}`r`n  - Default Gateway`t`t`t{2}`r`n  - DNS Servers`t`t`t`t{3}`r`n  - DHCP`t`t`t`t{4}" -f $current_ip, $prefix_length, $current_gateway, ($current_dns_servers -join "  "), $current_dhcp_status)
        ECHO $log_text >> $LogPath
    }
    catch {
        HandleError "Failed to retrieve current network configuration.`n`n{0}" $_
    }
}

function HandleScriptParams {
    GetConfigs
    if ($action -eq "static") {
        SetNetworkConfigToStaticIP $IP_Address $PefixLength $Gateway $DNS1 $DNS2 $LogPath
    }
    elseif ($action -eq "dhcp") {
        SetNetworkConfigToDhcp
    }
    elseif ($action -eq "current") {
        GetCurrentConfig
    }
    else {
        Write-Host -ForegroundColor Red "`nInvalid parameter. Please use either of the following parameters when calling this script:"
        Write-Host -ForegroundColor Green -NoNewline "  current`t"
        Write-Host -ForegroundColor Gray "retrieve current settings"
        Write-Host -ForegroundColor Green -NoNewline "  static`t"
        Write-Host -ForegroundColor Gray "Set network settings to configuration in config.json file"
        Write-Host -ForegroundColor Green -NoNewline "  dhcp`t`t"
        Write-Host -ForegroundColor Gray "Set network configuration to DHCP`n" 
        EXIT
    }
}

function HandleError ($Msg, $Err) {
    $script:output_message = "{0}: {1}`n`n{2}" -f "ERROR", $Msg, $Err 
    Write-Host -ForegroundColor Red $output_message
    ECHO $script:output_message >> $LogPath
    EXIT
}

HandleScriptParams

# SIG # Begin signature block
# MIIFqQYJKoZIhvcNAQcCoIIFmjCCBZYCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUriAeEe70pGflQdn8oZ1yngHf
# XqWgggM8MIIDODCCAiCgAwIBAgIQVk4ouBdw9JNH/N6xDvo+mTANBgkqhkiG9w0B
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
# CQQxFgQUcVPF66Z6ibJ9xcv2CedLv5EPPeQwDQYJKoZIhvcNAQEBBQAEggEAiWZy
# O1J2nhWVyMlhGQS9VcnFElYVQMIpSSoRBx80OvWMB7oKAzRA2P8NepVm4MvyqU3h
# YHtLTKWIqatcjOuIIkKcTcHwdbTYEGTWj0N4S+pQkt+O0+syfv+kOOygF0MKAwi8
# ODntHJoii4bSkmQVdlBZpqLdKWAecl/dEG4+kxA4FfA2XHvYH3EIaI0GQfzTZFib
# 2JwCtKESZ8qVaQzMA9SuGzn1eHzHn0UradXqfIo2+aeJKt1Eb4j1QJEz/DbA/Ug4
# s5hqpSTdAHZMSKTItqDHSmrWbylM1xjqMHK6s2BI7yUgXHUBQ4tVN7qOGo6Mh/Me
# fXf5/XE+xzjeBVlzEA==
# SIG # End signature block
