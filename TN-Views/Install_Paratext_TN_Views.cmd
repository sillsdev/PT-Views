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
echo %green%========== Installing TN Views. ==========%reset%
echo.
echo %green%Which views do you want to install?%reset%
echo.
call :question TNDD
call :question TNND
call :question SFM
call :question USX
echo.
echo %green%Updating the TN-views-manager.cmd from SIL source file on Github.%reset%
echo %green%The file being replaced is renamed "TN-views-manager.cmd.old"%reset%
pushd "%installpath%"
  call curl --ssl-no-revoke %url-base%/%manager% | more /P > "%manager%"
  FOR /F "usebackq" %%A IN ('%manager%') DO set size=%%~zA
popd
if %size%. gtr 16. (
  echo %green%Info: %manager% updated!%reset% size = %size% 
  call "%installpath%\%manager%" update
) else (
  echo %redbg%Error: %manager% not found at %url-base%.%reset%
)
goto :eof

:question
set type=%~1
@echo off
set /p answer="Do you want to install %type% views? (Y/N): "
if /i "%answer%"=="Y" (
    echo %green%The installer will install %type% views!%reset%
    echo TN-%type%-list.txt> %installpath%\TN-%type%-list.txt
) else (
    echo %yellow%%type% views will not be installed.%reset%
)
goto :eof