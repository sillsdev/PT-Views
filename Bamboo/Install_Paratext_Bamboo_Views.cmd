@echo off
set filename=Bamboo-views-manager.cmd
set installpath=C:\Users\Public\PT-Bamboo-Views
set url-base=https://raw.githubusercontent.com/sillsdev/PT-Views/master/Bamboo
set cmdfile=%installpath%\%filename%
if not exist "%cmdfile%" (
  call curl -o "%cmdfile%" --ssl-no-revoke %url-base%/%filename%
  @if exist "%cmdfile%\" echo %green%%filename% updated. %reset%
)
FOR /F "usebackq" %%A IN ('%cmdfile%') DO set size=%%~zA
if %size%. neq 14. (
pause
  call "%cmdfile%" install
)


