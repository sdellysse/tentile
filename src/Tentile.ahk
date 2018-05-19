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

  __New() {
    OnMessage(DllCall("RegisterWindowMessage", Str, "TaskbarCreated"), "Tentile.Messages.WM_TASKBARCREATED")

    this.vda := new VirtualDesktopAccessor(A_LineFile . "\..\..\vendor\virtual-desktop-accessor\x64\Release\VirtualDesktopAccessor.dll")
    Utility.debug("new instance created")

    for i, id in WinGetList() {
      Window.remove_minmax(id)
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
