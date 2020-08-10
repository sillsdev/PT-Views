@echo off
set viewgrp=TNDD
if exist user-views-manager.cmd call user-views-manager.cmd install %viewgrp% & exit
if exist ..\user-views-manager.cmd ( 
cd .. 
call user-views-manager.cmd install %viewgrp%
echo %cd%
cd %viewgrp%
echo %cd%
)



