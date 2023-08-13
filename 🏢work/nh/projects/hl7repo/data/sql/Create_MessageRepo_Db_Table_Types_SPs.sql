/***************************************************************************************************
Query:              Create_MessageRepo_Db_Table_Types_SPs.sql
Create Date:        2022-09-29
Author:             Mehdi N Tehrani <mehdi.tehrani@nh.org.au; m.nadji.t@gmail.com>
Description:        This SQL statement is meant to be used to create the required database, table, data type and stored procedures needed for the Message Repository database to store the data from 
					messages sent to Northern Health Integration Engine (Rhapsody).
table(s) Updated:   Message
table(s) Read:      N/A
Used By:            Database admin
Parameter(s):       N/A
Usage:              Run the whole SQL statement once-off for the database and relevant components to be created.
					Each section can also be run separately in case a more staggered approach is desired.
****************************************************************************************************
SUMMARY OF CHANGES
Date(yyyy-mm-dd)    Author              				Comments
-----------------   -------				 				------------------------------------------------------------
2023-04-04			Mehdi Tehrani						Add new columns (AckCode, AckText, AckId, AckDateTime) to table, and adjust stored procedures accordingly
***************************************************************************************************/

USE [master]
GO

CREATE Database [Message_Repository_UAT]
GO

BEGIN TRANSACTION

USE [Message_Repository_UAT]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Build Message Table
CREATE TABLE [dbo].[Message](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[NHUR] [char](10) NULL,
	[MRNs] [char](250) NULL,
	[SendingApplication] [char](50) NULL,
	[SendingFacility] [char](50) NULL,
	[ReceivingApplication] [char](50) NULL,
	[ReceivingFacility] [char](50) NULL,
	[MessageDateTime] [datetime2](7) NULL,
	[InsertDateTime] [datetime2](7) NULL,
	[MessageType] [char](10) NULL,
	[TriggerEvent] [char](10) NULL,
	[VersionId] [char](10) NULL,
	[MessageControlId] [char](50) NULL,
	[ProcessingId] [char](10) NULL,
	[Direction] [char](15) NULL,
	[MessageSizeBytes] [int] NULL,
	[MessageContent] [varbinary](max) NULL,
	[AckCode] [char](10) NULL,
	[AckText] [char](250) NULL,
	[AckId] [char](50) NULL,
	[AckDateTime] [datetime2](7) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
WITH (DATA_COMPRESSION = PAGE);
GO

-- Set default value for InsertDateTime to be current_timestamp
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_InsertDateTime]  DEFAULT (getdate()) FOR [InsertDateTime]
GO

-- Build the index over MessageDateTime in descending order
CREATE CLUSTERED INDEX tblMessage_MsgDateTime_idx ON [Message](MessageDateTime DESC)
GO

-- Build non-clustered indices
CREATE NONCLUSTERED INDEX tblMessage_NHUR_idx ON [Message] ([NHUR])
GO

CREATE NONCLUSTERED INDEX tblMessage_Event_idx ON [Message] ([TriggerEvent])
GO

CREATE NONCLUSTERED INDEX tblMessage_Sndr_idx ON [Message] ([SendingApplication])
GO

CREATE NONCLUSTERED INDEX tblMessage_rcvr_idx ON [Message] ([ReceivingApplication])
GO


