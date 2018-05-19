#Persistent
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SetBatchLines -1
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.

#Include, %A_ScriptDir%\VirtualDesktopAccessor.ahk

main(), return

main() {
	OnMessage(DllCall("RegisterWindowMessage", Str, "TaskbarCreated"), "WM_TASKBARCREATED")

	global vda
	vda := new VirtualDesktopAccessor(A_ScriptDir . "\vendor\virtual-desktop-accessor\x64\Release\VirtualDesktopAccessor.dll")
}

WM_TASKBARCREATED() {
	Reload
}

getCurrentWindow() {
  return WinActive("A")
}

#1::vda.GoToDesktopNumber(0)
#2::vda.GoToDesktopNumber(1)
#3::vda.GoToDesktopNumber(2)
#4::vda.GoToDesktopNumber(3)
#5::vda.GoToDesktopNumber(4)
#6::vda.GoToDesktopNumber(5)
#7::vda.GoToDesktopNumber(6)
#8::vda.GoToDesktopNumber(7)
#9::vda.GoToDesktopNumber(8)
#0::vda.GoToDesktopNumber(9)

#+1::vda.MoveWindowToDesktopNumber(getCurrentWindow(), 0)
#+2::vda.MoveWindowToDesktopNumber(getCurrentWindow(), 1)
#+3::vda.MoveWindowToDesktopNumber(getCurrentWindow(), 2)
#+4::vda.MoveWindowToDesktopNumber(getCurrentWindow(), 3)
#+5::vda.MoveWindowToDesktopNumber(getCurrentWindow(), 4)
#+6::vda.MoveWindowToDesktopNumber(getCurrentWindow(), 5)
#+7::vda.MoveWindowToDesktopNumber(getCurrentWindow(), 6)
#+8::vda.MoveWindowToDesktopNumber(getCurrentWindow(), 7)
#+9::vda.MoveWindowToDesktopNumber(getCurrentWindow(), 8)
#+0::vda.MoveWindowToDesktopNumber(getCurrentWindow(), 9)
