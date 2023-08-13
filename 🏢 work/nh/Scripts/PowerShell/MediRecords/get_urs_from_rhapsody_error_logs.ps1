# Get all UR numbers in iPM to MediRecords failed messages downloaded in the current folder.
param(
	[Parameter(Mandatory=$true)] [String] $error_logs_dir_path
)

if (-Not(Test-Path $error_logs_dir_path) -Or 
	(Get-ChildItem $error_logs_dir_path -Filter iPM_ADT_Error_*.csv | Measure-Object).Count -eq 0) {
	Write-Host -NoNewLine -ForegroundColor Gray -BackgroundColor DarkRed "[Error]"
	Write-Host -ForegroundColor DarkRed "`n      Failed to find a directory at following path $error_logs_dir_path or contains no eligible csv files"
	EXIT
}

$error_logs_out_file = Join-Path $error_logs_dir_path "error_logs_$(Get-Date -Format 'yyyyMMdd_HHmmss').csv"
$local:report = @()

Get-ChildItem $error_logs_dir_path -Filter iPM_ADT_Error_*.csv | ForEach-Object {
	$local:csv_file_content = Get-Content -Encoding Utf8 -Path $_.FullName
	
	# Get report header from the first file
	if ($report.Length -eq 0) { $report = ($csv_file_content | Select-Object -First 1) + "`n" }
	
	$report += ($csv_file_content | Select-Object -Skip 1) + "`n"
}

$local:csv_object = ConvertFrom-Csv $report | Sort-Object URNumber

$local:csv_object_duplicates_removed = @()

# Remove duplicates
for ($Local:i = 0; $i -lt $csv_object.Length ; $i++) {
	if ($i -eq 0 -Or 
		($csv_object[$i].URNumber -ne $csv_object[$i - 1].URNumber) -Or
		($csv_object[$i].URNumber -eq $csv_object[$i - 1].URNumber -And $csv_object[$i].Error -ne $csv_object[$i - 1].Error)) {
		$csv_object_duplicates_removed += $csv_object[$i]
	}
}

$csv_object_duplicates_removed | Format-Table

# [Optional] Export to a csv file
#$csv_object_duplicates_removed | Export-Csv -Path $error_logs_out_file -Encoding Utf8