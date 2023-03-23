SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


PathChecker(z, s, l) {
	x1 = % PathFinder(z, l)
	x2 := StrReplace(x1, A_Space, "")
	StringLen, x2len, x2
	
; sprawdzenie czy ścieżka jest wypełniona
	If (%x2len% = 0) {
		MsgBox, 16, Powoli, Ścieżka w file_source.txt jest pusta
		return
	} Else {		
; sprawdzenie czy jest poprawna
		If !InStr(x1, s) {
			MsgBox, 16, Powoli, Ścieżka w file_source.txt jest niepoprawna
			return
		} Else {
			return x1
		}
	}	
}
	
	PathFinder(z, l) {
		Loop, read, file_source.txt
		{
			If InStr(A_LoopReadLine, z) 
				StringTrimLeft, x1, A_LoopReadLine, l 
		}	
		return x1
	}
	
	FileAbsent() {
		MsgBox, 16, Powoli!, 
	(
	Brak pliku źródłowego file_source.txt.
	
Zrobię Ci go, ale uzupełnij ścieżki ok?
	)
		FileAppend,
	(
	Poniżej wpisz odpowiednie ścieżki:

	Git: 

	HF1:

		Steam: 

		Repo_HF: 
		
		Repo_HF2:

	), file_source.txt
		
		Run, file_source.txt
	}
