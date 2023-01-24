; y - repo hf
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
	Run, git-bash.exe, C:\Program Files\Git\, Hide
	Sleep 750
	SendInput, cd "%y1%" {Enter}
	Sleep 400
	SendInput, git log -1 | clip {Enter}
	Sleep 400
	Send !{F4}
}
BlockInput, Off

commithf:= StrSplit(Clipboard,"`n","`r").1
Sleep 200
SendInput, wykryte na branchu %HF1% (%commithf%)
return
