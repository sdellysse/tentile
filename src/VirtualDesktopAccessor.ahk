#Include %A_LineFile%\..\Utility.ahk

; https://github.com/Ciantic/VirtualDesktopAccessor

class VirtualDesktopAccessor {
  __New(dllPath) {
    this.dllPath := dllPath
  }

  GetCurrentDesktopNumber() {
    Utility.debug("GetCurrentDesktopNumber")
    return DllCall(this.dllPath . "\GetCurrentDesktopNumber")
  }

  GoToDesktopNumber(n) {
    Utility.debug("VirtualDesktopAccessor.GoToDesktopNumber; n=" . n)
    return DllCall(this.dllPath . "\GoToDesktopNumber", Int, n)
  }

  MoveWindowToDesktopNumber(w, n) {
    Utility.debug("VirtualDesktopAccessor.MoveWindowToDesktopNumber; w=" . w . "; n=" . n)
    return DllCall(this.dllPath . "\MoveWindowToDesktopNumber", Int, w, Int, n)
  }

  RegisterPostMessageHook(listener, offset) {
    return DllCall(this.dllPath . "\RegisterPostMessageHook", Int, listener, Int, offset)
  }
}
