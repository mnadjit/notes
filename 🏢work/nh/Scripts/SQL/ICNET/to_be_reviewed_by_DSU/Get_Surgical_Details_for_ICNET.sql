--***************************************************************************************************
--Query:			Get_Surgical_Details_for_ICNET.sql.sql
--Create Date:		2022-01-17
--Author:			Meera Bhandari <Meera.Bhandari@nh.org.au>
--Description:		Extracts surgeries along with relevant patient demographics - each as a single row, to be sent across to ICNET (Infection Control software solution at Northern Health)
--Called by:		Northern Health's Rhapsody ICNET Surgery route - Database Message Extraction filter
--Used By:			Northern Health Infection Control department
--table(s) Updated:	None
--table(s) Read:		
--					[DSU].[dbo].[tbl_Fact_Theatre_Event],			[HealthCentral_RPT_REPL].[dbo].[FactTheatreCase],		[HealthCentral_RPT_REPL].[dbo].[DimReference],
--					[HealthCentral_RPT_REPL].[dbo].[DimLocation],	[HealthCentral_RPT_REPL].[dbo].[DimCode],				[HealthCentral_RPT_REPL].[dbo].[DimPatient],
--					[HealthCentral_RPT_REPL].[dbo].[DimCarer],		[HealthCentral_RPT_REPL].[dbo].[FactInpatientEpisode],	[HealthCentral_RPT_REPL].[dbo].[FactTheatreCoding]
--Parameter(s)		@DIFF_DAYS: defines number of days in the past to capture data from until last midnight 
--Usage:			execute the SQL statement
--****************************************************************************************************
--SUMMARY OF CHANGES
--Date(yyyy-mm-dd)    Author              Comments
--- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
--2022-02-16        Mehdi N Tehrani <mehdi.tehrani@nh.org.au; m.nadji.t@gmail.com>     
--										  Add patient demographics and optimise for ICNET requirements
--2022-02-17        Mehdi N Tehrani       Update to export each row as values delimited by commas to enhance export to csv format
--2022-02-21		Mehdi N Tehrani       Add extra data fields Anaesthetist, Operation_Type, Prosthesis_Flag;
--***************************************************************************************************

DECLARE @DIFF_DAYS					DECIMAL		= 28

DECLARE @SURGERY_START_TO_DTTM		DATETIME2
SET		@SURGERY_START_TO_DTTM					= GETDATE() 

DECLARE @SURGERY_START_FROM_DTTM	DATETIME2
SET		@SURGERY_START_FROM_DTTM				= DATEADD(d, -@DIFF_DAYS, @SURGERY_START_TO_DTTM)

USE [HealthCentral_RPT_Repl]

SELECT 
	pats.[URNumber] AS NH_UR, --pats.Title, 
	pats.LastName, pats.FirstName, pats.MiddleNames, pats.MedicareNumber, CONVERT(varchar,pats.DateOfBirth,20) AS DOB,
	CASE WHEN (pats.MedicareExpiryDate is not null AND pats.MedicareExpiryDate < GETDATE()) THEN 'Y' ELSE 'N' END AS Medicare_Expired,
	CASE WHEN pats.Gender = 'Male' THEN 'M' WHEN pats.Gender = 'Female' Then 'F' ELSE 'U' END AS Gender,
	pats.HomeAddressLine1, pats.HomeAddressLine2, pats.HomeAddressLine3, pats.HomeAddressPostCode,
	gps.MainIdentifier AS GP_Provider_No,
	CONVERT(varchar,pats.DateOfDeath,20) AS DateOfDeath,
	CASE WHEN (pats.DateOfDeath is not null) THEN 'Y' ELSE 'N' END AS Death_Indicator,
	pats.HomePhoneNumber,
	pats.PrimaryEmailAddress,
	util.[TheatreCaseId], 
	CONVERT(varchar,util.[IntoTheatreDateTime],20) AS IntoTheatreDateTime,
	CONVERT(varchar,util.[SurgeryStartDateTime],20) AS SurgeryStartDateTime,
	CONVERT(varchar,util.[SurgeryEndDateTime],20) AS SurgeryEndDateTime,		
	util.[Surgeon],
	util.[Anaesthetist],
	[PPP_Code], [PPP_Description], 
	util.[EpisodeId] AS Visit_No,
	[OperationOutcome], 
	'Inpatient' as PatientType,
	REPLACE(util.[OperationComment], '"', '') AS OperationComment, 
	ref .[ReferenceIdentifier] as ASA_Score_Id, 
	ref .[ReferenceDescription] as ASA_Score_Desc, 
	ref2.[ReferenceIdentifier] as Wound_Classification_Id, 
	ref2.[ReferenceDescription] as Wound_Classification, 
	util.[FutureBookingflag],
	loc . [LocationDescription] as Post_Surgery_Ward, 
	[TheatreLocation], [TheatreGroup],
	ref3.[ReferenceDescription] as Discharge_Method,
	cmbs.[cmbs] AS CMBS_Codes,
	util.OperationType AS Operation_Type, [WaitingListCategory],
	CASE WHEN prosthesis.[theatrecaseid] is not null then '1' else '0' end Prothesis_Flag
