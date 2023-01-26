#SingleInstance Force
SetWorkingDir %A_ScriptDir%

; y - repo hf
{
Loop, read, file_source.txt
	If InStr(A_LoopReadLine, "Git: ")
		StringTrimLeft, git1, A_LoopReadLine, 5
}

; sprawdzenie czy w file_source.txt jest poprawna ścieżka do git-bash
StringLen, git1len, git1

If (%gitlen% = 0){
	MsgBox, 16, Powoli!, 
	(
	Ej! Nie dopisałeś ścieżki do gita w file_source.txt,
albo ją pochrzaniłeś!
		
	Uzupełnij lub popraw!
	)
	Sleep, 200
	return

} Else {
; commit
	{
	Loop, read, file_source.txt
		If InStr(A_LoopReadLine, "Repo: ")
			StringTrimLeft, y1, A_LoopReadLine, 7
	}
; branch
	{
	branch_path = %y1%\.git\HEAD
	FileReadLine, branch, %branch_path%, 1
		StringTrimLeft, branch1, branch, 16
	}

	BlockInput, On
	{
		Run, "%git1%"
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
	SendInput, wykryte na branchu %branch1% (%commithf%)
	return
}