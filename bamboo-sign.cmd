set sourcefile=Paratext-TN-Views-unsigned.exe
set targetfile=Paratext-TN-Views-signed-installer.exe

if exist *.exe del *.exe
curl --ssl-no-revoke -o "%targetfile%" https://raw.githubusercontent.com/sillsdev/PT-Views/master/Installers/%sourcefile%
sign *.exe
