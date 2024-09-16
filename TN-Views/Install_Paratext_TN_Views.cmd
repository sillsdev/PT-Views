@echo off
set red=[31m
set green=[32m
set cyan=[36m
set reset=[0m
set filename=TN-views-manager.cmd
set installpath=C:\Users\Public\PT-TN-Views
set url-base=https://raw.githubusercontent.com/sillsdev/PT-Views/master/TN
set cmdfile=%installpath%\%filename%
call curl -o "%cmdfile%" --ssl-no-revoke %url-base%/%filename%
FOR /F "usebackq" %%A IN ('%cmdfile%') DO set size=%%~zA
if %size%. neq 14. (
  echo %green%Info: %cmdfile% updated! %reset%
  call "%cmdfile%" install
) else (
  echo %red%Error: %filename% not found at %url-base%.%reset%
  goto :eof
)


