; buildy Steam i branche HF1

:*:wns::
; x - hf na steam
; y - repo hf

If !FileExist("file_source.txt") {
	Run file_source_absent.exe
	Sleep, 200
	return

} Else {
	Loop, read, file_source.txt
	{
		x := A_LoopReadLine
		If InStr(x, "Steam: ")
			StringTrimLeft, x1, x, 7
	}

; sprawdzenie czy w file_source.txt są ścieżki
	StringLen, x1len, x1

	If (%x1len% = 0) {
		MsgBox, 16, Powoli!, 
		(
		Ej! Nie dopisałeś ścieżki Steam w file_source.txt!
		
		Uzupełnij!
		)
		Sleep, 200
		return

	} Else {
		FileReadLine, Steam, %x1%\common\House Flipper\build-info.txt, 6
			StringTrimLeft, Steam1, Steam, 13
			StringTrimRight, Steam2, Steam1, 2

		Loop, read, %x1%\appmanifest_613100.acf
		{
			Branch := A_LoopReadLine
			If InStr(Branch, "BetaKey")
				StringTrimLeft, Branch1, Branch, 14
				StringTrimRight, Branch2, Branch1, 1
		}
		StringLen, Lenght, Branch2

		If (%Lenght% = 0)
			SendInput, wykryte na buildzie %Steam2% - obecny build graczy
		Else
			SendInput, wykryte na buildzie %Steam2% - obecny branch beta Steam %Branch2%
		return
	}
}

;Unity HF

:*:wnb::

If !FileExist("file_source.txt") {
	Run file_source_absent.exe
	Sleep, 200
	return

} Else {

	Loop, read, file_source.txt
	{
		y := A_LoopReadLine
		If InStr(y, "Repo: ")
			StringTrimLeft, y1, y, 6
	}

; sprawdzenie czy w file_source.txt są ścieżki	
	StringLen, y1len, y1

	If (%y1len% = 0) {
		MsgBox, 16, Powoli!, 
		(
		Ej! Nie dopisałeś ścieżki do repo w file_source.txt!
		
		Uzupełnij!
		)
		Sleep, 200
		return

	} Else {
		FileReadLine, HF, %y1%\.git\HEAD, 1
			StringTrimLeft, HF1, HF, 16
		MsgBox, 4, Pytanko, A może nr commita do tego?

		IfMsgBox, No
		{
			SendInput, wykryte na branchu %HF1%
			return
		}

		IfMsgBox, Yes
	; gitoinator
		Run *RunAs gitoinator.ahk
		return
	}
}

