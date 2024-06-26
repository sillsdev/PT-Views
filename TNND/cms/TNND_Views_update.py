# Update TNND Views for Paratext
# Written by Ian McQuay, SIL International, 2022-01-05+10:00

# Import OS to be able to output correctly to Windows
import os

# Define batch files
actionbatchfile = "C:\Users\Public\PT-Views\user-views-action.cmd"
batchfile = "C:\Users\Public\PT-Views\user-views-manager.cmd"
# setup variables for the ACTION batch file.
commandstring = "echo set action=update> " + actionbatchfile
os.system(commandstring)
commandstring = "echo set matchstart=TNND>> " + actionbatchfile
os.system(commandstring)
commandstring = "echo set baseurl=https://raw.githubusercontent.com/sillsdev/PT-Views/master/TNND>> " + actionbatchfile
os.system(commandstring)
commandstring = "echo set filelist=TNND-tag-errors.xslt TNND-word-count.xslt>> " + actionbatchfile
os.system(commandstring)
# Run the batch file to do the action
os.startfile(batchfile)
