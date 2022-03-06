
/* useful link 
https://www.autohotkey.com/board/topic/21105-crazy-scripting-scriptlet-to-find-scancode-of-a-key/
*/

#NoTrayIcon

LAlt & i::
if GetKeyState("Shift", "D")
    if GetKeyState("Ctrl", "D")
        Send +^{Up}
    else
        Send +{Up}
else if GetKeyState("Ctrl", "D")
    Send ^{Up}
else
    Send {Up}
return

LAlt & k::
if GetKeyState("Shift", "D")
    if GetKeyState("Ctrl", "D")
        Send +^{Down}
    else
        Send +{Down}
else if GetKeyState("Ctrl", "D")
        Send ^{Down}
else
    Send {Down}
return

LAlt & j::
if GetKeyState("Shift", "D")
    if GetKeyState("Ctrl", "D")
        Send +^{Left}
        else if GetKeyState("s", "D")
         Send +^{Left}
    else
        Send +{Left}
else if GetKeyState("Ctrl", "D")
        Send ^{Left}
else
    Send {Left}
return

LAlt & l::
if GetKeyState("Shift", "D")
    if GetKeyState("Ctrl", "D")
        Send +^{Right}
        else if GetKeyState("s", "D")
         Send +^{Right}
    else
        Send +{Right}
else if GetKeyState("Ctrl", "D")
     Send ^{Right}
else
    Send {Right}
return

LAlt & h::
if GetKeyState("Shift", "D")
        Send +{Home}
else if GetKeyState("Ctrl", "D")
    Send ^{Home}
else
    Send {Home}
return

LAlt & `;::
if GetKeyState("Shift", "D")
        Send +{End}
else if GetKeyState("Ctrl", "D")
    Send ^{End}
else
    Send {End}
return

LAlt & u:: send, {PgUp}
LAlt & p:: send, {PgDn}


CapsLock::Ctrl
>^CapsLock::CapsLock

1::Esc
Esc::1
+Esc::!
SC056::Shift
return

