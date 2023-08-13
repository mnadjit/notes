# Get all UR numbers in iPM to MediRecords failed messages downloaded in the current folder.
param(
	[Parameter(Mandatory=$true)] [String] $error_msg_dir_path
)

if (-Not(Test-Path $error_msg_dir_path)) {
	Write-Host -NoNewLine -ForegroundColor Gray -BackgroundColor DarkRed "[Error]"
	Write-Host -ForegroundColor DarkRed " Failed to find a zip file or folder at following path $error_msg_dir_path"
	EXIT
}

$Script:in_dir_path = $error_msg_dir_path

if ((Get-ChildItem $error_msg_dir_path).Extension -eq '.zip') {
    $local:zip_file_name = (dir $error_msg_dir_path).BaseName
    $local:zip_file_parent = (dir $error_msg_dir_path).Directory.FullName
    $in_dir_path = Join-Path $zip_file_parent $zip_file_name
    Expand-Archive -LiteralPath $error_msg_dir_path -DestinationPath $in_dir_path
    Get-ChildItem $in_dir_path | % { 
        if ($_.Extension -ne '.zip') { mv $_ "$($_).hl7" } 
    } 
}
elseif ((Get-Item $error_msg_dir_path) -isnot [System.IO.DirectoryInfo]) {
    Write-Warning 'Path should be either a folder or a zip file!'
}

$local:urs = @()
$local:report = @()

dir $in_dir_path | % { 
	$local:file_content = gc $_ -Raw
    try {
        $local:json_obj = $file_content | ConvertFrom-Json
        $ur = $json_obj.troubleshooting.NH_UR
        
    }
    catch {
        #Write-Warning "Failed to parse file content as JSON"
        if ($file_content.Substring(0,3) -eq 'MSH') {
            $ur = $([regex]::Match($file_content, 'PID\|.*?\|.*?\|(\d{7})\^').Groups[1].Value)
            $report += [pscustomobject]@{ ur=$ur; error_code=""; error_desc="Patient look-up failed" } 
            if ($urs -notcontains $ur) { $urs += $ur }
        }      
    }
	if ($urs -notcontains $ur) { 
        $urs += $ur
        if (($json_obj -ne $null) -And ($json_obj.response -ne $null) -And ($json_obj.response.issue -ne $null)) { 
            $report += [pscustomobject]@{ ur=$ur; error_code=$json_obj.response.issue[0].code; error_desc=$json_obj.response.issue[0].diagnostics } 
        } else { $report += [pscustomobject]@{ ur=$ur; }  }
    } 
}

$report