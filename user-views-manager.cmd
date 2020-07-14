:: User Views manager
:: Written by: ian_mcquay@sil.org
:: Date updated: 2020-07-13
@echo off
set viewsappdata=C:\Users\Public\PT-Views
set viewsaction=user-views-action.cmd
set action=%1
set matchstart=%2
if not defined action (
  if exist "%viewsappdata%\%viewsaction%" (
    call "%viewsappdata%\%viewsaction%"
    if not defined action echo No action found from command line or from %viewsaction%
  ) else (
    echo Did not find the %viewsaction% file  
  )
)
:main
@echo.
@echo Paratext Views manager for: %matchstart% 
@echo.
@echo Atempting to %action% %matchstart% Views
@echo.
@echo Checking for Paratext settings
@echo.
set ptpath=
set drive=
set curdir=%cd%
call :regquery 8
if errorlevel=0 (
    call :runaction
) else (
    @echo Checking for Paratext 9 settings
    call :regquery 9
  if errorlevel=0 (
    call :runaction
  ) else (
    echo Neither Paratext 8 or 9 installation found.
    echo No files copied!
    pause
  )
)
pause
echo.
if exit "%viewspath%\%matchstart%*.hide" echo %matchstart% view/s will be hidden after restart.
if exit "%viewspath%\%matchstart%*.xml" echo %matchstart% view/s will be shown after restart.
goto :eof

:runaction
  set ptpath=%drive%:%ptpathnodrive%
  set viewspath=%ptpath%Views
  set cmspath=%ptpath%cms
  @echo Paratext path found at: %ptpath%
  call :%action%
goto :eof

:regquery
FOR /F "usebackq skip=2 tokens=1,2 delims=:" %%A IN (`REG QUERY HKLM\SOFTWARE\WOW6432Node\Paratext\%~1 /v Settings_Directory`) DO (
  call :drive %%A
  set ptpathnodrive=%%B
)
goto :eof

:drive
  set drive=%~3
goto :eof

:show
if exist "%viewspath%\%matchstart%*.hide" ren "%viewspath%\%matchstart%*.hide" "*.xml"
if exist "%viewspath%\%matchstart%*.xml" echo %matchstart% Views files showing after PT restart
goto :eof

:hide
if exist "%viewspath%\%matchstart%*.xml" ren "%viewspath%\%matchstart%*.xml" "*.hide" 
if not exist "%viewspath%\%matchstart%*.xml" echo %matchstart% Views files hidden after PT restart
goto :eof


:hide1
echo 1 %~1 2 %~2
set file=%~1
if exist "%viewspath%\%file%" ren "%viewspath%\%file%" *.hide
if not exist "%viewspath%\%file%" echo TNDD %file% file hidden after PT restart
goto :eof

:uninstall
if exist "%viewspath%\%matchstart%*.*" del "%viewspath%\%matchstart%*.*"
if not exist "%viewspath%\%matchstart%*.x*" echo %matchstart% Views files deleted
if exist "%cmspath%\%matchstart%*.*" del "%cmspath%\%matchstart%*.*"
if not exist "%cmspath%\%matchstart%*.cms" echo %matchstart% cms files deleted
if exist "%viewsappdata%\%matchstart%\%matchstart%-*.*" rmdir /s /q "%viewsappdata%\%matchstart%"
if not exist "%viewsappdata%\%matchstart%\%matchstart%-*.*" echo AppData %matchstart% files deleted
goto :eof

:install
if not exist "%viewspath%" md "%viewspath%"
@echo.
@echo Copying Views files to the folder: "%viewspath%"
copy /y %cd%\%matchstart%\%matchstart%*.x* "%viewspath%"
if not exist "%viewspath%\%matchstart%*.xslt" (
  echo Something went wrong. The file is not where it should be.
  echo Explorer will open where the files should be
  pause
  start explorer "%~1"
)
if not exist "%cmspath%" md "%cmspath%"
@echo.
@echo Copying CMS files to the folder: "%cmspath%"
copy /y %cd%\%matchstart%\cms\%matchstart%*.* "%cmspath%"
copy /y %cd%\common\cms\*.py "%cmspath%"
copy /y %cd%\%matchstart%\%matchstart%-info.pdf "%cmspath%"

if not exist "%cmspath%\%matchstart%*.*" (
  echo Something went wrong. The file is not where it should be.
  echo Explorer will open where the files should be
  pause
  start explorer "%cmspath%"
)
if not exist "%viewsappdata%\%matchstart%\cms" md "%viewsappdata%\%matchstart%\cms"

@echo.
@echo Copying Views files to the folder: "%viewsappdata%"
copy /y user-views-manager.cmd "%viewsappdata%"
copy /y %cd%\%matchstart%\Uninstall*.cmd "%viewsappdata%"
copy /y %cd%\%matchstart%\%matchstart%*.x* "%viewsappdata%\%matchstart%"
copy /y %cd%\%matchstart%\cms\*.* "%viewsappdata%\%matchstart%\cms"

if not exist "%viewsappdata%\%matchstart%\%matchstart%*.*" (
  echo Something went wrong. The file is not where it should be.
  echo Explorer will open where the files should be
  pause
  start explorer "%viewsappdata%\%matchstart%"
)
goto :eof

