---
aliases:
  - Windows Privileges
tags:
  - tech
  - microsoft
  - windows
  - defender
author: Mehdi N Tehrani
creat_date: 2023-12-09
category: Windows
subcategory: Administration
---

# Get Defender status
- Reference: [Microsoft 365 docs](https://github.com/MicrosoftDocs/microsoft-365-docs/blob/public/microsoft-365/security/defender-endpoint/microsoft-defender-antivirus-windows.md)
Command:
`Get-MpComputerStus`
Output:
```
AMEngineVersion                 : 0.0.0.0
AMProductVersion                : 4.18.2104.5
AMRunningMode                   : Not running
AMServiceEnabled                : False
AMServiceVersion                : 0.0.0.0
AntispywareEnabled              : False
AntispywareSignatureAge         : 4294967295
AntispywareSignatureLastUpdated :
AntispywareSignatureVersion     : 0.0.0.0
AntivirusEnabled                : False
AntivirusSignatureAge           : 4294967295
AntivirusSignatureLastUpdated   :
AntivirusSignatureVersion       : 0.0.0.0                                                                                         BehaviorMonitorEnabled          : False                                                                                           ComputerID                      : 8EFF6C67-15D2-4D86-AEA6-2D479EB650D1                                                            ComputerState                   : 0
FullScanAge                     : 4294967295
FullScanEndTime                 :
FullScanStartTime               :
IoavProtectionEnabled           : False
IsTamperProtected               : False
IsVirtualMachine                : True
LastFullScanSource              : 0
LastQuickScanSource             : 0
NISEnabled                      : False
NISEngineVersion                : 0.0.0.0
NISSignatureAge                 : 4294967295
NISSignatureLastUpdated         :
NISSignatureVersion             : 0.0.0.0
OnAccessProtectionEnabled       : False
QuickScanAge                    : 4294967295
QuickScanEndTime                :                                                                                                 QuickScanStartTime              :                                                                                                 RealTimeProtectionEnabled       : False                                                                                           RealTimeScanDirection           : 0                                                                                               TamperProtectionSource          : Signatures
PSComputerName                  :
```
