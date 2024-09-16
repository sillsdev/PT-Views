call :fixlf USX_Views_show.cms
goto :eof

:fixlf
set curfile=%~1
set ext=%~x1
if .%ext% == .cms (
  rem TYPE %curfile% | MORE /P > tmp.txt
  more /P < %curfile% > tmp.txt
  move tmp.txt %curfile%
)
goto :eof
