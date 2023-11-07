'Option Explicit
On Error Resume Next

   Dim strSigName
   Dim strFirstName, strSurnameName, strFullName, strTitle, strCompany, strTel, strFax, strEmail, strWeb, strCorpEmail
   Dim boolUpdateStyle

'==========================================================================
' Some script variables
'==========================================================================

'  Name signature
   strSigName  = "Standard Signature"
'  If signature exists, overwrite (true) or leave alone (false)?
   boolUpdateStyle = true

'==========================================================================
' Set some static information
'==========================================================================

'  Company information
   strCompany  = "Northern"
   strCompany1  = " Health"
   strAddr      = "185 Cooper Street EPPING Vic 3076"
   strWeb      = "www.nh.org.au"

'  Fallback email address when no address is found
   strCorpEmail = "contact@yourdomain.com"

'==========================================================================
' Read User's Active Directory information
'==========================================================================
   Dim objSysInfo, objUser

   Set objSysInfo = CreateObject("ADSystemInfo")
   Set objUser    = GetObject("LDAP://" & objSysInfo.Username)

   strFirstName = objUser.givenName
   strSurname = objUser.sn
   strFullName = strFirstName & " " & strSurname
   strTitle    = UCase(objUser.title)
   strEmail    = objuser.emailaddress
   strFax      = objuser.facsimileTelephoneNumber
   strTel      = objuser.telephoneNumber
   strDepartment = UCase(objuser.department)

   If Trim(strTitle) = "" Then strTitle = "_"
   If Trim(strEmail) = "" Then strEmail = strCorpEmail

   Set objUser    = Nothing
   Set objSysInfo = Nothing


'==========================================================================
' Get Signature Folder
'==========================================================================
   Dim objShell
   Set objShell = CreateObject("WScript.Shell")
   strSigFolder = ObjShell.ExpandEnvironmentStrings("%appdata%") & "\Microsoft\Signatures\"
   Set objShell = Nothing


'==========================================================================
' Get Signature Folder
'==========================================================================
   Dim objFSO, objFile
   Set objFSO   = CreateObject("Scripting.FileSystemObject")

   If Not (objFSO.FolderExists(strSigFolder)) Then
      Call objFSO.CreateFolder(strSigFolder)
   End If

   strHTMFile = strSigFolder & strSigName & ".htm"
   strRTFFile = strSigFolder & strSigName & ".rtf"
   strTXTFile = strSigFolder & strSigName & ".txt"


'==========================================================================
' Create HTM File
'==========================================================================
'chr(47) = /

   Err.Clear
   Set objFile = objFSO.CreateTextFile(strHTMFile, boolUpdateStyle, False)
   If Err.Number = 0 Then
      objFile.Write "<html> <head> <title> <" & Chr(47) & "title> <" & Chr(47) & "head> <body>"&vbCrLf
      objFile.Write "<span style=""FONT-SIZE: 9pt; font-weight:bold; COLOR:#005CB9; FONT-FAMILY: Arial"">"&vbCrLf
      objFile.Write "Kind Regards" & "<br />"&vbCrLf
      objFile.Write strFullName & "<br />"&vbCrLf
      objFile.Write "<span style=""FONT-SIZE: 9pt; font-weight:Normal; COLOR:#636569; FONT-FAMILY: Arial"">"&vbCrLf
      objFile.Write strTitle & " | " & strDepartment & "<br />"&vbCrLf
      objFile.Write "<span style=""FONT-SIZE: 18pt; font-weight:bold; COLOR:#005CB9; FONT-FAMILY: Arial"">"&vbCrLf
      objFile.Write strCompany & "<span style=""FONT-SIZE: 18pt; font-weight:bold; COLOR:#636569; FONT-FAMILY: Arial"">" & strCompany1 & "<br />"&vbCrLf
      objFile.Write "<span style=""FONT-SIZE: 9pt; font-weight:Normal; COLOR:#636569; FONT-FAMILY: Arial"">"&vbCrLf
      objFile.Write strAddr & "<br />"&vbCrLf
      objFile.Write "T:&nbsp;" & strTel &vbCrLf
      objFile.Write "<span style=""FONT-SIZE: 9pt; font-weight:bold; COLOR:#005CB9; FONT-FAMILY: Arial"">"&vbCrLf
      objFile.Write "| <a href=""" &strWeb & """ style=""FONT-SIZE: 9pt; font-weight:bold; COLOR:#005CB9; FONT-FAMILY:Arial"""
      objFile.Write ">" & strWeb & "<" & Chr(47) & "a>"&vbCrLf
      objFile.Write "<" & Chr(47) & "p>"&vbCrLf
      objFile.Write "<br><span style=""FONT-SIZE: 7.5pt; COLOR:#636569; font-weight:Normal; FONT-FAMILY: Arial"">"&vbCrLf
      objFile.Write "<img src=https://cdn.shopify.com/s/files/1/0008/5858/7188/files/flags-large_480x480.jpg?v=1623210094 width=42 height=12>"
      objFile.Write "&nbsp;Northern Health acknowledges the traditional custodians of this land," & "<br />"&vbCrLf
      objFile.Write "the Wurundjeri people, and pays its respects to elders past, present and future."&vbCrLf
      objFile.Write "<" & Chr(47) & "span><" & Chr(47) & "p>"&vbCrLf
      objFile.Write "<" & Chr(47) & "body> <" & Chr(47) & "html> "&vbCrLf
      objFile.close
   End If


