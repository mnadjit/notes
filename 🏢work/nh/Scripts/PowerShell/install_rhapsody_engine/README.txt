Install Rhapsody Engine (Unattended)

Purpose:
This script can be used to automate the process of installation of Rhapsody engine.

Preparation:
1. Copy response.dat file (found in rhapsody engine installation directory) into the 'rhapsody_config_files' directory.
2. Copy rhapsody.properties file (found in 'rhapsody' directory under rhapsody engine installation directory) into the 'rhapsody_config_files' directory.
3. Copy ldap.properties file from users directory (found in rhapsody data directory) 'rhapsody_config_files' directory.
4. Copy the TLS certificate into a the 'Certificate' directory under 'rhapsody_config_files' directory. The script will copy this directory into rhapsody engine installation directory. The following keys in rhapsody.properties file should point to full path of the cerficiate file. 
	AdministrationManager.keystore = path/to/tls-cerficiate/file
	WebMonitoringService.ssl.keystore = path/to/tls-cerficiate/file
		For example if the certificate file is named 'mycompany.org.pfx', and it has been copied to the 'Certificate' directory under 'rhapsody_config_files' directory; If the rhapsody engine installation directory is 'e:\rhapsody\rhapsody_engine', then the following key value pairs should exist in the rhapsody.properties file:
			AdministrationManager.keystore = e:/rhapsody/rhapsody_engine/Certificate/mycompany.org.pfx
			WebMonitoringService.ssl.keystore = e:/rhapsody/rhapsody_engine/Certificate/mycompany.org.pfx
5. Config.json file
	- The value of 'Rhapsody_Engine_Path' should point to where 'sys.installationDir' is pointing in the response.dat file
	- The value of 'Rhapsody_Data_Path' should point to where 'dir.data' is pointing in the response.dat file
	- Rhapsody_Installer_Path: Full path to the installer file e.g. 'e:/Install/rhapsody-6_10_1-windows-x64.exe'
	- Rhapsody_ResponseDat_Path: relative path to response.dat file to use for this installation 
	- Rhapsody_Properties_Path: relative path to rhapsody.properties file to copy over to rhapsody engine directory
	- Ldap_Properties_Path: relative path to ldap.properties file to copy over to users directory under rhapsody data directory
	- TLS_Cert_Dir_Source_Path: relative path to directory containing the keystore file (which contains the TLS certificate) file. This directory will be copied to the rhapsody engine directory.
	- TLS_Cert_Dir_Destination_Path: relative path under rhapsody engine where the directory containing the TLS certificate file will be copied to. If left blank, it means the destination would be the rhapsody engine installation directory.
		- For example if the name of the folder containing the TLS file is 'Certificate' and the value of TLS_Cert_Dir_Destination_Path is set to blank, a directory named 'Certificate' will be created under rhapsody engine installation directory with the TLS certificate in it.

Usage:
Open a powershell with admin privileges, change directory into the directory containing this script and run it. Make sure PowerShell's ExecutionPolicy is set properly, otherwise it will not be able to run the script.

Exptected Outcome:
If no errors occur, at the end of the process Rhapsody engine should be up and running and the management console should be accessible via HTTPS.