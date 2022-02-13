instanceFormat := "1.16.1" ; The name format of your instances (i have instance1, instance2 etc so its 'instance')
instanceCount := "0"
multimcDir := "C:\Users\Sophie\Desktop\MultiMC\MultiMC.exe" ; Change this to match your MultiMC.exe location
instanceFolder := "C:\Users\Sophie\Desktop\MultiMC\instances" ; Instance where deleting worlds / changing seeds will happen
seed := "1234657890" ; Leave empty if you don't want to use a seed

obsDir := "" ; Replace this with where your OBS directory is located. (shortcut recommended)
calcDir := "" ; Replace this with where your ninja bot is located.
macroDir := "" ; Replace this with where your reset macro is located
trackerDir := "" ; Replace this with where your reset Tracker is.

; LaunchAllConfigs
launchMMC := True ; Set to False if you dont want to launch mmc when you press "StartupAll".
launchCalc := True ; Set to False if you dont want your calculator to launch when you press "StartupAll"
launchMacro := True ; Set to False if you dont want your macro launching up if you press StartupAll
launchInst := True ; Set to False if you dont want your instances to launch if you press the "StartupAll" button.
launchTracker := True ; Set to False if you dont want your tracker to launch if you press the "StartupAll" button.
deleteWorlds := True ; Set to False if you dont want your speedrunning worlds to be deleted if you press "StartupAll". (By default it doesnt delete practice worlds"
changeSeed := ; True Set to False if you dont want your seeds to be changed if you press "StartupAll".

; EndAllConfigs
killInst := True ; Set to False if you dont want your instance to be killed when you press "EndAll"
killObs := True ; Set to False if you dont want obs to be killed when you press "EndAll"
killCalc := True ; Set to False if you dont want your calc to be killed when you press "EndAll"
killTracker := True ; Set to False if you dont want your tracker to be killed when you press "EndAll"
killMMC := True ; Set to False if you dont want mmc to be killed when you press "EndAll"
killMacro := True ; same as the above but kills macro