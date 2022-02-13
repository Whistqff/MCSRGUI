with open("settings.ahk") as f:
        lines = f.readlines()

def format_lines(line_num):
        return lines[line_num].rsplit(":= ")[1].split('"')[1]