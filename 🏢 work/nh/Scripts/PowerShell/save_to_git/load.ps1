$script:cur_dir = (Get-Location)

$script:args | % {
	cd $_
	echo "`nDownloading from origin into path: $($_)`n"
	git fetch --all
	git reset --hard origin/main
	git pull --force
}

cd $cur_dir
