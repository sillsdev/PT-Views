# Update with TN_Views_manager_updater.py for Paratext
# Written by Ian McQuay, SIL International, 2022-01-05+10:00

# Import OS to be able to output correctly to Windows
import os

# Define batch files
actionbatchfile = "C:\Users\Public\PT-TN-Views\user-views-action.cmd"
batchfile = "C:\Users\Public\PT-TN-Views\update-TN-views-manager.cmd"

# setup variables for the ACTION batch file.
commandstring = "echo set action=update> " + actionbatchfile
os.system(commandstring)
# Run the batch file to do the action
os.startfile(batchfile)
