::@echo off
@echo Updating the TN-views files from SIL source file on Github.
@echo.
set manager="TN-views-manager.cmd"
@echo %manager%
pushd "C:\Users\Public\PT-TN-Views"
@if not exist %manager% echo File not found 
call %manager% updateall
popd
echo.
pause