:: update-TN-views-manager.cmd
@echo on
@set red=[31m
@set magenta=[35m
@set green=[32m
@set cyan=[36m
@set yellow=[33m
echo %green%Updating the TN-views-manager.cmd from SIL source file on Github.%reset%
echo %green%The file being replaced is renamed "TN-views-manager.cmd.old"%reset%
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

popd
timeout 30
