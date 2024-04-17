set sourcefile=Paratext-Bamboo-Views-unsigned.exe
set signedfile=Paratext-Bamboo-Views-signed-installer.exe

del *.exe
curl.exe --ssl-no-revoke -o "%targetfile%" https://raw.githubusercontent.com/SILAsiaPub/PT-Views/master/Installers/%sourcefile%
sign *.exe
