/***************************************************************************************************
Query:              create_zedoc-dcp_table.sql
Create Date:        2022-07-21
Author:             Mehdi N Tehrani <mehdi.tehrani@nh.org.au; m.nadji.t@gmail.com>
Description:        This script is used to create the table ZEDOC_DCP
Call by:            Run once by database admin to create the table					
table(s) Updated:   [dbo].[ZEDOC_DCP]
table(s) Read:      N/A
Used By:            Database admin only
Parameter(s):       N/A
Usage:              Execute sql statement
****************************************************************************************************
SUMMARY OF CHANGES
Date(yyyy-mm-dd)    Author              				Comments
-----------------   -------				 				------------------------------------------------------------
			
***************************************************************************************************/


USE [External_Apps_States]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [dbo].[ZEDOC_DCP](
	[NH_UR] [varchar](20) NOT NULL,
	[Last_Updated_dttm] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO

SET ANSI_PADDING ON
GO