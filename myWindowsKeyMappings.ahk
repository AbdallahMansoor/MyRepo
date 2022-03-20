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

/* activate/deactivate certain hotkeys for certain apps
GroupAdd myGroup, ahk_exe Code.exe 
GroupAdd myGroup, ahk_exe studio64.exe
GroupAdd myGroup, ahk_exe idea64.exe
GroupAdd myGroup, ahk_exe webstorm64.exe 
;this block of code should be at the top of the file ( the so called auto-execute section) and followed by its #IfWin statement 
     
#IfWinNotActive ahk_group myGroup
LAlt & q::Send ^{Tab}
#IfWinNotActive
*/


#NoTrayIcon

#UseHook
SendMode Input
#MaxThreads 255
#MaxThreadsPerHotkey 255 

#IfWinActive, ahk_class MultitaskingViewFrame ; Windows 10 alt-tab switcher 'https://www.autohotkey.com/docs/Hotkeys.htm#AltTabRemarks'
i::Up
k::Down
j::Left
l::Right
backspace::delete
CapsLock::Esc
#If

#IfWinNotActive, ahk_class MultitaskingViewFrame

LAlt & s:: return
LAlt & d:: return
LAlt:: return
LAlt & Space::
 if altQRunningLabel 
 Send {Space}
return  



LAlt & i::
if GetKeyState("CapsLock","P")
if GetKeyState("s", "P") || GetKeyState("Shift") 
    if GetKeyState("Space", "P") || GetKeyState("Ctrl")
        Send ^!+{Up}
    else
        Send +!{Up}
else if GetKeyState("Space", "P") || GetKeyState("Ctrl")
        Send ^!{Up}
else
    Send !{Up}

    else
if GetKeyState("d","P")
    if GetKeyState("s", "P") || GetKeyState("Shift") 
	Send, +{Up 4}
    else
    Send, {Up 4}
else if GetKeyState("s", "P") || GetKeyState("Shift") 
    if GetKeyState("Space", "P") || GetKeyState("Ctrl")
        Send +^{Up}
    else
        Send +{Up}
else if GetKeyState("Space", "P") || GetKeyState("Ctrl")
        Send ^{Up}
else
    Send {Up}
return

LAlt & k::
if GetKeyState("CapsLock","P")
if GetKeyState("s", "P") || GetKeyState("Shift") 
    if GetKeyState("Space", "P") || GetKeyState("Ctrl")
        Send ^!+{Down}
    else
        Send +!{Down}
else if GetKeyState("Space", "P") || GetKeyState("Ctrl")
        Send ^!{Down}
else
    Send !{Down}

    else
if GetKeyState("d","P")
    if GetKeyState("s", "P") || GetKeyState("Shift") 
	Send, +{Down 4}
    else
    Send, {Down 4}
else if GetKeyState("s", "P") || GetKeyState("Shift") 
    if GetKeyState("Space", "P") || GetKeyState("Ctrl")
        Send +^{Down}
    else
        Send +{Down}
else if GetKeyState("Space", "P") || GetKeyState("Ctrl")
        Send ^{Down}
else
    Send {Down}
return

LAlt & j::
if GetKeyState("CapsLock","P")
if GetKeyState("s", "P") || GetKeyState("Shift") 
    if GetKeyState("d", "P") || GetKeyState("Ctrl")
        Send ^!+{Left}
    else
        Send +!{Left}
else if GetKeyState("d", "P") || GetKeyState("Ctrl")
        Send ^!{Left}
else
    Send !{Left}

    else
if GetKeyState("s", "P") || GetKeyState("Shift") 
    if GetKeyState("d", "P") || GetKeyState("Ctrl")
        Send +^{Left}
    else
        Send +{Left}
else if GetKeyState("d", "P") || GetKeyState("Ctrl")
        Send ^{Left}
else
    Send {Left}
return

LAlt & l::
if GetKeyState("CapsLock","P")
if GetKeyState("s", "P") || GetKeyState("Shift") 
    if GetKeyState("d", "P") || GetKeyState("Ctrl")
        Send ^!+{Right}
    else
        Send +!{Right}
