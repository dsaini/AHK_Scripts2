FormatTime, today ,, MMddyy
FormatTime, mmm ,, MMM
FormatTime, mm,, MM

Gui, Add, Text, x6 y7 w60 h20 , Date
Gui, Add, Text, x6 y37 w70 h20 , Sample range
Gui, Add, Text, x6 y67 w70 h20 , Tech Initials
Gui, Add, Edit, x76 y7 w90 h20 vdate, %today%
Gui, Add, Edit, x86 y37 w60 h20 vrange, 1-2
Gui, Add, Edit, x86 y67 w50 h20 vinit, DS 
Gui, Add, Text, x6 y97 w40 h20 , Month
Gui, Add, Edit, x46 y97 w60 h20 vmm, %MMM%
Gui, Add, Text, x10 y130 w25 h20 , A
Gui, Add, Text, x10 y150 w25 h20 , B
Gui, Add, Text, x10 y170 w25 h20 , C
Gui, Add, Text, x70 y130 w25 h20 , DR
Gui, Add, Text, x70 y150 w25 h20 , DQ
Gui, Add, Text, x70 y170 w25 h20 , Dw
Gui, Add, Text, x69 y190 w16 h20 , DP
Gui, Add, Edit, x25 y130 w45 h20 va, 1-2
Gui, Add, Edit, x25 y150 w45 h20 vb, 1-2
Gui, Add, Edit, x25 y170 w45 h20 vc, 1-2
Gui, Add, Edit, x85 y130 w45 h20 vdr, 1-2
Gui, Add, Edit, x85 y150 w45 h20 vdq, 1-2
Gui, Add, Edit, x85 y170 w45 h20 vdw, 1-2
Gui, Add, Edit, x85 y190 w45 h20 vdp, 1-2
Gui, Add, Button, x40 y220 w100 h30 , OK

ButtonOK:
Gui, Submit, NoHide

Gui, Show, x131 y91 h272 w186, SSO Luminex  Template Setup
Return

