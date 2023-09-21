$script:cur_dir = (Get-Location)

$script:args | % {
	cd $_
	echo "`nDownloading from origin into path: $($_)`n"
	git status
	Read-Host "Continue?"
	## git fetch --all
	## git reset --hard origin/main
	git pull
}

cd $cur_dir
