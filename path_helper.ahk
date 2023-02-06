SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


class Path_helper
{
	PathChecker(z, s) {
		Loop, read, file_source.txt
		{
			If InStr(A_LoopReadLine, z) 
				StringTrimLeft, x, A_LoopReadLine, 7
			x1 := StrReplace(x, A_Space, "")
			StringLen, x1len, x1
		}
	; sprawdzenie czy ścieżka jest wypełniona
		If (%x1len% = 0) {
			return MsgBox, 16, Powoli, "Ścieżka do" %z% "w file_source.txt jest pusta."
			
		} Else {		
	; sprawdzenie czy jest poprawna
			If not InStr(x1, s) {
				return MsgBox, 16, Powoli, "Ścieżka do" %z% "w file_source.txt jest niepoprawna."
			
			} Else {
				return x1
			}
		}	
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

			Repo: 

		), file_source.txt
	}
}
