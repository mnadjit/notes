#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;****************************************************************************************
; NH Attestment
!^+t::
; 1 NH employee
if !WinActive("Northern Health Daily Attestation") 
	return
Send {Tab}{Space}{Tab}{Space}
Sleep 1500

; 2 Employee Number
if !WinActive("Northern Health Daily Attestation") 
	return
Send {Tab}103691{Tab}
Sleep 500

; 3 WFH
if !WinActive("Northern Health Daily Attestation") 
	return
Send {Space}{Tab}{Tab}{Space}
Sleep 1500

; 4 Multiple Work Premises
if !WinActive("Northern Health Daily Attestation") 
	return
Send {Tab}{Down}{Tab}{Tab}{Space}
Sleep 1500

; 5 Symptoms
if !WinActive("Northern Health Daily Attestation") 
	return
Send {Tab}{Down}{Tab}{Tab}{Space}
Sleep 1500

; 6 Known contact?
if !WinActive("Northern Health Daily Attestation") 
	return
Send {Tab}{Down}{Tab}{Tab}{Space}
Sleep 1500


; 7 Interstate Travel
if !WinActive("Northern Health Daily Attestation") 
	return
Send {Tab}{Down}{Tab}{Tab}
;{Space}
;Sleep 1000

; Cared for high risk patient?!
; if !WinActive("Northern Health Daily Attestation") 
; 	return
; Send {Tab}{Down}{Down}{Tab}{Tab}{Space}
; Sleep 1500

; Exposure Sites
; if !WinActive("Northern Health Daily Attestation") 
;	return
; Send {Tab}{Tab}{Down}{Tab}{Tab}{Space}
; Sleep 1500

; Hotel Quarantine sites
;if !WinActive("Northern Health Daily Attestation") 
;	return
;Send {Tab}{Down}{Tab}{Tab}
; Sleep 1500

; First Dose
;if !WinActive("Northern Health Daily Attestation") 
;	return
;Send {Tab}{Space}{Tab}{Tab}{Space}
;Sleep 1500

; Second Dose
;if !WinActive("Northern Health Daily Attestation") 
;	return
;Send {Tab}{Space}{Tab}{Tab}{Space}
;Sleep 1500

return

;****************************************************************************************
; Explorer++
#^e::
try {
    Run C:\MyFiles\explorer++_1.3.5_x64\Explorer++.exe
} catch e {
    MsgBox Couldn't run Explorer++.`n
}
return