:: Bamboo Views manager
:: Written by: ian_mcquay@sil.org
:: Date updated: 2020-07-13
rem @echo off
set installpath=C:\Users\Public\PT-Bamboo-Views
set viewsaction=user-views-action.cmd
set url-base=https://raw.githubusercontent.com/sillsdev/PT-Views/master/Bamboo
set action=%1
set TNxD=%2
@set redbg=[101m
@set magentabg=[105m
@set green=[32m
@set reset=[0m
@echo %CD%
if not defined action (
  rem no action passed in at the commandline
  rem so check if the user-views-action.cmd file exists
  if exist "%installpath%\%viewsaction%" (
    rem since it exists get the variables written to it
    call "%installpath%\%viewsaction%"
    rem now check if there is an action to do
    if not defined action echo %redbg% No action found from command line or from %viewsaction% %reset%
  ) else (
    echo %redbg% Did not find the %viewsaction% file   %reset%
  )
)


:main
@echo.
@echo Paratext Bamboo Views manager
@echo.
set mpppath=
set drive=
set curdir=%cd%
call :mpppathquery 8

@echo Paratext path found at: %mpppath%
if errorlevel=0 (
    call :%action%
) else (
    @echo Checking for Paratext 9 settings
    call :mpppathquery 9
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

:mpppathquery
FOR /F "usebackq skip=2 tokens=1,2 delims=:" %%A IN (`REG QUERY HKLM\SOFTWARE\WOW6432Node\Paratext\%~1 /v Settings_Directory`) DO (
  call :drive %%A
  set mpppathnodrive=%%B
)
  set mpppath=%drive%:%mpppathnodrive%
  set viewspath=%mpppath%Views
  set cmspath=%mpppath%cms
goto :eof

:drive
  set drive=%~3
goto :eof

:uninstall
:: Uninstall %TNxD% files
call :remove del "%viewspath%\Bamboo*.*"    "Bamboo Views files deleted!"
call :remove del "%viewspath%\TNDD*.*"        "TNDD Views files deleted!"
call :remove del "%viewspath%\TNND*.*"       "TNND Views files deleted!"
call :remove del "%viewspath%\USX*.*"        "USX Views files deleted!"
call :remove del "%cmspath%\Bamboo*.*"       "Bamboo cms files deleted!"
call :remove del "%cmspath%\TNDD*.*"         "TNDD cms files deleted!"
call :remove del "%cmspath%\TNND*.*"         "TNND cms files deleted!"
call :remove del "%cmspath%\USX*.*"          "USX cms files deleted!"
call :remove del "%installpath%\Views\*.*"  "Views base files removed!"
call :remove del "%installpath%\cms\*.*"    "CMS base files removed!"
call :remove del "%installpath%\*.cmd"      "Bamboo Views manager file deleted!"
call :remove "rmdir /s /q" "%installpath%\" "Public\PT-Paratext-Views folder removed!"
echo %green%All Bamboo Views files removed.%reset%
goto :eof

:install
rem If not exist then create PT Views path and copy files
  call :updateall
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
  call curl -o "%installpath%\%winfile:/=\%" --ssl-no-revoke %url-base%/%winfile%
  if exist "%installpath%\%~1" echo %green%%~1 updated. %reset%
goto :eof

:errorsdoc
  echo.
 
  cd /d "%mpppath%cms"
  echo Starting %TNxD%-errors-documentation.html
  start msedge "file://%mpppath%cms/%TNxD%-errors-documentation.html"
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
  echo off
  set outvar=%~1
  set parpre=%~2
  set numb=%~3
  set calcnumb=%~4
  if not defined calcnumb set calcnumb=+0
  set /A newnumb=%numb%%calcnumb%
  if not defined outvar echo Error: no var name defined at par3.& echo %funcendtext% %0  & goto :eof
  if defined %parpre%%numb% set appendparam=%appendparam% "!%parpre%%newnumb%!"
  set %outvar%=%appendparam%
  echo on
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
echo Test output for issue: %TNxD%
echo.
echo hello
echo.
pause
goto :eof

:goodbye
echo.
echo Test output for issue: %TNxD%
echo.
echo goodbye
echo.
pause
goto :eof

:looplist
:: Description: Used to loop through list supplied in a file
:: Usage: call :looplist sub_name list-file_specs [param[3-9]]
:: Functions called: multivarlist. Can also use any other function.
  @if defined debug echo %0 '%~1' '%~2' '%~3' '%~4' '%~5' '%~6' '%~7' '%~8' '%~9'
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

:listupdate
:: Description: Update view type from internet
:: Usage: call :listupdate type
  set TNxD=%~1 

  rem the following is only for testing.
  set installpath=C:\Users\Public\PT-Views2
  set curlist=%installpath%\%TNxD%-Public-list.txt

  if not exist "%installpath%\%TNxD%\cms" md "%installpath%\%TNxD%\cms"

  curl -o "%curlist%"  --ssl-no-revoke %url-base%/%TNxD%-Public-list.txt

  call :looplist :getfile "%curlist%" %url-base% "%installpath%"
  call :copyfiles
goto :eof


:neededdir
  if not exist "%installpath%\cms\" md "%installpath%\cms\"
  if not exist "%installpath%\Views\cms\" md "%installpath%\Views\cms\"
  if not exist "%viewspath%" md  "%viewspath%"
  if not exist "%cmspath%" md  "%cmspath%"
goto :eof

:toggle
:: Hide or show a set of views
  if exit "%viewspath%\%TNxD%*.xml" (
    if not exist "%installpath%\%TNxD%\cms\%TNxD%_Views_show.cms" copy /y "%installpath%\%TNxD%\cms\%TNxD%_Views_show.cms" "%mpppath%\cms\"
    if exist "%cmspath%\%TNxD%_Views_hide.cms" del "%cmspath%\%TNxD%_Views_hide.cms"
    if not exist "%cmspath%\%TNxD%_Views_show.xml" copy /Y "%installpath%\cms\%TNxD%_Views_show.xml" "%cmspath%\"
  ) else (
    if exist "%cmspath%\%TNxD%_Views_show.cms" del "%cmspath%\%TNxD%_Views_show.cms"
    if not exist "%viewspath%\%TNxD%*.xml" copy /Y "%installpath%\Views\%TNxD%*.xml" "%viewspath%\"
    if exist "%viewspath%\%TNxD%*.xml" echo %green%%TNxD% Views files showing after PT restart%reset%
    if not exist "%cmspath%\%TNxD%_Views_hide.xml" copy /Y "%installpath%\cms\%TNxD%_Views_hide.xml" "%cmspath%\"
goto :eof

:updateall
:: Description: Update all view from internet
:: Usage: call :updateall

 rem the following is only for testing.

  set curlist=%installpath%\Bamboo-Public-list.txt
  call :neededdir

  call curl -o "%curlist%"  --ssl-no-revoke %url-base%/Bamboo-Public-list.txt
  
  rem get the files
  call :looplist :getfile "%curlist%"
  
  rem update the files in Views and cms folder if there already
  call :copyfiles TNDD
  call :copyfiles TNND
  call :copyfiles USX
goto :eof

:copyfiles
  set TNxD=%~1
  if exist "%cmspath%\%TNxD%_Views_hide.cms" (
  copy /Y "%installpath%\cms\%TNxD%*.cms" "%mpppath%\cms"
  copy /Y "%installpath%\cms\%TNxD%*.py" "%mpppath%\cms"
  copy /Y "%installpath%\cms\%TNxD%*.pdf" "%mpppath%\cms"
  copy /Y "%installpath%\Views\%TNxD%*.xml" "%mpppath%\Views"
  copy /Y "%installpath%\Views\%TNxD%*.xslt" "%mpppath%\Views"
  )
goto :eof

