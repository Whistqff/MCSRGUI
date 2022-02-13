from FormatLines import format_lines
import subprocess

instance_format = format_lines(0)
instance_count = int(format_lines(1))
mmc = format_lines(2)

for i in range(1, instance_count + 1):
        print(f"Starting {instance_format}{i}...")
        subprocess.Popen(f"{mmc} -l {instance_format}{i}")