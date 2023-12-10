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

;#UseHook commented it out to see if it will fix the issue when the modifiers sometimes get stuck down logically

SendMode Input
#MaxThreads 255

; Making Context sensitive hotkeys for Adobe apps
GroupAdd AdobeApps, ahk_exe Photoshop.exe
GroupAdd AdobeApps, ahk_exe Illustrator.exe
GroupAdd AdobeApps, ahk_exe InDesign.exe
GroupAdd AdobeApps, ahk_exe Acrobat.exe
GroupAdd AdobeApps, ahk_exe AfterFX.exe
GroupAdd AdobeApps, ahk_exe Premiere.exe
GroupAdd AdobeApps, ahk_exe Audition.exe
GroupAdd AdobeApps, ahk_exe Adobe Premiere Pro.exe

#IfWinActive, ahk_class MultitaskingViewFrame ; Windows 10 alt-tab switcher 'https://www.autohotkey.com/docs/Hotkeys.htm#AltTabRemarks'
    i::Up
    k::Down
    j::Left
    l::Right
    backspace::delete
#IfWinActive ; end of #IfWinActive, ahk_class MultitaskingViewFrame

; if the group that contains Adobe apps is active
#ifWinActive ahk_group AdobeApps

    ; click shift twice to send f19
    $*~Shift::
        KeyWait, Shift
        KeyWait, Shift, D T0.3
        if ErrorLevel
            return
        else {
            ; adding "GetKeyState("LAlt","p")" especially because I disabled the LAlt key globally.
            if GetKeyState("LAlt","p")
                ; sending {shift up} to prevent {blind} from passing the Shift modifier, otherwise it will send Shift every time it sends f19.
                send {blind}{shift up}!{f19}
            else
                send {blind}{shift up}{f19}
        }
    return

    ; map the middle button to send h for hand tool in Adobe apps
    *~MButton::h

    ; click on space bar twice to send f18
    $*~Space::
        KeyWait, Space
        KeyWait, Space, D T0.3
        if ErrorLevel
            return
        else {
            if GetKeyState("LAlt","p")
                send {blind}!{f18}
            else
                send {blind}{f18}
        }
    return

#ifWinActive ; end of #ifWinActive ahk_group AdobeApps

*f9::
    KeyWait, f9
    KeyWait, f9, D T0.3
    if ErrorLevel
        send {f9}
    else {
        ; the path to chrome stable, not canary
        if WinExist("ahk_exe C:\Program Files\Google\Chrome\Application\chrome.exe")
        {
            if WinActive("ahk_exe C:\Program Files\Google\Chrome\Application\chrome.exe")
            {
                Send ^t
                Sleep 100

            }
            else
            {
                WinActivate, ahk_exe C:\Program Files\Google\Chrome\Application\chrome.exe
                WinWaitActive, ahk_exe C:\Program Files\Google\Chrome\Application\chrome.exe
                Send ^t
            }
        }
        else
        {
            Run, "C:\Program Files\Google\Chrome\Application\chrome.exe"
            WinWaitActive, ahk_exe chrome.exe
            ; it opens a new tab on running anyways
        }
    }
return

$*LAlt::return

