# Import Module
```PowerShell
Import-Module 'C:\Program Files (x86)\Microsoft Endpoint Manager\AdminConsole\bin\ConfigurationManager.psd1'
```

# Query SCCM "All Client Systems"
```PowerShell
# For a given list of hostnames, query SCCM 'All Client Systems', get more info for each host and export the result into a csv file
$hostname_list_filepath = 'C:/temp/hostname_list.csv'
$host_sites =  'C:/temp/device_site.csv'
$query_name = 'all client systems'
$device_list = gc $hostname_list_filepath -Encoding utf8; invoke-CMQuery -Name $query_name | ? { $device_list -contains $_.Name } | Select-Object -Property Name, ADSiteName | Export-Csv $host_sites -Encoding Utf8
```

# Reference
[Ultimate SCCM Query Collection List](https://www.andersrodland.com/ultimate-sccm-querie-collection-list/)
