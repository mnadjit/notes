<#
	Create Date:	2022-02-14
	Author:			Mehdi N Tehrani <mehdi.tehrani@nh.org.au; m.nadji.t@gmail.com>
	Purpose:		Convert look up table in the old format where there was a row for each message type, into the new format where each row represent a single sender and receiver and all relevant messsage types.
					In the new format the processing Ids can also be configured. For example, the new table can be used to only route iPM UAT messages to CPF, but messages from Dev, UAT & Staging to TCM. This is useful in the non-prod environments. 
					In production the only processing Id should be P, if senders are all correctly configured to use processing id of P in their outbound prod messages.
	Overview:		The script first expects the lookup table in the old format to be passed as the only parameter. Data is converted from csv into PowerShell object. 
					User is prompted to enter the processing Ids which are going to be set by default for all routes. For production it should be "P" only. For UAT depending on which routes are desirable; "D-V-M" means Dev (D), UAT (V), and Staging (M)
					Then for each item in the object containing the routes in the old format (for each row in the csv file) a row in the new format is created and added to the $routes variable.
						In the old format SOURCE is the sender and APPLICATION is the receiver. In the new format SENDER is the sending application, and RECEIVER is the receiving application.
						If the route already exists in $routes (this is checked by finding the Sender and Receiver in $routes) only the message type is added to the list of message types for that route.
					Once the loop is over, the message types are reformated from a list of items into a single array separated by hyphens
					And finally the $routes object is exported into the csv format into a file path similar ot the input file but ending in ".out.csv"
	Usage:			Run the script and pass input look up table csv file path as the only parameter to the script.
					e.g.  PS C:\> .\convert_rhapsody_lu_table_format.ps1 .\lookup_table_old.csv
					You get prompted to enter the default processing Ids set for all routes. Default value is "D-V-M" if no values are entered which is suitable for Rhapsody UAT.
						For production, enter "P".
#>


# [Define Constants - Initialise Variables]
$Script:in_file = $args[0]
# Ensure the input file exists
if (($Script:in_file -eq $null) -or (-Not (Test-Path -Path $Script:in_file))) { Write-Host "`nPlease enter a valid file path as parameter to the script. File must be in CSV format.`n"; exit }
$Script:out_file = $Script:in_file.Substring(0, $Script:in_file.length - 3) + 'out.csv'
$Script:routes = @()

# Prompt user for default processing Ids - for production it should be "P" only - for UAT depending on which routes are desirable; "D-V-M" means Dev (D), UAT (V), and Staging (M)
Write-Host -ForegroundColor Yellow "`nProcessing Ids >`nFor production enter `"P`". If no values are entered `"D-V-M`" will be used which means Dev (D), UAT (V), and Staging (M)."
$Script:default_processing_ids = Read-host "Please enter the default Processing Ids desired for all routes (separated by hyphens)"
if ($Script:default_processing_ids -eq "") { $Script:default_processing_ids = "D-V-M" }

# [Read input file]
$Script:in_table = Import-Csv -Path $Script:in_file

# [Main Action] Read each row in the old table, reformat and build the new table
$Script:in_table | % { 		
	$Local:Sender = $_.Source
	$Local:MsgType = $_.Type
	$Local:Receivers = $_.Application.split('|')
	
	$Local:Receivers | % {
		$Local:Receiver = $_
		$Local:route = $Script:routes | Where { ($_.Sender -eq $Local:Sender) -And ($_.Receiver -eq $Local:Receiver) }   # Try finding the route in $routes variable
		if ($Local:route -ne $null) {    # ROUTE EXISTS ALREADY			
			for ($Local:i = 0; $Local:i -lt $Script:routes.length; $Local:i++) {
				if (($Script:routes[$Local:i].Sender -eq $Local:Sender) -And ($Script:routes[$Local:i].Receiver -eq $Local:Receiver)) { # Find the route
					$Script:routes[$Local:i].MessageTypes += $Local:MsgType   # Add message type to the list
				}
			}			
		} else {		# ROUTE DOES NOT EXIST - ADD NEW ROUTE
			$Local:route = [pscustomobject]@{    # Create a new route
				Sender = $Local:Sender
				Receiver = $_
				MessageTypes = @( )
				ProcessingIds = $Script:default_processing_ids
			}
			$Local:route.MessageTypes += $Local:MsgType
			$Script:routes += $Local:route
		}		
	}	
}

# Change message types from array to a string delimited by hyphens
for ($Local:i = 0; $Local:i -lt $Script:routes.length; $Local:i++) {
	$Script:routes[$Local:i].MessageTypes = $Script:routes[$Local:i].MessageTypes -Join '-'
}

$Script:routes | Export-Csv -Path $Script:out_file -NoTypeInformation -Force

# SIG # Begin signature block
# MIIFoQYJKoZIhvcNAQcCoIIFkjCCBY4CAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQU0kFRzX8ruC1DtuQwaFCHoFxC
# t1igggM2MIIDMjCCAhqgAwIBAgIQeW+lf5ctUqFN7JPdjCn+0jANBgkqhkiG9w0B
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
# HAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwIwYJKoZIhvcNAQkEMRYEFIn2
# oxM3B8WeeoH7aBBbEl0ui3ZUMA0GCSqGSIb3DQEBAQUABIIBALJfCZEw3qUsi7Nm
# Cdb4WWnlcYPDQ3L7zIX+84LgCi6a6xWD/fbFl2n7ljibd0Ffrm97zxvgtwQg4oiX
# BmoQQ9M3nxshWd9OFi3GOMZmRLG9PuG+UoiW7Aq4uT+N/CJvZhtFT+z7i4JxjMVV
# 6bHpPZbAFbNjmsRhlU64p9f3KlB0KApbLNGlkmSfRhm2NgBVP98YT2x/il2bTAAA
# 5XZjxcCwXX3xQnbC0U9xIr2D9+yFVzmnU3S83/IWXnZ/UObAWFrok8r6Ekw3AArA
# XTFlVePtEd77GmRq8Xen6ivGWPcaV+NiFGqxM62jt5U2uH6wjMVE7j1jERGQ1kQ/
# dsVoZkk=
# SIG # End signature block
