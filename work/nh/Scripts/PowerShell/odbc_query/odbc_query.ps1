<#
    Purpose:        Retrieve data using an ODBC connection from iPM database. This makes a call to the stored proce
    Create Date:    2022-05-25
    Author:         Mehdi N Tehrani <mehdi.tehrani@nh.org.au; m.nadji.t@gmail.com>
#>

# [Define Constants - Initialise Variables]
$config = Get-Content '.\config.json' | Out-String | ConvertFrom-Json

$Script:dsn = 				$config.ODBC_DSN_Name
$Script:odbc_driver =       $config.Driver_Name

<# -----------------------------
[SCRIPT - START]
----------------------------- #>

# Script Usage explained to the user
if ($args.Count -ne 3) {
  Write-Host
  Write-Host "------------------------------------------------------------------------"
  Write-Host "script usage:"
  Write-Host "          .\odbc_query.ps1 <start_date> <end_date> <connection_password>"
  Write-Host "Example:"
  Write-Host "          .\odbc_query.ps1 "24/05/2022" "25/05/22" "my_secure_password""
  Write-Host "------------------------------------------------------------------------"
  EXIT
}

$start_date=$args[0]
$end_date=$args[1]
$dsn_pwd=$args[2]

# $odbc_driver = (Get-OdbcDriver | Where { $_.name -like 'Oracle*' -AND $_.platform -eq '64-bit' }).Name | Select-Object -First 1

$sql_query="DECLARE v_rec globalpkg.RCT1; BEGIN OHIS_NH_OUT036_BookingData('$start_date','$end_date',v_rec); dbms_sql.return_result(v_rec); END;"

$odbc_conn = New-Object System.Data.Odbc.OdbcConnection
$odbc_conn.connectionstring = "Provider=System.Data.OracleClient;{Driver=$odbc_driver};DSN=$dsn;pwd=$dsn_pwd"
$odbc_conn.open()
$sql_cmd = new-Object Data.Odbc.OdbcCommand($sql_query, $odbc_conn)
$sql_da = New-Object system.Data.odbc.odbcDataAdapter($sql_cmd)
$sql_ds = New-Object system.Data.DataSet($sql_da)
$sql_da.Fill($sql_ds) | out-null
$odbc_conn.close()

$record_count = ($sql_ds.Tables[0].URNumber | Measure-Object).Count
Write-Host
if ($record_count -le 1000) { $sql_ds.Tables[0] | Select-Object -Property URNumber, @{ Name='AppointmentID'; Expression = { [string] $_.AppointmentID } },
        AppointmentDate, AppointmentTime, SiteCode, SiteName, Location, ClinicCode, ClinicName, FirstName, Surname, Gender | ogv -Title "Appointments from $start_date to $end_date"}
Write-Host
Write-Host "Number of records found:" $record_count
Write-Host

<# -----------------------------
[SCRIPT - END]
----------------------------- #>