#Persistent
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SetBatchLines -1
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.

#Include, %A_LineFile%\..\src\Tentile.ahk

global tentile := new Tentile()

#Include, %A_LineFile%\..\configuration.ahk
