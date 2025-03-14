:: Date updated: 2024-06-19; 2024-10-23
@echo off
@set red=[31m
@set green=[32m
@set cyan=[36m
@set reset=[0m
set filename=TN-views-manager.cmd
set installpath=C:\Users\Public\PT-TN-Views
set url-base=https://raw.githubusercontent.com/sillsdev/PT-Views/master/TN-Views
set cmdfile=%installpath%\%filename%
call curl --ssl-no-revoke %url-base%/%filename% | more /P > "%cmdfile%"
FOR /F "usebackq" %%A IN ('%cmdfile%') DO set size=%%~zA
if %size%. neq 14. (
  echo %green%Info: %cmdfile% updated! size = %size% %reset%
  call "%cmdfile%" updateall
) else (
  echo %red%Error: %filename% not found at %url-base%.%reset%
)
  goto :eof

