; y - repo hf

Loop, read, file_source.txt
{
	git := A_LoopReadLine
	If InStr(git, "Git: ")
		StringTrimLeft, git1, git, 5
}

; commit
Loop, read, file_source.txt
{
	y := A_LoopReadLine
	If InStr(y, "Repo: ")
		StringTrimLeft, y1, y, 6
}

; branch
FileReadLine, HF, %y1%\.git\HEAD, 1
	StringTrimLeft, HF1, HF, 16

BlockInput, On
{
	Run, C:\Program Files\Git\git-bash.exe
	; %git1%"\git-bash.exe
	Sleep 750
	SendInput, cd "%y1%" {Enter}
	Sleep 400
	SendInput, git log -1 | clip {Enter}
	Sleep 400
	; Send !{F4}
}
BlockInput, Off

commithf:= StrSplit(Clipboard,"`n","`r").1
Sleep 200
SendInput, wykryte na branchu %HF1% (%commithf%)
return
