@echo off
set viewgrp=Bamboo
if exist user-views-manager.cmd call user-views-manager2.cmd uninstall %viewgrp% & exit
if exist ..\user-views-manager.cmd ( 
cd .. 
call user-views-manager.cmd uninstall %viewgrp%
cd %viewgrp%
)

