# Paratext TNDD Views release

This set of files is to help content creators and checkers to see the data in different ways. There are 5 views, each view requires two files with the same name but one with a .xml and the other with a .xslt extension:

## Installation methods

### First do the following for before choosing an installation option:
- Download **Paratext-TNDD-Views-installer.exe** and follow Option 1 
- or download **[Views.zip](https://github.com/SILAsiaPub/PT-Views/releases/download/latest/Views.zip)** and follow Options 2, 3 or 4. 
  - In your Downloads folder, right click on the Views.zip file
  - Select Extract all...
  - Ensuring "Show extracted files when complete" is checked, click on **Extract**.



### Option 1 Use the Paratext-TNDD-Views-installer.exe 
- This is an unsigned installer so your Anti-Virus may object.

### Option 2 script install
- Double click on the **install_Paratext_TNDD_Views.cmd**
  - If all went well the black box dissappears. If not it will stay and give failure info
- Restart or Start Paratext and the new views should be available in the Ctrl+E menu or the projects hamburger menu.

### Option 3 Drag and drop with mouse
- Click and drag the Views folder into the **My Paratext 8(or 9) Project** folder
- Select the four files in the cms folder and drag them to your **cms** folder in your **My Paratext 8(or 9) Project** folder
- Create a folder: %USERPROFILE%\AppData\Roaming\TNDD-Views
- Select the TNDD-manager.cmd and the Uninstall-TNDD-Views.cmd filea and drag them to folder created in the previous line
- Restart or Start Paratext and the new views should be available in the Ctrl+E menu or the projects hamburger menu.
- If the Views do not show you may have dragged the Views folder to the wrong place.

### Option 4 Copy files manually
- Copy the *.xml and *.xslt files from the Views folder
- Navigate to your My Paratext 8(or 9) Projects folder
- Look for the **Views** folder
- If the **Views** folder does not exist then create it
- Paste the copied files into your **My Paratext 8(or 9) Projects\Views** folder
- Copy the four files from the **My Paratext 8(or 9) Projects\Views\cms** folder
- Navigate to your **My Paratext 8(or 9) Projects** folder
- Look for the **cms** folder
- Paste the copied files into your **My Paratext 8(or 9) Projects\cms** folder
- Create a folder: %USERPROFILE%\AppData\Roaming\TNDD-Views
- Select the TNDD-manager.cmd and the Uninstall-TNDD-Views.cmd filea and copy them to folder created in the previous line
- Restart or Start Paratext and the new views should be available in the Ctrl+E menu or the projects hamburger menu.
- Under the **Project Tools > Custom Tools > Custom Views ** menu you will have two items to hide or show the TNDD Views as part of your views.
- If the Views do not show you may have copied the file to the wrong place.

## Managing Custom Views

### Hiding TNDD Views
- In Paratext click on the hamburger icon in any project.
- In the **Tools** menu hover over or click on **Custom tools**
- In  **Custom tools** click on **Custom Views**
- Click on **Hide TNDD Views**
- Click the **OK** on the **Hide TNDD Views** dialog
- Restart Paratext

### Show TNDD Views tha were previously hidden
- In Paratext click on the hamburger icon in any project.
- In the **Tools** menu hover over or click on **Custom tools**
- In  **Custom tools** click on **Custom Views**
- Click on **Show TNDD Views**
- Click the **OK** on the **Show TNDD Views** dialog
- Restart Paratext

## Uninstall
- Just double click the **Uninstall-TNDD-Views.cmd** in original extracted View.zip folder.
- Or find in: %userprofile%\AppData\Roaming\TNdd-Views the file **Uninstall-TNDD-Views.cmd** and double click that 
- or You could just delete the Views folder if you only have TNDD views,
- or You could just delete the .xml files in the Views folder and those views would no longer appear,
- or you could delete all the files in the Views folder.
- also delete all files starting with TNDD from the **My Paratext 8(or 9) Projects\cms** folder if not using the uninstaller.

## Views

- TNDD-table view -- This displays up to four columns. The source language in the left most column, then the first meaning from the \ml1, then the second meaning and finally the third meaning.
- TNDD-1st-mng-line -- This displays the 1st meaning line preceded by the verse reference. Each verse starts on a new line.
- TNDD-2nd-mng-line -- This displays the 2nd meaning line and is similar to the 1st line, but if there no data for a second meaning (\ml1) line the then that data from the 1st meaning is displayed in (( )) with text in a red-brown color.
- TNDD-3rd-mng-line -- This displays the 3rd meaning line and is similar to the 1st and 2nd line, but if there no data for a third meaning (\ml1) line the then that data is displayed in (( with a brown color if it comes from the 2nd meaning and a red-brown if it come from he 1st first line.
- TNDD-tag-errors -- This aids content creators to see that there is a markup error that PT does not catch. This is an initial attempt, so may have issues.

## There are three **Tools > Custom Tools > Custom Views**
- Hide TNDD Views 
- Show TNDD Views 
- Uninstall TNDD Views 