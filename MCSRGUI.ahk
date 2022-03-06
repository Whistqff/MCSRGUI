#NoEnv
#SingleInstance Force
#Include settings.ahk
DetectHiddenWindows, On
global darkMode := darkMode
FileRemoveDir, % A_ScriptDir "/resources/__pycache__"

If (darkMode) {
    Gui, Color, 2c2c2c
    Gui, Add, Picture, x162 y109 w90 h30 vDeleteWorlds gButtonDeleteWorlds, % A_ScriptDir "/GUI/DeleteWorlds.png"
    Gui, Add, Picture, x162 y19 w90 h30 vOBS gButtonOBS, % A_ScriptDir "/GUI/OBS.png"
    Gui, Add, Picture, x52 y19 w90 h30 vMultiMC gButtonMultiMC, % A_ScriptDir "/GUI/MultiMC.png"
    Gui, Add, Picture, x162 y49 w90 h30 vNinBot gButtonNinjabrainBot, % A_ScriptDir "/GUI/NinBot.png"
    Gui, Add, Picture, x52 y49 w90 h30 vMacro gButtonToggleMacro, % A_ScriptDir "/GUI/Macro.png"
    Gui, Add, Picture, x162 y79 w90 h30 vInstance gButtonLaunchInstance(s), % A_ScriptDir "/GUI/Instance.png"
    Gui, Add, Picture, x52 y79 w90 h30 vTracker gButtonLaunchTracker, % A_ScriptDir "/GUI/Tracker.png"
    Gui, Add, Picture, x272 y79 w90 h30 vConfig gButtonOpenConfig, % A_ScriptDir "/GUI/Config.png"
    Gui, Add, Picture, x52 y109 w90 h30 vSeed gButtonChangeSeed, % A_ScriptDir "/GUI/Seed.png"
    Gui, Add, Picture, x272 y19 w90 h30 vLaunchAll gButtonLaunchAll, % A_ScriptDir "/GUI/LaunchAll.png"
    Gui, Add, Picture, x272 y49 w90 h30 vEndAll gButtonEndAll, % A_ScriptDir "/GUI/EndAll.png"
    Gui, Add, Picture, x272 y109 w90 h30 vExit gButtonExit, % A_ScriptDir "/GUI/Exit.png"
    Gui, Show, x449 y289 h163 w427, MCSRGUI
    Return
}

Else {
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
}
Return

ButtonOBS:
    Pressed("OBS")
    RunKill(obsDir, "OBS")
return

ButtonMultiMC:
    Pressed("MultiMC")
    RunKill(multimcDir, "ahk_exe MultimMC.exe")
return

ButtonToggleMacro:
    Pressed("Macro")
    RunKill(macroDir, macroDir . " ahk_class AutoHotkey")
return

ButtonLaunchInstance(s):
    Pressed("Instance")
    PythonRun(A_ScriptDir . "\resources\InstanceLaunch.py",,, False)
Return

ButtonLaunchTracker:
    Pressed("Tracker")
    RunKill(trackerDir, trackerDir)
Return

ButtonNinjabrainBot:
    Pressed("NinBot")
    RunKill(calcDir, "NinjaBrain")
return

ButtonDeleteWorlds:
    Pressed("DeleteWorlds")
    PythonRun(A_ScriptDir . "\resources\DeleteWorlds.py", "delete", "world existing")
return

ButtonChangeSeed:
    Pressed("Seed")
    PythonRun(A_ScriptDir . "\resources\ChangeSeed.py", "change", "seed")
return

ButtonLaunchAll:
    Pressed("LaunchAll")
    If (launchObs)
        RunKill(obsDir)
    If (launchMMC)
        RunKill(multimcDir)
    If (launchCalc)
        RunKill(calcDir)
    If (launchMacro)
        RunKill(macroDir)
    If (launchtracker)
        RunKill(trackerDir)
    If (deleteWorld)
        PythonRun(A_ScriptDir . "\resources\DeleteWorlds.py",,, False)
    If (launchInst) 
        PythonRun(A_ScriptDir . "\resources\InstanceLaunch.py",,, False)
    If (SeedLaunch)
        PythonRun(A_ScriptDir . "\resources\ChangeSeed.py",,, False)
return

ButtonOpenConfig:
    Pressed("Config")
    RunWait, notepad settings.ahk
    WinWaitClose, settings.ahk - notepad
    Reload
Return

ButtonEndAll:
    Pressed("EndAll")
    if (killObs)
        Kill("OBS")
    if (killInst)
        Kill("ahk_group instances")
    if (killMMC)
        Kill("ahk_exe MultiMC.exe")
    if (killCalc)
        Kill("Ninjabot")
    if (killMacro)
        Kill(macroDir . " ahk_class AutoHotkey")
    if (killtracker)
        Kill(trackerDir)
return

ButtonExit:
    Pressed("Exit")
ExitApp

GuiClose: 
ExitApp

global instanceFolder := instanceFolder

; If the user has shift holded, will kill the process. Otherwise it just runs it.
RunKill(runCommand= "", killCommand= "") {
    if GetKeyState("Shift")
        WinKill, % killCommand
    Else
        Run, % runCommand
Return
}

; Warns the user, then if pressed yes, will run the file. (Will launch without warning if the function got called false)
PythonRun(File= "", Action= "", Element= "", WarnBox= "True") {
    If (WarnBox) {
        MsgBox, 4,, % "This will " action " every " element " in " instanceFolder "`nDo you wish to continue?"
            IfMsgBox, No
                return
            Else
                Run, % File,, Hide
    }
    Else
        Run, % File,, Hide
Return
}

; Changes the state of a button for 40ms to be on the "pressed" state
Pressed(Control_ID) {
    If (darkMode) {
        GuiControl,, % Control_ID, % A_ScriptDir "/GUI/" Control_ID "Pressed.png"
        Sleep, 40
        GuiControl,, % Control_ID, % A_ScriptDir "/GUI/" Control_ID ".png"
    }
Return
}

; Kills the process specified(and if KillInst is set to true it also kills all the instances)
Kill(ProcessTitle= "") {
    WinKill, %ProcessTitle
    If (killInst)
        GroupAdd, instances, Minecraft
        WinKill, ahk_group instances
Return
}