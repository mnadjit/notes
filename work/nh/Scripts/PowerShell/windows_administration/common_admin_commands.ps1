## Restart EDIS Service - Bouncer Gateway
`Invoke-Command -ComputerName nhedis01 -ScriptBlock { Restart-Service -Name 'edis-adt-outbound-prod' }`

## Get Windows Build version
`(Get-ComputerInfo).OsHardwareAbstractionLayer`