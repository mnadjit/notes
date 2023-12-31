/***************************************************************************************************
Query:              create_zedoc-dcp_table_index.sql
Create Date:        2022-07-21
Author:             Mehdi N Tehrani <mehdi.tehrani@nh.org.au; m.nadji.t@gmail.com>
Description:        This script will add a clustered index to the ZEDOC_DCP table
table(s) Updated:   [dbo].[ZEDOC_DCP]
table(s) Read:      N/A
Parameter(s):       N/A
Call by:            Any SQL client capable of connecting with SQL Server instances e.g. Microsoft SSMS
Used By:            Database admin only
Usage:              Execute sql statement
					Run once by database admin to create the index for the ZEDOC_DCP table.
					This should be run once the table has been created in the database.
****************************************************************************************************
SUMMARY OF CHANGES
Date(yyyy-mm-dd)    Author              				Comments
-----------------   -------				 				------------------------------------------------------------
			
***************************************************************************************************/

USE [External_Apps_States]
GO

SET ANSI_PADDING ON
GO


CREATE CLUSTERED INDEX [ClusteredIndex-NH_UR-20221205] ON [dbo].[ZEDOC_DCP]
(
	[NH_UR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO