<#
	Create Date:	2022-02-23
	Author:			Mehdi N Tehrani <mehdi.tehrani@nh.org.au; m.nadji.t@gmail.com>
	Purpose:		
	Overview:		Retreive a list of 
	Usage:			???
#>

# [Define Constants - Initialise Variables]
$config = Get-Content '.\config.json' | Out-String | ConvertFrom-Json

$Script:sql_statement_filepath = 				$config.sql_statement_filepath
$Script:urs_csv_filepath = 						$config.urs_csv_filepath
$Script:dsu_db_server = 						$config.dsu_db_server
$Script:dsu_db_name = 							$config.dsu_db_name
$Script:reslab_db_server = 						$config.reslab_db_server
$Script:reslab_db_name = 						$config.reslab_db_name
$Script:out_filename = 							$config.out_filename
$Script:batch_size = 							[int]$config.batch_size

# [Define Functions]


<# -----------------------------
[SCRIPT - START]
----------------------------- #>

# Get Reslab patient NH UR numbers from ResLab database
$Script:get_reslab_urs_sql_query = "SELECT DISTINCT [ur] FROM [ResLabDB_Heavy_V2].[dbo].[pas_pt_ur_numbers] WHERE ur_hsid='1280' --AND ur_status='primary'"

$Script:all_urs = Invoke-Sqlcmd -ServerInstance $Script:reslab_db_server -Database $Script:reslab_db_name -Query $Script:get_reslab_urs_sql_query 

$Script:sw = [Diagnostics.Stopwatch]::StartNew()

# For every x number of URs
$Local:processed_urs_count = 0
while ($Local:processed_urs_count -lt $Script:all_urs.Count) {
	"Processing URs: " + ($Local:processed_urs_count + $Script:batch_size) + " / " + $Script:all_urs.Count
	# Build a batch of UR numbers to be passed as a parameter into the sql statement
	$Local:ur_batch = ($Script:all_urs | Select-Object -First $Script:batch_size -Skip $Local:processed_urs_count | % { "'{0}'" -F $_.ur }) -join ","
	
	$Local:ur_batch | Out-File ("urs_" + $Script:out_filename)
	
	# Run the sql statement to retreieve pateint demographics for each batch of URs
	$Local:sql_statement = (Get-Content $Script:sql_statement_filepath | Out-String).replace("'PLACEHOLDER'", $Local:ur_batch)	
	$Script:demogs_for_ur_batch = Invoke-Sqlcmd -ServerInstance $Script:dsu_db_server -Database $Script:dsu_db_name -Query $Local:sql_statement

	# Add retrieved data into the output CSV file which eventually will contain all patient demographics for all ResLab UR numbers
	$Script:demogs_for_ur_batch | Export-Csv -Append $Script:out_filename -Delimiter "," -NoTypeInformation

	$Local:processed_urs_count += $Script:batch_size
	
	if ($Local:processed_urs_count -gt 300) { break }
}
	
$Script:sw.Stop()
"Query took " +  [int]$Script:sw.Elapsed.TotalSeconds + " seconds to complete"

<# -----------------------------
[SCRIPT - END]
----------------------------- #>