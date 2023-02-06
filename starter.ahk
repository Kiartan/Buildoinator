#SingleInstance Force
SetWorkingDir %A_ScriptDir%

; menu z wyborem gry i platformę itd. coś jak starter

Gui, New,, Buildoinator

Gui, Add, Text,, 
(
Witaj w Buildoinatorze!
Wybierz grę i platforme na której testujesz:
)

Gui, Add, Text,, Gra
Gui, Add, CheckBox, vHF, House Flipper
Gui, Add, CheckBox, vHF2, House Flipper 2

Gui, Add, Text,, Platforma
Gui, Add, DropDownList, vPlatform, Steam|Unity

Gui, show, W250 H160


Gui, Submit, NoHide
If (%HF% = 1)
	MsgBox "yay"
	return