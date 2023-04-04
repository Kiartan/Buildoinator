#SingleInstance Force
SetWorkingDir %A_ScriptDir%


; skrypt sprawdzajacy czy buildoinator jest kompletny

x = % Completness_checker()

If %x% = 0
	MsgBox, 16, Powoli!, 
	(
	Brak któregoś skryptu Buildoinatora.
	
Pobierz całość ponownie, bo inaczej coś wybuchnie.
	)
Else
	Run, %A_ScriptDir%/menu1.exe
ExitApp
return

Completness_checker(){
	If !FileExist("menu1.exe") {
		return 0
	} Else If !FileExist("gitoinator.exe") {
		return 0 
	} Else If !FileExist("gitoinator_beast.exe") {
		return 0
	} Else If !FileExist("path_helper.ahk") {
		return 0
	} Else If !FileExist("steam1.exe") {
		return 0
	} Else If !FileExist("steam2.exe") {
		return 0
	} Else If !FileExist("unity1.exe") {
		return 0
	} Else If !FileExist("unity2.exe") {
		return 0
	} Else {
		return 1
		}
}

