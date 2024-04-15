# Update TNDD Views for Paratext
# Written by Ian McQuay, SIL International, 2024-04-15

# Import OS to be able to output correctly to Windows
import os

# Define batch files
actionbatchfile = "C:\Users\Public\PT-Views\user-views-action.cmd"
batchfile = "C:\Users\Public\PT-Views\user-views-manager.cmd"
viewsmaster = "TNDD-Public-list.txt"
# setup variables for the ACTION batch file.
commandstring = "echo set action=updateinstalled> " + actionbatchfile
os.system(commandstring)
commandstring = "echo set matchstart=TNDD>> " + actionbatchfile
os.system(commandstring)updateinstalled
commandstring = "echo set baseurl=https://raw.githubusercontent.com/sillsdev/PT-Views/master/TNDD>> " + actionbatchfile
os.system(commandstring)
#commandstring = "echo set filelist=TNDD-1st-mng-line.xslt TNDD-2nd-mng-line.xslt TNDD-3rd-mng-line.xslt TNDD-table-view.xslt TNDD-tag-errors.xslt TNDD-word-count-1st-mng-line.xslt TNDD-word-count-2nd-mng-line.xslt>> " + actionbatchfile
commandstring = "echo set filelist=" + viewsmaster + ">> " + actionbatchfile
os.system(commandstring)
# Run the batch file to do the action
os.startfile(batchfile)