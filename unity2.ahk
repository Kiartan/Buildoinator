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
	path = % PathChecker("Repo_HF2: ", "HF2", 11)
	StringLen, Path_lenght, path
	
	If (%Path_lenght%) = 0 {
		return
	} Else {
		{
		; branch core
			core_path = %path%\hf2-core\.git\HEAD
			FileReadLine, core, %core_path%, 1
			StringTrimLeft, core1, core, 16
		}
		{
		; branch content
			content_path = %path%\hf2-content\.git\HEAD
			FileReadLine, content, %content_path%, 1
			StringTrimLeft, content1, content, 16
		}
		
		MsgBox, 4, Pytanko, A może nr commita do tego?
		IfMsgBox, Yes
			Run *RunAs gitoinator_beast.ahk
		
		IfMsgBox, No
			SendInput, wykryte na branchach core [%core1%] i content [%content1%]
		return
	}
}