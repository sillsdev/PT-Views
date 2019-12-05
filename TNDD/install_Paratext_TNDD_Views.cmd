echo off
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
  if errorlevel=1 (
    echo Neither Paratext 8 or 9 installation found.
    echo No files copied!
    pause
  ) else (
    call :found "%drive%:%ptpath%""
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
  set ptdviewspath=%~1Views
  @echo Paratext Projects folder found! %~1
  call :copyfiles "%ptdviewspath%"
goto :eof

:drive
  set drive=%~3
goto :eof

:copyfiles
if not exist "%~1" md "%~1"
@echo.
@echo Copying files to the folder: "%~1"
copy *.x* "%~1"
if not exist "%~1\TNDD-table-view.xslt" (
  echo Something went wrong. The file is not where it should be.
  echo Explorer will open where the files should be
  pause
  start explorer "%~1"
)
goto :eof
