/*
DON'T make multiple hotkeys that starts with the same modifier/key. instead, group all of them under #if GetKeyState("modifier/key").
in AHK get away from using the Custom Combinations Hotkeys (modifier/key & key). you can use the GetKeyState function with
the #if directive or in a conditional context to check the state of a key. also avoid involving with Alt+Tab in any way.

AutoHotKey subreddit pinned post contains useful resources for handling AutoHotKey,
including a script to know the scanCode/unicode for each key on the keyboard
https://www.reddit.com/r/AutoHotkey/comments/4f4j9k/read_this_before_posting/
*/


/* 
activate/deactivate certain hotkeys for certain apps
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
#IfWinActive


LAlt::return

#if GetKeyState("LAlt","P")
*d:: return  
*s:: return
.::/
'::?
*BackSpace:: Send ^{BackSpace}
Enter:: Send ^{Enter}
z:: 
x:: 
c:: 
v:: 
y:: 
a:: 
f:: 
if GetKeyState("Shift")
         Send  ^+{%A_ThisHotkey%}
else
       Send ^{%A_ThisHotkey%}
return

Tab:: 
Send {Alt down}{tab}
KeyWait LAlt
Send {Alt up}
return
Space::
 if isAltQRunning
 Send {Space}
return  
b::
e::
g::
m::
n::
o::
r::
t::
w::
1::
2::
3::
4::
5::
6::
7::
8::
9::
0::
Delete::
Insert::
Home::
End::
PgUp::
PgDn::
,::
|::
[::
]::
-::
=::
F1::
F2::
F3::
F4::
F5::
F6::
F7::
F8::
F9::
F10::
F11::
F12::
if isAltQRunning{
    Send {%A_ThisHotkey%
}else
if  GetKeyState("Shift") 
    if  GetKeyState("Ctrl")
        Send !^+{%A_ThisHotkey%}
    else
        Send !+{%A_ThisHotkey%}
else if GetKeyState("Ctrl")
         Send  !^{%A_ThisHotkey%}
else
       Send !{%A_ThisHotkey%}
return



*i::
if GetKeyState("CapsLock","P")
if GetKeyState("s", "P") || GetKeyState("Shift") 
    if GetKeyState("Space", "P") || GetKeyState("Ctrl")
        Send ^!+{Up}{Space Up}
    else
        Send +!{Up}
else if GetKeyState("Space", "P") || GetKeyState("Ctrl")
        Send ^!{Up}{Space Up}
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
        Send +^{Up}{Space Up}
    else
        Send +{Up}
else if GetKeyState("Space", "P") || GetKeyState("Ctrl")
        Send ^{Up}{Space Up}
else
    Send {Up}
return


*k::
if GetKeyState("CapsLock","P")
if GetKeyState("s", "P") || GetKeyState("Shift") 
    if GetKeyState("Space", "P") || GetKeyState("Ctrl")
        Send ^!+{Down}{Space Up}
    else
        Send +!{Down}
else if GetKeyState("Space", "P") || GetKeyState("Ctrl")
        Send ^!{Down}{Space Up}
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
        Send +^{Down}{Space Up}
    else
        Send +{Down}
else if GetKeyState("Space", "P") || GetKeyState("Ctrl")
        Send ^{Down}{Space Up}
else
    Send {Down}
return


j::
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


*l::
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


*h::
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


*`;::
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


*u::
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


*p::
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


q::
    isAltQRunning:=true
    if GetKeyState("Shift"){
        Send ^+{Tab}
    }
    else
        Send {LCtrl down}{Tab}
        KeyWait LAlt
        Send {LCtrl up}
        isAltQRunning:=false
return   




#if


>!CapsLock::CapsLock

*CapsLock::
if GetKeyState("shift")
    if GetKeyState("Ctrl") 
        Send {Blind}^+{Alt Down}
    else
        Send {Blind}+{Alt Down}
else if GetKeyState("Ctrl") 
        Send {Blind}^{Alt Down}
else
    Send {Alt Down}   
Return

*CapsLock up::
    If ( A_PriorKey = "CapsLock" ){ 
        if (WinActive("ahk_exe Code.exe"))
       Send {Blind}{Alt Up}{Alt}{Esc} ; for some reason I had to press extra alt in vscode before CapsLock to function as Esc
    else
        Send {Blind}{Alt Up}{Esc}
    }
    else
    Send {Alt Up}
Return


$j::
    If (A_PriorHotKey = "j" AND A_TimeSincePriorHotkey < 200) ;  I don't know how it works but it works
{
        if GetKeyState("Shift")
        Send {backspace}+{f13}
        else
	    Send {backspace}{f13}
} else 
Send {j}
return


SC056::Shift        ;the Scan Code for the left '\'
/::Shift
LShift::Ctrl
#k::WinMinimize, A
#i::WinMaximize, A 

