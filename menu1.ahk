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
		WinClose, %A_ScriptDir%\steam2.exe
		WinClose, %A_ScriptDir%\unity1.exe
		WinClose, %A_ScriptDir%\unity2.exe
		Run, steam1.exe
	} Else If (HF = 1 && Platform = "Unity") {
		WinClose, %A_ScriptDir%\steam1.exe
		WinClose, %A_ScriptDir%\steam2.exe
		WinClose, %A_ScriptDir%\unity2.exe
		Run, unity1.exe
	} Else If (HF2 = 1 && Platform = "Steam") {
		WinClose, %A_ScriptDir%\steam1.exe
		WinClose, %A_ScriptDir%\unity1.exe
		WinClose, %A_ScriptDir%\unity2.exe
		Run, steam2.exe
	} Else If (HF2 = 1 && Platform = "Unity") {
		WinClose, %A_ScriptDir%\steam1.exe
		WinClose, %A_ScriptDir%\steam2.exe
		WinClose, %A_ScriptDir%\unity1.exe
		Run, unity2.exe
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
		WinClose, %A_ScriptDir%\steam1.exe
		WinClose, %A_ScriptDir%\steam2.exe
		WinClose, %A_ScriptDir%\unity1.exe
		WinClose, %A_ScriptDir%\unity2.exe
		DetectHiddenWindows Off
	}
	ExitApp
	return
