from FormatLines import format_lines
import shutil
import glob

INST_FOLDER = format_lines(3)

files = glob.glob(f'{INST_FOLDER}/*/.minecraft/saves/*')
for f in files:
    if "New World" in f or "Speedrun #" in f or "SetSpeedrun #" in f:
        shutil.rmtree(f)
