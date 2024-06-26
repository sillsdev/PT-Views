:: User Views manager
:: Written by: ian_mcquay@sil.org
:: Date updated: 2020-07-13
rem @echo off
set viewsappdata=C:\Users\Public\PT-Views
set viewsaction=user-views-action.cmd
set action=%1
set matchstart=%2
  set redbg=[101m
  set magentabg=[105m
  set green=[32m
  set reset=[0m
@echo %CD%
if not defined action (
  rem no action passed in at the commandline
  rem so check if the user-views-action.cmd file exists
  if exist "%viewsappdata%\%viewsaction%" (
    rem since it exists get the variables written to it
    call "%viewsappdata%\%viewsaction%"
    rem now check if there is an action to do
    if not defined action echo %redbg% No action found from command line or from %viewsaction% %reset%
  ) else (
    echo %redbg% Did not find the %viewsaction% file   %reset%
  )
)


:main
@echo.
@if "%matchstart%" == "TNDD" echo Paratext Views manager for: %matchstart% 
@echo.
@if "%matchstart%" == "TNDD" echo Atempting to %action% %matchstart% Views
@echo.
@echo Checking for Paratext settings
@echo.
set ptpath=
set drive=
set curdir=%cd%
call :regquery 8
  set viewspath=%ptpath%Views
  set cmspath=%ptpath%cms
  @echo Paratext path found at: %ptpath%
if errorlevel=0 (
    call :%action%
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
echo.
pause
goto :eof

:regquery
FOR /F "usebackq skip=2 tokens=1,2 delims=:" %%A IN (`REG QUERY HKLM\SOFTWARE\WOW6432Node\Paratext\%~1 /v Settings_Directory`) DO (
  call :drive %%A
  set ptpathnodrive=%%B
)
  set ptpath=%drive%:%ptpathnodrive%
goto :eof

:drive
  set drive=%~3
goto :eof

:show
if exist "%viewspath%\%matchstart%*.hide" ren "%viewspath%\%matchstart%*.hide" "*.xml"
if exist "%viewspath%\%matchstart%*.xml" echo %green%%matchstart% Views files showing after PT restart%reset%
goto :eof

:hide
if exist "%viewspath%\%matchstart%*.xml" ren "%viewspath%\%matchstart%*.xml" "*.hide" 
if not exist "%viewspath%\%matchstart%*.xml" echo %green%%matchstart% Views files hidden after PT restart %reset%
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

:update
  set baseurl=%baseurl%
  call :loopstring :getfile "%filelist%"
  echo.
  echo %green%Updating of Views complete. %reset%
goto :eof

:getfile
  echo.
  set winfile=%~1
  call curl -o "%outpath%\%winfile:/=\%" --ssl-no-revoke %url-base%/%~1
  if exist "%outp%\%~1" echo %green%%~1 updated. %reset%
goto :eof

:errorsdoc
  echo.
 
  cd /d "%ptpath%cms"
  echo Starting %matchstart%-errors-documentation.html
  start msedge "file://%ptpath%cms/%matchstart%-errors-documentation.html"
goto :eof


:loopstring
:: Description: Loops through a list supplied in a space separated string.
:: Usage: call :loopstring func "string" [param[3-9]]
:: Depends on: appendnumbparam, last, taskgroup. Can also use any other function.
:: Note: action may have multiple parts
  rem @call :funcbegin %0 "'%~1' '%~2' '%~3'"
  if defined fatal goto :eof
  rem echo on
  set func=%~1
  set string=%~2
  set par3=%~3
  set par4=%~4
  set par5=%~5
  set par6=%~6
  set par7=%~7
  set par8=%~8
  set par9=%~9
  if not defined func echo Missing action parameter
  if not defined func echo %funcendtext% %0 
  if not defined func goto :eof
  if not defined string echo Missing string parameter
  if not defined string echo %funcendtext% %0 
  if not defined string goto :eof
  set numbparam=
  set appendparam=
  for /L %%v in (3,1,9) Do call :appendnumbparam numbparam par %%v 
  for /L %%v in (3,1,9) Do call :last par %%v
  if defined info3 set numbparam
  if defined info2 echo %last%
  if "%func:~0,1%" == ":" FOR %%s IN (%string%) DO call %func% "%%s" %numbparam%
  if "%func:~0,1%" neq ":" FOR %%s IN (%string%) DO call :taskgroup %func% "%%s" %numbparam%
  rem @call :funcend %0
  rem @echo off
goto :eof

:appendnumbparam
:: Description: Append numbered parameters on the end of a given variable name. Used from a loop like :loopfiles.
:: Usage: call :appendnumbparam prepart-of-par-name seed-numb out_var_name
  set outvar=%~1
  set parpre=%~2
  set numb=%~3
  set calcnumb=%~4
  if not defined calcnumb set calcnumb=+0
  set /A newnumb=%numb%%calcnumb%
  if not defined outvar echo Error: no var name defined at par3.& echo %funcendtext% %0  & goto :eof
  if defined %parpre%%numb% set appendparam=%appendparam% "!%parpre%%newnumb%!"
  set %outvar%=%appendparam%
goto :eof

:last
:: Description: Find the last parameter in a set of numbered params. Usually called by a loop.
:: Usage: call :last par_name number
  if defined lastfound goto :eof
  set last=!%~1%~2!
  if defined last set lastfound=on
  rem set utreturn=%last%, %~1, %~2
goto :eof

:hello
echo.
echo Test output for issue: %matchstart%
echo.
echo hello
echo.
pause
goto :eof

:goodbye
echo.
echo Test output for issue: %matchstart%
echo.
echo goodbye
echo.
pause
goto :eof

:looplist
:: Description: Used to loop through list supplied in a file
:: Usage: call :looplist sub_name list-file_specs [param[3-9]]
:: Functions called: multivarlist. Can also use any other function.
  @if defined debug %0 "'%~1' '%~2' '%~3' '%~4' '%~5' '%~6' '%~7' '%~8' '%~9'"
  if defined fatal goto :eof
  set func=%~1
  set listfile=%~2
  set param3=%~3
  set param4=%~4
  set param5=%~5
  set param6=%~6
  set param7=%~7
  set param8=%~8
  set param9=%~9
  if not defined func echo %error% Missing 'function' parameter%reset% & goto :eof
  if not defined listfile echo %error% Missing 'list file' parameter%reset% & goto :eof
  if not exist "%listfile%" echo %error% Missing source: %listfile% %reset% & echo %funcendtext% %0 & goto :eof 
  call :multivarlist 3 9
  FOR /F " delims=" %%s IN (%listfile%) DO  call %func% "%%s" %multivar:'="% 
goto :eof

:multivarlist
:: Descriptions: if varaible string contains a space put double quotes around it.
:: Usage: call quotevar var_name start_numb end_numb
  @if defined debug echo %0 "'%~1' '%~2' '%~3' '%~4' '%~5' '%~6' '%~7' '%~8' '%~9'"
  set startnumb=%~1
  set endnumb=%~2
  for /L %%v in (%startnumb%,1,%endnumb%) Do if defined param%%v if "!param%%v!" neq "!param%%v: =!" set param%%v='!param%%v!'
  if %startnumb%. == 1. set multivar=%param1% %param2% %param3% %param4% %param5% %param6% %param7% %param8% %param9%
  if %startnumb%. == 2. set multivar=%param2% %param3% %param4% %param5% %param6% %param7% %param8% %param9%
  if %startnumb%. == 3. set multivar=%param3% %param4% %param5% %param6% %param7% %param8% %param9%
  if %startnumb%. == 4. set multivar=%param4% %param5% %param6% %param7% %param8% %param9%
  if defined info3 echo %green%Info: multivar = %multivar%%reset%
goto :eof

:updateinstalled
:: Description: Run list updates on al installed Views
:: Usage: Call :listupdate
  if exist "%ptpath%\Views\TNDD-tag-errors.xslt" call :listupdate tndd
  if exist "%ptpath%\Views\TNND-tag-errors.xslt" call :listupdate tnnd
  if exist "%ptpath%\Views\USX-view.xslt" call :listupdate usx
goto :eof

:listupdate
:: Description: Update view type from internet
:: Usage: call :listupdate type
  set TNxD=%~1 
  set url-base=https://raw.githubusercontent.com/sillsdev/PT-Views/master
  rem the following is only for testing.
  set outpath=C:\Users\Public\PT-Views2
  set curlist=%outpath%\%TNxD%-Public-list.txt

  if not exist "%outpath%\%TNxD%\cms" md "%outpath%\%TNxD%\cms"

  curl -o "%curlist%"  --ssl-no-revoke %url-base%/%TNxD%-Public-list.txt

  ::call :ptpathquery
  set ptpath=%drive%:%ptpathnodrive%
  
  rem for testing
  set ptpath=C:\Users\Public\PT-test

  call :looplist :getfile "%curlist%" %url-base% "%outpath%"
  call :copyfiles
goto :eof

:copyfiles
  if not exist "%ptpath%\cms" md "%ptpath%\cms"
  copy /Y "%outpath%\%TNxD%\cms\*.cms" "%ptpath%\cms"
  copy /Y "%outpath%\%TNxD%\cms\*.py" "%ptpath%\cms"
  copy /Y "%outpath%\%TNxD%\cms\*.pdf" "%ptpath%\cms"

  if not exist "%ptpath%\Views" md  "%ptpath%\Views"
  copy /Y "%outpath%\%TNxD%\*.xml" "%ptpath%\Views"
  copy /Y "%outpath%\%TNxD%\*.xslt" "%ptpath%\Views"
goto :eof
