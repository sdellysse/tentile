#Include %A_LineFile%\..\Utility.ahk

class Window {
  remove_minmax(w) {
    Utility.debug("Window.remove_minmax; " . w)
    return WinSetStyle(-0x30000, w)
  }
}
