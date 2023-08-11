/***************************************************************************************************
Query:              create_proc_zedoc-dcp_update_urs.sql
Create Date:        2022-07-21
Author:             Mehdi N Tehrani <mehdi.tehrani@nh.org.au; m.nadji.t@gmail.com>
Description:        Creates stored procedure with the following functionality and no output:
						- if the nh_ur exists in the ZEDOC_DCP table of the External_Apps_States database, Last_Updated_dttm is updated to time of the message
						- if the nh_ur does not exist in the ZEDOC_DCP table, the ur is added to the table and Last_Updated_dttm is updated to time of the message
table(s) Updated:   [dbo].[ZEDOC_DCP]
table(s) Read:      [dbo].[ZEDOC_DCP]
Parameter(s):       @msg_nh_ur, @msg_datetime
Call by:            Any SQL client capable of connecting with SQL Server instances e.g. Microsoft SSMS
Used By:            Database admin only to create the stored procedure in the database
					Stored Procedure Used By:
						Rhapsody-Reader local sql account
						User requires read/update rights on the database
Usage:              Execute sql statement. To be run once by database admin to create the stored procedure
					Stored Procedure Usage: 
						Northern Health (NH) Integration Engine (Rhapsody) calls the stored procedure once created when ZEDOC_DCP sends an A19 query to iPM and the response is successful. 
****************************************************************************************************
SUMMARY OF CHANGES
Date(yyyy-mm-dd)    Author              				Comments
-----------------   -------				 				------------------------------------------------------------
			
***************************************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE zedocdcp_update_urs
	-- parameters for the stored procedure
	@msg_nh_ur varchar(20),
	@msg_datetime varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Check if appointment exists in the table already
	DECLARE @ur_exists bit;
	SET @ur_exists = 
		CASE WHEN EXISTS (
				SELECT TOP 1 [dbo].[ZEDOC_DCP].[NH_UR] 
				FROM [dbo].[ZEDOC_DCP] 
				WHERE [dbo].[ZEDOC_DCP].[NH_UR] = @msg_nh_ur
			) 
			THEN 1 
			ELSE 0 
		END

	-- Change datetime format from YYYYMMddHHmmss to 'YYYYMMdd HH:mm:ss' SQL datetime2 
	DECLARE @message_datetime2 datetime2 = CONVERT(datetime2, STUFF(STUFF(STUFF(@msg_datetime, 13, 0, ':'), 11, 0, ':'), 9, 0, ' '))

    -- Procedure statements
	IF @ur_exists = 1
		UPDATE [dbo].[ZEDOC_DCP] SET [Last_Updated_dttm]=@message_datetime2 WHERE [NH_UR]=@msg_nh_ur
	ELSE INSERT INTO [dbo].[ZEDOC_DCP] ([NH_UR], [Last_Updated_dttm]) VALUES (@msg_nh_ur, @message_datetime2)
END
GO
