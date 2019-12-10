echo off
:: Make Views.zip of files to be installed
:: Written by: Ian McQuay
:: Date: 2019-12-05
:: Updated: 2019-12-10
:main
@echo.
@echo Installing TNDD Views into Paratext Views folder
@echo.
@echo Checking for Paratext 8 or 9 settings
set ptpath=
set drive=
call :regquery 8
if errorlevel=0 (
  call :found "%drive%:%ptpath%"
) else (
  call :regquery 9
  if errorlevel=0 (
    call :found "%drive%:%ptpath%""
  ) else (
    echo Neither Paratext 8 or 9 installation found.
    echo No files copied!
    pause
  )
)
goto :eof

:regquery
FOR /F "usebackq skip=2 tokens=1,2 delims=:" %%A IN (`REG QUERY HKLM\SOFTWARE\WOW6432Node\Paratext\%~1 /v Settings_Directory`) DO (
  call :drive %%A
  set ptpath=%%B
)
goto :eof

:found
  set ptviewspath=%~1Views
  set ptcmspath=%~1cms
  @echo Paratext Projects folder found! %~1
  call :copyviews "%ptviewspath%"
  call :copycms "%ptcmspath%"
goto :eof

:drive
  set drive=%~3
goto :eof

:copyviews
if not exist "%~1" md "%~1"
@echo.
@echo Copying files to the folder: "%~1"
copy /y *.x* "%~1"
if not exist "%~1\TNDD-table-view.xslt" (
  echo Something went wrong. The file is not where it should be.
  echo Explorer will open where the files should be
  pause
  start explorer "%~1"
)
goto :eof

:copycms
set cmspath=%~1
if not exist "%cmspath%" md "%cmspath%"
@echo.
@echo Copying files to the folder: "%~1"
copy /y cms\TNDD*.* "%cmspath%"
if not exist "%cmspath%\TNDD*.*" (
  echo Something went wrong. The file is not where it should be.
  echo Explorer will open where the files should be
  pause
  start explorer "%cmspath%"
)
goto :eof
