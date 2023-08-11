---
alias: 
tags: 
---

# Reference 
- [PNP Github](https://pnp.github.io/powershell/cmdlets/)
# Install Module
- `Install-Module PnP.PowerShell`

# Import Module
- `Import-Module PnP.PowerShell -DisableNameChecking`

# Connect to Site
- `Connect-PnPOnline 'https://mysite.sharepoint.com/sites/myteam'`

# Get folders and files
- `Get-PnPFolderItem -FolderSiteRelativeUrl $relative_path_to_file -ItemType Folder`
- `Get-PnPFolderItem -FolderSiteRelativeUrl $relative_path_to_file -ItemType File`
- `Get-PNPFile -Url $relateive_path_to_file`

# Copy files
- `Copy-PnPFile -SourceUrl $source_url -TargetUrl $target_url`
- `Copy-PnPFile -SourceUrl $source_url -TargetUrl $target_url -Overwrite -Force`

# Remove file
-  `Remove-PnPFile -SiteRelativeUrl $file_relative_url`

# Save file to local path
- `Copy-PnPFile -Url $file_url -AsFile -Path $local_folder -Filename $local_filename`

# Upload local file to site
- `Add-PnPFile -Path $file_path -Folder $relative_path_to_folder`

