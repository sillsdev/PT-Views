:: Install/update Paratext TN Views
:: Written by: ian_mcquay@sil.org
:: Date updated: 2025-03-14
@echo off
@set magenta=[35m
@set green=[32m
@set cyan=[36m
@set yellow=[33m
@echo %magenta%Updating the TN-views files from SIL source file on Github.%reset%
@echo.
set manager="TN-views-manager.cmd"
set updatemanager="update-TN-views-manager.cmd"
pushd "C:\Users\Public\PT-TN-Views"
@if not exist %manager% echo %yellow%File %manager% not found %reset% & pause
@if not exist %updatemanager% echo %yellow%File %updatemanager% not found %reset% & pause
call %updatemanager% 2
call %manager% updateall
popd
echo.
pause
