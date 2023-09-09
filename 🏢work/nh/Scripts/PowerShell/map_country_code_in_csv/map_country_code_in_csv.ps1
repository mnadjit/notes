<#
	Create Date:	2022-10-06
	Author:			Mehdi N Tehrani <mehdi.tehrani@nh.org.au; m.nadji.t@gmail.com>
	Purpose:		
    Usage:			pass the csv file that holds the data to be processed as the first argument
                    the second argument is the mapping file in csv format  which is optional and default path 
                        'c:/MyFiles/Scripts/PowerShell/map_country_code_in_csv/country_code_mapping.csv' is used if no argument is provided
#>

$script:chunck_size = 100

function ReadDataAndWriteToCsv ($csv_obj, $out_filepath) {
    # Get each row and update country code from HL7 code to ISO 3166 code
    $script:csv_row_count = $csv_obj.Count
    for($local:i = 0; $i -lt $csv_row_count ; $i++ ) {
        #Write-Host -ForegroundColor DarkGray "...processing row $i  from  $csv_row_count rows"

        $local:hl7_country_code = $csv_obj[$i].HOMEADDRESSCOUNTRY
        $local:country = $country_mapping_obj | Where-Object HL7_Code -eq $hl7_country_code | Select -First 1
    
        if ($local:country -ne $null) { $csv_obj[$i].HOMEADDRESSCOUNTRY = $local:country.ISO_3166_Numeric_Code }
        elseif ($local:hl7_country_code -ne '') { $csv_obj[$i].HOMEADDRESSCOUNTRY >> $out_unmapped_countries }
    }

    # Export csv data into a csv file
    $csv_obj | Export-Csv -Path $out_filepath -NoTypeInformation -Append -Delimiter '|' -UseQuotes Never
}

# handle input files
$script:input_file_path = $args[0]
$script:country_code_map_csv = './country_code_mapping.csv'
if ($args.Count -eq 2) { $country_code_map_csv = $args[1] }

# get input file name (w/o ext) and folder path
$script:in_filename = (Get-Item $input_file_path).BaseName
$script:folderpath = Split-Path $input_file_path -Parent

# build output file path and log unmapped countries
$script:out_filepath = (Join-Path $folderpath $in_filename) + '_mapped.psv'
$script:out_unmapped_countries = Join-Path $folderpath "error_unmapped_countries.csv"

# delete output files if exist
if (Test-Path -Path $out_filepath) { Remove-Item -Path $out_filepath }
if (Test-Path -Path $out_unmapped_countries) { Remove-Item -Path $out_unmapped_countries }

# Read csv file which contains country code mapping
$script:country_mapping_obj = Get-Content -Path $country_code_map_csv | ConvertFrom-Csv

# Read source csv file
$script:csv_headers = (Get-Content -Path $input_file_path -First 1).Replace('"','').Split(',')

$script:processed_count = 0
$script:csv_file_all = Get-Content -Path $input_file_path

while ($True) {
    $script:csv_obj = $csv_file_all | Select -Skip 1 | Select -First $chunck_size -Skip $processed_count | ConvertFrom-Csv -Header $csv_headers
    if ($script:csv_obj.Count -eq 0) { break; }
    ReadDataAndWriteToCsv $csv_obj $out_filepath
    $processed_count += $chunck_size
    Write-Host -ForegroundColor DarkGray "Number of rows processed: $processed_count"
}