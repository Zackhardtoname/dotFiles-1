#!/usr/bin/env python3

import subprocess
import time


subprocess.Popen(["xrandr"])


connect_command = "xrandr --output DP2 --auto --above eDP1"
disconnect_command = "xrandr --auto"

# function to get the output of xrandr
def get(cmd): return subprocess.check_output(cmd).decode("utf-8")
# - to count the occurrenc of " connected "
def count_screens(xr): return xr.count(" connected ")

def run_command(cmd): subprocess.Popen(["/bin/bash", "-c", cmd])

# first count
xr2 = count_screens(get(["xrandr"]))
run_command("notify-send (xr2)")
# check if there is a change in the screen state
# run_command("notify-send 'Hello from VGA'")
if xr2 == 2:
# command to run if connected (two screens)
    run_command(disconnect_command)
    run_command(connect_command)
elif xr2 == 1:
# command to run if disconnected (one screen)
# uncomment run_command(disconnect_command) to enable, then also comment out pass
    run_command(disconnect_command)
# set the second count as initial state for the next loop

time.sleep(2)

subprocess.call("~/.config/polybar/launch.sh", shell=True)
subprocess.call("pkill -9 -f wallpaper.sh", shell=True)
subprocess.call("wallpaper.sh", shell=True)
