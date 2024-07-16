@echo on
:: Make Views.zip of files to be installed
:: Written by: Ian McQuay
:: Date: 2019-12-10
set view=%1
set prince=C:\programs\prince-15.1-win64\bin\prince.exe
:main
call :date
call :time
call :created
call :pdf
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

:created
echo. > docs\created.md
echo Created: %isodate%T%curhh_mm%+10 >> docs\created.md
goto :eof

:date
:: Description: Returns multiple variables with date in three formats, the year in two formats, month and day date.
:: Depends on: detectdateformat
:: Required variables: dateseparator
:: Created: 2016-05-04
rem got this from: http://www.robvanderwoude.com/datetiment.php#IDate
  if not defined dateseparator call :detectdateformat
  FOR /F "tokens=1-4 delims=%dateseparator% " %%A IN ("%date%") DO (
      IF "%dateformat%"=="0" (
          SET fdd=%%C
          SET fmm=%%B
          SET fyyyy=%%D
      )
      IF "%dateformat%"=="1" (
          SET fdd=%%B
          SET fmm=%%C
          SET fyyyy=%%D
      )
      IF "%dateformat%"=="2" (
          SET fdd=%%D
          SET fmm=%%C
          SET fyyyy=%%B
      )
  )
  set curdate=%fyyyy%-%fmm%-%fdd%
  set isodate=%fyyyy%-%fmm%-%fdd%
  set yyyy-mm-dd=%fyyyy%-%fmm%-%fdd%
goto :eof

:detectdateformat
:: Description: Get the date format from the Registery: 0=US 1=AU 2=iso
:: Usage: call :detectdateformat
  set KEY_DATE="HKCU\Control Panel\International"
  rem get dateformat number
  FOR /F "usebackq skip=2 tokens=3" %%A IN (`REG QUERY %KEY_DATE% /v iDate`) DO set dateformat=%%A
  rem get the date separator: / or -
  FOR /F "usebackq skip=2 tokens=3" %%A IN (`REG QUERY %KEY_DATE% /v sDate`) DO set dateseparator=%%A
  rem get the time separator: : or ?
  FOR /F "usebackq skip=2 tokens=3" %%A IN (`REG QUERY %KEY_DATE% /v sTime`) DO set timeseparator=%%A
  rem set project log file name by date
goto :eof

:time
:: Description: Retrieve time in several shorter formats than %time% provides
:: Usage: call :time
:: Created: 2016-05-05
  FOR /F "tokens=1-4 delims=:." %%A IN ("%time%") DO (
    set curhhmm=%%A%%B
    set curhhmmss=%%A%%B%%C
    set curisohhmmss=%%A-%%B-%%C
    set curhh_mm=%%A:%%B
    set curhh_mm_ss=%%A:%%B:%%C
  )
goto :eof

:pdf
copy docs\Bamboo-Views.md+docs\Bamboo-Views-install.md+docs\Bamboo-Views-custom.md+docs\TNDD-info.md+docs\TNND-info.md+docs\USX-info.md+docs\SFM-info.md+docs\credits.md+docs\created.md tmp\%view%-final.md
call mdpdf tmp\Bamboo-final.md cms\Bamboo-Views-Documentation.pdf
:: mdpdf is a nodejs script https://github.com/BlueHatbRit/mdpdf
rem call make-Bamboo-index.ps
set readme=readme.md
copy /Y tmp\Bamboo-final.md %readme%
fart --remove %readme% "../"
if not exist %readme% echo %readme% not found & pause
goto :eof
