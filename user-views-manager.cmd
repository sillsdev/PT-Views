:: User Views manager
:: Written by: ian_mcquay@sil.org
:: Date updated: 2020-07-13
@echo off
set viewsappdata=C:\Users\Public\PT-Views
set viewsaction=user-views-action.cmd
set action=%1
set matchstart=%2
  set redbg=[101m
  set magentabg=[105m
  set green=[32m
  set reset=[0m
echo %CD%
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
if exist "%viewspath%\%matchstart%*.hide" echo %matchstart% view/s will be hidden after restart.
if exist "%viewspath%\%matchstart%*.xml" echo %matchstart% view/s will be shown after restart.
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
:: Uninstall %matchstart% files
call :remove del "%viewspath%\%matchstart%*.*"       "%matchstart% Views files deleted!"
call :remove del "%cmspath%\%matchstart%*.*"         "%matchstart% cms files deleted!"
call :remove del "%viewsappdata%\*%matchstart%*.cmd" "TNDD installer and uninstaller deleted from: %viewsappdata% "
call :remove del "%viewsappdata%\%matchstart%\%matchstart%-*.*" "Public\PT-Views\%matchstart% files deleted!"
call :remove "rmdir /s /q" "%viewsappdata%\%matchstart%\%matchstart%-*.*" "Public\PT-Views\%matchstart% folder removed!"
goto :eof

:install
rem If not exist then create PT Views path and copy files
if not exist "%viewspath%" md "%viewspath%"
@echo.
@echo %magentabg% Copying Views files to the folder: "%viewspath%" %reset%
@echo.
copy /y %cd%\%matchstart%\%matchstart%*.x* "%viewspath%"
call :test "%viewspath%\%matchstart%*.xslt" "%viewspath%"

rem If not exist create cms folder then copy to PT cms folder
if not exist "%cmspath%" md "%cmspath%"
@echo.
@echo %magentabg% Copying CMS files to the folder: "%cmspath%" %reset%
@echo.
copy /y "%cd%\%matchstart%\cms\%matchstart%*.*" "%cmspath%"
copy /y common\cms\*.py "%cmspath%"
copy /y "%cd%\%matchstart%\cms\%matchstart%-info.pdf" "%cmspath%"
call :test "%cmspath%\%matchstart%*.*" "%cmspath%"

rem Now copy files to \Users\Public\PT-Views\%1
if not exist "%viewsappdata%\%matchstart%\cms" md "%viewsappdata%\%matchstart%\cms"
@echo.
@echo %magentabg% Copying Views files to the folder: "%viewsappdata%\%matchstart%" %reset%
@echo.
copy /y "%cd%\%matchstart%\%matchstart%*.x*" "%viewsappdata%\%matchstart%"
copy /y "%cd%\%matchstart%\cms\*.cms" "%viewsappdata%\%matchstart%\cms"
copy /y "%cd%\%matchstart%\cms\*.pdf" "%viewsappdata%\%matchstart%\cms"
copy /y "common\cms\*.py" "%viewsappdata%\%matchstart%\cms"
call :test "%viewsappdata%\%matchstart%\%matchstart%*.*" "%viewsappdata%\%matchstart%"
@echo.
@echo %magentabg% Copying Views files to the folder: "%viewsappdata%\%matchstart%" %reset%
@echo.
copy /y user-views-manager.cmd "%viewsappdata%"
call :test "%viewsappdata%\*manager.cmd" "%viewsappdata%"
copy /y "%cd%\%matchstart%\Uninstall*.cmd" "%viewsappdata%\%matchstart%"
copy /y "%cd%\%matchstart%\install*.cmd" "%viewsappdata%\%matchstart%"
call :test "%viewsappdata%\%matchstart%\*%matchstart%*.cmd" "%viewsappdata%\%matchstart%"
goto :eof

:test
set test=%~1
set openpath=%~2
if not exist "%test%" (
  echo %redbg% Something went wrong. The files are not where they should be. %reset%
  echo %redbg% Explorer will open where the files should be %reset%
  pause
  start explorer "%openpath%"
  )
if %errorlevel% == 0 (
 if exist "%test%" echo %green% Success! %reset%
 ) else (
 echo %redbg% An error occured. Check! %reset%
 pause
 )
goto :eof

:remove
set action=%~1
set file=%~2
set message=%~3
if exist "%file%" %action% "%file%"
if not exist "%file%" echo %green% %message% %reset%
goto :eof