SetWorkingDir, %A_ScriptDir%
blank = 
FormatTime, year,,yyyy
FormatTime, month,,MMM
FormatTime, monthno,,MM
Loop, 7
	IniWrite, %blank%, %A_WorkingDir%\stored.ini, Filepaths, Locus%A_Index%
IniRead, alot, %A_WorkingDir%\stored.ini, LotNumbers, Alocus
IniRead, blot, %A_WorkingDir%\stored.ini, LotNumbers, Blocus
IniRead, clot, %A_WorkingDir%\stored.ini, LotNumbers, Clocus
IniRead, drlot, %A_WorkingDir%\stored.ini, LotNumbers, Drlocus
IniRead, dqlot, %A_WorkingDir%\stored.ini, LotNumbers, Dqlocus
IniRead, dwlot, %A_WorkingDir%\stored.ini, LotNumbers, Dwlocus
IniRead, dplot, %A_WorkingDir%\stored.ini, LotNumbers, Dplocus
Gui, Add, ComboBox, x90 y40 w110 h100 vbatchname gfill, 160425_SSO_DS
Gui, Add, Checkbox, x40 y100 w60 h20 vchecka, A Locus
Gui, Add, Checkbox, x40 y130 w60 h20 vcheckb, B Locus
Gui, Add, Checkbox, x40 y160 w60 h20 vcheckc, C Locus
Gui, Add, Checkbox, x40 y190 w70 h20 vcheckdr, DR Locus
Gui, Add, Checkbox, x40 y220 w70 h20 vcheckdq, DQ Locus
Gui, Add, Checkbox, x40 y250 w80 h20 vcheckdw, DRw Locus
Gui, Add, Checkbox, x40 y280 w70 h20 vcheckdp, DP Locus
Gui, Add, Checkbox, x40 y320 w70 h20 vcheckall gselectall, Select All
Gui, Add, Edit, x150 y100 w100 h20 vlota gfill, %alot%
Gui, Add, Edit, x150 y130 w100 h20 vlotb gfill, %blot%
Gui, Add, Edit, x150 y160 w100 h20 vlotc gfill, %clot%
Gui, Add, Edit, x150 y190 w100 h20 vlotdr gfill, %drlot%
Gui, Add, Edit, x150 y220 w100 h20 vlotdq gfill, %dqlot%
Gui, Add, Edit, x150 y250 w100 h20 vlotdw gfill, %dwlot%
Gui, Add, Edit, x150 y280 w100 h20 vlotdp gfill, %dplot%
Gui, Add, GroupBox, x140 y80 w120 h230, Lot Name
Gui, Add, GroupBox, x80 y20 w130 h50, Batch Name
Gui, Add, Edit, right x30 y350 w350 h20 vllfilepath, T:\_PatientLoadList_\%year%\%month%...
Gui, Add, Button, x390 y350 w40 h20 gselect, ...
Gui, Add, GroupBox, x30 y80 w100 h230, Locus
Gui, Add, ListBox, x280 y140 w180 h95 vsession_name glaunch, 
Gui, Show, Center w477 h389, SSO Luminex Setup
Return
	
fill:
sleep, 500
list = |
GuiControl,,session_name, %list%
Gui, Submit, NoHide
StringSplit, chars, batchname, _
date = %chars1%
initials = %chars3%
sa = %date%_%lota%_%initials%
sb = %date%_%lotb%_%initials%
sc = %date%_%lotc%_%initials%
sdr = %date%_%lotdr%_%initials%
sdq = %date%_%lotdq%_%initials%
sdw = %date%_%lotdw%_%initials%
sdp = %date%_%lotdp%_%initials%
list = %sa%|%sb%|%sc%|%sdr%|%sdq%|%sdw%|%sdp%|
GuiControl,,session_name, %list%
IniWrite, %lota%, %A_WorkingDir%\stored.ini, LotNumbers, Alocus
IniWrite, %lotb%, %A_WorkingDir%\stored.ini, LotNumbers, Blocus
IniWrite, %lotc%, %A_WorkingDir%\stored.ini, LotNumbers, Clocus
IniWrite, %lotdr%, %A_WorkingDir%\stored.ini, LotNumbers, Drlocus
IniWrite, %lotdq%, %A_WorkingDir%\stored.ini, LotNumbers, Dqlocus
IniWrite, %lotdw%, %A_WorkingDir%\stored.ini, LotNumbers, Dwlocus
IniWrite, %lotdp%, %A_WorkingDir%\stored.ini, LotNumbers, Dplocus
return

select:
FileSelectFile, filepath,,\\hnas1-dpts\HLA Lab\Tissue\TTYPING\_SSO Typing Load Lists\%year%\%monthno% %month%, Select Load List, *.txt
StringSplit, shortened, filepath, \
filepath = Y:\%shortened6%\%shortened7%\%shortened8%\%shortened9%\%shortened10%
GuiControl,,llfilepath,%filepath%
Gui, Submit, NoHide
val = %checka%|%checkb%|%checkc%|%checkdr%|%checkdq%|%checkdw%|%checkdp%|%checkall%
StringSplit, checkers, val, |
check_count = 
Loop, %checkers0%
{
	locus_no := A_index
	check_val := checkers%A_index%
	If (check_val = 1)
		IniWrite, %filepath%, %A_WorkingDir%\stored.ini, Filepaths, Locus%locus_no%
	else
		check_count++
	
}
if check_count = 8
{
	Loop, 7
		IniWrite, %blank%, %A_WorkingDir%\stored.ini, Filepaths, Locus%A_Index%
	Exit
}
return

selectall:
Gui, Submit, NoHide
vars = checka|checkb|checkc|checkdr|checkdq|checkdw|checkdp
StringSplit, checks, vars, |
if (checkall = 1)
{
	Loop, %checks0%
	{
		check := checks%A_Index%
		GuiControl,,%check%,1
	}
}
if (checkall = 0)
{
	Loop, %checks0%
	{
		check := checks%A_Index%
		GuiControl,,%check%,0
	}
}
return

launch:
GuiControlGet, name, , session_name
GuiControl, +AltSubmit, session_name
GuiControlGet, index, , session_name
GuiControl, -AltSubmit, session_name
IniRead, file, %A_WorkingDir%\stored.ini, Filepaths, Locus%index%
if !file
{
	MsgBox, No Load List found!
	Exit
}
MsgBox,6,Macro, Session Name = %name% `n Filepath =  %file%
IfMsgBox, Continue
{
	Sleep, 100
	WinWait, Luminex Batch Setup, 
	IfWinNotActive, Luminex Batch Setup, , WinActivate, Luminex Batch Setup, 
	WinWaitActive, Luminex Batch Setup, 
	MouseClick, left,  177,  134
	Sleep, 100
	Send, %name%{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{ENTER}
	WinWait, Open Patient List File, 
	IfWinNotActive, Open Patient List File, , WinActivate, Open Patient List File, 
	WinWaitActive, Open Patient List File, 
	Send, %file%{ENTER}
}
IfMsgBox, Cancel
	Exit
IfMsgBox, TryAgain
	Exit
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


GuiClose:
ExitApp
