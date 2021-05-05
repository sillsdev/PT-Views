# TNDD Views for Paratext
# Written by Ian McQuay, SIL International, 2019-12-10 

# Import OS to be able to output correctly to Windows 
import os

# Define batch files
actionbatchfile = "C:\Users\Public\PT-Views\user-views-action.cmd"
batchfile = "C:\Users\Public\PT-Views\user-views-manager.cmd"
# setup variables for the ACTION batch file and write two variables
commandstring = "echo set action=show > " + actionbatchfile
os.system(commandstring)
commandstring = "echo set matchstart=" + matchstart + ">> " + actionbatchfile
os.system(commandstring)
# Run the batch file to do the action
os.startfile(batchfile)