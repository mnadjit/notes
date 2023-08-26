# User Agents
## Windows
- `Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.56`

## Android
- `Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Mobile Safari/537.36`

## Linux
- `Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0`

## Mac OS X
- `Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1.2 Safari/605.1.15`

## Chrome
```PowerShell
([Microsoft.PowerShell.Commands.PSUserAgent]::Chrome)
```
- `Mozilla/5.0 (Windows NT 10.0; Microsoft Windows 10.0.22621; en-AU) AppleWebKit/534.6 (KHTML, like Gecko) Chrome/7.0.500.0 Safari/534.6`

# Endpoints
## Microsoft Online
- https://login.microsoftonline.com/common/login

## Office 365 Outlook 
- https://outlook.office365.com

## Active-Sync
- https://outlook.office365.com/Microsoft-Server-ActiveSync

## ADFS
```PowerShell
$ADFSCheck = Invoke-WebRequest -Uri "https://login.microsoftonline.com/getuserrealm.srf?login=$UserName&xml=1"
[xml]$ADFSXML = $ADFSCheck.Content
$adfsurl = $ADFSXML.RealmInfo.AuthUrl
[uri]$RootADFSURL = $ADFSXML.RealmInfo.AuthUrl
$ADFSDomain = $RootADFSURL.Host
$SessionRequest = Invoke-WebRequest -Uri $adfsurl -SessionVariable adfs -UserAgent ([Microsoft.PowerShell.Commands.PSUserAgent]::Chrome)
$userform = $SessionRequest.Forms[0]
$userform.Fields["UserName"] = $Username
$userform.Fields["Password"] = $Password
$userform.Fields["AuthMethod"] = "FormsAuthentication"
$adfsauthpath = $SessionRequest.Forms[0] | Select-Object -ExpandProperty Action
$FullADFSURL = ("https://" + $ADFSDomain + $adfsauthpath)
```






# More Details from MFA_Sweep.ps1
```PowerShell
https://login.microsoftonline.com/getuserrealm.srf?login=$UserName&xml=1"
https://outlook.office365.com' -SessionVariable o365 -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.56"
https://login.microsoftonline.com/common/GetCredentialType?mkt=en-US") -WebSession $o365 -Method POST -Body $JSONForm -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.56"
https://login.microsoftonline.com/common/login") -WebSession $o365 -Method POST -Body $AuthBody -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.56"
https://outlook.office365.com' -SessionVariable o365 -UserAgent "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Mobile Safari/537.36"
https://login.microsoftonline.com/common/GetCredentialType?mkt=en-US") -WebSession $o365 -Method POST -Body $JSONForm -UserAgent "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Mobile Safari/537.36"
https://login.microsoftonline.com/common/login") -WebSession $o365 -Method POST -Body $AuthBody -UserAgent "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Mobile Safari/537.36"
https://outlook.office365.com' -SessionVariable o365 -UserAgent "Mozilla/5.0 (iPhone; CPU iPhone OS 12_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1 Mobile/15E148 Safari/604.1
https://login.microsoftonline.com/common/GetCredentialType?mkt=en-US") -WebSession $o365 -Method POST -Body $JSONForm -UserAgent "Mozilla/5.0 (iPhone; CPU iPhone OS 12_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1 Mobile/15E148 Safari/604.1
https://login.microsoftonline.com/common/login") -WebSession $o365 -Method POST -Body $AuthBody -UserAgent "Mozilla/5.0 (iPhone; CPU iPhone OS 12_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1 Mobile/15E148 Safari/604.1
https://outlook.office365.com' -SessionVariable o365 -UserAgent "Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0"
https://login.microsoftonline.com/common/GetCredentialType?mkt=en-US") -WebSession $o365 -Method POST -Body $JSONForm -UserAgent "Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0"
https://login.microsoftonline.com/common/login") -WebSession $o365 -Method POST -Body $AuthBody -UserAgent "Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0"
https://outlook.office365.com' -SessionVariable o365 -UserAgent "Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 635) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537
https://login.microsoftonline.com/common/GetCredentialType?mkt=en-US") -WebSession $o365 -Method POST -Body $JSONForm -UserAgent "Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 635) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537
https://login.microsoftonline.com/common/login") -WebSession $o365 -Method POST -Body $AuthBody -UserAgent "Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 635) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537
https://outlook.office365.com' -SessionVariable o365 -UserAgent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1.2 Safari/605.1.15"
https://login.microsoftonline.com/common/GetCredentialType?mkt=en-US") -WebSession $o365 -Method POST -Body $JSONForm -UserAgent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1.2 Safari/605.1.15
https://login.microsoftonline.com/common/login") -WebSession $o365 -Method POST -Body $AuthBody -UserAgent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1.2 Safari/605.1.15
	    $easlogin = Invoke-WebRequest -Uri $EASURL -Headers $Headers -Method Get -ErrorAction Stop
https://login.microsoftonline.com/getuserrealm.srf?login=$UserName&xml=1"
https://login.microsoftonline.com/getuserrealm.srf?login=$UserName&xml=1"
    $SessionRequest = Invoke-WebRequest -Uri $adfsurl -SessionVariable adfs -UserAgent ([Microsoft.PowerShell.Commands.PSUserAgent]::Chrome)
    $ADFSAuthAttempt= Invoke-WebRequest -Uri $FullADFSURL -WebSession $adfs -Method POST -Body $userform.Fields -UserAgent ([Microsoft.PowerShell.Commands.PSUserAgent]::Chrome)
https://login.microsoftonline.com/login.srf" -WebSession $adfsmsonline -Method POST -Body $ADFSAuthAttempt.Forms[0].Fields -UserAgent ([Microsoft.PowerShell.Commands.PSUserAgent]::Chrome) -MaximumRedirection 0
```


