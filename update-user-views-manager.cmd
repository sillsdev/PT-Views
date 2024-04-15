@echo off
echo Updating the user-views-manager.cmd from SIL source file.
echo The file being replaced is renamed "user-views-manager.cmd.old"
echo.
if exist "C:\Users\Public\PT-Views\user-views-manager.cmd.old" del "C:\Users\Public\PT-Views\user-views-manager.cmd.old"
ren "C:\Users\Public\PT-Views\user-views-manager.cmd" user-views-manager.cmd.old
call curl --ssl-no-revoke -o "C:\Users\Public\PT-Views\user-views-manager.cmd" https://raw.githubusercontent.com/sillsdev/PT-Views/master/user-views-manager.cmd
echo.
if exist "C:\Users\Public\PT-Views\user-views-manager.cmd" echo Update complete.
pause
