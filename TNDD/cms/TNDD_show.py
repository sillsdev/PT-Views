
# Written by Ian McQuay, SIL Philippines, 2019-12-10 

# Import OS to be able to output correctly to Windows 
import os
batchfile = "C:\\Temp\\TNDD-manager.cmd"
commandstring = "ren \"" + ptviewsfolder + "\*.hide\" *.xml >" + batchfile
os.system(commandstring)
os.system(batchfile)