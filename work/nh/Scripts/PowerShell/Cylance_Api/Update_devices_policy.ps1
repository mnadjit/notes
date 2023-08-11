param (
    [Parameter(Position=0,Mandatory,HelpMessage="Input File CSV Path")][String]$in_file_csv_path,
    [Parameter(Position=1,Mandatory,HelpMessage="Target Policy Name")][String]$target_policy_name
)

function New-JwtToken {
    # generate uuid as jti (JWT Token Id)
    $Local:jti = (New-Guid).Guid
    # Get timestamp in seconds
    $Local:current_timestamp = [Int32](Get-Date -UFormat %s)
    # prepare header section
    $Local:jwt_header = [ordered]@{ "typ"="JWT"; "alg"="HS256"  }
    # prepare data section
    $Local:jwt_body = [ordered]@{
        "sub"= (Read-Host -Prompt "App Id" -MaskInput)
        "tid"= (Read-Host -Prompt "Tenant Id" -MaskInput)
        "iat"= $current_timestamp
        "exp"= $current_timestamp + 60
        "iss"= $jwt_issuer
        "jti"= $jti
    }
    # encode header and body
    $Local:jwt_header_json = $jwt_header | ConvertTo-Json -Compress
    $Local:jwt_header_bytes = [Text.Encoding]::UTF8.GetBytes($jwt_header_json)
    $Local:jwt_header_b64 = [Convert]::ToBase64String($jwt_header_bytes, [Base64FormattingOptions]::None).Replace('+', '-').Replace('/', '_').Replace("=", "")

    $Local:jwt_body_json = $jwt_body | ConvertTo-Json -Compress
    $Local:jwt_body_bytes = [Text.Encoding]::UTF8.GetBytes($jwt_body_json)
    $Local:jwt_body_b64 = [Convert]::ToBase64String($jwt_body_bytes, [Base64FormattingOptions]::None).Replace('+', '-').Replace('/', '_').Replace("=", "")

    # generate new token
    $Local:token = "$($jwt_header_b64).$($jwt_body_b64)"

    # sign token
    $hs = New-Object System.Security.Cryptography.HMACSHA256
    $Local:app_secret = (Read-Host -Prompt "App Secret" -MaskInput)
    $hs.key = [Text.Encoding]::UTF8.GetBytes($app_secret)
    $Local:app_secret_hash = $hs.ComputeHash([Text.Encoding]::UTF8.GetBytes($token))
    $Local:signature = [Convert]::ToBase64String($app_secret_hash,[Base64FormattingOptions]::None).Replace('+', '-').Replace('/', '_').Replace("=", "")

    # build authentication token
    return "$($token).$($signature)"
}

if (-Not(Test-Path $in_file_csv_path)) { Write-Error "Input CSV file not found at path: $($in_file_csv_path)"; EXIT  }

$Local:config_file_path = "./config.json"
if (-Not(Test-Path $config_file_path)) { Write-Error "Config file not found at path: $($config_file_path)"; EXIT  }

# get configuration from config.json file in the same directory as the script
$Script:config = Get-Content $config_file_path -Encoding utf8 | ConvertFrom-Json
$Script:base_url = $config.base_url
$Script:domain = $config.domain
$Script:jwt_issuer = $config.jwt_issuer

$Script:out_file_csv_path = "$($in_file_csv_path.replace('.csv',''))_updated.csv"

$Script:headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Accept", "application/json")
$headers.Add("Content-Type", "application/json")

function Get-AccessToken {
    # build authentication token
    $Local:auth_token = New-JwtToken

    # Make call to Cylance API to retrieve access token
    $Local:body = "{ `"auth_token`": `"$($auth_token)`" }"

	try {
		$response = Invoke-RestMethod "$($base_url)/auth/v2/token" -Method 'POST' -Headers $headers -Body $body
        return $response.access_token
	} catch {
		Write-Error "API call to retrieve Authentication Token failed"
		Write-Host "StatusCode:" $_.Exception.Response.StatusCode.value__
		Write-Host "StatusDescription:" $_.Exception.Response.StatusDescription
		Exit
	}
}

function Get-TargetPolicyId {
	try {
        $Local:url = "$($base_url)/policies/v2?page=1&page_size=100"
		$response = Invoke-RestMethod $url -Method 'GET' -Headers $headers
        if ($response.page_items.length -eq 0) { Write-Error "API call was successful, but no policies were returned from API"; EXIT }
        $Local:policy = $response.page_items | Where-Object { $_.name -eq $target_policy_name }
        if ($null -eq $policy) { Write-Error "No policy was found with name $($target_policy_name)"; Exit }
        return $policy.id
	} catch {
		Write-Error "API call to retrieve Policy id for policy name failed"
		Write-Host "StatusCode:" $_.Exception.Response.StatusCode.value__
		Write-Host "StatusDescription:" $_.Exception.Response.StatusDescription
		Exit
	}
}

$Script:access_token = Get-AccessToken
$headers.Add("Authorization", "Bearer $($access_token)")

$Script:target_policy_id = Get-TargetPolicyId

$Script:devices_hostnames = (import-csv $in_file_csv_path).Name
$Script:devices_details = @()

$devices_hostnames | Foreach-Object {
	try {
		$response = Invoke-RestMethod "$($base_url)/devices/v2/hostname/$($_).$($domain)" -Method 'GET' -Headers $headers
	} catch {
		Write-Error "API call to get device details for hostname failed for $($_).$($domain)"
		Write-Host "StatusCode:" $_.Exception.Response.StatusCode.value__
		Write-Host "StatusDescription:" $_.Exception.Response.StatusDescription
		Exit
	}

  if (-not($response -is [array])) { $response = @($response)  }

  $response | Foreach-Object {
    $devices_details += @{
	  "device_id" = $_.id
	  "device_name" = $_.name
      "policy_id" = $_.policy.id
	  "policy_name" = $_.policy.name
    }
  }
}

#for ($Local:i = 0; $i -lt 1; $i++) {
for ($Local:i = 0; $i -lt $devices_details.Length; $i++) {
	#if ($devices_details[$i].policy_name -ne 'Default') { continue; }

    $body = "{ `"name`": `"$($devices_details[$i].device_name)`", `"policy_id`": `"$($target_policy_id)`" }"

	try {
		$response = Invoke-RestMethod "$($base_url)/devices/v2/$($devices_details[$i].device_id)" -Method 'PUT' -Headers $headers -Body $body
	} catch {
		Write-Host "Update device call failed for $($devices_details[$i].device_name)"
		Write-Host "StatusCode:" $_.Exception.Response.StatusCode.value__
		Write-Host "StatusDescription:" $_.Exception.Response.StatusDescription
		Exit
	}

	$devices_details[$i].updated_policy_name = $target_policy_name
	$devices_details[$i].updated_policy_id = $target_policy_id

    Write-Host "$($devices_details[$i].device_name)`t updated"
}

$devices_details | Export-Csv -Path $out_file_csv_path
