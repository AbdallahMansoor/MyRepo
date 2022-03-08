#NoTrayIcon


#If GetKeyState("LAlt", "P") ; While holding a, these hotkeys work
s & j::  
        if GetKeyState("d","P")
         Send +^{Left}
         else
        Send +{Left}
        return
d & j:: 
        if GetKeyState("s","P")
         Send +^{Left}
         else
        Send ^{Left}
        return
s & l::  
        if GetKeyState("d","P")
         Send +^{Right}
         else
        Send +{Right}
        return
d & l:: 
        if GetKeyState("s","P")
         Send +^{Right}
         else
        Send ^{Right}
        return
s & i::  
        if GetKeyState("d","P")
         Send +^{Up}
         else
        Send +{Up}
        return
d & i:: 
        if GetKeyState("s","P")
         Send +^{Up}
         else
        Send ^{Up}
        return
s & k::  
        if GetKeyState("d","P")
         Send +^{Down}
         else
        Send +{Down}
        return
d & k:: 
        if GetKeyState("s","P")
         Send +^{Down}
         else
        Send ^{Down}
        return
#If


LAlt & i::
if GetKeyState("s", "P")
    if GetKeyState("d", "P")
        Send +^{Up}
    else
        Send +{Up}
else if GetKeyState("d", "P")
        Send ^{Up}
else
    Send {Up}
return

LAlt & k::
if GetKeyState("s", "P")
    if GetKeyState("d", "P")
        Send +^{Down}
    else
        Send +{Down}
else if GetKeyState("d", "P")
        Send ^{Down}
else
    Send {Down}
return

LAlt & j::
if GetKeyState("s", "P")
    if GetKeyState("d", "P")
        Send +^{Left}
    else
        Send +{Left}
else if GetKeyState("d", "P")
        Send ^{Left}
else
    Send {Left}
return

LAlt & l::
if GetKeyState("s", "P")
    if GetKeyState("d", "P")
        Send +^{Right}
    else
        Send +{Right}
else if GetKeyState("d", "P")
        Send ^{Right}
else
    Send {Right}
return

LAlt & h::
if GetKeyState("s", "P")
    if GetKeyState("d", "P")
        Send +^{Home}
    else
        Send +{Home}
else if GetKeyState("d", "P")
        Send ^{Home}
else
    Send {Home}
return

LAlt & `;::
if GetKeyState("s", "P")
    if GetKeyState("d", "P")
        Send +^{End}
    else
        Send +{End}
else if GetKeyState("d", "P")
        Send ^{End}
else
    Send {End}
return



LAlt & u:: send, {PgUp}
LAlt & p:: send, {PgDn}



CapsLock::LAlt
>!CapsLock::CapsLock

1::Esc
Esc::1
+Esc::!
SC056::Shift
return


#k::#Down
#i::#Up


LAlt & BackSpace::
    if GetKeyState("d","P")
    Send ^{BackSpace}
    return

LAlt & Enter::
    if GetKeyState("d","P")
    Send ^{Enter}
    return






