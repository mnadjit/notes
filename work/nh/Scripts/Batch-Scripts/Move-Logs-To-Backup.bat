@ECHO ON

SET SourceDir=%1
SET DestUNC=%2
:: Remove quotes around the path
SET SourceDir=%SourceDir:~1,-1%
SET DestUNC=%DestUNC:~1,-1%

SET LogPath="%SourceDir%\MoveProcesslog.txt"
SET MaxLogSize=500000
:: Get today's date
SET TODAYYMD=%DATE:~10,4%%DATE:~7,2%%DATE:~4,2%

::Create a "FAILURE" file and delete it at the end of the process, so if the process fails at any point, existence of this file will be an indicator of the failure
CALL :CreateFailureFile


ECHO ----------------------------------------------------------------------------- >> %LogPath%
ECHO Start DateTime:      %DATE% %TIME% >> %LogPath%
ECHO Today's Folder name: %TODAYYMD% >> %LogPath%
ECHO Source Folder:       %SourceDir% >> %LogPath%
ECHO Destination Folder:  %DestUNC% >> %LogPath%
ECHO.

:: Process all folders in first level i.e. Year folder
SETLOCAL EnableDelayedExpansion
FOR /f "skip=5 tokens=1,2,4,5* delims= " %%a in ('dir "%SourceDir%" /a:d /o:d /t:c') do (
	SET YdirName=%%~d
	SET YdirNameFirstChar=!YdirName:~0,1!
	IF !YdirNameFirstChar! EQU 2 (
		CALL :ProcessMonthFolders %%~d
		ECHO. >> %LogPath%
	)	
)
ECHO Process ended. >> %LogPath%
ECHO ----------------------------------------------------------------------------- >> %LogPath%
CALL :DeleteFailureFile
CALL :CheckLogSize


:: Process all folders in second level i.e. Month folder
GOTO END
:ProcessMonthFolders
ECHO --Processing Month Folders for year: %1 >> %LogPath%
SET ProcessingYear=%1
FOR /f "skip=5 tokens=1,2,4,5* delims= " %%a in ('dir "%SourceDir%\%1" /a:d /o:d /t:c') do (
	SET MdirName=%%~d
	SET MdirNameFirstChar=!MdirName:~0,1!
	IF !MdirNameFirstChar! EQU 2 (
		CALL :ProcessDayFolders !ProcessingYear! !MdirName!
	)
)
EXIT /B

:: Process all folders in third level i.e. Day folder
GOTO END
:ProcessDayFolders
ECHO ----Processing Day Folders for month: %2 >> %LogPath%
FOR /f "skip=5 tokens=1,2,4,5* delims= " %%a in ('dir "%SourceDir%\%1\%2" /a:d /o:d /t:c') do (
	SET DdirName=%%~d
	SET DdirNameFirstChar=!DdirName:~0,1!
	IF !DdirNameFirstChar! EQU 2 (
		IF !DdirName! NEQ %TODAYYMD% CALL :MoveFolderToDest %1 %2 %%~d %%~a
	)
)
EXIT /B

GOTO END
:MoveFolderToDest
ECHO -------Moving folder "%3" from "%SourceDir%" TO "%DestUNC%" [Created: "%4"] >> %LogPath%
PUSHD %DestUNC%
ECHO -------Destination root folder: %CD% >> %LogPath%

IF NOT EXIST "%CD%\%1\%2\%3" (
	ECHO -------Creating destination folder: [cmd=MKDIR "%CD%\%1\%2\%3"] >> %LogPath%
	MKDIR "%CD%\%1\%2\%3" 1>> %LogPath% 2>&1
	IF %ERRORLEVEL% NEQ 0 (
		ECHO -------*** Failed to create folder in the following path: "%CD%\%1\%2\%3"
		GOTO END
	)
	
	SET /A SourceFileCount=0
	FOR /F %%A IN ('dir /b "%SourceDir%\%1\%2\%3\*.*"') DO SET /A SourceFileCount+=1 >> %LogPath%
	ECHO -------Source File count: !SourceFileCount! >> %LogPath%
	
	ECHO -------Moving contents of the folder across: [cmd=MOVE /Y "%SourceDir%\%1\%2\%3\*.*" "%CD%\%1\%2\%3\"] >> %LogPath%
	MOVE /Y "%SourceDir%\%1\%2\%3\*.*" "%CD%\%1\%2\%3\" 1>> %LogPath% 2>&1

	IF %ERRORLEVEL% NEQ 0 (
		ECHO -------*** Failed to move contents of the folder:
		ECHO -------***                      From : "%SourceDir%\%1\%2\%3"
		ECHO -------***                      To   : "%CD%\%1\%2\%3"
		GOTO END
	)
	
	SET /A DestinationFileCount=0
	FOR /F %%A IN ('dir /b "%CD%\%1\%2\%3\*.*"') DO SET /A DestinationFileCount+=1 >> %LogPath%
	ECHO -------Destinatoin File count: !DestinationFileCount! >> %LogPath%
	IF !SourceFileCount! EQU !DestinationFileCount! ( 
		ECHO -------SUCCESS. Source and Destination number of files do match. >> %LogPath%
	) ELSE (
		ECHO -------*** FAILURE *** Source and Destination number of files DO NOT match. >> %LogPath%
		EXIT
	)
	
	ECHO -------Deleting empty source folder: [cmd=RMDIR /Q /S "%SourceDir%\%1\%2\%3"] >> %LogPath%
	RMDIR /Q /S "%SourceDir%\%1\%2\%3" 1>> %LogPath% 2>&1
	ECHO ------------------------------------- >> %LogPath%
	POPD
) ELSE (
	POPD
	ECHO -------*** FAILED to move the folder *** Destination folder exists already. >> %LogPath%
	ECHO -------SOURCE:      "%SourceDir%\%1\%2\%3"  >> %LogPath%
	ECHO -------DESTINATION: "%DestUNC%\%1\%2\%3" >> %LogPath%
	ECHO ------------------------------------- >> %LogPath%
)
EXIT /B

GOTO END
:CheckLogSize
IF NOT EXIST %LogPath% EXIT /B
FOR /F "usebackq delims=" %%l IN ('%LogPath%') DO SET /A LogSize=%%~zl

IF %LogSize% GTR %MaxLogSize% (
	ECHO Log Path:     %LogPath% >> %LogPath%
	ECHO Log Size:     %LogSize% >> %LogPath%
	ECHO Max Log Size: %MaxLogSize% >> %LogPath%
	ECHO Log file is larger than %MaxLogSize% Bytes. Moving log file from %LogPath%   to   %LogPath:~0,-5%.old.txt"  >> %LogPath%
	COPY /Y %LogPath% %LogPath:~0,-5%.old.txt" 1>> %LogPath% 2>&1
	ECHO. > %LogPath%
)
ECHO.
EXIT /B
GOTO END

:CreateFailureFile
SET FailureFileName=FAILURE-%TODAYYMD%.txt
SET SourceFailureFilePath=%SourceDir%\%FailureFileName%
ECHO Something went wrong while moving log files to the backup server. Please check the log file in the following location: %LogPath% > "%SourceFailureFilePath%"
PUSHD %DestUNC%
::ECHO COPY /Y "%SourceFailureFilePath%" "%CD%\%FailureFileName%" >> %LogPath%
COPY /Y "%SourceFailureFilePath%" "%CD%\%FailureFileName%"
POPD
EXIT /B
GOTO END

:DeleteFailureFile
DEL /Q "%SourceFailureFilePath%"
PUSHD %DestUNC%
DEL /Q "%CD%\%FailureFileName%"
POPD
EXIT /B
GOTO END

:END