'==========================================================================
' Create TXT File
'==========================================================================
   Err.Clear
   Set objFile = objFSO.CreateTextFile(strTXTFile, boolUpdateStyle, False)
   If Err.Number = 0 Then
      objFile.Write "Kind Regards" & vbCrLf
      objFile.Write strFullName & vbCrLf
      objFile.Write strTitle & " | " & strDepartment & vbCrLf
      objFile.Write strCompany & strCompany1 & vbCrLf
      objFile.Write strAddr & vbCrLf
      objFile.Write "T: " & strTel & " | " & strWeb & vbCrLf & vbCrLf
      objFile.Write "Northern Health acknowledges the traditional custodians of this land," &vbCrLf
      objFile.Write "the Wurundjeri people, and pays its respects to elders past, present and future."&vbCrLf
      objFile.close
   End If


'==========================================================================
' Create RTF File
'==========================================================================
   Err.Clear
   Set objFile = objFSO.CreateTextFile(strRTFFile, boolUpdateStyle, False)
   If Err.Number = 0 Then
      objfile.write "{\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang3081{\fonttbl{\f0\fswiss\fprq2\fcharset0 Arial;}{\f1\fnil\fcharset0 Calibri;}}" & vbCrLF
      objfile.write "{\colortbl ;\red0\green92\blue185;\red99\green101\blue105;\red0\green0\blue0;\red0\green0\blue128;\red0\green92\blue185;}" & vbCrLF
      objfile.write "{\*\generator Riched20 10.0.18362}\viewkind4\uc1" & vbCrLF
      objfile.write "\pard\widctlpar\cf1\b\f0\fs18\lang1033" & "Kind Regards" & "\b0\fs24\par" & vbCrLF
      objfile.write "\pard\widctlpar\cf1\b\f0\fs18\lang1033" & strFullName & "\b0\fs24\par" & vbCrLF
      objfile.write "\cf2\fs18" & strTitle & " | " & strDepartment & "\line "
      objfile.write "\cf1\b\fs36\lang3081" & strCompany &"\cf3 \cf2 " & strCompany1 & "\line " &vbCrLF
      objfile.write "\cf2\b0\fs18\lang1033 " & strAddr & "\fs24\par" & vbCrLF
      objfile.write "\fs18" & "T: " & strTel & "\cf1\lang3081" & "  | " & " {\b{\field{\*\fldinst{HYPERLINK http://" & strWeb & "/ }}{\fldrslt{\ul\cf5\ul " & strWeb & "}}}}\cf0\f1\fs22\lang9\par" & "\line " & vbCrLF
      objfile.write "\cf2\fs18 Northern Health acknowledges the traditional custodians of this land,\par" & vbCrLF
      objfile.write "\cf2\fs18 the Wurundjeri people, and pays its respects to elders past, present and future.\par" & vbCrLF
      objfile.write "\pard\cf1\lang1033\par" & vbCrLF
      objfile.write "}" & vbCrLF
      objFile.close
   End If


'==========================================================================
' Tidy-up
'==========================================================================
   set objFile = Nothing
   set objFSO  = Nothing

