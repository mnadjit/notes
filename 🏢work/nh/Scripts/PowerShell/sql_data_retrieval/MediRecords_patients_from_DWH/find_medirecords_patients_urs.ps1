<#
	Create Date:	2022-02-23
	Author:			Mehdi N Tehrani <mehdi.tehrani@nh.org.au; m.nadji.t@gmail.com>
	Purpose:		
	Overview:		Retreive a list of patients from iPM
	Usage:			???
#>

# [Define Constants - Initialise Variables]
$config = Get-Content './config.json' | Out-String | ConvertFrom-Json

$Script:sql_statement_filepath = 				$config.sql_statement_filepath
$Script:medirecords_csv_filepath = 				Join-Path -Path $(Get-Location) $config.in_filename
$Script:dsu_db_server = 						$config.dsu_db_server
$Script:dsu_db_name = 							$config.dsu_db_name
$Script:out_file_path = 						Join-Path -Path $(Get-Location) $config.out_filename
$Script:batch_size = 							[int]$config.batch_size

# [Define Functions]

<# -----------------------------
[SCRIPT - START]
----------------------------- #>

{} | SELECT "order","MR_pat_guid","iPM_UR","MR_Surname","iPM_Surname","MR_Firstname","iPM_Firstname","MR_dob","iPM_dob","MR_Sex","iPM_Sex","MR_Medicare","iPM_Medicare" | Export-Csv $out_file_path -Delimiter "," -NoTypeInformation

$Script:mr_data = Import-Csv $medirecords_csv_filepath

$Script:sw = [Diagnostics.Stopwatch]::StartNew()

for ($i=0; $i -le $mr_data.length; $i++) {
    $Local:mr_row = $Script:mr_data[$i]

    if ($mr_row.LASTNAME -eq $null -or $mr_row.FIRSTNAME -eq $null -or $mr_row.DOB -eq $null) { 
        @{"order"=$i+1;"MR_pat_guid"=$mr_row.PATIENTGUID;"MR_Surname"=$mr_row.LASTNAME; "MR_Firstname"=$mr_row.FIRSTNAME; "MR_dob"=$mr_row.DOB; "MR_Sex"=$mr_row.SEX;"MR_Medicare"=$mr_row.MEDICARE} | Export-Csv -Append $out_file_path -Delimiter "," -NoTypeInformation
        continue 
    }
    $Local:mr_lastname = $mr_row.LASTNAME.replace('''', "''")
    $Local:mr_firstname = $mr_row.FIRSTNAME.replace('''', "''")
    $Local:mr_dob = $mr_row.DOB

    $Local:sql_statement = "SELECT pat.PASID AS iPM_UR, pat.SURNAME as iPM_Surname, pat.MEDICARE_FORENAME as iPM_Firstname, LEFT(pat.DATE_OF_BIRTH, 10) AS iPM_dob, rv.DESCRIPTION AS iPM_Sex, pid.IDENTIFIER AS iPM_Medicare `
                            FROM PATIENTS pat `
                            LEFT JOIN PATIENT_IDS pid ON pid.PATNT_REFNO = pat.PATNT_REFNO AND pid.PITYP_REFNO='11548' AND pid.END_DTTM IS NULL `
                            LEFT JOIN REFERENCE_VALUES rv ON rv.RFVDM_CODE='SEXXX' AND pat.SEXXX_REFNO = rv.RFVAL_REFNO `
                            WHERE pat.SURNAME = '$($mr_lastname)' AND pat.MEDICARE_FORENAME = '$($mr_firstname)' AND LEFT(pat.DATE_OF_BIRTH, 10) = '$($mr_dob)' AND pat.ARCHV_FLAG = 'N' AND pat.MERGE_MINOR_FLAG = 'N'"

    $Local:ipm_data = Invoke-Sqlcmd -ServerInstance $dsu_db_server -Database $dsu_db_name -Query $sql_statement

    if ($ipm_data -eq $null) {
        @{"order"=$i+1;"MR_pat_guid"=$mr_row.PATIENTGUID;"iPM_UR"="";"MR_Surname"=$mr_row.LASTNAME;"iPM_Surname"="";"MR_Firstname"=$mr_row.FIRSTNAME;"iPM_Firstname"="";"MR_dob"=$mr_row.DOB;"iPM_dob"="";"MR_Sex"=$mr_row.SEX;"iPM_Sex"="";"MR_Medicare"=$mr_row.MEDICARE;"iPM_Medicare"=""} | Export-Csv -Append $out_file_path -Delimiter "," -NoTypeInformation
        continue;
    }

    $ipm_data | Add-Member order $i+1
    $ipm_data | Add-Member MR_pat_guid $mr_row.PATIENTGUID
    $ipm_data | Add-Member MR_Surname $mr_row.LASTNAME
    $ipm_data | Add-Member MR_Firstname $mr_row.FIRSTNAME
    $ipm_data | Add-Member MR_dob $mr_row.DOB
    $ipm_data | Add-Member MR_Sex $mr_row.SEX
    $ipm_data | Add-Member MR_Medicare $mr_row.MEDICARE

    $ipm_data | Export-Csv -Append $out_file_path -Delimiter "," -NoTypeInformation
}


$sw.Stop()
"Query took " + [int]$sw.Elapsed.TotalSeconds + " seconds to complete"

<# -----------------------------
[SCRIPT - END]
----------------------------- #>