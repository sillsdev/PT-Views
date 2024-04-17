set sourcefile=Paratext-Bamboo-Views-unsigned.exe
set signedfile=Paratext-Bamboo-Views-signed-installer.exe

if exist *.exe del *.exe
curl --ssl-no-revoke -o "%targetfile%" https://raw.githubusercontent.com/SILAsiaPub/PT-Views/master/Installers/%sourcefile%
sign *.exe
