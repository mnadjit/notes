@ECHO OFF

SET UnzipperPATH="C:\Program Files\7-Zip\7z.exe"
SET HL7EditorPATH="C:\Program Files\7edit.com\7Edit 2.x\7edit.exe"

SETLOCAL ENABLEDELAYEDEXPANSION
FOR %%f IN (*.zip) DO (
	CALL :Unzip %%~nf
	SET /P DeleteZip="Delete Zip File? [y/n]: "
	IF /I !DeleteZip!==y DEL /Q %%~nf.zip
)
GOTO END

:Unzip
ECHO Unzipping the following file:
ECHO %1
SET /P OUTFOLDER="Output Folder Name? "
ECHO %UnzipperPATH% x %1.zip -o %CD%\%OUTFOLDER%
%UnzipperPATH% x %1.zip -o"%CD%\%OUTFOLDER%"
CD %CD%\%OUTFOLDER%"
FOR %%g in (*) DO CALL :RenameFiles %%g
CALL :CombineFiles
CD ..
ECHO.
EXIT /B

:RenameFiles
ECHO Adding .hl7 to the end of the following file name:
ECHO Renaming: %1
REN %1 %1.hl7
EXIT /B

:CombineFiles
SET CombinedFileName=_cmbnd_%OUTFOLDER%
ECHO Combining all HL7 files in current folder into one named: %CombinedFileName%.hl7
FOR %%i IN (*.hl7) DO (
	type %%i >> %CombinedFileName%
	echo. >> %CombinedFileName%
)
REN %CombinedFileName% %CombinedFileName%.hl7
CALL :CheckForError
ECHO Path to HL7 viewer: %HL7EditorPATH%
SET /P DORUN="Run with HL7 Viewer? [y/n]: "
IF /I %DORUN%==y %HL7EditorPATH% %CD%\%CombinedFileName%.hl7
EXIT /B

:CheckForError
IF %ERRORLEVEL% EQU 0 (
ECHO ***************************
ECHO ********* SUCCESS *********
ECHO ***************************
ECHO Successfully combined all HL7 files in current folder into one named: %CombinedFileName%.hl7
) ELSE (
ECHO Something went wrong!
GOTO END
)
EXIT /B

:END