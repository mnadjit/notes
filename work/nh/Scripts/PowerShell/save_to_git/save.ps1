$script:cur_dir = (Get-Location)

$script:args | % {
	cd $_
	echo "`nUploading to origin from path: $($_)`n"
	git add --all
	git commit -am "updated"
	git push --all --force
}

cd $cur_dir
