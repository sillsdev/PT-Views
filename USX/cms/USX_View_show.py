# Show USX View for Paratext
# Written by Ian McQuay, SIL International, 2024-04-15

# Import OS to be able to output correctly to Windows
import os
import shutil
curfile = "USX-view.xml"
sourcefile = "C:\\Users\\Public\\PT-Views\\USX\\" + curfile
destfile = "..\\Views\\" + curfile

shutil.copyfile(sourcefile, destfile)
