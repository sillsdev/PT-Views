# Paratext TNDD Views release

This set of files is to help content creators and checkers to see the data in different ways. There are 5 views:

- TNDD-table view -- This displays up to four columns. The source language in the left most column, then the first meaning from the \ml1, then the second meaning and finally the third meaning.
- TNDD-1st-mng-line -- This displays the 1st meaning line preceded by the verse reference. Each verse starts on a new line.
- TNDD-2nd-mng-line -- This displays the 2nd meaning line and is similar to the 1st line, but if there no data for a second meaning (\ml1) line the then that data from the 1st meaning is displayed in (( )) with text in a red-brown color.
- TNDD-3rd-mng-line -- This displays the 3rd meaning line and is similar to the 1st and 2nd line, but if there no data for a third meaning (\ml1) line the then that data is displayed in (( with a brown color if it comes from the 2nd meaning and a red-brown if it come from he 1st first line.
- TNDD-schema-check -- This aids content creators to see that there is a markup error that PT does not catch. This is an initial attempt, so may have issues.

## Automated install

- Download **Paratext-TNDD-Views-installer.exe** from the https://github.com/SILAsiaPub/PT-Views/releases from the latest release.
- Double click on the **Paratext-TNDD-Views-installer.exe** file, in your Downloads folder.
- Wait while your Antivirus inspects it, ignore error messages. These are caused by the Antivirus interupting installer.
- When the User Account Control appears asking "Do you want to allow this app from and unknown publisher to make changes to this device?" click Yes.
- Follow the prompts.
- Restart or Start Paratext and the new views should be available in the Ctrl+E menu or the projects hamburger menu.


## Manual install

- Download **Source code (zip)** from the https://github.com/SILAsiaPub/PT-Views/releases from the latest release.
- Unzip the source.zip file
- Copy the *.xml and *.xslt files from the TNDD folder
- Paste the copied files into your 'My Paratext 8(or 9) Projects\Views' folder
- Restart or Start Paratext and the new views should be available in the Ctrl+E menu or the projects hamburger menu.


