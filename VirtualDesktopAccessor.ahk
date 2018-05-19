class VirtualDesktopAccessor {
  __New(dllPath) {
    this.dllPath := dllPath
  }

	GoToDesktopNumber(n) {
		return DllCall(this.dllPath . "\GoToDesktopNumber", Int, n)
	}

	MoveWindowToDesktopNumber(w, n) {
		return DllCall(this.dllPath . "\MoveWindowToDesktopNumber", Int, w, Int, n)
	}
}
