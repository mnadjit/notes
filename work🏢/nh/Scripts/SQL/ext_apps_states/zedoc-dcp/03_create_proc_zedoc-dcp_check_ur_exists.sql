/***************************************************************************************************
Query:              create_proc_zedoc-dcp_check_ur_exists.sql
Create Date:        2022-07-21
Author:             Mehdi N Tehrani <mehdi.tehrani@nh.org.au; m.nadji.t@gmail.com>
Description:        Creates stored procedure that receives Northern Health UR number as a parameter; returns 1 (true) if UR number is found in the ZEDOC_DCP table in the External_Apps_States database; otherwise returns 0 (false) 
table(s) Updated:   N/A
table(s) Read:      [dbo].[ZEDOC_DCP]
Parameter(s):       @msg_nh_ur
Returns:			@ur_exists
Call by:            Any SQL client capable of connecting with SQL Server instances e.g. Microsoft SSMS
Used By:            Database admin only to create the stored procedure in the database
					Stored Procedure Used By: 
						Rhapsody-Reader local sql account
						For this stored procedure read-only access suffices
Usage:              Execute sql statement. Run once by database admin to create the stored procedure
					Stored Procedure Usage: 
						Northern Health Integration Engine (Rhapsody) calls the stored procedure once created whenever an ADT_A31 or ADT_A40 message is passing through to define whether message UR exists in the database or not.
****************************************************************************************************
SUMMARY OF CHANGES
Date(yyyy-mm-dd)    Author              				Comments
-----------------   -------				 				------------------------------------------------------------
			
***************************************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE zedocdcp_check_ur_exists
	-- Add the parameters for the stored procedure here
	@msg_nh_urs varchar(50),
	@ur_exists bit OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
	SET NOCOUNT ON;

	-- SET constants/variables
	DECLARE @delimiter varchar(1) = ';';
	DECLARE @delim_index int = CHARINDEX(';', @msg_nh_urs, 1);
	IF @delim_index=0 SET @delim_index=LEN(@msg_nh_urs) + 1;
	DECLARE @ur_major varchar(20) = SUBSTRING(@msg_nh_urs, 0, @delim_index);
	DECLARE @ur_minor varchar(20) = SUBSTRING(@msg_nh_urs, @delim_index + 1, LEN(@msg_nh_urs) + 1);

    -- Procedure statements
	IF EXISTS (
		SELECT [NH_UR] FROM [dbo].[ZEDOC_DCP]
		WHERE [dbo].[ZEDOC_DCP].[NH_UR] in (@ur_major, @ur_minor)
	)
	SET @ur_exists = 1;
	ELSE SET @ur_exists = 0;
END
GO
