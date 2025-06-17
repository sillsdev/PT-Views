:: Date updated: 2024-06-19; 2024-10-23
@echo off
set installpath=C:\Users\Public\PT-TN-Views
set manager=TN-views-manager.cmd
if exist "%installpath%\%manager%" call "%installpath%\%manager%" uninstall
