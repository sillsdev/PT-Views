@echo off
:: Make Views.zip of files to be installed
:: Written by: Ian McQuay
:: Date: 2019-12-10
set view=%1
:main
call :date
call :time
call :created
call relaxed %view%\%view%-info.pug --build-once
:: "C:\Program Files (x86)\Prince\engine\bin\prince.exe" %1-info.html -o %1-info.pdf
copy /y %view%\%view%-info.pdf %view%\cms
@echo.
@echo Making Zip of distribution files
@echo.
if exist Installers\%view%-Views-test.zip del Installers\%view%-Views.zip
7z a -tzip Installers\%view%-Views.zip @%view%\file-list.txt
goto :eof

:created
echo Created: %isodate%T%curhh_mm%+10 > %view%\created.md
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