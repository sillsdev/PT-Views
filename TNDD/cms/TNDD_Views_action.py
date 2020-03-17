# TNDD Views for Paratext
# Written by Ian McQuay, SIL Philippines, 2019-12-10 

# Import OS to be able to output correctly to Windows 
import os
actionbatchfile = "C:\Users\Public\TNDD-Views\TNDD-action.cmd"
batchfile = "C:\Users\Public\TNDD-Views\TNDD-manager.cmd"
commandstring = "echo set action=" + action + " > " + actionbatchfile
os.system(commandstring)
os.startfile(batchfile)
