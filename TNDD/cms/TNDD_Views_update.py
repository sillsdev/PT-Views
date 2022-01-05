# Update TNDD Views for Paratext
# Written by Ian McQuay, SIL International, 2022-01-05+10:00

# Import OS to be able to output correctly to Windows
import os

# Define batch files
actionbatchfile = "C:\Users\Public\PT-Views\user-views-action.cmd"
batchfile = "C:\Users\Public\PT-Views\user-views-manager.cmd"
# setup variables for the ACTION batch file.
commandstring = "echo set action=update> " + actionbatchfile
os.system(commandstring)
commandstring = "echo set matchstart=TNDD>> " + actionbatchfile
os.system(commandstring)
commandstring = "echo set baseurl=https://raw.githubusercontent.com/SILAsiaPub/PT-Views/master/TNDD>> " + actionbatchfile
os.system(commandstring)
commandstring = "echo set filelist=TNDD-1st-mng-line.xslt TNDD-2nd-mng-line.xslt TNDD-3rd-mng-line.xslt TNDD-table-view.xslt TNDD-tag-errors.xslt TNDD-word-count-1st-mng-line.xslt TNDD-word-count-2nd-mng-line.xslt>> " + actionbatchfile
os.system(commandstring)
# Run the batch file to do the action
os.startfile(batchfile)