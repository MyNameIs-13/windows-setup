;#SETUP START
#SingleInstance force
ListLines 0
SendMode "Input"
SetWorkingDir A_ScriptDir
KeyHistory 0
#WinActivateForce

ProcessSetPriority "H"

SetWinDelay -1
SetControlDelay -1

;#SETUP END

#Include "%A_MyDocuments%\AutoHotKey\keyboard_layout.ahk"
#Include "%A_MyDocuments%\AutoHotKey\keyboard_shortcuts.ahk"
#Include "%A_MyDocuments%\AutoHotKey\virtual_desktop_shortcuts.ahk"
