@echo off
:: Make Views.zip of files to be installed
:: Written by: Ian McQuay
:: Date: 2019-12-10
set view=bamboo
set info2=on
set new=0
set prince=C:\programs\prince-15.1-win64\bin\prince.exe
:main
call :colorvar
call :countnewer "%cd%\docs\Bamboo-views.md" "%cd:Bamboo=%Installers\Bamboo-Views.zip"
call :countnewer "%cd%\docs\Bamboo-Views-custom.md" "%cd:Bamboo=%Installers\Bamboo-Views.zip"
call :countnewer "%cd%\docs\Bamboo-Views-install.md" "%cd:Bamboo=%Installers\Bamboo-Views.zip"
call :countnewer "%cd%\docs\TNDD-info.md" "%cd:Bamboo=%Installers\Bamboo-Views.zip"
call :countnewer "%cd%\docs\TNND-info.md" "%cd:Bamboo=%Installers\Bamboo-Views.zip"
call :countnewer "%cd%\docs\SFM-info.md" "%cd:Bamboo=%Installers\Bamboo-Views.zip"
call :countnewer "%cd%\docs\USX-info.md" "%cd:Bamboo=%Installers\Bamboo-Views.zip"
if %new%. gtr 0. echo Recreating the PDF
if %new%. gtr 0. call :pdf
call :zip
pause
goto :eof

:zip
@echo.
@echo Making Zip of distribution files
@echo.
set zipfile=..\Installers\Bamboo-Views.zip
if exist "%zipfile%" del "%zipfile%"
7z a -tzip "%zipfile%" @file-list.txt
goto :eof


:pdf
call :date
call :created
copy docs\Bamboo-Views.md+docs\Bamboo-Views-install.md+docs\Bamboo-Views-custom.md+docs\TNDD-info.md+docs\TNND-info.md+docs\USX-info.md+docs\SFM-info.md+docs\credits.md+docs\created.md tmp\%view%-final.md
call mdpdf tmp\Bamboo-final.md cms\Bamboo-Views-Documentation.pdf
:: mdpdf is a nodejs script https://github.com/BlueHatbRit/mdpdf
rem call make-Bamboo-index.ps
set readme=readme.md
copy /Y tmp\Bamboo-final.md %readme%
fart --remove %readme% "../"
if not exist %readme% echo %readme% not found & pause
goto :eof

:filedate
:: Description: Get the file date and time in usable string
:: Usage: call :filedate infile varname
  set s=%~t1
  set fname=%~nx1
  set numb=%s:~8,2%%s:~3,2%%s:~0,2%%s:~11,2%%s:~14,2%
  set %~2=%numb%
  @if defined info2 echo %green%DateTime: %yellow%%numb% %green%%fname%%reset%
goto :eof

:countnewer
:: Description: if file one is newer than file two then do func
:: Usage: call :countnewer fileone filetwo
  set f1=%~1
  set f1p=%~dp1
  set f1n=%~nx1
  set f2=%~2
  set f2p=%~dp2
  set f2n=%~nx2
  call :filedate "%~1" d1
  call :filedate "%~2" d2
  rem if %d1%. gtr %d2%. call :%functodo::=%
  if %d1%. gtr %d2%. echo %green%%f1n% is newer than %f2n%%reset%
  if %d1%. gtr %d2%. set /A new=%new%+1
goto :eof

:created
echo. > docs\created.md
echo Created: %curisodatetime%+10 >> docs\created.md
goto :eof

:getdatetime
:: Description: Returns multiple variables with 6 individual date and time vraiable prefixed by 00.
:: Used by: :date
:: Created: 2016-05-04
:: Modified: 2024-09-11
:: Source: got this from: http://www.robvanderwoude.com/datetiment.php#IDate but modified into two func
  FOR /F "skip=1 tokens=1-6" %%G IN ('WMIC Path Win32_LocalTime Get Day^,Hour^,Minute^,Month^,Second^,Year /Format:table') DO (
    IF "%%~L"=="" goto :eof
    set _yyyy=%%L
    set _mm=00%%J
    set _dd=00%%G
    set _hour=00%%H
    set _minute=00%%I
    set _second=00%%K
  )
goto :eof

:date
:: Description: Returns multiple variables with date in three formats, the year in two formats, month, day date and time.
:: Functions called: funcend funcbegin
:: Created: 2016-05-04
:: Modified: 2024-09-11
  @call :funcbegin %0 "'%~1' '%~2' '%~3'"
  call :getdatetime
  Set _mm=%_mm:~-2%
  Set _dd=%_dd:~-2%
  Set _hour=%_hour:~-2%
  Set _minute=%_minute:~-2%
  Set _second=%_second:~-2%
  set curhhmm=%_hour%%_minute%
  set curhhmmss=%_hour%%_minute%%_second%
  set curisohhmmss=%_hour%-%_minute%-%_second%
  set curhh_mm=%_hour%:%_minute%
  set curhh_mm_ss=%_hour%:%_minute%:%_second%
  set curdate=%_yyyy%-%_mm%-%_dd%
  set curisodatetime=%_yyyy%-%_mm%-%_dd%T%curisohhmmss%
  set curisodate=%_yyyy%-%_mm%-%_dd%
  set yyyy-mm-dd=%_yyyy%-%_mm%-%_dd%
  set curyyyy-mm=%_yyyy%-%_mm%
  set curyyyymmdd=%_yyyy%%_mm%%_dd%
  set curyymmdd=%_yyyy:~2%%_mm%%_dd%
  set curUSdate=%_mm%/%_dd%/%_yyyy%
  set curAUdate=%_dd%/%_mm%/%_yyyy%
  set curyyyy=%_yyyy%
  set curyy=%_yyyy:~2%
  set curmm=%_mm%
  set curdd=%_dd%
  @call :funcend %0
goto :eof

:colorvar
:: Description: Sets the inline color variables.
:: Usage: call :inlinecolor
:: Reference: https://stackoverflow.com/questions/2048509/how-to-echo-with-different-colors-in-the-windows-command-line
  set reset=[0m
  rem dull forground colors
  set black=[30m
  set red=[31m
  set green=[32m
  set yellow=[33m
  set blue=[34m
  set magenta=[35m
  set cyan=[36m
  set white=[37m
  rem strong forground colors
  set redb=[91m
  set greenb=[92m
  set yellowb=[93m
  set blueb=[94m
  set magentab=[95m
  set cyanb=[96m
  set whiteb=[97m
  rem strong background colors
  set redbg=[101m
  set greenbg=[102m
  set yellowbg=[103m
  set bluebg=[104m
  set magentabg=[105m
  set bluebg=[106m
  set whitebg=[107m
goto :eof
