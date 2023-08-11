```PowerShell
Set-Location C:\

$Host.UI.RawUI.WindowTitle = "PowerShell " + $PSVersionTable.PSVersion.ToString() + " (Admin)"

Set-Alias npp 'C:\Program Files\Notepad++\notepad++.exe'
Set-Alias azcopy 'D:\Tools\azcopy\azcopy.exe'

function Add-Path($Path, $Scope) {
    $Path = [Environment]::GetEnvironmentVariable("PATH", $Scope) + [IO.Path]::PathSeparator + $Path
    [Environment]::SetEnvironmentVariable( "PATH", $Path, $Scope )
}

Clear

```