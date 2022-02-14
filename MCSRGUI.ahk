#NoEnv
#SingleInstance Force
#Include settings.ahk

Gui, Add, Button, x162 y109 w90 h30 , Multi MC
Gui, Add, Button, x162 y19 w90 h30 , OBS
Gui, Add, Button, x52 y19 w100 h30 , Reset Macro
Gui, Add, Button, x162 y49 w90 h30 , Ninjabrain Bot
Gui, Add, Button, x52 y49 w100 h30 , Delete Worlds
Gui, Add, Button, x162 y79 w90 h30 , Launch Instance(s)
Gui, Add, Button, x52 y79 w100 h30 , Launch Tracker
Gui, Add, Button, x302 y79 w100 h30 , Open Config
Gui, Add, Button, x52 y109 w100 h30 , Change Seed
Gui, Add, Button, x302 y19 w100 h30 , Launch All
Gui, Add, Button, x302 y49 w100 h30 , End All
Gui, Add, Button, x302 y109 w100 h30 , Exit
Gui, Add, Text, x112 y149 w130 h20 , Shift+Click to kill programs.
Gui, Show, x488 y254 h181 w462, MCSRGUI
Return

ButtonOBS:
Run, %obsDir%
return
ButtonMultiMC:
Run, %multimcDir%
return
ButtonResetMacro:
Run, %resetDir%
return
ButtonNinjabrainBot:
Run, %calcDir%
return

ButtonDeleteWorlds:
Warning("remove", "world")
Run, %A_WorkingDir%\resources\DeleteWorlds.py,, Hide
return

ButtonChangeSeed:
Warning("change", "seed")
Run, %A_WorkingDir%\resources\ChangeSeed.py,, Hide
return

ButtonLaunchInstance(s):
Run, %A_WorkingDir%\resources\InstanceLaunch.py,, Hide
return

+lbutton::
WinGetActiveTitle, activewin
If WinActive("MultiMC")
   WinKill, %activewin%
If WinActive("OBS")
   WinKill, %activewin%
If WinActive("Ninjabrain")
   WinKill, %activewin%
If WinActive("ahk_exe resettracker.exe")
   WinKill, %activewin%
return

ButtonLaunchTracker:
Run, % trackerdir
Return

ButtonExit:
ExitApp

ButtonOpenConfig:
Run, notepad settings.ahk
Return

ButtonLaunchAll:
If (launchObs)
    run, % obsDir
If (launchMMC)
    run, % multimcDir
If (launchCalc)
    run, % calcDir
If (launchMacro)
    run, % resetDir
If (deleteWorld)
    Run, %A_WorkingDir%\resources\DeleteWorlds.py,, Hide
If (launchInst)
    Run, %A_WorkingDir%\resources\InstanceLaunch.py ;,, Hide
WinWait, Minecraft
WinKill, ahk_exe C:\Windows\py.exe
If (launchtracker)
    Run, % trackerDir
return

ButtonEndAll:
if (killObs)
    WinKill, OBS
if (killInst) {
    GroupAdd instances, Minecraft
    WinKill, ahk_group instances
}
if (killMMC)
    WinKill, ahk_exe MultiMC.exe
if (killCalc)
    WinKill, Ninjabrain Bot
if (killMacro) {
    DetectHiddenWindows, On 
    WinKill, %resetdir% ahk_class AutoHotkey
}
if (killtracker)
   WinKill, %trackerDir%
return

GuiClose:
ExitApp

global instanceFolder := instanceFolder
Warning(action, element) {
    MsgBox, 4, , This will %action% every %element% in %instanceFolder%.`nDo you wish to continue?
    IfMsgBox No
        return
}
