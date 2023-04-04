#SingleInstance Force
SetWorkingDir %A_ScriptDir%
#Include path_helper.ahk

; path - repo hf2

git = % PathChecker("Git: ", "bash", 5)
StringLen, Git_lenght, git

If (%Git_lenght%) = 0 {
	return
	
} Else {
	
	path = % PathFinder("Repo_HF2: ", 10)
	core_path = %path%\hf2-core
	content_path = %path%\hf2-content
	
; branche
	{
	; branch core
		core_branch = %core_path%\.git\HEAD
		FileReadLine, core, %core_branch%, 1
		StringTrimLeft, core1, core, 16
	}
	{
	; branch content
		content_branch = %content_path%\.git\HEAD
		FileReadLine, content, %content_branch%, 1
		StringTrimLeft, content1, content, 16
	}
	
; commity
	BlockInput, On
	commit_core = % Gitoinator(git, core_path)
	Send !{F4}
	commit_content = % Gitoinator(git, content_path)
	Send !{F4}
	BlockInput, Off
	
	Sleep 200
	commit_core1 := SubStr(commit_core, 8, 7)
	commit_content1 := SubStr(commit_content, 8, 7)
	SendInput, wykryte na branchach core [%core1%] commit [%commit_core1%] i content [%content1%] commit [%commit_content1%]
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
	