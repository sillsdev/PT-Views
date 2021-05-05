@echo off
:: Make Views.zip of files to be installed
:: Written by: Ian McQuay
:: Date: 2019-12-10
:main
call relaxed %1\%1-info.pug --build-once
:: "C:\Program Files (x86)\Prince\engine\bin\prince.exe" %1-info.html -o %1-info.pdf
copy /y %1\%1-info.pdf %1\cms
@echo.
@echo Making Zip of distribution files
@echo.
if exist Installers\%1-Views-test.zip del Installers\%1-Views.zip
7z a -tzip Installers\%1-Views.zip @%1\file-list.txt