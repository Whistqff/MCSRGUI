#NoEnv
#SingleInstance Force
#Include settings.ahk


Gui, Add, Button, x2 y-1 w100 h30 , Multi MC
Gui, Add, Button, xp+100 y-1 w90 h30 , OBS
Gui, Add, Button, x2 yp+30 w100 h30 , Reset Macro
Gui, Add, Button, xp+100 y29 w90 h30 , Ninjabrain Bot
Gui, Add, Button, x2 yp+30 w100 h30 , Delete Worlds
Gui, Add, Button, xp+100 y59 w90 h30 , Launch Instance(s)
Gui, Add, Button, x2 yp+30 w100 h30 , Launch Tracker
Gui, Add, Button, x2 yp+30 w100 h30 , Open Config
Gui, Add, Button, xp+100 y89 w90 h30 , Change Seed
Gui, Add, Button, x197 y14 w100 h30 , Launch All
Gui, Add, Button, x197 y44 w100 h30 , End All
Gui, Add, Button, x197 y74 w100 h30 , Exit
Gui, Add, Text, x2 y154 w300 h30 , Please press "Open Config" and configure the script if you haven't yet.
Gui, Add, Text, x2 y190 w300 h30 , Use Shift+Click to Kill Programs.
Gui, Show, h210 w307, SRSU
Return


ButtonOBS:
    RunKill(obsDir, "OBS")
return
ButtonMultiMC:
    RunKill(multimcDir, "ahk_exe MultiMC.exe")
return
ButtonResetMacro:
    RunKill(macroDir, "%resetdir% ahk_class AutoHotkey")
return
ButtonNinjabrainBot:
    RunKill(calcDir, "Ninjabrain Bot")
return

ButtonDeleteWorlds:
    Warning("remove", "world")
    RunKill("%A_WorkingDir%\resources\DeleteWorlds.py,, Hide")
return

ButtonChangeSeed:
    Warning("change", "seed")
    RunKill("%A_WorkingDir%\resources\ChangeSeed.py,,")
return

ButtonLaunchInstance(s):
    RunKill("%A_WorkingDir%\resources\InstanceLaunch.py", "akh_group instances")
return

ButtonLaunchTracker:
    RunKill(%trackerDir%)
return

ButtonExit:
ExitApp

ButtonOpenConfig:
    RunKill("notepad settings.ahk")
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
If (launchTracker)
    run, % trackerDir
If (deleteWorld)
    Run, %A_WorkingDir%\resources\DeleteWorlds.py,, ; Hide
If (launchInst)
    Run, %A_WorkingDir%\resources\InstanceLaunch.py
If (changeSeed)
    Run, %A_WorkingDir%\resources\ChangeSeed.py,, ;Hide
WinWait, Minecraft
WinKill, ahk_exe C:\Windows\py.exe
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

Warning(action, element) {
    global instanceFolder
    MsgBox, 4, , This will %action% every %element% in %instanceFolder%.`nDo you wish to continue?
    IfMsgBox No
        return
}

RunKill(runCommand= "", killCommand= "") {
    DetectHiddenWindows, On
    if GetKeyState("Shift")
        if killCommand
            WinKill, %killCommand%
    else
        if runCommand
            Run, %runCommand%
}