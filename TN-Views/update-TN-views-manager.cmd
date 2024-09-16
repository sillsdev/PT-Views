@echo off
echo Updating the TN-views-manager.cmd from SIL source file.
echo The file being replaced is renamed "TN-views-manager.cmd.old"
echo.
set manager=C:\Users\Public\PT-TN-Views\TN-views-manager.cmd
set url-base=https://raw.githubusercontent.com/sillsdev/PT-Views/master
if exist "%manager%.old" del "%manager%.old"
ren "%manager%" "%manager:~32%.old"
call curl --ssl-no-revoke -o "%manager%" %url-base%/%manager:~32%
echo.
if exist "%manager%" echo Update complete.
pause
