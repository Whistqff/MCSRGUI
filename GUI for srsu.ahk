#NoEnv
#SingleInstance Force

; Speedrun startup, for short, SRSU. With a gui too!
; Also configure the python scripts.
; Options, set to no if you dont want these to start.
global launchobs := "yes" ; Set this to no if you dont want obs to launch when you press "StartupAll"
global launchmmc := "yes" ; Set to no if you dont want to launch mmc when you press "StartupAll".
global launchcalc := "yes" ; Set to no if you dont want your calculator to launch when you press "StartupAll"
global launchmacro := "yes" ; Set to no if you dont want your macro launching up if you press StartupAll
global deleteworld := "yes" ; Set to no if you dont want your speedrunning worlds to be deleted if you press "StartupAll". (By default it doesnt delete practice worlds"
global launchinst := "yes" ; Set to no if you dont want your instances to launch if you press the "StartupAll" button.
; Directories okayge
global obsdir := "" ; Replace this with where your OBS directory is located.
global calcdir := "" ; Replace this with where your ninja bot is located.
global mmcdir := "" ; Replace this with where your MultiMC is located.
global resetdir := "" ; Replace this with where your reset macro is located

Gui, Add, Button, x102 y-1 w90 h30 , LaunchOBS
Gui, Add, Button, x2 y-1 w100 h30 , LaunchMMC
Gui, Add, Button, x2 y29 w100 h30 , LaunchResetMacro
Gui, Add, Button, x102 y29 w90 h30 , LaunchCalculator
Gui, Add, Button, x102 y89 w90 h30 , Exit
Gui, Add, Button, x102 y59 w90 h30 , LaunchInstance
Gui, Add, Button, x2 y59 w100 h30 , DeleteWorlds
Gui, Add, Button, x2 y89 w100 h30 , OpenConfig
Gui, Add, Button, x197 y14 w100 h30 , StartupAll
Gui, Add, Button, x197 y44 w100 h30 , EndAll
Gui, Add, Text, x2 y119 w260 h30 , Please press "OpenConfig" and configure the script if you haven't yet.
Gui, Show, h155 w307, SRSU
Return

ButtonLaunchOBS:
Run, %obsdir%
return
ButtonLaunchMMC:
Run, %mmcdir%
return
ButtonLaunchResetMacro:
Run, %resetdir%
return
ButtonLaunchCalculator:
Run, %calcdir%
return
ButtonDeleteWorlds:
Run, delete worlds.py
return
ButtonLaunchInstance:
Run, InstanceLaunch.py
return
ButtonExit:
ExitApp
ButtonOpenConfig:
Edit
Return
ButtonStartupAll:
If (launchobs = "yes")
run, %obsdir%
If (launchmmc = "yes")
run, %mmcdir%
If (launchcalc = "yes")
run, %calcdir%
If (launchmacro = "yes")
run, %resetdir%
If (deleteworld = "yes")
run, delete worlds.py
If (launchinst = "yes")
run, InstanceLaunch.py
WinWait, Minecraft
WinKill, ahk_exe C:\Windows\py.exe
return
ButtonEndAll:
WinKill, OBS
WinKill, Minecraft
WinKill, MultiMC
WinKill, Ninjabrain
WinKill, ahk_exe %resetdir%
fullScriptPath = %resetdir%
DetectHiddenWindows, On 
WinClose, %fullScriptPath% ahk_class AutoHotkey
return

GuiClose:
ExitApp