-- Build Stored Procedures

    -- Build the spMessage_InsertMsg Stored Procedure - this is used for importing messages one at a time into the database
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
    -- =============================================
    -- Author:		Mehdi N Tehrani <mehdi.tehrani@nh.org.au;m.nadji.t@gmail.com>
    -- Create date: 2022-09-29
    -- Description:	Insert a table of messages into Messages table - using User Defined Table 'MessageUDT'
    -- =============================================
    CREATE PROCEDURE spMessage_InsertMsg
        @nhur varchar(10) = NULL,
		@mrns varchar(250) = NULL,
		@sender_app varchar(50) = NULL,
		@sender_fac varchar(50) = NULL,
		@rec_app varchar(50) = NULL,
		@rec_fac varchar(50) = NULL,
		@msg_time datetime2 = NULL,
		@msg_type varchar(10) = NULL,
		@msg_event varchar(10) = NULL,
		@version_id varchar(10) = NULL,
		@msg_ctrl_id varchar(50) = NULL,
		@proc_id varchar(10) = NULL,
		@direction varchar(15) = NULL,
		@msg_content varchar(max) = NULL,
		@msg_size_bytes int = 0,
		@ack_code varchar(10) = NULL,
		@ack_text varchar(250) = NULL,
		@ack_id varchar(50) = NULL,
		@ack_time datetime2 = NULL
    AS
    BEGIN
        INSERT INTO dbo.Message (	NHUR, MRNs, SendingApplication, SendingFacility, 
									ReceivingApplication, ReceivingFacility, 
									MessageDateTime, MessageType, TriggerEvent, VersionId,
									MessageControlId, ProcessingId, Direction, MessageContent, MessageSizeBytes,
									AckCode, AckText, AckId, AckDateTime
								)
        VALUES ( @nhur, @mrns, @sender_app, @sender_fac, @rec_app, @rec_fac, @msg_time, @msg_type, 
				 @msg_event, @version_id, @msg_ctrl_id, @proc_id, @direction, COMPRESS(@msg_content), @msg_size_bytes,
				 @ack_code, @ack_text, @ack_id, @ack_time
				);
    END
    GO

    -- Build the [get_messages] stored procedure - a flexible SP used to search for messages based on one or multiple parameters
    -- =============================================
    -- Author:		Mehdi N Tehrani <mehdi.tehrani@nh.org.au;m.nadji.t@gmail.com>
    -- Create date: 2022-09-29
    -- Description:	Retrieve messages with a given NH URnumber, date range for MessageDateTime, TriggerEvent, sending and receiving applications. 
	--				Ignore either parameter if the passed value is null.
    -- =============================================
    CREATE PROCEDURE [dbo].[get_messages]
        @nhur varchar(50) = NULL,
		@start datetime2 = NULL,
		@end datetime2 = NULL,
		@sender varchar(50) = NULL,
		@receiver varchar(50) = NULL,
		@events varchar(250) = 'all',
		@direction varchar(50) = 'all',
        @maxCount int = 1000
    AS
    BEGIN
        SET NOCOUNT ON;

		SELECT TOP (@maxCount) * FROM 
        (SELECT  [Id] as db_id, [NHUR], [SendingApplication] AS SenderApp, [SendingFacility] AS SenderFac, 
				[ReceivingApplication] AS ReceiverApp, [ReceivingFacility] AS ReceiverFac, 
                [MessageDateTime], [MessageType], [TriggerEvent], [VersionId], [MessageControlId], 
                [ProcessingId],  [MessageSizeBytes], [InsertDateTime] AS db_insert_dttm, [Direction], 
				CAST(DECOMPRESS([MessageContent]) AS varchar(max)) AS [MessageContent],
				[AckCode], [AckText], [AckId], [AckDateTime]
        FROM [Message]
        WHERE 
			(([MessageDateTime] >= @start) OR (@start IS NULL)) AND
			(([MessageDateTime] <= @end) OR (@end IS NULL)) AND
			(([SendingApplication] = @sender) OR (@sender IS NULL)) AND
			(([ReceivingApplication] = @receiver) OR (@receiver IS NULL)) AND
			(([NHUR] = @nhur) OR (@nhur IS NULL))
		) AS PatientMessages
		WHERE
			(
				@events = 'all'
					OR
				[TriggerEvent] = @events
					OR
				[TriggerEvent] in (SELECT * FROM STRING_SPLIT(@events, ';'))
			)
					AND
			(
				@direction = 'all'
					OR
				Direction = @direction
					OR
				[Direction] in (SELECT * FROM STRING_SPLIT(@direction, ';'))
			);
    END
    GO

COMMIT TRANSACTION