#Persistent
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SetBatchLines -1
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

main(), return

switchToDesktop(idx) {
	global ppDesktopManager, IID_IVirtualDesktop

	DllCall(vtable(ppDesktopManager, 7), "Ptr", ppDesktopManager, "Ptr*", pDesktops)
	if (pDesktops) {
		DllCall(vtable(pDesktops, 4), "Ptr", pDesktops, "UInt", idx, "Ptr", &IID_IVirtualDesktop, "Ptr*", VirtualDesktop)
		if (VirtualDesktop) {
			DllCall(vtable(ppDesktopManager, 9), "Ptr", ppDesktopManager, "Ptr", VirtualDesktop)
 			Send {Alt Down}{Tab}{Alt Up} ; focus on most recent window on desktop
			ObjRelease(VirtualDesktop) ; I assume these should be freed
		}
		ObjRelease(pDesktops)
	}
}


main() {
	OnExit, cleanup

	OnMessage(DllCall("RegisterWindowMessage", Str, "TaskbarCreated"), "WM_TASKBARCREATED")

	static ImmersiveShell := ComObjCreate("{C2F03A33-21F5-47FA-B4BB-156362A2F239}", "{00000000-0000-0000-C000-000000000046}")
	global IID_IVirtualDesktop, ppDesktopManager
	
	try ppDesktopManager := ComObjQuery(ImmersiveShell, "{C5E0CDCA-7B6E-41B2-9FC4-D93975CC467B}", "{f31574d6-b682-4cdc-bd56-1827860abec6}")
	if (!ppDesktopManager) {
		ppDesktopManager := ComObjQuery(ImmersiveShell, "{C5E0CDCA-7B6E-41B2-9FC4-D93975CC467B}", "{AF8DA486-95BB-4460-B3B7-6E7A6B2962B5}")
	}

	GUID(IID_IVirtualDesktop, "{FF72FFDD-BE7E-43FC-9C03-AD81681E88E4}")
	ObjRelease(ImmersiveShell)
	return

cleanup:
	if (ppDesktopManager)
		ObjRelease(ppDesktopManager)
	ExitApp
}

WM_TASKBARCREATED()
{
    Reload
}

vtable(ptr, n) {
    ; NumGet(ptr+0) returns the address of the object's virtual function
    ; table (vtable for short). The remainder of the expression retrieves
    ; the address of the nth function's address from the vtable.
    return NumGet(NumGet(ptr+0), n*A_PtrSize)
}

GUID(ByRef GUID, sGUID) ; Converts a string to a binary GUID
{
    VarSetCapacity(GUID, 16, 0)
    DllCall("ole32\CLSIDFromString", "Str", sGUID, "Ptr", &GUID)
}

#1::switchToDesktop(0)
#2::switchToDesktop(1)
#3::switchToDesktop(2)
#4::switchToDesktop(3)
#5::switchToDesktop(4)
#6::switchToDesktop(5)
#7::switchToDesktop(6)
#8::switchToDesktop(7)
#9::switchToDesktop(8)
#0::switchToDesktop(9)
