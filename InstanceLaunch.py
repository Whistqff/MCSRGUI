import shutil
import glob
import os

instance_format    = "SSG"                # The name format of your instances (i have instance1, instance2 etc so its 'instance')
mmc                = "D:\\MultiMC"             # Change this to match your MultiMc.exe location
instance_count     = 1 

for i in range(1, instance_count + 1):
        print(f"Starting {instance_format}{i}...")
        os.system(f"{mmc}\\UltimMC.exe -l {instance_format}{i}")
