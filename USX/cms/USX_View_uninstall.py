# Uninstall USX View for Paratext
# Written by Ian McQuay, SIL International, 2024-04-15

# Import OS to be able to output correctly to Windows
import os

# Define batch files
actionbatchfile = "C:\Users\Public\PT-Views\user-views-action.cmd"
batchfile = "C:\Users\Public\PT-Views\user-views-manager.cmd"
# setup variables for the ACTION batch file.
commandstring = "echo set action=uninstall> " + actionbatchfile
os.system(commandstring)
commandstring = "echo set matchstart=USX>> " + actionbatchfile
os.system(commandstring)
# Run the batch file to do the action
os.startfile(batchfile)