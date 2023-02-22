#NoEnv
#SingleInstance Force
SetWorkingDir %A_ScriptDir%
#Include path_helper.ahk


; buildy Steam i branche HF1

:*:wns::
; x - hf na steam
; y - repo hf

If !FileExist("file_source.txt") {
	FileAbsent()
	return
	
} Else {
	path = % PathChecker("Steam: ", "steamapps", 7)
	StringLen, Path_lenght, path
	
	If (%Path_lenght%) = 0 {
		return
	} Else {
		{
			steam_path = %path%\common\House Flipper\build-info.txt
			FileReadLine, Steam, %steam_path%, 6
			StringTrimLeft, Steam1, Steam, 13
			StringTrimRight, Steam2, Steam1, 2
		}
		{
			beta_path = %path%\appmanifest_613100.acf
			Loop, read, %beta_path%
				If InStr(A_LoopReadLine, "BetaKey")
					StringTrimLeft, beta1, A_LoopReadLine, 14
					StringTrimRight, beta2, beta1, 1
		}
		StringLen, Lenght, beta2
	
		If (%Lenght% = 0)
			SendInput, wykryte na buildzie %Steam2% - obecny build graczy
		Else
			SendInput, wykryte na buildzie %Steam2% - obecny branch beta Steam %beta2%
		return
	}
}		

	
	
;Unity HF
	
:*:wnb::

If !FileExist("file_source.txt") {
	FileAbsent()
	return
	
} Else {
	path = % PathChecker("Repo: ", "Release", 7)
	StringLen, Path_lenght, path
	
	If (%Path_lenght%) = 0 {
		return
	} Else {
		{
			branch_path = %path%\.git\HEAD
			FileReadLine, branch, %branch_path%, 1
			StringTrimLeft, branch1, branch, 16
		}
		MsgBox, 4, Pytanko, A może nr commita do tego?
		IfMsgBox, Yes
			Run *RunAs gitoinator.ahk
		
		IfMsgBox, No
			SendInput, wykryte na branchu %branch1%
		return
		
		
	}
}