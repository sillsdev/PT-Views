# Update Bamboo Views updater for Paratext
# Written by Ian McQuay, SIL International, 2022-01-05+10:00

# Import OS to be able to output correctly to Windows
import os

# Define batch files
actionbatchfile = "C:\Users\Public\PT-Views\user-views-action.cmd"
batchfile = "C:\Users\Public\PT-Views\Bamboo_Views_updater.cmd"
# setup variables for the ACTION batch file.
commandstring = "echo set action=update> " + actionbatchfile
os.system(commandstring)
#commandstring = "echo set matchstart=TNND>> " + actionbatchfile
#os.system(commandstring)
commandstring = "echo set baseurl=https://raw.githubusercontent.com/sillsdev/PT-Views/master>> " + actionbatchfile
os.system(commandstring)
commandstring = "echo set filelist=" + batchfile + ">> " + actionbatchfile
os.system(commandstring)
commandstring = "curl.exe --ssl-no-revoke -o " + actionbatchfile + " " + baseurl + "Bamboo_Views_updater.cmd"
os.system(commandstring)
# Run the batch file to do the action
os.startfile(actionbatchfile)