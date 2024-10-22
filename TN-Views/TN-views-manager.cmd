:: TN Views manager
:: Written by: ian_mcquay@sil.org
:: Date updated: 2024-06-19
@echo off
cls
set installpath=C:\Users\Public\PT-TN-Views
set viewsaction=user-views-action.cmd
set url-base=https://raw.githubusercontent.com/sillsdev/PT-Views/master/TN-Views
set action=%1
set TNxD=%2
@set redbg=[101m
@set magentabg=[105m
@set magenta=[35m
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
@echo %magenta%Paratext TN Views manager%reset%
@echo.
set mpppath=
set drive=
set curdir=%cd%
call :mpppathquery 8

@echo %green%Paratext path found at:%reset% %mpppath%
@echo.
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
call :remove del "%viewspath%\TN*.*"    "TN Views files deleted!"
call :remove del "%viewspath%\TNDD*.*"        "TNDD Views files deleted!"
call :remove del "%viewspath%\TNND*.*"       "TNND Views files deleted!"
call :remove del "%viewspath%\USX*.*"        "USX Views files deleted!"
call :remove del "%cmspath%\TN*.*"       "TN cms files deleted!"
call :remove del "%cmspath%\TNDD*.*"         "TNDD cms files deleted!"
call :remove del "%cmspath%\TNND*.*"         "TNND cms files deleted!"
call :remove del "%cmspath%\USX*.*"          "USX cms files deleted!"
call :remove del "%installpath%\Views\*.*"  "Views base files removed!"
call :remove del "%installpath%\cms\*.*"    "CMS base files removed!"
call :remove del "%installpath%\*.cmd"      "TN Views manager file deleted!"
call :remove "rmdir /s /q" "%installpath%\" "Public\PT-Paratext-Views folder removed!"
echo %green%All TN Views files removed.%reset%
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
  @echo.
  @set winfile=%~1
  @set fileext=%~x1
  @set outfile=%installpath%\%winfile:/=\%
  @echo Attempting: %winfile%
  @if '%fileext%' == '.cms' (
    @echo %green%Converting line endings from LF to CRLF%reset%
    @call curl --ssl-no-revoke %url-base%/%winfile% | MORE /P > "%outfile%"
  ) else if '%fileext%' == '.cmd' (
    @echo %green%Converting line endings from LF to CRLF%reset%
    @call curl --ssl-no-revoke %url-base%/%winfile% | MORE /P > "%outfile%"
  ) else (
  @call curl -o "%outfile%" --ssl-no-revoke %url-base%/%winfile%
  )
  @rem set /p line1=<"%outfile%"
  @rem @FOR /F " delims=:" %%s IN (%outfile%) DO set line1=%%s
  @FOR /F "usebackq" %%A IN ('%outfile%') DO @set size=%%~zA
  @echo size = %size%
  @if "%size%" == "14" (
    @echo %redbg%Error: %winfile% not found at %url-base%.%reset%
  ) else (
    @if exist "%outfile%" echo %green%Updated: %winfile%  %reset%
  )
@goto :eof

:errorsdoc
  echo.
  cd /d "%mpppath%cms"
  echo Starting %TNxD%-errors-documentation.html
  start msedge "file://%mpppath%cms/%TNxD%-errors-documentation.html"
goto :eof

:loopfiles
:: Description: Used to loop through a subset of files specified by the filespec from a single directory
:: Usage: call :loopfiles sub_name file_specs [param[3-9]]
:: Functions called: appendnumbparam, last, taskgroup. Can also use any other function.
  rem @call :funcbegin %0 "'%~1' '%~2' '%~3' '%~4' '%~5' '%~6' '%~7' '%~8' '%~9'"
  rem if defined fatal goto :eof
  set grouporfunc=%~1
  set filespec=%~2
  set param3=%~3
  set param4=%~4
  set param5=%~5
  set param6=%~6
  set param7=%~7
  set param8=%~8
  set param9=%~9
  rem set numbparam=
  rem set appendparam=
  if not defined grouporfunc echo %error% Missing func parameter[2]%reset%
  if not defined grouporfunc if defined info4 echo %funcendtext% %0 
  if not defined grouporfunc goto :eof
  if not defined filespec echo %error% Missing filespec parameter[1]%reset%
  if not defined filespec if defined info4 echo %funcendtext% %0 
  if not defined filespec goto :eof
  if not exist "%filespec%" echo %error% Missing source files %reset%
  if not exist "%filespec%" if defined info4 echo %funcendtext% %0 
  if not exist "%filespec%" goto :eof
  @if defined loopfilesecho echo off
  call :multivarlist 3 9
  rem for /L %%v in (3,1,9) Do call :appendnumbparam numbparam par %%v
  rem for /L %%v in (3,1,9) Do call :last par %%v
  if defined info3 if defined numbparam set %multivar%
  if "%grouporfunc:~0,1%" == ":" (
      FOR /F " delims=" %%s IN ('dir /b /a:-d /o:n "%filespec%"') DO  call %grouporfunc% "%%s" %multivar:'="%
    ) else (
      FOR /F " delims=" %%s IN ('dir /b /a:-d /o:n "%filespec%"') DO  call :%grouporfunc% "%%s" %multivar:'="%
  )  
  rem @call :funcend %0
goto :eof

:loopstring
:: Description: Loops through a list supplied in a space separated string.
:: Usage: call :loopstring grouporfunc "string" [param[3-9]]
:: Functions called: quotevar, last, taskgroup. Can also use any other function.
:: Note: action may have multiple parts
  @call :funcbegin %0 "'%~1' '%~2' '%~3' '%~4' '%~5' '%~6' '%~7'"
  if defined fatal goto :eof
  set grouporfunc=%~1
  set string=%~2
  set param3=%~3
  set param4=%~4
  set param5=%~5
  set param6=%~6
  set param7=%~7
  set param8=%~8
  set param9=%~9
  if not defined grouporfunc echo Missing action parameter
  if not defined grouporfunc echo %funcendtext% %0 
  if not defined grouporfunc goto :eof
  if not defined string echo Missing string parameter
  if not defined string if defined info4 echo %funcendtext% %0 
  if not defined string goto :eof
  call :multivarlist 3 9
  if defined info3 set multivar
  if "%grouporfunc:~0,1%" == ":" FOR %%s IN (%string%) DO call %grouporfunc% "%%s" %multivar:'="%
  if "%grouporfunc:~0,1%" neq ":" FOR %%s IN (%string%) DO call :%grouporfunc% "%%s" %multivar:'="%
  @call :funcend %0
goto :eof

:looplist
:: Description: Used to loop through list supplied in a file
:: Usage: call :looplist sub_name list-file_specs [param[3-9]]
:: Functions called: multivarlist. Can also use any other function.
  @if defined debug echo %0 '%~1' '%~2' '%~3' '%~4' '%~5' '%~6' '%~7' '%~8' '%~9'
  if defined fatal goto :eof
  set func=%~1
  set listfile=%~2
  if not defined func echo %error% Missing 'function' parameter%reset% & goto :eof
  if not defined listfile echo %error% Missing 'list file' parameter%reset% & goto :eof
  if not exist "%listfile%" echo %error% Missing source: %listfile% %reset% & echo %funcendtext% %0 & goto :eof 
  @FOR /F " delims=" %%s IN (%listfile%) DO  call %func% "%%s"
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

  call :looplist :getfile "%curlist%"
  call :copyfiles TNDD
  call :copyfiles TNND
  call :copyfiles USX
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
  @echo %magenta%:updateall%reset%
  call :neededdir
  call :getfile "TN-Public-list.txt"
  call :getfile "TN-views-manager.cmd"
  call :getfile "Install_Paratext_TN_Views.cmd"
  call :getfile "Uninstall_Paratext_TN_Views.cmd"

  rem get the files in the downloaded list
  @call :looplist :getfile "%installpath%\TN-Public-list.txt"
  
  rem update the files in Views and cms folder if there already
  echo.
  echo %green%Info: Copying cms, py and PDF files to '%mpppath%cms' folder%reset%
  xcopy /D/Q/Y "%installpath%\cms\*.*" "%mpppath%cms"
  del /q "%mpppath%cms\*show*.cms"
  echo %green%Info: Copying XSLT and xml files to '%mpppath%Views' folder%reset%
  xcopy /D/Q/Y "%installpath%\Views\*.*" "%mpppath%Views"
goto :eof

:copyfiles
  set TNxD=%~1
  if exist "%cmspath%\%TNxD%_Views_hide.cms" (
  copy /Y "%installpath%\cms\%TNxD%*.cms" "%mpppath%cms"
  copy /Y "%installpath%\cms\%TNxD%*.py" "%mpppath%cms"
  copy /Y "%installpath%\cms\%TNxD%*.pdf" "%mpppath%cms"
  copy /Y "%installpath%\Views\%TNxD%*.xml" "%mpppath%Views"
  copy /Y "%installpath%\Views\%TNxD%*.xslt" "%mpppath%Views"
  )
goto :eof


