#Include, %A_LineFile%\..\VirtualDesktopAccessor.ahk

class Tentile {
	__New() {
		OnMessage(DllCall("RegisterWindowMessage", Str, "TaskbarCreated"), "Tentile__WM_TASKBARCREATED")

		this.vda := new VirtualDesktopAccessor(A_LineFile . "\..\..\vendor\virtual-desktop-accessor\x64\Release\VirtualDesktopAccessor.dll")
	}

	focus_desktop(n) {
		return this.vda.GoToDesktopNumber(n)
	}

	move_active_window_to_desktop(n) {
		return this.vda.MoveWindowToDesktopNumber(WinActive("A"), n)
	}
}

Tentile__WM_TASKBARCREATED() {
	Reload
}

