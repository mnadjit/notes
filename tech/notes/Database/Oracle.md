# Oracle Instant Client
## Download and install Oracle Instant-Client
1. From [Oracle website](https://www.oracle.com/database/technologies/instant-client/downloads.html)
  * Download and unzip the following package: `Instant Client Package - Basic`
  * Download and unzip the following package: `Instant Client Package - ODBC` of the same version
2. In Windows the Basic package has dependency on a certain version of [Microsoft Visual Studio Redistributable](https://support.microsoft.com/en-us/help/2977003/the-latest-supported-visual-c-downloads). Make sure it's installed.
3. Add files from the `ODBC` package into the same folder as `Basic` and that folder would be the installation folder.
4. Move the installatin folder to a proper location e.g. `C:\instantclient` or `C:\Oracle\instantclient_12_2`
5. Run `odbc_install.exe` with admin rights and make sure it installs successfully.
6. Add the installation folder path to `PATH` environment variable. 
7. Create a new environment named `TNS_ADMIN` which also points to where the `tnsname.ora` file is stored e.g. the installation path.
8. For simplicity, add `tnsnames.ora` file which contains datasource connection strings in to the same folder
The following link explains the process: https://www.oracle.com/database/technologies/releasenote-odbc-ic.html

- `tnsnames.ora` file template:
```
DATASOURCE_NAME =
  (DESCRIPTION= Description goes here
    (ADDRESS=(PROTOCOL=TCP)(HOST=<hostname/IP>)(PORT=<port_number>))
  (CONNECT_DATA=
    (SERVER=DEDICATED)
    (SERVICE_NAME=<name_of_the_service_to_connect_to>)
  )
 )

```

## ODBC Configuration
1. Run ODBC on a 64-bit Windows machine from following paths:
  - 32 bit: `%systemroot%\SysWOW64\odbcad32.exe`
  - 64 bit: `%systemroot%\system32\odbcad32.exe`
2. Under `Drivers` tab make sure `Oracle in <instllation_folder_name>` has appeared
3. Under `System DSN` or `User DSN` depending on the preferred scope, click on `Add...` 
4. Select the Oracle driver
5. Click on `TNS Service Name` dropdown and select the desired connection. Options appearing here are being populated from `tranames.ora` file.
6. Add User ID and click on `Test Connection`
7. A password prompt should show up. Enter the password and make sure the whole setting has been okay.
8. Click `Ok` to add the ODBC datasource. Applications using ODBC should be able to use the DSN now.

## Oracle SQL Developer application
- Download from [Oracle website](https://www.oracle.com/tools/downloads/sqldev-downloads.html)

## DBVisualizer (a database client application)
- Make sure `TNS_ADMIN` environment variable is pointing to the folder containing tnsnames.ora with connection strings
### Tools -> Tool Properties -> General -> Java VM Properties
  - Specify overriden Java VM Properties here:
    - `-Doracle.net.tns_admin=$folder_containing_tnsnames.ora`
### Add Driver if the avilable ones are not compatiable
- `Tools` > `Driver Manager` > `Oracle Thin` 
- Highlight and duplicate and rename it
- Remove all .jar files  
- Point to the file `ojdbc6.jar` in the installation folder
### Use *Connection Wizard* to create a new connection
  - Add custom *Name* and *Notes*
  - Driver (JDBC): Pick the new driver created above
  - Connection Type: `Service`
  - Database Server: `$server.domain`
  - Database Port: `$port`
  - Service: `$ServiceName`
  - Database Userid: `$username`
  - Database Password: `$password`
  - Permission Mode: Development / Production

## Sample connection string
$Alias =
  (DESCRIPTION=
    (ADDRESS=(PROTOCOL=TCP)(HOST=$server_domain)(PORT=$port))
    (LOAD_BALANCE=yes)
    (CONNECT_DATA=
      (SERVER=DEDICATED)
      (SERVICE_NAME=$serviceName)
      (FAILOVER_MODE=(TYPE=SELECT)(METHOD=BASIC)(RETRIES=180)(DELAY=5))
    )
  )

# ODBC set up
## Set up ODBC connection 
- use case: e.g. a dotnet app requires connectivity to an Oracle database
- Not required for DBVisualizer or SQL Developer
### Launch *ODBC Data Sources* using `odbcad32.exe`
- 64-bit in "C:\Windows\system32"
- 32-bit in "C:\Windows\syswow64"
### Add a connection
- Under `User DSN` or `System DSN` click Add
- Pick the Oracle driver that got installed before
  - **Data Source Name**: Name the connection
  - **Description**: Name the connection
  - **TNS Service Name**: Alias in the connection string
  - **User ID**: $username
- Click on `Test Connection`
  - Once prompted enter the password
- Click OK