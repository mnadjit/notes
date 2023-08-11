# Delegate Azure Copy Process

## Table of Contents:
- [Overview](#overview)
- [Integration](#integration)
- [Diet Codes Transfer Process](#diet-codes-transfer-process)

## Overview
Delegate is the application used at Northern Health by food services to handle types of food needed for each patient admitted at the hospital.

## Integration
There are two pieces of integration between iPM and Delegate. 
1) Patient demographics and visits via HL7 messages from iPM 
2) Diet codes via CSV files extracted directly from iPM database

### Integration Overview	
Rhapsody (Northern Health integration engine) queries iPM database every 15 minutes, extracts required data, 
converts them into CSV format and the file is uploaded to Delegate's Azure blob every 15 minutes.

## Diet Codes Transfer Process
### Rhapsody data extraction from iPM
Rhapsody queries iPM oracle database every 15 minutes to extract patient demographics, ward, unit, diet code and allergies. 
This happens at 00, 15, 30 & 45 minutes of every hour. The extracted data is then converted into CSV format and kept in a local folder on Rhapsody server. 
This file is overwritten with the next one. 

Each file contains the latest status of diets and allergies of all inpatients at a given time. 
In other woords each file is a full extract and historical files are only kept for troubleshooting purposes.

### Azure Copy
The file is uploaded to Delegate's Azure blob every 15 minutes. This happens at 02, 17, 32 & 47 minutes of every hour.
SAS token (Storage Access Signature) is used to provide authentication with the Azure blob. 

- To check files and their status in Delegate's azure blob:
	- PRODCUTION:
	> `azcopy list "https://nhprodhl7.blob.core.windows.net/delegate?<delegate_prod_azure_sas>" --properties "LastModifiedTime"`
	- UAT:
	> `azcopy list "https://nhuathl7.blob.core.windows.net/delegate?<delegate_uat_azure_sas>" --properties "LastModifiedTime`
	- SAS tokens for uat and prod can be found in KeePass
	
Copied CSV files are kept for 30 days, and azure copy logs and plans are also purged past 30 days.