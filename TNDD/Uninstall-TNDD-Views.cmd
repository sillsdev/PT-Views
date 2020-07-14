@echo off
if exit user-manager-manager.cmd (
  call user-manager-manager.cmd uninstall TNDD
  ) else (
  if exit ..\user-manager-manager.cmd call ..\user-manager-manager.cmd uninstall TNDD
  )

