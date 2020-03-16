@echo off
set tnddappdata=%USERPROFILE%\AppData\Roaming\TNDD-Views
set action=%1
if not defined action (
  if exist "%tnddappdata%\TNDD-action.cmd" (
    call "%tnddappdata%\TNDD-action.cmd"
    if not defined action echo No action found from command line or from TNDD-action.cmd
  ) else (
    echo Did not find the TNDD-action.cmd file  
  )
)
:main
@echo.
@echo TNDD Veiws manager for Paratext
@echo.
@echo Atempting to %action% TNDD Views
@echo.
@echo Checking for Paratext 8 settings
@echo.
set ptpath=
set drive=
set curdir=%cd%
call :regquery 8
if errorlevel=0 (
  set ptpath=%drive%:%ptpath%
  set viewspath=%drive%:%ptpath%Views
  set cmspath=%drive%:%ptpath%cms
  call :%action%
) else (
  @echo Checking for Paratext 9 settings
  call :regquery 9
  if errorlevel=0 (

    call :%action%
  ) else (
    echo Neither Paratext 8 or 9 installation found.
    echo No files copied!
    pause
  )
)
pause
goto :eof

:regquery
FOR /F "usebackq skip=2 tokens=1,2 delims=:" %%A IN (`REG QUERY HKLM\SOFTWARE\WOW6432Node\Paratext\%~1 /v Settings_Directory`) DO (
  call :drive %%A
  set ptpath=%%B
)
goto :eof

:drive
  set drive=%~3
goto :eof

:show
if exist "%viewspath%\TNDD*.hide" ren "%viewspath%\TNDD*.hide" "*.xml"
if exist "%viewspath%\TNDD*.xml" echo TNDD Views files showing after PT restart
goto :eof

:hide
if exist "%viewspath%\TNDD*.xml" ren "%viewspath%\TNDD*.xml" "*.hide" 
if not exist "%viewspath%\TNDD*.xml" echo TNDD Views files hidden after PT restart
goto :eof

:hide1
echo 1 %~1 2 %~2
set file=%~1
if exist "%viewspath%\%file%" ren "%viewspath%\%file%" *.hide
if not exist "%viewspath%\%file%" echo TNDD %file% file hidden after PT restart
goto :eof

:uninstall
if exist "%viewspath%\TNDD*.*" del "%viewspath%\TNDD*.*"
if not exist "%viewspath%\TNDD*.x*" echo TNDD Views files deleted
if exist "%cmspath%\TNDD*.*" del "%cmspath%\TNDD*.*"
if not exist "%cmspath%\TNDD*.cms" echo TNDD cms files deleted
if exist "%tnddappdata%\TNDD-*.*" rmdir /s /q "%tnddappdata%"
if not exist "%tnddappdata%\TNDD-*.*" echo AppData files deleted
goto :eof

:install
if not exist "%viewspath%" md "%viewspath%"
@echo.
@echo Copying Views files to the folder: "%viewspath%"
copy /y *.x* "%viewspath%"
if not exist "%viewspath%\TNDD-table-view.xslt" (
  echo Something went wrong. The file is not where it should be.
  echo Explorer will open where the files should be
  pause
  start explorer "%~1"
)
if not exist "%cmspath%" md "%cmspath%"
@echo.
@echo Copying CMS files to the folder: "%cmspath%"
copy /y cms\TNDD*.* "%cmspath%"
copy /y info.md "%cmspath%"

if not exist "%cmspath%\TNDD*.*" (
  echo Something went wrong. The file is not where it should be.
  echo Explorer will open where the files should be
  pause
  start explorer "%cmspath%"
)
if not exist "%tnddappdata%" md "%tnddappdata%"
@echo.
@echo Copying Views files to the folder: "%tnddappdata%"
copy /y TNDD*.cmd "%tnddappdata%"
copy /y Uninstall*.cmd "%tnddappdata%"
if not exist "%tnddappdata%\TNDD*.*" (
  echo Something went wrong. The file is not where it should be.
  echo Explorer will open where the files should be
  pause
  start explorer "%tnddappdata%"
)
goto :eof

