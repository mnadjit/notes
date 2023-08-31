
---
alias: Azure Copy 
tags: tech cloud microsoft azure azcopy azure_copy storage azure_blob blob 
---

# references
- [Azcopy - MS Learn](https://learn.microsoft.com/en-us/azure/storage/common/storage-ref-azcopy?toc=%2Fazure%2Fstorage%2Fblobs%2Ftoc.json&bc=%2Fazure%2Fstorage%2Fblobs%2Fbreadcrumb%2Ftoc.json)
- [Create Service SAS - MS Learn](https://learn.microsoft.com/en-us/rest/api/storageservices/create-service-sas#service-sas-example)
# Download
- [Azure Github](https://github.com/Azure/azure-storage-azcopy/releases)
# Usage
- Parameters
	- `sv`: signed version
	- `st`: start time
	- `se`: expiration time
	- `sr`: resource; `b`: blob, `c`= container, `d`: directory, `f`: file, `s`: share 
	- `sdd`: directory depth e.g. `sdd=`
	- `sp`: permissions e.g. `sp=rw`
	- `si`: identifier (SAS token)
	- `sip`: IP range e.g.  `sip=10.1.1.1-10.2.2.2`
```PowerShell
# Stage variables
$sas_token = "YWJjZGVmZw%3d%3d&sig=dD80ihBh5jfNpymO5Hg1IdiJIEvHcJpCMiCMnN%2fRnbI%3d"
$my_account_name = "myaccount"
$dst_folder_path = "parent/subfolder"
$dst_my_filename = "my_file.png"

$url = "https://$($my_account).blob.core.windows.net/$($dst_folder_path)/$($dst_filename)?sv=2012-02-12&st=2009-02-09&se=2009-02-10&sr=c&sp=r&si=$($sas_token)"

$flags = "--properties `"LastModifiedTime, VersionId, BlobType, BlobAccessTier, ContentType, ContentEncoding, LeaseState, LeaseDuration, LeaseStatus`""

# List files
azcopy.exe list $url $flags --properties LastModifiedTime --log-level INFO

# Copy files
azcopy.exe copy $local_file_path $url
```
