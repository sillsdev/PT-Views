@echo off
@set magenta=[35m
@set green=[32m
@set cyan=[36m
@set yellow=[33m
echo Updating the TN-views-manager.cmd from SIL source file on Github.
echo The file being replaced is renamed "TN-views-manager.cmd.old"
echo.
set manager=TN-views-manager.cmd
set url-base=https://raw.githubusercontent.com/sillsdev/PT-Views/master
pushd "C:\Users\Public\PT-TN-Views"
if exist "%manager%.old" del "%manager%.old"
ren "%manager%" "%manager:~32%.old"
call curl --ssl-no-revoke -o "%manager%" %url-base%/%manager:~32%
echo.
if exist "%manager%" echo Update complete.
popd
pause
