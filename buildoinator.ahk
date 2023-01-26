#SingleInstance Force
SetWorkingDir %A_ScriptDir%

; buildy Steam i branche HF1

:*:wns::
; x - hf na steam
; y - repo hf

If !FileExist("file_source.txt") {
	Run file_source_absent.ahk
	Sleep, 200
	return

} Else {
	Loop, read, file_source.txt
		If InStr(A_LoopReadLine, "Steam: ")
			StringTrimLeft, x1, A_LoopReadLine, 7

; sprawdzenie czy w file_source.txt są ścieżki i czy są poprawne
	StringLen, x1len, x1

	If (%x1len% = 0) {
		MsgBox, 16, Powoli!, 
		(
		Ej! Nie dopisałeś ścieżki Steam w file_source.txtalbo ją pochrzaniłeś!
		
	Uzupełnij lub popraw!!
		)
		Sleep, 200
		return

	} Else {
		{
		steam_path = %x1%\common\House Flipper\build-info.txt
		FileReadLine, Steam, %steam_path%, 6
			StringTrimLeft, Steam1, Steam, 13
			StringTrimRight, Steam2, Steam1, 2
		}
		
		{
		beta_path = %x1%\appmanifest_613100.acf
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
	Run file_source_absent.ahk
	Sleep, 200
	return

} Else {

	Loop, read, file_source.txt
		If InStr(A_LoopReadLine, "Repo: ")
			StringTrimLeft, y1, A_LoopReadLine, 6
	
; sprawdzenie czy w file_source.txt są ścieżki i czy są poprawne
	StringLen, y1len, y1
	
	If (%y1len% = 0) {
		MsgBox, 16, Powoli!, 
		(
		Ej! Nie dopisałeś ścieżki do repo w file_source.txt,
albo ją pochrzaniłeś!
		
	Uzupełnij lub popraw!
		)
		Sleep, 200
		return

	} Else {
		{
		branch_path = %y1%\.git\HEAD
		FileReadLine, branch, %branch_path%, 1
			StringTrimLeft, branch1, branch, 16
		}

		MsgBox, 4, Pytanko, A może nr commita do tego?

			IfMsgBox, No
				SendInput, wykryte na branchu %branch1%
				return
		
			IfMsgBox, Yes
				Run gitoinator.ahk
				return
	}
}