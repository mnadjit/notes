$script:cur_dir = (Get-Location)

$script:args | % {
	cd $_
	Write-Host -ForegroundColor Yellow -BackgroundColor DarkBlue "`nDownloading from origin into path: $($_)"
	Write-Host "`n"
	
	git status
	
	Write-Host -ForegroundColor Yellow -BackgroundColor DarkBlue "Continue [y/N]?" -NoNewline
	Write-Host " " -NoNewline
	$Local:continue = (Read-Host).toLower()
	
	if ($Local:continue -eq 'y' -Or $Local:continue -eq 'yes') { git pull }
	
	## git fetch --all
	## git reset --hard origin/main
	## git pull
}

cd $cur_dir
