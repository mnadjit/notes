# Get configs from config.json file in the same folder as this script and convert into an object
$script:configJson = Get-Content '.\config.json' | Out-String | ConvertFrom-Json

# Get configs and load into variables
$script:EndpointsToMonitor = $configJson.EndpointsToMonitor
$script:IPs = $EndpointsToMonitor | Select-Object -Property IP
$script:Ports = $EndpointsToMonitor | Select-Object -Property Port
$script:logFilePath = Join-Path -Path $(Get-Location).Path -ChildPath "tcp-log.txt"

Get-Date >> $logFilePath

# Check IP addresses in config files among all active TCP connections on this machine and print out local and remote endpoint details to the output log of this script (Not tested yet)
Get-NetTCPConnection | select local*,remote*,state,@{Name="Process";Expression={(Get-Process -Id $_.OwningProcess).ProcessName}}, @{Name="ProcessId";Expression={(Get-Process -Id $_.OwningProcess).Id }} | Where { $IPs.Contains($_.RemoteAddress) -And $_.State -ne "CloseWait"}

# Static version of the line above, but this one has been tested successfully
# Get-NetTCPConnection | select local*,remote*,state,@{Name="Process";Expression={(Get-Process -Id $_.OwningProcess).ProcessName}}, @{Name="ProcessId";Expression={(Get-Process -Id $_.OwningProcess).Id }} | Where { $_.RemoteAddress -eq "172.28.200.52" -And $_.State -ne "CloseWait"} >> $logFilePath

# Check ports in config files in Firewall log file and add relevant lines to the output log of this script (not tested yet)
$Ports | % { Get-Content C:\Windows\System32\LogFiles\Firewall\pfirewall.log | findstr $_.Port >> $logFilePath }
