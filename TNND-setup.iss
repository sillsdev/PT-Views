; Script generated by the Inno Script Studio Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Paratext TNND Views"
#define MyAppVersion "0.3"
#define MyAppPublisher "SILAsiaPub"
#define MyAppURL "https://github.com/sillsdev/PT-Views/tree/master/TNND"

#define MPP "{code:GetPTProjectFolder}"
#define MAppData "C:\Users\Public\PT-Views\TNND"
#define MAppManager "C:\Users\Public\PT-Views"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{C57D37BA-10FF-4E26-BA7E-32F546BE53A5}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={#MPP}\Views
DisableDirPage=yes
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=Yes
LicenseFile=LICENSE
InfoAfterFile=TNND\info.md
OutputDir=Installers
OutputBaseFilename=Paratext-TNND-Views-unsigned
Compression=lzma
SolidCompression=yes

;SignTool=$qC:\Program Files (x86)\Windows Kits\10\bin\10.0.18362.0\x64\signtool.exe$q sign /a /n $qSIL Asia Publishing$q /t http://timestamp.comodoca.com/authenticode /d $qParatext TNND Views$q $f


[Files]
Source: "TNND\*.xml"; DestDir: "{app}"
Source: "TNND\*.xml"; DestDir: "{#MAppData}"
Source: "TNND\*.xslt"; DestDir: "{app}"
Source: "TNND\*.xslt"; DestDir: "{#MAppData}"
Source: "TNND\cms\*.cms"; DestDir: "{#MPP}\cms"
Source: "TNND\cms\*.cms"; DestDir: "{#MAppData}\cms"
Source: "TNND\cms\*.py"; DestDir: "{#MPP}\cms"
Source: "TNND\cms\*.py"; DestDir: "{#MAppData}\cms"
Source: "TNND\cms\TNND-info.pdf"; DestDir: "{#MPP}\cms"
Source: "TNND\cms\TNND-info.pdf"; DestDir: "{#MAppData}\cms"
Source: "user-views-manager.cmd"; DestDir: "{#MAppManager}"
Source: "TNND\Uninstall*.cmd"; DestDir: "{#MAppData}"
Source: "TNND\install*.cmd"; DestDir: "{#MAppData}"
Source: "TNND\cms\TNND-errors-documentation.html"; DestDir: "{#MPP}\cms"

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Icons]
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

[Code]
function GetPTProjectFolder(Default: String): String;
  {function to get the runtime install folder}
  var ResultStr: String;
  begin
    Result:='{app}';
    if RegQueryStringValue(HKLM,'SOFTWARE\WOW6432Node\Paratext\8','Settings_Directory',ResultStr) then
       Result:=ResultStr
    else if RegQueryStringValue(HKLM,'SOFTWARE\WOW6432Node\Paratext\9','Settings_Directory',ResultStr) then
       Result:=ResultStr
     else
       Result:='C:\My Paratext 9 Projects';
    end;  
  end.

