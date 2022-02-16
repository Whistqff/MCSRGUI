#NoEnv
#SingleInstance Force
#Include settings.ahk
DetectHiddenWindows, On

if (darkMode) {
    Gui, Color, 2c2c2c
    Gui, Add, Picture, x162 y109 w90 h30 gButtonDeleteWorlds, %A_WorkingDir%\Gui\DeleteWorlds.png
    Gui, Add, Picture, x162 y19 w90 h30 gButtonOBS, %A_WorkingDir%\Gui\OBS.png
    Gui, Add, Picture, x52 y19 w90 h30 gButtonMultiMC, %A_WorkingDir%\Gui\MultiMC.png
    Gui, Add, Picture, x162 y49 w90 h30 gButtonNinjabrainBot, %A_WorkingDir%\Gui\NinBot.png
    Gui, Add, Picture, x52 y49 w90 h30 gButtonToggleMacro, %A_WorkingDir%\Gui\Macro.png
    Gui, Add, Picture, x162 y79 w90 h30 gButtonLaunchInstance(s), %A_WorkingDir%\Gui\InstanceLaunch.png
    Gui, Add, Picture, x52 y79 w90 h30 gButtonLaunchTracker, %A_WorkingDir%\Gui\Tracker.png
    Gui, Add, Picture, x272 y79 w90 h30 gButtonOpenConfig, %A_WorkingDir%\Gui\Config.png
    Gui, Add, Picture, x52 y109 w90 h30 gButtonChangeSeed, %A_WorkingDir%\Gui\Seed.png
    Gui, Add, Picture, x272 y19 w90 h30 gButtonLaunchAll, %A_WorkingDir%\Gui\LaunchAll.png
    Gui, Add, Picture, x272 y49 w90 h30 gButtonEndAll, %A_WorkingDir%\Gui\EndAll.png
    Gui, Add, Picture, x272 y109 w90 h30 gButtonExit, %A_WorkingDir%\Gui\Exit.png
    Gui, Show, x449 y289 h163 w427, MCSRGUI
    Return
}
Else
    Gui, Add, Button, x162 y109 w90 h30 , Delete Worlds
    Gui, Add, Button, x162 y19 w90 h30 , OBS
    Gui, Add, Button, x52 y19 w90 h30 , MultiMC
    Gui, Add, Button, x162 y49 w90 h30 , Ninjabrain Bot
    Gui, Add, Button, x52 y49 w90 h30 , Toggle Macro
    Gui, Add, Button, x162 y79 w90 h30 , Launch Instance(s)
    Gui, Add, Button, x52 y79 w90 h30 , Launch Tracker
    Gui, Add, Button, x272 y79 w90 h30 , Open Config
    Gui, Add, Button, x52 y109 w90 h30 , Change Seed
    Gui, Add, Button, x272 y19 w90 h30 , Launch All
    Gui, Add, Button, x272 y49 w90 h30 , End All
    Gui, Add, Button, x272 y109 w90 h30 , Exit
    Gui, Show, x449 y289 h163 w427, MCSRGUI
Return

ButtonOBS:
Run, %obsDir%
return

ButtonMultiMC:
Run, %multimcDir%
return

ButtonToggleMacro:
IfWinNotExist, %macroDir% ahk_class AutoHotkey
   Run, %macroDir%
IfWinExist, %macroDir% ahk_class AutoHotkey
   WinKill, %macroDir%
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

F12::
WinGetActiveTitle, activewin
If WinActive("MultiMC")
   WinKill, %activewin%
If WinActive("OBS")
   WinKill, %activewin%
If WinActive("Ninjabrain")
   WinKill, %activewin%
If WinActive("ahk_exe resettracker.exe")
   WinKill, %activewin%
If (killinstshift)
   If WinActive("Minecraft")
      GroupAdd instances, Minecraft
      WinKill,ahk_group instances
return

ButtonLaunchTracker:
Run, %trackerDir%
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
    run, % macroDir
If (deleteWorld)
    Run, %A_WorkingDir%\resources\DeleteWorlds.py,, Hide
If (launchInst) {
    Run, %A_WorkingDir%\resources\InstanceLaunch.py,, Hide
WinWait, Minecraft
WinKill, ahk_exe C:\Windows\py.exe
}
If (launchtracker)
    Run, % trackerDir
If (changeSeed)
    Run, %A_WorkingDir%\resources\ChangeSeed.py,, Hide
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
    WinKill, %macroDir% ahk_class AutoHotkey
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
