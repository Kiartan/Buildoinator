#NoEnv
#SingleInstance Force
SetWorkingDir %A_ScriptDir%
#Include path_helper.ahk


; branche HF1

	
:*:wnb::

If !FileExist("file_source.txt") {
	FileAbsent()
	return
	
} Else {
	path = % PathChecker("Repo_HF: ", "Release", 10)
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