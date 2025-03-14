::@echo off
@set magenta=[35m
@set green=[32m
@set cyan=[36m
@set yellow=[33m
@echo %magenta%Updating the TN-views files from SIL source file on Github.%reset%
@echo.
set manager="TN-views-manager.cmd"
set updatemanager="update-TN-views-manager.cmd"
pushd "C:\Users\Public\PT-TN-Views"
@if not exist %manager% echo %yellow%File not found %reset%
call %updatemanager%
call %manager% updateall
popd
echo.
pause