#MaxThreadsPerHotkey 255
#if GetKeyState("LAlt","P")
    *d::
    *s::
        if WinActive("ahk_group AdobeApps")
        {
            ;trimming A_ThisHotkey variable to remove the "*" modifier
            trimmedHotKey := Trim(A_ThisHotkey, "*")
            send {blind}^{%trimmedHotKey%}
        }
    return

    *BackSpace::
    *Enter::
    *z::
    *x::
    *c::
    *v::
    *y::
    *a::
    *f::
        trimmedHotKey := Trim(A_ThisHotkey, "*")
        send {blind}^{%trimmedHotKey%}
    return

    1::
    9::
        if isAltQRunning{
            Send {%A_ThisHotkey%
        }else
            if GetKeyState("Shift")
                if GetKeyState("Ctrl")
                    if WinActive("ahk_exe chrome.exe")
                        Send ^+{%A_ThisHotkey%}
                    else
                        Send !^+{%A_ThisHotkey%}
                else
                    if WinActive("ahk_exe chrome.exe")
                        Send ^+{%A_ThisHotkey%}
                    else
                        Send !+{%A_ThisHotkey%}
            else if GetKeyState("Ctrl")
                Send !^{%A_ThisHotkey%}
            else
                if WinActive("ahk_exe chrome.exe")
                    Send ^{%A_ThisHotkey%}
                else
                    Send !{%A_ThisHotkey%}
    return

    b::
    g::
    m::
    n::
    o::
    r::
    t::
    w::
    e::
    2::
    3::
    4::
    5::
    6::
    7::
    8::
    0::
    Delete::
    Insert::
    Home::
    End::
    PgUp::
    PgDn::
    '::
    |::
    [::
    ]::
    \::
    /::
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
            if GetKeyState("Shift")
                if GetKeyState("Ctrl")
                    Send !^+{%A_ThisHotkey%}
                else
                    Send !+{%A_ThisHotkey%}
            else if GetKeyState("Ctrl")
                Send !^{%A_ThisHotkey%}
            else
                Send !{%A_ThisHotkey%}
    return

    i::
        if GetKeyState("CapsLock","P")
            if GetKeyState("s", "P") || GetKeyState("Shift","P")
                if GetKeyState("Space", "P") || GetKeyState("Ctrl")
                    Send ^!+{Up}{Space Up}
                else
                    Send +!{Up}
            else if GetKeyState("Space", "P") || GetKeyState("Ctrl")
                Send ^!{Up}{Space Up}
            else if GetKeyState("d","P")
                Send ^!{Up}
            else
                Send !{Up}

        else
            if GetKeyState("d","P")
                if GetKeyState("s", "P") || GetKeyState("Shift","p")
                    Send, +{Up 4}
                else
                    Send, {Up 4}
            else if GetKeyState("s", "P") || GetKeyState("Shift","p")
                if GetKeyState("Space", "P") || GetKeyState("Ctrl")
                    Send +^{Up}{Space Up}
                else
                    Send +{Up}
            else if GetKeyState("Space", "P") || GetKeyState("Ctrl")
                Send ^{Up}{Space Up}
            else
                Send {Up}
    return

    k::
        if GetKeyState("CapsLock","P")
            if GetKeyState("s", "P") || GetKeyState("Shift")
                if GetKeyState("Space", "P") || GetKeyState("Ctrl")
                    Send ^!+{Down}{Space Up}
                else
                    Send +!{Down}
            else if GetKeyState("Space", "P") || GetKeyState("Ctrl")
                Send ^!{Down}{Space Up}
            else if GetKeyState("d","P")
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

    l::
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

    h::
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

    `;::
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

    u::
        if GetKeyState("CapsLock","P")
            if GetKeyState("s", "P") || GetKeyState("Shift")
                if GetKeyState("d", "P") || GetKeyState("Ctrl")
                    Send ^!+{PgUp}
                else
                    Send +!{PgUp}
            else if GetKeyState("d", "P") || GetKeyState("Ctrl")
                Send ^!{PgUp}
            else
                Send !{PgUp}

        else
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

    p::
        if GetKeyState("CapsLock","P")
            if GetKeyState("s", "P") || GetKeyState("Shift")
                if GetKeyState("d", "P") || GetKeyState("Ctrl")
                    Send ^!+{PgDn}
                else
                    Send +!{PgDn}
            else if GetKeyState("d", "P") || GetKeyState("Ctrl")
                Send ^!{PgDn}
            else
                Send !{PgDn}

        else
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

    Tab::
        Send {Alt down}{tab}
        KeyWait LAlt
        Send {LAlt up}
    return

    q::
        isAltQRunning:=true
        if GetKeyState("LAlt"){ ;in the case of holding down Lalt+tab then Escape(without releasing Lalt), the Lalt key keeps being pressed down logically
            Send {LAlt up}
        }
        if GetKeyState("Shift"){
            Send ^+{Tab}
        }
        else
            Send {LCtrl down}{Tab}
        KeyWait LAlt
        Send {LCtrl up}
        isAltQRunning:=false
    return

#if ; end of GetKeyState("LAlt","P") context
#MaxThreadsPerHotkey

>!CapsLock::CapsLock

*CapsLock::
    if not GetKeyState("Alt","P"){ ; if Alt key is already pressed down physically, then no need to send Alt key down
        Sendinput {alt down}
        Sendinput {Blind}{sc0E9} ; to deactivate highlighting application Menu bar first letters (for accessebility) in Windows (https://www.youtube.com/watch?v=vRld4bVFrpU&lc=UgzMjkQd4rbmvRDqU9h4AaABAg&ab_channel=TaranVanHemert)
    }

    if (A_PriorHotkey != A_ThisHotkey){
        timeWhenFirstCapsLockPressed := A_TickCount
    }

return

*CapsLock Up::

    if (WinActive("ahk_class MultitaskingViewFrame")){
        sendinput {Esc}
        sendinput {alt up}
        Return
    }

    sendinput {alt up}

    if (isAltQRunning)
    {
        if (WinActive("ahk_exe Code.exe"))
        {
            send {f15} ; to move focus to the active editor group in vscode 'workbench.action.focusActiveEditorGroup'
            Send {LCtrl up}
            isAltQRunning:=false
            Return
        }
        if (WinActive("ahk_exe webstorm64.exe"))
        {
            send {Space}
            Send {LCtrl up}
            isAltQRunning:=false
            Return
        }
    }
    If ( A_PriorKey = "CapsLock") && (A_TickCount - timeWhenFirstCapsLockPressed < 300){
        if GetKeyState("shift")
            if GetKeyState("Ctrl")
                Send ^+{Esc}
            else
                Send +{Esc}
        else if GetKeyState("Ctrl")
            Send ^{Esc}
        else
            Send {Esc}
    }

Return

; $j::
;     If (A_PriorHotKey = "j" AND A_TimeSincePriorHotkey < 200) ;  I don't know how it works but it works
; {
;         if GetKeyState("Shift")
;         Send {backspace}+{f13}
;         else
; 	    Send {backspace}{f13}
; } else
; if  GetKeyState("Shift")
;     if  GetKeyState("Ctrl")
;         Send ^+{j}
;     else
;       Send +{j}
; else if GetKeyState("Ctrl")
;          Send  ^{j}
; else
;        Send {j}
; return

SC056::Shift ;the Scan Code for the left '\'
; LShift::Shift
; RShift::Shift
; RCtrl::Ctrl
; LCtrl::Ctrl
#k::WinMinimize, A
#i::WinMaximize, A
#CapsLock::WinClose, A
