#SingleInstance Force
SetWorkingDir %A_ScriptDir%
#Include path_helper.ahk

; menu z wyborem gry i platformę itd. coś jak starter

Gui, New,, Buildoinator

Gui, Add, Text,, 
(
Witaj w Buildoinatorze!
Wybierz grę i platforme na której testujesz:
)

Gui, Add, Text,, Gra
Gui, Add, Radio, vHF gRun_slave, House Flipper
Gui, Add, Radio, vHF2 gRun_slave, House Flipper 2

Gui, Add, Text,, Platforma
Gui, Add, DropDownList, vPlatform gRun_slave, Steam|Unity

Gui, Add, Button, gOpen, Edytuj ścieżki

Gui, show, W250 H180
Gui, Submit, NoHide
return


;Labels



Run_slave:
	Gui, Submit, Nohide
	DetectHiddenWindows On
	If (HF = 1 && Platform = "Steam") {	
		WinClose, %A_ScriptDir%\steam2.ahk
		WinClose, %A_ScriptDir%\unity1.ahk
		WinClose, %A_ScriptDir%\unity2.ahk
		Run, steam1.ahk
	} Else If (HF = 1 && Platform = "Unity") {
		WinClose, %A_ScriptDir%\steam1.ahk
		WinClose, %A_ScriptDir%\steam2.ahk
		WinClose, %A_ScriptDir%\unity2.ahk
		Run, unity1.ahk
	} Else If (HF2 = 1 && Platform = "Steam") {
		WinClose, %A_ScriptDir%\steam1.ahk
		WinClose, %A_ScriptDir%\unity1.ahk
		WinClose, %A_ScriptDir%\unity2.ahk
		Run, steam2.ahk
	} Else If (HF2 = 1 && Platform = "Unity") {
		WinClose, %A_ScriptDir%\steam1.ahk
		WinClose, %A_ScriptDir%\steam2.ahk
		WinClose, %A_ScriptDir%\unity1.ahk
		Run, unity2.ahk
	}
	DetectHiddenWindows Off
	return

Open:
	If FileExist("file_source.txt") {
		MsgBox, Nie zapomnij zapisać!
		Run, file_source.txt
	} Else {
		FileAbsent()
	}	
	return

GuiClose:
	{	
		DetectHiddenWindows On
		WinClose, %A_ScriptDir%\steam1.ahk
		WinClose, %A_ScriptDir%\steam2.ahk
		WinClose, %A_ScriptDir%\unity1.ahk
		WinClose, %A_ScriptDir%\unity2.ahk
		DetectHiddenWindows Off
	}
	ExitApp
	return



;t::
; HF2 %HF2% Platform %Platform%
; return
