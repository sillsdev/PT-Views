:: Install/update Paratext TN Views
:: Written by: ian_mcquay@sil.org
:: Date updated: 2025-03-14
@echo off
@set magenta=[35m
@set green=[32m
@set cyan=[36m
@set yellow=[33m
@echo %magenta%Updating the TN-views files from SIL source file on Github.%reset%
echo %magenta%Update TN Views manager.%reset%
echo.
set manager=TN-views-manager.cmd
set url-base=https://raw.githubusercontent.com/sillsdev/PT-Views/master/TN-Views
pushd "C:\Users\Public\PT-TN-Views"
  if exist "%manager%.old" del "%manager%.old"
  ren "%manager%" "%manager%.old"
  @echo %green%Attempting download of:%reset% %manager%
  @echo %green%    With line endings conversion from LF to CRLF%cyan%
  call curl --ssl-no-revoke  %url-base%/%manager% | MORE /P > "%manager%"
  FOR /F "usebackq" %%A IN ('%manager%') DO @set size=%%~zA
  @if "%size%" == "14" (
    @echo %redbg%Error: %manager% not found at %url-base%. Failed  with size = %size% %reset%
  ) else (
    @if exist "%manager%" echo %green%Updated: %manager% %reset% with size = %size%
  )
@echo.
@if not exist %manager% (echo %yellow%File %manager% not found %reset% & pause ) else (echo %green%Now running views update through TN-views-manager.cmd%reset%)
call %manager% update
popd
echo.
timeout 30