else if GetKeyState("d", "P") || GetKeyState("Ctrl")
        Send ^!{Right}
else
    Send !{Right}

    else
if GetKeyState("s", "P") || GetKeyState("Shift") 
    if GetKeyState("d", "P") || GetKeyState("Ctrl")
        Send +^{Right}
    else
        Send +{Right}
else if GetKeyState("d", "P") || GetKeyState("Ctrl")
        Send ^{Right}
else
    Send {Right}
return

LAlt & h::
if GetKeyState("CapsLock","P")
if GetKeyState("s", "P") || GetKeyState("Shift") 
    if GetKeyState("d", "P") || GetKeyState("Ctrl")
        Send ^!+{Home}
    else
        Send +!{Home}
else if GetKeyState("d", "P") || GetKeyState("Ctrl")
        Send ^!{Home}
else
    Send !{Home}

    else
if GetKeyState("s", "P") || GetKeyState("Shift") 
    if GetKeyState("d", "P") || GetKeyState("Ctrl")
        Send +^{Home}
    else
        Send +{Home}
else if GetKeyState("d", "P") || GetKeyState("Ctrl")
        Send ^{Home}
else
    Send {Home}
return

LAlt & `;::
if GetKeyState("CapsLock","P")
if GetKeyState("s", "P") || GetKeyState("Shift") 
    if GetKeyState("d", "P") || GetKeyState("Ctrl")
        Send ^!+{End}
    else
        Send +!{End}
else if GetKeyState("d", "P") || GetKeyState("Ctrl")
        Send ^!{End}
else
    Send !{End}

    else
if GetKeyState("s", "P") || GetKeyState("Shift") 
    if GetKeyState("d", "P") || GetKeyState("Ctrl")
        Send +^{End}
    else
        Send +{End}
else if GetKeyState("d", "P") || GetKeyState("Ctrl")
        Send ^{End}
else
    Send {End}
return

LAlt & u::
if GetKeyState("s", "P") || GetKeyState("Shift") 
    if GetKeyState("d", "P") || GetKeyState("Ctrl")
        Send +^{PgUp}
    else
        Send +{PgUp}
else if GetKeyState("d", "P") || GetKeyState("Ctrl")
        Send ^{PgUp}
else
    Send {PgUp}
return

LAlt & p::
if GetKeyState("s", "P") || GetKeyState("Shift") 
    if GetKeyState("d", "P") || GetKeyState("Ctrl")
        Send +^{PgDn}
    else
        Send +{PgDn}
else if GetKeyState("d", "P") || GetKeyState("Ctrl")
        Send ^{PgDn}
else
    Send {PgDn}
return


>!CapsLock::CapsLock

*CapsLock::
cDown := A_TickCount ; A_TickCount is the time since the script started
if GetKeyState("shift")
    if GetKeyState("Ctrl") 
        Send {Blind}^+{Alt Down}
    else
        Send {Blind}+{Alt Down}
else if GetKeyState("Ctrl") 
        Send {Blind}^{Alt Down}
else
    Send {Blind}{Alt Down}   
Return

*CapsLock up::
    If ((A_TickCount-cDown)<200) && ( A_PriorKey = "CapsLock" ){ 
        if (WinActive("ahk_exe Code.exe"))
       Send {Blind}{Alt Up}{Alt}{Esc} ; for some reason I had to press extra alt in vscode before CapsLock to function as Esc
    else
        Send {Blind}{Alt Up}{Esc}
    }
    else
    Send {Blind}{Alt Up}
Return


LAlt & q::
altQRunningLabel:=true
    if GetKeyState("Shift"){
        Send ^+{Tab}
    }
    else
        Send {LCtrl down}{Tab}
        KeyWait LAlt
        Send {LCtrl up}
        altQRunningLabel:=false
return                  


$j::
    If (A_PriorHotKey = "$j" AND A_TimeSincePriorHotkey < 200)
{
    if if GetKeyState("Shift")
        Send {backspace}+{f13}
        else
	    Send {backspace}{f13}
} else 
Send {j}
return



SC056::Shift        ;the Scan Code for the left '\'
/::Shift
LShift::Ctrl
LAlt & .::send, /
LAlt & '::send, ?
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


#If
