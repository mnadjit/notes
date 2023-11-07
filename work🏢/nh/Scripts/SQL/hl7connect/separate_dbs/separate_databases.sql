/***************************************************************************************************
Create Date:        2022-10-14
Author:             Khalil Kazi
Description:        Every year in April, all messages from previous year are moved into a separate database, and the messages for last year need to be removed from the current database. As a result, the current database will only hold messages from this year. The whole process is best to be done after-hours. 
First, take a backup of the current database, rename it HL7Connect<YEAR> e.g. if this is being done in 2023, then the copy would belong to 2022 and the database name would be HL7Connect2022. Attach the newly copied database backup. This script can be used to separate the data across the two databases.
					ATTENTION 1: Avoid running the whole script in one go. Some DELETE commands might take 10-15 minutes. Try to run a line at a time to get a sense of how long it takes to process.
					ATTENTION 2: Make sure in line 29 or where the script tries to use the old database, the USE command is updated according to the database you just created e.g. USE [HL7Connect2022] - this should be the only update needed.
					ATTENTION 3: The second part of the script that removed last year messages from the current HL7Connect database is commented out to avoid any inadvertent script run. This is the section commented as "DELETE RECORDS OF LAST YEAR FROM FROM CURRENT DATABASE". Once the previous section is completed, uncomment this section and run commands line by line.
table(s) Updated:   gwInterfaceAudit, gwMessageAudit, gwMessageErrors, gwMessageSendRecord, gwMessageQueue, gwMessageStore, gwResendAudit, gwUserSessionLog
table(s) Read:      N/A
Parameter(s):       N/A
Call by:            -
Used By:            Northern Health ICT Integration Engineer or Database Administrator
Usage:              Avoid running the whole script in one go. Some DELETE commands might take 10-15 minutes. Try to run a line at a time to get a sense of how long it takes to process.
****************************************************************************************************
SUMMARY OF CHANGES
Date(yyyy-mm-dd)    Author              				Comments
-----------------   -------				 				------------------------------------------------------------
2022-10-14			Mehdi N Tehrani <mehdi.tehrani@nh.org.au; m.nadji.t@gmail.com>
														Add year variable
***************************************************************************************************/

DECLARE @THIS_YEAR CHAR(4)
DECLARE @LAST_YEAR CHAR(4)

SET @THIS_YEAR = CAST(YEAR(getdate()) AS CHAR(4))
SET @LAST_YEAR = CAST(YEAR(DATEADD(year, -1, getdate())) AS CHAR(4))

				 
--===========================================================================
--==== DELETE RECORDS OF CURRENT YEAR FROM FROM PREVIOUS YEAR DATABASE ======
--===========================================================================
USE [HL7Connect2021]

DELETE FROM gwInterfaceAudit WHERE EventDate >= (@THIS_YEAR + '0101')
DELETE FROM gwMessageAudit WHERE DateEdited >= (@THIS_YEAR + '0101')
DELETE FROM gwMessageErrors WHERE ErrorDate >= (@THIS_YEAR + '0101')
DELETE FROM gwMessageSendRecord WHERE SentDate >= (@THIS_YEAR + '0101')
DELETE FROM gwMessageQueue WHERE DateQueued >= (@THIS_YEAR + '0101')

-------------- Deleting form gwMessageStore table - each statement may take 15 to 20 mins ----------------
DELETE FROM gwMessageStore WHERE Datereceived >= (@THIS_YEAR + '0601')
 DBCC SHRINKFILE(HL7Connect_log, 20)
DELETE FROM gwMessageStore WHERE Datereceived >= (@THIS_YEAR + '0501')
 DBCC SHRINKFILE(HL7Connect_log, 20)
DELETE FROM gwMessageStore WHERE Datereceived >= (@THIS_YEAR + '0401')
 DBCC SHRINKFILE(HL7Connect_log, 20)
DELETE FROM gwMessageStore WHERE Datereceived >= (@THIS_YEAR + '0301')
 DBCC SHRINKFILE(HL7Connect_log, 20)
DELETE FROM gwMessageStore WHERE Datereceived >= (@THIS_YEAR + '0201')
 DBCC SHRINKFILE(HL7Connect_log, 20)
DELETE FROM gwMessageStore WHERE Datereceived >= (@THIS_YEAR + '0101')
--------------------------------------------------------------------------------------------------------

