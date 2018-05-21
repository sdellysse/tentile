#Include %A_LineFile%\..\VirtualDesktopAccessor.ahk
#Include %A_LineFile%\..\Utility.ahk
#Include %A_LineFile%\..\Window.ahk

class Tentile {
  class Messages {
    WM_TASKBARCREATED() {
      Utility.debug("WM_TASKBARCREATED")
      Reload
    }
  }

  class FooEvent {
    __New(tentile, event_name) {
      this.tentile := tentile
      this.event_name := event_name
    }

    Call(wParam, lParam, msg, hwnd) {
      this.tentile._event_received(this.event_name, wParam, lParam, msg, hwnd)
    }
  }

  __New() {
    OnMessage(DllCall("RegisterWindowMessage", Str, "TaskbarCreated"), new Tentile.FooEvent(this, "TaskbarCreated"))

    this.vda := new VirtualDesktopAccessor(A_LineFile . "\..\..\vendor\virtual-desktop-accessor\x64\Release\VirtualDesktopAccessor.dll")

		this.vda.RegisterPostMessageHook(hwnd, 0x1400 + 30)
		OnMessage(0x1400 + 30, new Tentile.FooEvent(this, "VirtualDesktopAccessor.PostMessageHook"))

    Utility.debug("new instance created")
  }

  _event_received(name, wParam, lParam, msg, hwnd) {
		Utility.debug("Event(" . name . "); wParam=" . wParam . "; lParam=" . lParam . "; msg=" . msg . "; hwnd=" . hwnd . ";")

		if (false) {

		} else if (name = "TaskbarCreated") {
			Reload

		} else if (name = "VirtualDesktopAccessor.PostMessageHook") {
		}
  }

  focus_desktop(n) {
    if (n = this.vda.GetCurrentDesktopNumber()) {
      return
    }

    Utility.debug("Focus desktop; n=" . n)
    this.vda.GoToDesktopNumber(n)
  }

  move_active_window_to_desktop(n) {
    if (n = this.vda.GetCurrentDesktopNumber()) {
      return
    }

    Utility.debug("Move selection; n=" . n)
    this.vda.MoveWindowToDesktopNumber(WinActive("A"), n)
  }
}
