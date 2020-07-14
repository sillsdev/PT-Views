@echo off
if exit user-manager-manager.cmd (
  call user-manager-manager.cmd install TNDD
  ) else (
  if exit ..\user-manager-manager.cmd call ..\user-manager-manager.cmd install TNDD
  )


