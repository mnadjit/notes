<#
    Purpose:        This is a working script as of 2023-03-21 to download PROMS reports from ZEDOC's API endpoint.
					However, Northern Health decision support unit (DSU) who is going to use this script to download the data, will not be using PowerShell
					This script is prepared only as proof of concept and also to mark the requirements and parameteres needed to make a successful call to ZEDOC's endpoint
	Requirements:	1. Northern Health Wildcard Certificate needs to be installed in the Trusted KeyStore of the machine running this script
						- in Windows this can be either imported directly into certmgt.msc or using PowerShell's Import-PfcCertificate command
						- keep in mind the whole pfx file which contains the private key as well should be installed, not only the certificate
						- This script looks in all locations under Cert:\ finds the certificate using the thumbprint provided in the script
							- Once a new Wilcard certificate is issued for Northern Health, following steps should be taken:
								1. ZEDOC's vendor (The Clinician) needs to use the new certificate (public key)
								2. New certificate (pfx file containing both private and public keys) should be installed on the DSU server running making the call to ZEDOC's API endpoint
								3. If this script is being used to test connectivity, the constant named $cert_thumbprint needs to be updated to the thumbprint of the new certificate
    Create Date:    2023-03-21
    Author:         Mehdi N Tehrani <mehdi.tehrani@nh.org.au; m.nadji.t@gmail.com>
#>

# As ZEDOC endpoint is using a self-signed certificate, certificate verification should be disabled.
# for PowerShell 7 merely passing -SkipCertificateCheck to the Invoke-RestMethod would suffice,
# however, for Windows PowerShell 5, the function below i.e. Disable-SslVerification is required instead.
# once the download is completed, SSL verification is re-enabled.
function Disable-SslVerification
{
    if (-not ([System.Management.Automation.PSTypeName]"TrustEverything").Type)
    {
        Add-Type -TypeDefinition  @"
		using System.Net.Security;
		using System.Security.Cryptography.X509Certificates;
		public static class TrustEverything
		{
			private static bool ValidationCallback(object sender, X509Certificate certificate, X509Chain chain,
				SslPolicyErrors sslPolicyErrors) { return true; }
			public static void SetCallback() { System.Net.ServicePointManager.ServerCertificateValidationCallback = ValidationCallback; }
			public static void UnsetCallback() { System.Net.ServicePointManager.ServerCertificateValidationCallback = null; }
		}
"@
    }
    [TrustEverything]::SetCallback()
}
function Enable-SslVerification
{
    if (([System.Management.Automation.PSTypeName]"TrustEverything").Type)
    {
        [TrustEverything]::UnsetCallback()
    }
}

$Script:start_date = '2023-03-06'
$Script:end_date = '2023-03-11'
$Script:out_file_path = 'c:/temp/data.zip'

$Script:uri = 'https://nh-proms-mirth.zedoc.io/dataexport/'
$Script:project_id = '32fc-00-usAnZkjcsRSE6pyBd'
$Script:basic_auth = 'bmg6cUNkOFZ6M3FGV0tD'
$Script:cert_thumbprint = '4B102C47066D0D5B8C791C5263473BA14FDDB098'

$Script:cert = Get-ChildItem Cert:\* -Recurse | Where-object { $_.Thumbprint -eq $cert_thumbprint }
$Script:headers = @{"Authorization"="Basic $($basic_auth)";"Content-Type"="application/json"}
$Script:payload = "{`"projectId`":`"$($project_id)`",`"dateStart`":`"$($start_date)`",`"dateEnd`":`"$($end_date)`",`"timezone`":`"Australia/Melbourne`"}"


if ($PSVersionTable.PSVersion.Major -gt 5) {
    $Script:base64_string = Invoke-RestMethod -Certificate $cert -Uri $uri -Method POST -Headers $headers -Body $payload -SkipCertificateCheck
} else {
    Disable-SslVerification
    $Script:base64_string = Invoke-RestMethod -Certificate $cert -Uri $uri -Method POST -Headers $headers -Body $payload
    Enable-SslVerification
}

$Script:bytes = [System.Convert]::FromBase64String($base64_string)
[IO.File]::WriteAllBytes($out_file_path, $bytes)

