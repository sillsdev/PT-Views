# Toggle SFM Views updater for Paratext
# Written by Ian McQuay, SIL International, 2024-05-25

# Import OS to be able to output correctly to Windows
import os

# Define batch files
actionbatchfile = "C:\Users\Public\PT-Bamboo-View\user-views-action.cmd"
batchfile = "C:\Users\Public\PT-Bamboo-View\Bamboo-views-manager.cmd"

# setup variables for the ACTION batch file.
commandstring = "echo set action=toggle> " + actionbatchfile
os.system(commandstring)
commandstring = "echo set TNxD=SFM>> " + actionbatchfile
os.system(commandstring)
# Run the batch file to do the action
os.startfile(batchfile)
