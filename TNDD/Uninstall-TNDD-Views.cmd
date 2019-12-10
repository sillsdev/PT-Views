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
  echo on
  set ptviewspath=%drive%:%ptpath%Views
  set ptcmspath=%drive%:%ptpath%cms
  @echo Paratext Projects folder found! %~1
  del "%ptviewspath%\TNDD*.*"
  if not exist "%ptviewspath%\TNDD*.*" echo TNDD Views files uninstalled!
  del "%ptcmspath%\TNDD*.*"
  if not exist "%ptcmspath%\TNDD*.*" echo Custom Views Manager files uninstalled!
  echo off
goto :eof

:drive
  set drive=%~3
goto :eof


