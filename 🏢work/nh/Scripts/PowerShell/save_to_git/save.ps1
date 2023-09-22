$script:cur_dir = (Get-Location)

$script:args | % {
	cd $_
	echo "`nUploading to origin from path: $($_)`n"
	
	git status
	
	Write-Host -ForegroundColor Yellow -BackgroundColor DarkBlue "Continue [y/N]?" -NoNewline
	Write-Host " " -NoNewline
	$Local:continue = (Read-Host).toLower()
	
	if ($Local:continue -eq 'y' -Or $Local:continue -eq 'yes') { 
		git add --all
		git commit -am "updated"
		git push --all --force
	}
}

cd $cur_dir
