from FormatLines import format_lines
import glob

INST_FOLDER = format_lines(3)
seed = format_lines(4)
print(seed)

files = glob.glob(f'{INST_FOLDER}/*/.minecraft/*')
for file in files:
    if 'seed.txt' in file:
        with open(file, 'w') as s:
            s.write(seed)
