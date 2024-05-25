:: User Views manager
:: Written by: ian_mcquay@sil.org
:: Date updated: 2020-07-13
rem @echo off
set viewsappdata=C:\Users\Public\PT-Bamboo-Views
set viewsaction=user-views-action.cmd
set url-base=https://raw.githubusercontent.com/sillsdev/PT-Views/master/Bamboo
set filelist=file-list.txt
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
set mpppath=
set drive=
set curdir=%cd%
call :mpppathquery 8

if errorlevel=0 (
    @echo Paratext path found at: %ptpath%
    call :%action%
) else (
    @echo Checking for Paratext 9 settings
    call :ptpathquery 9
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
  set mpppath=%drive%:%ptpathnodrive%
  set viewspath=%mpppath%Views
  set cmspath=%mpppath%cms
goto :eof

:drive
  set drive=%~3
goto :eof

:uninstall
:: Uninstall Bamboo Views files
del "%mpppath%\Views\TNDD*.x*"
del "%mpppath%\Views\TNND*.x*"
del "%mpppath%\Views\USX*.x*"
del "%mpppath%\cms\Bamboo*.*"
del "%mpppath%\cms\TNDD*.*"
del "%mpppath%\cms\TNND*.*"
del "%mpppath%\cms\USX*.*"
del "%viewsappdata%\Views\*.*"
del "%viewsappdata%\cms\*.*"
rd "%viewsappdata%\Views"
rd "%viewsappdata%\cms"
del "%viewsappdata%\*.*"
rd "%viewsappdata%"
@echo All files removed
goto :eof

:install
rem If not exist then create PT Views path and copy files
@echo.
@echo %magentabg% Copying Views files to the folder: "%viewspath%" %reset%
@echo.
call :neededdir
cd /d "%viewsappdata%"
call :update

rem Copy to MPP
copy /y %viewsappdata%\Views\*.x* "%viewspath%"
call :test "%viewspath%\%matchstart%*.xslt" "%viewspath%"
@echo.
@echo %magentabg% Copying CMS files to the folder: "%cmspath%" %reset%
@echo.
copy /y "%viewsappdata%\cms\%matchstart%*.*" "%cmspath%"
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
  if exist "%outpath%\%~1" echo %green%%~1 updated. %reset%
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
  set param3=%~3
  set param4=%~4
  set param5=%~5
  set param6=%~6
  set param7=%~7
  set param8=%~8
  set param9=%~9
  if not defined func echo Missing action parameter
  if not defined func echo %funcendtext% %0 
  if not defined func goto :eof
  if not defined string echo Missing string parameter
  if not defined string echo %funcendtext% %0 
  if not defined string goto :eof
  set numbparam=
  set appendparam=
  call :multivarlist 3 9
  if defined info3 set numbparam
  if defined info2 echo %last%
  if "%func:~0,1%" == ":" FOR %%s IN (%string%) DO call %func% "%%s" %multivar:'="%
  if "%func:~0,1%" neq ":" FOR %%s IN (%string%) DO call :taskgroup %func% "%%s" %multivar:'="%
  rem @call :funcend %0
  rem @echo off
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

:listupdate
:: Description: Update view type from internet
:: Usage: call :listupdate type
  set TNxD=%~1 

  rem the following is only for testing.
  set outpath=C:\Users\Public\PT-Views2
  set curlist=%outpath%\%TNxD%-Public-list.txt

  if not exist "%outpath%\%TNxD%\cms" md "%outpath%\%TNxD%\cms"

  curl -o "%curlist%"  --ssl-no-revoke %url-base%/%TNxD%-Public-list.txt

  rem for testing
  set ptpath=C:\Users\Public\PT-test

  call :looplist :getfile "%curlist%" %url-base% "%outpath%"
  call :copyfiles
goto :eof


:neededdir
  if not exist "%installpath%\cms\" md "%installpath%\cms\"
  if not exist "%installpath%\Views\" md "%installpath%\Views\"
  if not exist "%mppviews%" md  "%mppviews%"
  if not exist "%mppcms%" md  "%mppcms%"
goto :eof

:toggle
:: Hide or show a set of views
  if exit "%mpppath%\Views\%matchstart%*.x*" (
    del "%mpppath%\Views\%matchstart%*.x*"
  ) else (
    copy /y "%mpppath%\Views\%matchstart%*.x*" "%mpppath%\Views\"
goto :eof

:updateall
:: Description: Update all view from internet
:: Usage: call :updateall

 rem the following is only for testing.
  set installpath=C:\Users\Public\PT-Views2
  
  set curlist=%installpath%\Bamboo-Public-list.txt
  call :neededdir

  call curl -o "%curlist%"  --ssl-no-revoke %url-base%/Bamboo-Public-list.txt
  
  rem get the files
  call :looplist :getfile "%curlist%" %url-base% "%outpath%"
  
  rem update the files in Views and cms folder if there already
  call :copyfiles TNDD
  call :copyfiles TNND
  call :copyfiles USX
goto :eof

:copyfiles
  set TNxD=%~1
  if exist "%ptpath%\cms\%TNxD%_Views_hide.cms" (
  copy /Y "%outpath%\%TNxD%\cms\*.cms" "%ptpath%\cms"
  copy /Y "%outpath%\%TNxD%\cms\*.py" "%ptpath%\cms"
  copy /Y "%outpath%\%TNxD%\cms\*.pdf" "%ptpath%\cms"
  copy /Y "%outpath%\%TNxD%\*.xml" "%ptpath%\Views"
  copy /Y "%outpath%\%TNxD%\*.xslt" "%ptpath%\Views"
  )
goto :eof

