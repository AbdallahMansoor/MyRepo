/*
AutoHotKey subreddit pinned post contains useful resources for handling AutoHotKey,
including a script to know the scanCode/unicode for each key on the keyboard
https://www.reddit.com/r/AutoHotkey/comments/4f4j9k/read_this_before_posting/
*/

/* listen to a key if pressed two consecutive/twice in a certain interval and make it do a different function
Down::
If (A_PriorHotKey = "Down" AND A_TimeSincePriorHotkey < 400)
{
	Send, {Down}{Down}{Down}{Down}{Down}
} else 
Send {Down}
return
*/


#NoTrayIcon

LAlt & s:: return
LAlt & d:: return
LAlt & Space:: return


LAlt & i::
if GetKeyState("d","P")
    if GetKeyState("s", "P") || GetKeyState("RShift", "P") || GetKeyState("SC056", "P") || GetKeyState("/", "P") || GetKeyState("LCtrl", "P")
	Send, +{Up 3}
    else
    Send, {Up 3}

if GetKeyState("s", "P") || GetKeyState("RShift", "P") || GetKeyState("SC056", "P") || GetKeyState("/", "P") || GetKeyState("LCtrl", "P")
    if GetKeyState("Space", "P") || GetKeyState("RCtrl", "P") || GetKeyState("LShift", "P")
        Send +^{Up}
    else
        Send +{Up}
else if GetKeyState("Space", "P") || GetKeyState("RCtrl", "P") || GetKeyState("LShift", "P")
        Send ^{Up}
else
    Send {Up}

if GetKeyState("CapsLock","P")
if GetKeyState("s", "P") || GetKeyState("RShift", "P") || GetKeyState("SC056", "P") || GetKeyState("/", "P") || GetKeyState("LCtrl", "P")
    if GetKeyState("Space", "P") || GetKeyState("RCtrl", "P") || GetKeyState("LShift", "P")
        Send ^!+{Up}
    else
        Send +!{Up}
else if GetKeyState("Space", "P") || GetKeyState("RCtrl", "P") || GetKeyState("LShift", "P")
        Send ^!{Up}
else
    Send !{Up}
return

LAlt & k::
if GetKeyState("d","P")
    if GetKeyState("s", "P") || GetKeyState("RShift", "P") || GetKeyState("SC056", "P") || GetKeyState("/", "P") || GetKeyState("LCtrl", "P")
	Send, +{Down 3}
    else
    Send, {Down 3}

if GetKeyState("s", "P") || GetKeyState("RShift", "P") || GetKeyState("SC056", "P") || GetKeyState("/", "P") || GetKeyState("LCtrl", "P")
    if GetKeyState("Space", "P") || GetKeyState("RCtrl", "P") || GetKeyState("LShift", "P")
        Send +^{Down}
    else
        Send +{Down}
else if GetKeyState("Space", "P") || GetKeyState("RCtrl", "P") || GetKeyState("LShift", "P")
        Send ^{Down}
else
    Send {Down}

if GetKeyState("CapsLock","P")
if GetKeyState("s", "P") || GetKeyState("RShift", "P") || GetKeyState("SC056", "P") || GetKeyState("/", "P") || GetKeyState("LCtrl", "P")
    if GetKeyState("Space", "P") || GetKeyState("RCtrl", "P") || GetKeyState("LShift", "P")
        Send ^!+{Down}
    else
        Send +!{Down}
else if GetKeyState("Space", "P") || GetKeyState("RCtrl", "P") || GetKeyState("LShift", "P")
        Send ^!{Down}
else
    Send !{Down}
return

LAlt & j::
if GetKeyState("s", "P") || GetKeyState("RShift", "P") || GetKeyState("SC056", "P") || GetKeyState("/", "P") || GetKeyState("LCtrl", "P")
    if GetKeyState("d", "P") || GetKeyState("RCtrl", "P") || GetKeyState("LShift", "P")
        Send +^{Left}
    else
        Send +{Left}
else if GetKeyState("d", "P") || GetKeyState("RCtrl", "P") || GetKeyState("LShift", "P")
        Send ^{Left}
else
    Send {Left}

if GetKeyState("CapsLock","P")
if GetKeyState("s", "P") || GetKeyState("RShift", "P") || GetKeyState("SC056", "P") || GetKeyState("/", "P") || GetKeyState("LCtrl", "P")
    if GetKeyState("d", "P") || GetKeyState("RCtrl", "P") || GetKeyState("LShift", "P")
        Send ^!+{Left}
    else
        Send +!{Left}
else if GetKeyState("d", "P") || GetKeyState("RCtrl", "P") || GetKeyState("LShift", "P")
        Send ^!{Left}
else
    Send !{Left}
return

LAlt & l::
if GetKeyState("s", "P") || GetKeyState("RShift", "P") || GetKeyState("SC056", "P") || GetKeyState("/", "P") || GetKeyState("LCtrl", "P")
    if GetKeyState("d", "P") || GetKeyState("RCtrl", "P") || GetKeyState("LShift", "P")
        Send +^{Right}
    else
        Send +{Right}
