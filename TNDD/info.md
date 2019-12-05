# Paratext TNDD Views release

This set of files is to help content creators and checkers to see the data in different ways. There are 5 views, each view requires two files with the same name but one with a .xml and the other with a .xslt extension:

- TNDD-table view -- This displays up to four columns. The source language in the left most column, then the first meaning from the \ml1, then the second meaning and finally the third meaning.
- TNDD-1st-mng-line -- This displays the 1st meaning line preceded by the verse reference. Each verse starts on a new line.
- TNDD-2nd-mng-line -- This displays the 2nd meaning line and is similar to the 1st line, but if there no data for a second meaning (\ml1) line the then that data from the 1st meaning is displayed in (( )) with text in a red-brown color.
- TNDD-3rd-mng-line -- This displays the 3rd meaning line and is similar to the 1st and 2nd line, but if there no data for a third meaning (\ml1) line the then that data is displayed in (( with a brown color if it comes from the 2nd meaning and a red-brown if it come from he 1st first line.
- TNDD-schema-check -- This aids content creators to see that there is a markup error that PT does not catch. This is an initial attempt, so may have issues.

## Installation methods

### First do the following for before choosing an installation option:
- Download **Views.zip** from the https://github.com/SILAsiaPub/PT-Views/releases from the latest release.
- In your Downloads folder, right click on the Views.zip file
- Select Extract all...
- Ensuring "Show extracted files when complete" is checked, click on **Extract**.

### Option 1 script install
- Double click on the **install_Paratext_TNDD_Views.cmd**
  - If all went well the black box dissappears. If not it will stay and give failure info
- Restart or Start Paratext and the new views should be available in the Ctrl+E menu or the projects hamburger menu.

### Option 2 Drag and drop with mouse
- Click and drag the Views folder into the **My Paratext 8(or 9) Project** folder
- Restart or Start Paratext and the new views should be available in the Ctrl+E menu or the projects hamburger menu.
- If the Views do not show you may have dragged the Views folder to the wrong place.

### Option 3 Copy files manually
- Copy the *.xml and *.xslt files from the Views folder
- Navigate to your My Paratext 8(or 9) Projects folder
- Look for the **Views** folder
- If the **Views** folder does not exist then create it
- Paste the copied files into your 'My Paratext 8(or 9) Projects\Views' folder
- Restart or Start Paratext and the new views should be available in the Ctrl+E menu or the projects hamburger menu.
- If the Views do not show you may have copied the file to the wrong place.
