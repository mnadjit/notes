---
alias:
tags: powershell pwsh locked_file content_search zip compress unzip uncompress drives environment_variables env
---

```PowerShell
# Shorthand commands
Get-ChildItem | ? {} # Where {}
Get-ChildItem | % {} # ForEach {}
```

```PowerShell
# find command
Get-Command -Name '*name*'
```

```PowerShell
# find the path to an executable file in PATHS env variable
where.exe $executable_file_path
```

## Find File locked by a process 
```PowerShell
# Find which process has a lock on a directory or file
Get-WmiObject Win32_Process | ? {$_.commandLine -like "*file_dir_name*"}
```

```PowerShell
Get-Process | %  { $pr_var = $_; $_.Modules | % { if ($_.filename -like '*file_dir_name*') { "$($pr_var.Name)`tPID: $($pr_var.Id)" } } }
```

## Content Search
```PowerShell
# Content search in a certain path
Select-String -Path ./ -Pattern 'text'
```

## Create Folder if missing
```PowerShell
# If folder not exists, create it
if (-Not (Test-Path $dir_path)) { md $dir_path }
```

## Zip Files
```PowerShell
# Unzip a compressed file
Expand-Archive $in_file -DestinationPath $out_dir
Compress-Archive -Path $path_to_files_or_folder -DestinationPath $out_zip_file
```

```PowerShell
# Get timezone code from its id
$tz_code = ((Get-TimeZone).id.split(' ') | % { $_[0] }) -join ''
```

```PowerShell
# Install Winget
Add-AppxPackage ./Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
```

## Environment Variables
```PowerShell
# Environment Variable
[Environment]::GetEnvironmentVariable($var_name, $scope)
[Environment]::SetEnvironmentVariable($var_name, $value, $scope)
# Examples
[System.Environment]::GetEnvironmentVariable('path', 'm')
[System.Environment]::GetEnvironmentVariable('path', 'machine')
[System.Environment]::GetEnvironmentVariable('path', 'u')
[System.Environment]::GetEnvironmentVariable('path', 'user')
ls Env:\path

# Add to PATH Environment Variable
function Add-Path($Path, $Scope) {
    $Path = [Environment]::GetEnvironmentVariable("PATH", $Scope) + [IO.Path]::PathSeparator + $Path
    [Environment]::SetEnvironmentVariable( "PATH", $Path, $Scope)
}
```

## Uninstall Apps
```PowerShell
Get-Package -Provider Programs | ? { $_.Name -like '*app_name*' }
	Uninstall-Package -Name $app_name

$app = Get-CimInstance -ClassName Win32reg_AddRemovePrograms | Select-Object -Property DisplayName | Sort-Object -Property DisplayName

$app.Uninstall()
```

## Drives
```powershell
Get-PsDrive -PsProvider filesystem
```

