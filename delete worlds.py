import shutil
import glob

# Edit this
INST_FOLDER = "D:/MultiMC/instances"


files = glob.glob(f'{INST_FOLDER}/*/.minecraft/saves/*')
for f in files:
    if "New World" in f or "Speedrun #" in f or "SetSpeedrun #" in f:
        shutil.rmtree(f)
