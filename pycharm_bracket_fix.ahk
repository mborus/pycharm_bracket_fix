; Quick and Dirty Fix for the PyCharm Problem
; that blocks brackets until JetBrains fixes
; https://youtrack.jetbrains.com/issue/PY-35001
;
; needs Autohotkey
; https://www.autohotkey.com/
;
; (c) Martin Borus, https://twitter.com/mborus
;
; licence: MIT

#SingleInstance force
#InstallKeybdHook

SetTitleMatchMode, 2

waitup()
{
  GetKeyState, state, RAlt, P
  while (state = "D")
  {
    sleep 20
    GetKeyState, state, RAlt, P
  }
}

#IfWinActive, - PyCharm

  RAlt & 7 up::
  Clipboard := "{"
  waitup()
  Send, ^v
  return

  RAlt & 0 up::
  clipboard := "}"
  waitup()
  Send, ^v
  return

  RAlt & 8 up::
  clipboard := "["
  waitup()
  Send, ^v
  return

  RAlt & 9 up::
  clipboard := "]"
  waitup()
  Send, ^v
  return

#IfWinActive