:: Install Paratext TN Views
:: Written by: ian_mcquay@sil.org
:: Date updated: 2024-06-19; 2024-10-23; 2025-03-14
@echo off
@set redbg=[101m
@set red=[31m
@set magentabg=[105m
@set magenta=[35m
@set green=[32m
@set cyan=[36m
@set yellow=[33m
@set reset=[0m
set manager=TN-views-manager.cmd
set installpath=C:\Users\Public\PT-TN-Views
set url-base=https://raw.githubusercontent.com/sillsdev/PT-Views/master/TN-Views
set cmdfile=%installpath%\%manager%
echo %green%Updating the TN-views-manager.cmd from SIL source file on Github.%reset%
echo %green%The file being replaced is renamed "TN-views-manager.cmd.old"%reset%
echo.
pushd "%installpath%"
call curl --ssl-no-revoke %url-base%/%manager% | more /P > "%manager%"
FOR /F "usebackq" %%A IN ('%manager%') DO set size=%%~zA
if %size%. gtr 16. (
  echo %green%Info: %manager% updated!%reset% size = %size% 
  call "%manager%" updateall
) else (
  echo %redbg%Error: %manager% not found at %url-base%.%reset%
)
popd
  goto :eof

