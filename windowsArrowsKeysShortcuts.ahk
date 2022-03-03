#NoTrayIcon


Alt & i::
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

Alt & k::
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

Alt & j::
if GetKeyState("Shift", "D")
    if GetKeyState("Ctrl", "D")
        Send +^{Left}
    else
        Send +{Left}
else if GetKeyState("Ctrl", "D")
        Send ^{Left}
else
    Send {Left}
return

Alt & l::
if GetKeyState("Shift", "D")
    if GetKeyState("Ctrl", "D")
        Send +^{Right}
    else
        Send +{Right}
else if GetKeyState("Ctrl", "D")
     Send ^{Right}
else
    Send {Right}
return

Alt & h::
if GetKeyState("Shift", "D")
        Send +{Home}
else if GetKeyState("Ctrl", "D")
    Send ^{Home}
else
    Send {Home}
return

Alt & `;::
if GetKeyState("Shift", "D")
        Send +{End}
else if GetKeyState("Ctrl", "D")
    Send ^{End}
else
    Send {End}
return

Alt & u:: send, {PgUp}
Alt & p:: send, {PgDn}


return