#a::
Sleep, 100
WinWait, Luminex Batch Setup, 
IfWinNotActive, Luminex Batch Setup, , WinActivate, Luminex Batch Setup, 
WinWaitActive, Luminex Batch Setup, 
MouseClick, left,  177,  134
Sleep, 100
Send, %date%_A%range%_RSSO1A_015_%init%{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{ENTER}
WinWait, Open Patient List File, 
IfWinNotActive, Open Patient List File, , WinActivate, Open Patient List File, 
WinWaitActive, Open Patient List File, 
Send, Y:\TTYPING\_SSO Typing Load Lists\2016\%mm%\%date%_%a%_%init%_1{ENTER}
Return

#b::
Sleep, 100
WinWait, Luminex Batch Setup, 
IfWinNotActive, Luminex Batch Setup, , WinActivate, Luminex Batch Setup, 
WinWaitActive, Luminex Batch Setup, 
MouseClick, left,  177,  134
Sleep, 100
Send, %date%_B%range%_RSSO1B_019_%init%{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{ENTER}
WinWait, Open Patient List File, 
IfWinNotActive, Open Patient List File, , WinActivate, Open Patient List File, 
WinWaitActive, Open Patient List File, 
Send, Y:\TTYPING\_SSO Typing Load Lists\2016\%mm%\%date%_%b%_%init%_1{ENTER}
Return

#c::
Sleep, 100
WinWait, Luminex Batch Setup, 
IfWinNotActive, Luminex Batch Setup, , WinActivate, Luminex Batch Setup, 
WinWaitActive, Luminex Batch Setup, 
MouseClick, left,  177,  134
Sleep, 100
Send, %date%_C%range%_RSSO1C_012_%init%{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{ENTER}
WinWait, Open Patient List File, 
IfWinNotActive, Open Patient List File, , WinActivate, Open Patient List File, 
WinWaitActive, Open Patient List File, 
Send, Y:\TTYPING\_SSO Typing Load Lists\2016\%mm%\%date%_%c%_%init%_1{ENTER}
Return

#r::
Sleep, 100
WinWait, Luminex Batch Setup, 
IfWinNotActive, Luminex Batch Setup, , WinActivate, Luminex Batch Setup, 
WinWaitActive, Luminex Batch Setup, 
MouseClick, left,  177,  134
Sleep, 100
Send, %date%_DR%range%_RSSO2B1_018_%init%{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{ENTER}
WinWait, Open Patient List File, 
IfWinNotActive, Open Patient List File, , WinActivate, Open Patient List File, 
WinWaitActive, Open Patient List File, 
Send, Y:\TTYPING\_SSO Typing Load Lists\2016\%mm%\%date%_%dr%_%init%_1{ENTER}
Return

#q::
Sleep, 100
WinWait, Luminex Batch Setup, 
IfWinNotActive, Luminex Batch Setup, , WinActivate, Luminex Batch Setup, 
WinWaitActive, Luminex Batch Setup, 
MouseClick, left,  177,  134
Sleep, 100
Send, %date%_DQ%range%_RSSO2Q_010_%init%{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{ENTER}
WinWait, Open Patient List File, 
IfWinNotActive, Open Patient List File, , WinActivate, Open Patient List File, 
WinWaitActive, Open Patient List File, 
Send, Y:\TTYPING\_SSO Typing Load Lists\2016\%mm%\%date%_%dq%_%init%_1{ENTER}
Return

#w::
Sleep, 100
WinWait, Luminex Batch Setup, 
IfWinNotActive, Luminex Batch Setup, , WinActivate, Luminex Batch Setup, 
WinWaitActive, Luminex Batch Setup, 
MouseClick, left,  177,  134
Sleep, 100
Send, %date%_DW%range%_RSSO2345_012_%init%{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{ENTER}
WinWait, Open Patient List File, 
IfWinNotActive, Open Patient List File, , WinActivate, Open Patient List File, 
WinWaitActive, Open Patient List File, 
Send, Y:\TTYPING\_SSO Typing Load Lists\2016\%mm%\%date%_%dw%_%init%_1{ENTER}
Return

#p::
Sleep, 100
WinWait, Luminex Batch Setup, 
IfWinNotActive, Luminex Batch Setup, , WinActivate, Luminex Batch Setup, 
WinWaitActive, Luminex Batch Setup, 
MouseClick, left,  177,  134
Sleep, 100
Send, %date%_DP%range%_RSSO2P_006_%init%{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{ENTER}
WinWait, Open Patient List File, 
IfWinNotActive, Open Patient List File, , WinActivate, Open Patient List File, 
WinWaitActive, Open Patient List File, 
Send, Y:\TTYPING\_SSO Typing Load Lists\2016\%mm%\%date%_%dp%_%init%_1{ENTER}
Return

#x::
Send, {ENTER}
WinWait, Luminex Multi-Batch Setup, 
IfWinNotActive, Luminex Multi-Batch Setup, , WinActivate, Luminex Multi-Batch Setup, 
WinWaitActive, Luminex Multi-Batch Setup, 
MouseClick, left,  68,  19
Sleep, 100
Send, {ENTER}
WinWait, Open Batch, 
IfWinNotActive, Open Batch, , WinActivate, Open Batch, 
WinWaitActive, Open Batch, 
Send, {PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}
MouseClick, left,  364,  58
Sleep, 100
Send, {PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{UP}{UP}{UP}{UP}{UP}{UP}{ENTER}{ENTER}
MouseClick, left,  360,  56
Sleep, 100
Send, {PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{UP}{UP}{UP}{UP}{UP}{ENTER}{ENTER}
MouseClick, left,  358,  55
Sleep, 100
Send, {PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{UP}{UP}{UP}{UP}{ENTER}{ENTER}
MouseClick, left,  358,  55
Sleep, 100
Send, {PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{UP}{UP}{UP}{ENTER}{ENTER}
MouseClick, left,  358,  55
Sleep, 100
Send, {PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{UP}{UP}{ENTER}{ENTER}
MouseClick, left,  358,  55
Sleep, 100
Send, {PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{UP}{ENTER}{ENTER}
MouseClick, left,  357,  55
Sleep, 100
Send, {PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{PGDN}{ENTER}
WinWait, Luminex Multi-Batch Setup, 
IfWinNotActive, Luminex Multi-Batch Setup, , WinActivate, Luminex Multi-Batch Setup, 
WinWaitActive, Luminex Multi-Batch Setup, 
Send, {TAB}{TAB}{TAB}%today%_%init%

Return