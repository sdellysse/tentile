#Persistent
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SetBatchLines -1
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.

#Include, %A_LineFile%\..\vendor\caf.core.ahk

#Include, %A_LineFile%\..\src\Tentile.ahk

global tentile := new Tentile()

#1::tentile.focus_desktop(0)
#2::tentile.focus_desktop(1)
#3::tentile.focus_desktop(2)
#4::tentile.focus_desktop(3)
#5::tentile.focus_desktop(4)
#6::tentile.focus_desktop(5)
#7::tentile.focus_desktop(6)
#8::tentile.focus_desktop(7)
#9::tentile.focus_desktop(8)
#0::tentile.focus_desktop(9)

#+1::tentile.move_active_window_to_desktop(0)
#+2::tentile.move_active_window_to_desktop(1)
#+3::tentile.move_active_window_to_desktop(2)
#+4::tentile.move_active_window_to_desktop(3)
#+5::tentile.move_active_window_to_desktop(4)
#+6::tentile.move_active_window_to_desktop(5)
#+7::tentile.move_active_window_to_desktop(6)
#+8::tentile.move_active_window_to_desktop(7)
#+9::tentile.move_active_window_to_desktop(8)
#+0::tentile.move_active_window_to_desktop(9)

^F2::WinSet, Style, -0x30000, A ; WS_MAXIMIZEBOX 0x10000 + WS_MINIMIZEBOX 0x20000
^F3::WinSet, Style, +0x30000, A ; WS_MAXIMIZEBOX 0x10000 + WS_MINIMIZEBOX 0x20000
