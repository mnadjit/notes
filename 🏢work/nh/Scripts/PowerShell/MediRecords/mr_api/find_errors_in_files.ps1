# Find String in files
dir *.json | Where { $(gc $_ -Encoding UTF8) -like '"9988"' }

# Misc Erros:
dir *.json | % { $f = $_; $j = ConvertFrom-Json (gc $_ -Encoding UTF8); if ($j.request_url -eq $null -And $j.response.issue -ne $null) { $j.request.identifier | % { if ($_.system -eq "urn:uuid:1bac2669-297c-4164-a468-6349cf855df2") { ECHO "$($j.request.meta.lastUpdated.ToString("yyyy-MM-dd HH:mm:ss")),$($f),$($j.request.id),$($_.value),`"$($j.response.issue[0].diagnostics)`"" | Out-File -Append -Encoding utf8 -FilePath ../errors.csv } } } }


# Duplicates:
dir *.json | % { $j = ConvertFrom-Json (gc $_ -Encoding UTF8); if ($j.request_url -ne $null -And $j.error.resourceType -eq "Bundle") { $j.error.entry[0].resource.identifier | % { if ($_.system -eq "urn:uuid:1bac2669-297c-4164-a468-6349cf855df2") { ECHO "$($j.error.meta.lastUpdated.ToString("yyyy-MM-dd HH:mm:ss")),$($f),,$($_.value),duplicate=$($j.error.total)" | Out-File -Append -Encoding utf8 -FilePath ../errors.csv } } } }