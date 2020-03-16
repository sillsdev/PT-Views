# TNDD Views for Paratext
# Written by Ian McQuay, SIL Philippines, 2019-12-10 

# Import OS to be able to output correctly to Windows 
import os
actionbatchfile = "%USERPROFILE%\AppData\Roaming\TNDD-Views\TNDD-action.cmd"
batchfile = "%USERPROFILE%\AppData\Roaming\TNDD-Views\TNDD-manager.cmd"
commandstring = "echo set action=" + action + " > " + actionbatchfile
os.system(commandstring)
os.startfile(batchfile)