FROM 
	[dsu].[dbo].[tbl_Fact_Theatre_Event] util 	WITH (NOLOCK)
	left outer join [HealthCentral_RPT_REPL] . [dbo] . [FactTheatreCase] ftc 
		WITH (NOLOCK) on util . [TheatreCaseId] = ftc . [TheatreCaseId] and ftc . [ArchiveFlag] = '0' 
	left outer join [HealthCentral_RPT_REPL] . [dbo] . [DimReference] ref 
		WITH (NOLOCK) on ftc . [ASAScoreRefId] = ref . [ReferenceId]
	left outer join [HealthCentral_RPT_REPL] . [dbo] . [DimReference] ref2 
		WITH (NOLOCK) on ftc . [WoundClassificationRefId] = ref2 . [ReferenceId] 
	left outer join [HealthCentral_RPT_REPL] . [dbo] . [DimLocation] loc 
		WITH (NOLOCK) on ftc . [PostOpWardLocationId] = loc . [LocationId] 
	left outer join [HealthCentral_RPT_REPL] . [dbo] . [FactInpatientEpisode] epi 
		WITH (NOLOCK) on util . [EpisodeId] = epi . [SourceIdentifier] and epi . [archiveflag] ='0'
	left outer join [HealthCentral_RPT_REPL] . [dbo] . [DimReference] ref3 
		WITH (NOLOCK) on epi . [DischargeMethodRefId] = ref3 . [ReferenceId]
	OUTER APPLY (select TOP 1 
		[TheatreCaseId],
		STUFF(
				(
					SELECT '|~| [' + cmbscode.Code + '] ' + cmbscode.CodeDescription AS [text()]		-- Add a comma (,) before each value
					FROM 
						[HealthCentral_RPT_REPL].dbo.FactTheatreCoding cmbs 	WITH (NOLOCK)
						inner join [HealthCentral_RPT_REPL].dbo.DimCode cmbscode WITH (NOLOCK) ON cmbs.CodeId = cmbscode.CodeId
					WHERE
						cmbs.TheatreCaseId = tc.TheatreCaseId
						and cmbs.ArchiveFlag = 0
						and cmbscode.codesystem = 'cmbs' FOR XML PATH('')  --Select it as XML
				), 1, 4, '' 
			) [cmbs]

		FROM 
			[HealthCentral_RPT_REPL].dbo.FactTheatreCoding tc WITH (NOLOCK)
			inner join [HealthCentral_RPT_REPL].dbo.DimCode cmbscode WITH (NOLOCK) ON tc.CodeId = cmbscode.CodeId
			and cmbscode.codesystem = 'cmbs'
		WHERE util.TheatreCaseId = tc.TheatreCaseId
				and tc.ArchiveFlag = 0
		) cmbs   
	LEFT OUTER JOIN
	(
		SELECT
			tc.[theatrecaseid],	COUNT(*) AS [No.oF Prosthesis], 1 as Flag
		FROM 
			[dsu].[dbo].[tbl_Fact_Theatre_Event] tc	WITH ( nolock )
			INNER JOIN [HealthCentral_RPT_REPL].dbo.FactTheatreCoding cod WITH (NOLOCK) ON tc.TheatreCaseId = cod.TheatreCaseId
			INNER JOIN [HealthCentral_RPT_REPL].dbo.DimCode dc WITH (NOLOCK) ON cod.CodeId = dc.CodeId

		where 
			tc.[TheatreCaseStartDateTime] > = @SURGERY_START_FROM_DTTM
			AND tc.[TheatreCaseStartDateTime] < = @SURGERY_START_TO_DTTM
			AND tc.[status] = '0'
			AND CodeSystem = 'PROS'
		GROUP BY tc.[theatrecaseid]
	) prosthesis ON util.[TheatreCaseId] = prosthesis.[TheatreCaseId]
	LEFT OUTER JOIN	[DimPatient] pats WITH (NOLOCK) ON util.URNumber = pats.URNumber
	LEFT OUTER JOIN [DimCarer] gps WITH (NOLOCK) ON (pats.GPCode = gps.Identifier1 AND gps.CarerCategory = 'General Practitioner')
WHERE 
	util . [TheatreCaseStartDateTime] > =  @SURGERY_START_FROM_DTTM
ORDER BY
	IntoTheatreDateTime