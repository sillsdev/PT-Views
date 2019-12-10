echo off
:: Make Views.zip of files to be installed
:: Written by: Ian McQuay
:: Date: 2019-12-10
:main
@echo.
@echo Making Zip of distribution files
@echo.
if exist Views.zip del Views.zip
7z a -tzip Views.zip @file-list.txt