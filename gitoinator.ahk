#SingleInstance Force
SetWorkingDir %A_ScriptDir%
#Include path_helper.ahk

; y - repo hf

git = % PathChecker("Git: ", "bash", 5)
StringLen, Git_lenght, git

If (%Git_lenght%) = 0 {
	return
	
} Else {
	
	y1 = % PathFinder("Repo_HF: ", 9)
	
; branch
	{
		branch_path = %y1%\.git\HEAD
		FileReadLine, branch, %branch_path%, 1
		StringTrimLeft, branch1, branch, 16
	}
	
; commit
	BlockInput, On
	commit = % Gitoinator(git, y1)
	Send !{F4}
	BlockInput, Off
	
	Sleep 200
	commit1 := SubStr(commit, 8, 7)
	SendInput, wykryte na branchu [%branch1%] commit [%commit1%]
	return
}


Gitoinator(git, repo) {
	Run, %git%
	Sleep 750
	SendInput, cd "%repo%" {Enter}
	Sleep 400
	SendInput, git log -1 | clip {Enter}
	Sleep 400
	commithf:= StrSplit(Clipboard,"`n","`r").1
	return commithf	
	}
	