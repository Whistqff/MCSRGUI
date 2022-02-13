#NoEnv
#SingleInstance Force

; Speedrun startup, for short, SRSU. With a gui too!

; Also configure the python scripts.
; If Something doesn't startup, its probs wrong directories

; Options, set to no if you dont want these to start.

global launchobs := "yes" ; Set this to no if you dont want obs to launch when you press "StartupAll"
global launchmmc := "yes" ; Set to no if you dont want to launch mmc when you press "StartupAll".
global launchcalc := "yes" ; Set to no if you dont want your calculator to launch when you press "StartupAll"
global launchmacro := "yes" ; Set to no if you dont want your macro launching up if you press StartupAll
global deleteworld := "yes" ; Set to no if you dont want your speedrunning worlds to be deleted if you press "StartupAll". (By default it doesnt delete practice worlds"
global launchinst := "yes" ; Set to no if you dont want your instances to launch if you press the "StartupAll" button.
global launchtracker := "yes" ; Set to no if you dont want your reset tracker to launch if you press the "StartupAll" button.

; EndAllConfigs

global deleteworldend := "yes" ; Set to no if you dont want your speedrunning worlds to be deleted if you press "EndAll". (By default it doesnt delete practice worlds)
global endinst := "yes" ; Set to no if you dont want your instance to be killed when you press "EndAll"
global killobs := "yes" ; Set to no if you dont want obs to be killed when you press "EndAll"
global killcalc := "yes" ; Set to no if you dont want your calc to be killed when you press "EndAll"
global killmacro := "yes" ; Set to no if you dont want your macro to be killed when you press "EndAll"
global killtracker := "yes" ; Set to no if you dont want your tracker to be killed when you press "EndAll"
global killmmc := "yes" ; Set to no if you dont want mmc to be killed when you press "EndAll"

; Directories okayge

global obsdir := "" ; Replace this with where your OBS directory is located.
global calcdir := "" ; Replace this with where your ninja bot is located.
global mmcdir := "" ; Replace this with where your MultiMC is located.
global resetdir := "" ; Replace this with where your reset macro is located
global trackerdir := "D:\multiResetTrackerV1.0\resetTracker.exe" ; Replace this with where your resetracker is.

Gui, Add, Button, x132 y9 w90 h30 , LaunchOBS
Gui, Add, Button, x32 y39 w100 h30 , LaunchMMC
Gui, Add, Button, x32 y69 w100 h30 , LaunchResetMacro
Gui, Add, Button, x132 y39 w90 h30 , LaunchCalculator
Gui, Add, Button, x242 y99 w100 h30 , Exit
Gui, Add, Button, x32 y9 w100 h30 , LaunchInstance
Gui, Add, Button, x132 y69 w90 h30 , DeleteWorlds
Gui, Add, Button, x242 y69 w100 h30 , OpenConfig
Gui, Add, Button, x242 y9 w100 h30 , StartupAll
Gui, Add, Button, x242 y39 w100 h30 , EndAll
Gui, Add, Button, x82 y99 w90 h30 , LaunchTracker
Gui, Add, Button, x362 y39 w90 h30 , CloseOBS
Gui, Add, Button, x362 y9 w90 h30 , CloseInstance
Gui, Add, Button, x362 y69 w90 h30 , CloseResetMacro
Gui, Add, Button, x452 y9 w90 h30 , CloseMMC
Gui, Add, Button, x452 y39 w90 h30 , CloseCalculator
Gui, Add, Button, x452 y69 w90 h30 , DeleteWorlds
Gui, Add, Button, x402 y99 w100 h30 , CloseTracker
Gui, Show, h143 w577, MCSRGUI
IfNotExist, %obsdir%
   MsgBox, Please put the right directories for obs in the script.(Ignore if you dont use obs)
IfNotExist, %calcdir%
   MsgBox, Please put the right directories for your calculator in the script.(Ignore if you dont use a calculator)
IfNotExist, %mmcdir%
   MsgBox, Please put the right directories for your mmc in the script.(Ignore if you dont use mmc)
IfNotExist, %resetdir%
   MsgBox, Please put the right directories for your resetdir in the script.(Ignore if you dont use a macro)
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
WinWait, C:\Windows\py.exe
WinHide, C:\Windows\py.exe
return
ButtonExit:
ExitApp
ButtonOpenConfig:
Edit
Return
ButtonLaunchTracker:
run, %trackerdir%
return
ButtonCloseInstance:
WinKill, ahk_exe javaw.exe
return
ButtonCloseMMC:
WinKill, MultiMC
Return
ButtonCloseOBS:
WinKill, OBS
return
Nicege()
{
DetectHiddenWindows, On
IfWinExist, %resetdir% ahk_class AutoHotkey
WinClose, %resetdir% ahk_class AutoHotkey
return
}
ButtonCloseCalculator:
WinKill, Ninjabrain
return
ButtonCloseTracker:
WinKill, %trackerdir%
return
ButtonCloseResetMacro:
Nicege()
return
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
If (killobs = "yes")
   WinKill, OBS
If (endinst = "yes")
   WinKill, ahk_exe javaw.exe
If (killmmc = "yes")
   WinKill, MultiMC
If (killcalc = "yes")
   WinKill, %calcdir%  
If (killtracker = "yes")
   WinKill, %trackerdir%      
If (killmacro = "yes")
   Nicege()
If (deleteworldend = "yes")
   run, delete worlds.py
return

GuiClose:
ExitApp
