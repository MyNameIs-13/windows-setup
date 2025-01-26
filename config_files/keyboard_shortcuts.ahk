; defines keyboard shortcuts

; # = Win
; ! = Alt
; ^ = Ctrl
; + = Shift

; expand 'mfg' to sentence
::mfg::
{
    Send "mit freundlichen Grüßen`nGerrit Skodowski"
}

; Notepad++		Super + F (windows default)
#f::
{
	Sleep 500
	Run A_ProgramFiles "\Notepad++\notepad++.exe"
}

; Calculator	Super + C
#c::
{
	Sleep 500
	Run "calc.exe"
}

; Terminal		Super + T
SwitchToWindowsTerminal() {
    windowHandleId := WinExist("ahk_exe WindowsTerminal.exe")
    windowExistsAlready := windowHandleId > 0

    ; If the Windows Terminal is already open, determine if we should put it in focus or minimize it.
    if windowExistsAlready {
        activeWindowHandleId := WinExist("A")
        windowIsAlreadyActive := activeWindowHandleId == windowHandleId

        if windowIsAlreadyActive {
            ; Minimize the window.
            WinMinimize("ahk_id " windowHandleId)
        } else {
            ; Put the window in focus.
            WinActivate("ahk_id " windowHandleId)
            WinShow("ahk_id " windowHandleId)
        }
    }
    ; Else it's not already open, so launch it.
    else {
        Run "wt"
    }
}
; Hotkey to launch/restore the Windows Terminal.
#t::SwitchToWindowsTerminal()


; Hotkey to launch lx launcher
!Space::
{
	Run A_WinDir "\system32\mstsc.exe `"C:\Users\gsk\AppData\Roaming\Microsoft\Workspaces\{14CCECE5-2EC4-4F13-805F-728D2579B172}\Resource\LX Launcher (LS RemoteApp).rdp`""
}

; Close Window		Super + Q | Alt + F4
#q::!F4

; Toggle Maximize Window		Super + M
#m:: ;
{
	MinMax := WinGetMinMax("A")
	if (MinMax==1)
	{
		Send "#{Down}"
	}
	Else
	{
		Send "#{Up}"
	}
}

; Minimize Windows      Super + H
#h::WinMinimize "A"

; Move windows across monitor
^#+Left::Send "{Win Shift left}"
^#+Right::Send "{Win Shift right}"

; set mouse thumb keys
;XButton1::PgDn
;XButton2::PgUp

; disable Capslock
SetCapsLockState "AlwaysOff"
*CapsLock::Esc