DELETE FROM gwResendAudit WHERE ResendDate >= (@LAST_YEAR + '0101')
DELETE FROM gwUserSessionLog WHERE StartDate >= (@LAST_YEAR + '0101')
--===========================================================================

DBCC SHRINKFILE(HL7Connect_log, 20)
--===========================================================================
--========= DELETE RECORDS OF LAST YEAR FROM FROM CURRENT DATABASE ==========
--===========================================================================
/*
USE [HL7Connect]

DELETE FROM HL7Connect.dbo.gwInterfaceAudit WHERE EventDate < (@THIS_YEAR + '0101')
DELETE FROM HL7Connect.dbo.gwMessageAudit WHERE DateEdited < (@THIS_YEAR + '0101')
DELETE FROM HL7Connect.dbo.gwMessageErrors WHERE ErrorDate < (@THIS_YEAR + '0101')
DELETE FROM HL7Connect.dbo.gwMessageSendRecord WHERE SentDate < (@THIS_YEAR + '0101')
DELETE FROM HL7Connect.dbo.gwMessageQueue WHERE DateQueued < (@THIS_YEAR + '0101')

-------- Delete these records form gwMessageQueue table to avoice reference errors  ----------------
DELETE FROM HL7Connect.dbo.gwMessageSendRecord
WHERE MsgQueueKey in (
	SELECT a.MsgQueueKey
	FROM HL7Connect.dbo.gwMessageQueue a
	INNER JOIN HL7Connect.dbo.gwMessageStore b on a.msgkey = b.msgkey
	WHERE Datereceived < (@THIS_YEAR + '0101')
)

DELETE FROM HL7Connect.dbo.gwMessageQueue
	WHERE MsgKey in (
		SELECT a.msgkey
		FROM HL7Connect.dbo.gwMessageQueue a
		INNER JOIN HL7Connect.dbo.gwMessageStore b on a.msgkey = b.msgkey
		WHERE Datereceived < (@THIS_YEAR + '0101')
	)
--------------------------------------------------------------------------------------------------------
*/

-------------- Deleting form gwMessageStore table - each statement may take 15 to 20 mins ----------------
--DELETE FROM HL7Connect.dbo.gwMessageStore WHERE Datereceived < (@LAST_YEAR + '0201')
--DELETE FROM HL7Connect.dbo.gwMessageStore WHERE Datereceived < (@LAST_YEAR + '0301')
--DELETE FROM HL7Connect.dbo.gwMessageStore WHERE Datereceived < (@LAST_YEAR + '0401')
--DELETE FROM HL7Connect.dbo.gwMessageStore WHERE Datereceived < (@LAST_YEAR + '0501')
--DELETE FROM HL7Connect.dbo.gwMessageStore WHERE Datereceived < (@LAST_YEAR + '0601')
--DELETE FROM HL7Connect.dbo.gwMessageStore WHERE Datereceived < (@LAST_YEAR + '0701')
--DELETE FROM HL7Connect.dbo.gwMessageStore WHERE Datereceived < (@LAST_YEAR + '0801')
--DELETE FROM HL7Connect.dbo.gwMessageStore WHERE Datereceived < (@LAST_YEAR + '0901')
--DELETE FROM HL7Connect.dbo.gwMessageStore WHERE Datereceived < (@LAST_YEAR + '1001')
--DELETE FROM HL7Connect.dbo.gwMessageStore WHERE Datereceived < (@LAST_YEAR + '1101')
--DELETE FROM HL7Connect.dbo.gwMessageStore WHERE Datereceived < (@LAST_YEAR + '1201')
--DELETE FROM HL7Connect.dbo.gwMessageStore WHERE Datereceived < (@THIS_YEAR + '0101')

--------------------------------------------------------------------------------------------------------

--DELETE FROM HL7Connect.dbo.gwResendAudit WHERE ResendDate < (@THIS_YEAR + '0101')
--DELETE FROM HL7Connect.dbo.gwUserSessionLog WHERE StartDate < (@THIS_YEAR + '0101')

--===========================================================================

--DBCC SHRINKFILE(HL7Connect_log, 20)
/*

SELECT file_id, name, type_desc, physical_name, size, max_size
FROM sys.database_files	

-- DBCC SHRINKFILE (N'HL7Connect' , 0, TRUNCATEONLY)

*/