else if GetKeyState("d", "P") || GetKeyState("RCtrl", "P") || GetKeyState("LShift", "P")
        Send ^{Right}
else
    Send {Right}

if GetKeyState("CapsLock","P")
if GetKeyState("s", "P") || GetKeyState("RShift", "P") || GetKeyState("SC056", "P") || GetKeyState("/", "P") || GetKeyState("LCtrl", "P")
    if GetKeyState("d", "P") || GetKeyState("RCtrl", "P") || GetKeyState("LShift", "P")
        Send ^!+{Right}
    else
        Send +!{Right}
else if GetKeyState("d", "P") || GetKeyState("RCtrl", "P") || GetKeyState("LShift", "P")
        Send ^!{Right}
else
    Send !{Right}
return

LAlt & h::
if GetKeyState("s", "P") || GetKeyState("RShift", "P") || GetKeyState("SC056", "P") || GetKeyState("/", "P") || GetKeyState("LCtrl", "P")
    if GetKeyState("d", "P") || GetKeyState("RCtrl", "P") || GetKeyState("LShift", "P")
        Send +^{Home}
    else
        Send +{Home}
else if GetKeyState("d", "P") || GetKeyState("RCtrl", "P") || GetKeyState("LShift", "P")
        Send ^{Home}
else
    Send {Home}

if GetKeyState("CapsLock","P")
if GetKeyState("s", "P") || GetKeyState("RShift", "P") || GetKeyState("SC056", "P") || GetKeyState("/", "P") || GetKeyState("LCtrl", "P")
    if GetKeyState("d", "P") || GetKeyState("RCtrl", "P") || GetKeyState("LShift", "P")
        Send ^!+{Home}
    else
        Send +!{Home}
else if GetKeyState("d", "P") || GetKeyState("RCtrl", "P") || GetKeyState("LShift", "P")
        Send ^!{Home}
else
    Send !{Home}
return

LAlt & `;::
if GetKeyState("s", "P") || GetKeyState("RShift", "P") || GetKeyState("SC056", "P") || GetKeyState("/", "P") || GetKeyState("LCtrl", "P")
    if GetKeyState("d", "P") || GetKeyState("RCtrl", "P") || GetKeyState("LShift", "P")
        Send +^{End}
    else
        Send +{End}
else if GetKeyState("d", "P") || GetKeyState("RCtrl", "P") || GetKeyState("LShift", "P")
        Send ^{End}
else
    Send {End}

if GetKeyState("CapsLock","P")
if GetKeyState("s", "P") || GetKeyState("RShift", "P") || GetKeyState("SC056", "P") || GetKeyState("/", "P") || GetKeyState("LCtrl", "P")
    if GetKeyState("d", "P") || GetKeyState("RCtrl", "P") || GetKeyState("LShift", "P")
        Send ^!+{End}
    else
        Send +!{End}
else if GetKeyState("d", "P") || GetKeyState("RCtrl", "P") || GetKeyState("LShift", "P")
        Send ^!{End}
else
    Send !{End}
return

LAlt & u::
if GetKeyState("s", "P") || GetKeyState("RShift", "P") || GetKeyState("SC056", "P") || GetKeyState("/", "P") || GetKeyState("LCtrl", "P")
    if GetKeyState("d", "P") || GetKeyState("RCtrl", "P") || GetKeyState("LShift", "P")
        Send +^{PgUp}
    else
        Send +{PgUp}
else if GetKeyState("d", "P") || GetKeyState("RCtrl", "P") || GetKeyState("LShift", "P")
        Send ^{PgUp}
else
    Send {PgUp}
return

LAlt & p::
if GetKeyState("s", "P") || GetKeyState("RShift", "P") || GetKeyState("SC056", "P") || GetKeyState("/", "P") || GetKeyState("LCtrl", "P")
    if GetKeyState("d", "P") || GetKeyState("RCtrl", "P") || GetKeyState("LShift", "P")
        Send +^{PgDn}
    else
        Send +{PgDn}
else if GetKeyState("d", "P") || GetKeyState("RCtrl", "P") || GetKeyState("LShift", "P")
        Send ^{PgDn}
else
    Send {PgDn}
return


CapsLock::Alt
>!CapsLock::CapsLock

1::Esc
*^1:: Send {Esc}
Esc::1
+Esc::!
SC056::Shift        ;the Scan Code for the left '\'
/::Shift
LShift::Ctrl
LCtrl::Shift
LAlt & .::send, /
#k::WinMinimize, A
#i::WinMaximize, A 
LAlt & BackSpace:: Send ^{BackSpace}
LAlt & Enter:: Send ^{Enter}
LAlt & z:: Send ^{z}
LAlt & x:: Send ^{x}
LAlt & c:: Send ^{c}
LAlt & v:: Send ^{v}
LAlt & y:: Send ^{y}
LAlt & a:: Send ^{a}
LAlt & f:: Send ^{f}
